/* Low Level Word Serial Implementation Example in C

 Below is an example that uses NI-VXI to implement Word Serial Protocol
 for one Word Serial Write and one Word Serial Read.  It will prompt the
 user for the LA of the message based device to communicate with and a
 string to send to the device.  It will then read the response from the
 device and print it to the screen.  In some systems you may need to adjust
 the timing of the register reads and writes by adding �waits� to the program
 as some instruments may not respond fast enough.  In the interest of space,
 most error checking has been left out of this example.	  */

//#include <nivxi.h>
//#include <ansi_c.h>
#include <sicl.h>
#include "helper.h"

#define UINT16 unsigned short
#define INT16 short


#define TRUE  1
#define FALSE 0
#define MAXINSTR 256

// register numbers (not: byte offsets as in official doc)
#define REG_ID 0x00
#define REG_DEVTYPE 1
#define REG_STATUSCRTL 2

#define REG_RESPONSE 5
#define REG_DATALOW 7

#define REG_RESPONSE_WR_BITV (UINT16)(1<<9)
#define REG_RESPONSE_RD_BITV (UINT16)(1<<10)
#define REG_RESPONSE_DIR_BITV (UINT16)(1<<12)
#define REG_RESPONSE_DOR_BITV (UINT16)(1<<13)
#define REG_RESPONSE_ERR_BITV (UINT16)(1<<11)


#define WRITEREADYDIR /*0x0900*/ (UINT16)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DIR_BITV)
#define WRITEREADYDOR /*0x2200*/ (UINT16)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DOR_BITV)

// Device has put sth. in Datalow
#define READREADY 0x400
// Device is ok to read  from Datalow
#define WRITEREADY 0x200

#define TIMEOUT 10000
#define NORMALCHAR 0xBC00
#define FINALCHAR 0xBD00
#define CHARMASK 0xFF
#define ENDMASK 0xFF00
#define NOMOREDATA 0xFF00


int main(int argc, char *argv[]) {
	UINT16 offset;
	UINT16 regdata;
	INT16 status;
	UINT16 responseReg;

	int timeoutCnt = 0;
	int err;

	setLogLevel(LOG_DEBUG);

	INST id = iopen("vxi,126");
	if (id == 0) {
		err = igeterrno();
		dlog(LOG_DEBUG, "iopen FAILED with ID 0 %d\n", err);
		return -1;
	}
	dlog(LOG_DEBUG, "iopen returned ID=%d\n", id);

	int ret = itimeout(id, 10000);
	if (ret != 0) {
		err = igeterrno();
		dlog(LOG_DEBUG, "itimeout Error: %d %d\n", ret, err);
		return -1;
	}

	int windowCount;
	int windowSize;
	ret = imapinfo(id, I_MAP_A24/*I_MAP_A16*/, &windowCount, &windowSize);
	if (err != I_ERR_NOERROR) {
		err = igeterrno();
		dlog(LOG_DEBUG, "imapinfo Error: %d %d\n", ret, err);
		return -1;
	}
	dlog(LOG_INFO, "window count: %d, size: %d\n", windowCount, windowSize);
	ret = imapinfo(id, I_MAP_VXIDEV, &windowCount, &windowSize);
	if (err != I_ERR_NOERROR) {
		err = igeterrno();
		dlog(LOG_DEBUG, "imapinfo Error: %d %d\n", ret, err);
		return -1;
	}
	dlog(LOG_INFO, "window count: %d, size: %d\n", windowCount, windowSize);

	// Memory map the device registers
	char *mapped = imap(id, I_MAP_VXIDEV, 0x0, 0x0, 0);
	if (mapped == 0) {
		err = igeterrno();
		dlog(LOG_DEBUG, "imap Error returned NULL, err=%d\n", err);
		return -1;
	}
	dlog(LOG_DEBUG, "imap returned valid pointer %lx\n", mapped);
	UINT16 *q = mapped;
	int i;

	dlog(LOG_DEBUG, "Vendor ID: 0x%x\n", iwpeek(&q[REG_ID]));
	dlog(LOG_DEBUG, "Device type: 0x%x\n", iwpeek(&q[REG_DEVTYPE]));

	/*for (q = mappedReg, i = 0; i < 32; i++, q++) {
		printf("[%02d]=0x%x\n", i, *q);
	}*/
	q = mapped;
	for (i=0; i<32; i++) {
		printf("reg[%d @ byte offset %02x]=x%04x\n", i, 2*i, iwpeek(&q[i]));
	}

	dlog(LOG_DEBUG, "------------------------------------------------------\n");

	ret = _dd_sendCommand(id, WS_CMD_RP /*WS_CMD_RMOD /*WS_CMD_RPE*/);
	dlog(LOG_DEBUG, "_dd_sendCommand WS_CMD_RP result: %x\n", (short)(ret & 0xefff));


	regdata = 0;
	timeoutCnt = 0;
	// Let point word pointer to memory
	q = mapped;

	UINT16 old_regdata = 12345;
	// Read RESPONSE register 0xA of instrument and wait till instrument is ready for write
	// or until timeout occurs
	while ((regdata != WRITEREADY) && (timeoutCnt < TIMEOUT)) {
		//status = VXIinReg(myinstrLA, REG_RESPONSE, &regdata);
		//regdata = q[REG_RESPONSE];
		regdata = iwpeek(&(q[REG_RESPONSE]));
		// Mask for the WRITEREADY and DIR bits. this will be checked by the while loop and
		// if the instrument is ready we will exit the loop and continue
		if (regdata != old_regdata) {
			dlog(LOG_DEBUG, "reg[0x%x]=0x%x mask=0x%x masked=%x\n", REG_RESPONSE, regdata, WRITEREADY,
					(WRITEREADY & regdata));
			old_regdata = regdata;
		}
		regdata = (WRITEREADY & regdata);
		// Increment timeout timer so we keep track
		timeoutCnt++;
	}
	if (timeoutCnt >= TIMEOUT) {
		printf("Timeout occurred while checking WRITEREADYDIR.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "WRITEREADY after %d loops\n", timeoutCnt);

	UINT16 cmd = WS_CMD_ANO; // WS_CMD_RP; // WS_CMD_ANO;
	// Write the command to send to the DATALOW register 0xe
	//q[REG_DATALOW] = cmd;
	iwpoke(&(q[REG_DATALOW]), cmd);
	//dlog(LOG_DEBUG, "q[REG_DATALOW] = 0x%x\n", *(&(q[REG_DATALOW])));

	// ---------------------- READ ANSWER ----------------------

	timeoutCnt = 0;
	// Read RESPONSE register 0xA of instrument and wait till instrument is ready for read
	// or until timeout occurs
	old_regdata = 12345;
	// Wait for WRITEREADY and DOR bit to be set in the response register or timeout
	// if it takes to long
	while ((regdata != READREADY) && (timeoutCnt < TIMEOUT)) {
		//status = VXIinReg(myinstrLA, RESPONSE, &regdata);
		regdata = q[REG_RESPONSE];
		if (regdata != old_regdata) {
			dlog(LOG_DEBUG, "reg[0x%x]=0x%x mask=0x%x masked=%x\n", REG_RESPONSE, regdata, READREADY, (READREADY & regdata));
			old_regdata = regdata;
		}
		// Masking for READREADY
		regdata = (READREADY & regdata);
		// Keep track of timeout time
		timeoutCnt++;
	}
	for (i=0; i<32; i++) {
		printf("reg[%d @ byte offset %02x]=x%04x\n", i, 2*i, iwpeek(&q[i]));
	}

	// If we exited the loop because of a timeout quit the program with an error
	if (timeoutCnt >= TIMEOUT) {
		printf("Timeout occurred during wait for WRITEREADYDOR.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "WRITEREADYDOR after %d loops\n", timeoutCnt);

#ifdef NOT
	// Send 0xDEFF to DATALOW register of the instrument to request a byte to be transferred
	// from the device
	cmd = WS_CMD_BR;
	//status = VXIoutReg(myinstrLA, DATALOW, sendchar);
	q[REG_DATALOW] = cmd;

	// Wait until the READREADY bit is set in the RESPONSE register or timeout
	// if it takes too long
	while ((regdata != READREADY) && (timeoutCnt < TIMEOUT)) {
		//status = VXIinReg(myinstrLA, RESPONSE, &regdata);
		regdata = q[REG_RESPONSE];
		// Mask for READREADY bit
		regdata = (READREADY & regdata);
		// Keep track of timeout time
		timeoutCnt++;
	}
	if (timeoutCnt > TIMEOUT) {
		printf("Timeout occurred during wait for READREADY\n");
		return -1;
	}
	dlog(LOG_DEBUG, "READREADY after %d loops\n", timeoutCnt);

	// Now read a word from the instrument
	//status = VXIinReg(myinstrLA, DATALOW, &regdata);
	regdata = q[REG_DATALOW];

	dlog(LOG_DEBUG, "regdata = 0x%x\n", regdata);
#endif

#ifdef NOTYET
			//	Close the VXI driver
			status = CloseVXIlibrary();
			return 0;
		}
#endif
}

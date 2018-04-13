/* Low Level Word Serial Implementation Example in C

 Below is an example that uses NI-VXI to implement Word Serial Protocol
 for one Word Serial Write and one Word Serial Read.  It will prompt the
 user for the LA of the message based device to communicate with and a
 string to send to the device.  It will then read the response from the
 device and print it to the screen.  In some systems you may need to adjust
 the timing of the register reads and writes by adding �waits� to the program
 as some instruments may not respond fast enough.  In the interest of space,
 most error checking has been left out of this example.	  */

#include "ws.h"

#include "helper.h"
#include <stdio.h>
#include <time.h>

#define TIMEOUT 1000000L

// Memory mapped device registers
static char *mapped = 0L;

dumpRegisters() {
	uint16_t *q = (uint16_t *)mapped;
	int i;
	/*for (q = mappedReg, i = 0; i < 32; i++, q++) {
		printf("[%02d]=0x%x\n", i, *q);
	}*/
	for (i=0; i<32; i++) {
		uint16_t v = iwpeek(&q[i]);
		if (v != (uint16_t)0xffff) {
			dlog(LOG_TRACE, "reg[%d @ byte offset %02x]=x%04x\n", i, 2*i, v);
		}
	}
}

/**
 * Opens a device and reads/dumps some basic information about device.
 */
INST dd_iOpen(char *sessionString) {
	dlog(LOG_DEBUG, "dd_iOpen\n");
	INST id = iopen(sessionString);
	int err;
	if (id == 0) {
		err = igeterrno();
		dlog(LOG_DEBUG, "iopen FAILED with ID 0 %d\n", err);
		return -1;
	}
	dlog(LOG_DEBUG, "iopen returned ID=%d\n", id);

	int ret = itimeout(id, 0/*10000*/);
	if (ret != 0) {
		err = igeterrno();
		dlog(LOG_DEBUG, "itimeout Error: %d %d\n", ret, err);
		return -1;
	}

	int windowCount;
	int windowSize;

	// Memory map the device registers
	mapped = imap(id, I_MAP_VXIDEV, 0x0, 0x0, 0);
	if (mapped == 0) {
		err = igeterrno();
		dlog(LOG_DEBUG, "imap Error returned NULL, err=%d\n", err);
		return -1;
	}
	dlog(LOG_DEBUG, "imap returned valid pointer %lx\n", mapped);
	uint16_t *q = (uint16_t *)mapped;
	int i;

	dlog(LOG_DEBUG, "Vendor ID: 0x%x\n", iwpeek(&q[REG_ID]));
	dlog(LOG_DEBUG, "Device type: 0x%x\n", iwpeek(&q[REG_DEVTYPE]));

	dumpRegisters();

	return id;
}

/**
 * Standard implementation of the word serial protocol.
 *
 * This function sends a word (2 bytes) to a device.
 * It checks the device RESPONSE register until the device is ready to be written to (WriteReady bit).
 * Then it writes the word to the DATALOW register.
 * To read the answer, it then checks the device RESPONSE register until the device is ready to be read from (ReadReady bit).
 * Then it reads the answer word from the DATALOW register.

 * If a timeout value is reached, the waits are interrupted and the function returns immediatedly.
 *
 */
//
uint32_t dd_wsCommand(INST id, uint16_t command, uint16_t *theResponse, uint16_t *rpe ) {
	dlog(LOG_DEBUG, "\ndd_wsCommand(0x%x)\n", command);
	uint16_t regdata = 0;
	int timeoutCnt = 0;

	// Let point word pointer to memory
	uint16_t *q =(uint16_t *)mapped;

	struct timespec start, stop;
	double accum;

	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		perror("clock gettime");
		exit(-1);
	}

	// ---------------------- WRITE COMMAND ----------------------

	uint16_t old_regdata = 0;
	// Read RESPONSE register until instrument is ready for write or timeout.
	// Wait for WRITEREADY bit value to be set.
	while ((regdata != WRITEREADY) && (timeoutCnt < TIMEOUT)) {
		//regdata = q[REG_RESPONSE];
		regdata = iwpeek(&(q[REG_RESPONSE]));
		if (regdata != old_regdata) {
			// trace: dump register data if something changes
			dlog(LOG_TRACE, "\treg[0x%x]=0x%x mask=0x%x masked=%x, %s,%s\n", REG_RESPONSE, regdata, WRITEREADY,
					(WRITEREADY & regdata),
					((regdata&READREADY)? "RR" : ""),
					((regdata&WRITEREADY)? "WR" : "")
			);
			old_regdata = regdata;
		}
		// Mask for the WRITEREADY bit
		regdata = (WRITEREADY & regdata);
		// Increment timeout
		timeoutCnt++;
	}
	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		perror("clock gettime");
		exit(-1);
	}
	if (timeoutCnt >= TIMEOUT) {
		printf("Timeout occurred while checking WRITEREADY.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "\tWRITEREADY after %ldus (%d tries).\n", (stop.tv_nsec - start.tv_nsec)/1000L, timeoutCnt);

	// Write the command to send to the DATALOW register
	//q[REG_DATALOW] = cmd;
	iwpoke(&(q[REG_DATALOW]), command);

	// ---------------------- READ ANSWER ----------------------

	timeoutCnt = 0;
	old_regdata = 0;
	// Read RESPONSE register until instrument is ready for read or timeout.
	// Wait for READREADY bit to be set.
	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		perror("clock gettime");
		exit(-1);
	}
	while ((regdata != READREADY) && (timeoutCnt < TIMEOUT)) {
		regdata = q[REG_RESPONSE];
		if (regdata != old_regdata) {
			// trace: dump register data if something changes
			dlog(LOG_TRACE, "\treg[0x%x]=0x%x mask=0x%x masked=%x, %s,%s\n", REG_RESPONSE, regdata,
					READREADY, (READREADY & regdata),
					((regdata&READREADY)? "RR" : ""),
					((regdata&WRITEREADY)? "WR" : "")
			);
			old_regdata = regdata;
		}
		// Masking for READREADY
		regdata = (READREADY & regdata);
		// Keep track of timeout time
		timeoutCnt++;
	}
	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		perror("clock gettime");
		exit(-1);
	}

	//dumpRegisters();

	// If we exited the loop because of a timeout quit the program with an error
	if (timeoutCnt >= TIMEOUT) {
		printf("Timeout occurred during wait for READREADY.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "\tREADREADY after %ldus (%d tries).\n", (stop.tv_nsec - start.tv_nsec)/1000L, timeoutCnt);

	// Read result from Datalow
	uint16_t response = q[REG_DATALOW];
	dlog(LOG_DEBUG, "\tResponse: 0x%x\n", response);

	*rpe = 0; // ???
	*theResponse = response;
	return 0;
}

/**
 * Sends a word (2 byte) command to the P1 CPU.
 * This is not strictly following Word Serial Protocol but goes as follows.
 *
 * It checks the device RESPONSE register until the device is ready to be written to (WriteReady bit).
 * Then it writes the special command 'VXI_ENGINECMD' to the DATALOW register.
 * The device temporarily unsets the WriteReady bit. After some short time it sets the WriteReady bit again.
 * Then the command itself (the parameter value for the function) is written to the DATALOW register.
 *
 * If the command we are sending to P1 CPU consists of more than one word, we must repeat call this function
 * for each word.
 *
 * After calling the function, the Protocol Error Register can be checked. There should be no errors.
 * Moreover, the engine P1 status can be checked. As long as the command is not complete (not all parameters have been sent)
 * the status is '0' (BUSY). If all parameters have been send the status becomes '1' (ACK). P1 CPU then executes the command.
 *
 * The function also allows to read an answer from the P1 CPU. To do that, the flag 'readAnswer' must be != 0.
 * Note that most P1 commands DO NOT send an answer and you will get a timeout then (slowing down communication).
 *
 * The following text needs rework. It is currently not finally clear how answers from P1 must be handled.
 *
 * To read the answer, it then checks the device RESPONSE register until the device is ready to be read from (ReadReady bit).
 * Then it reads the answer word from the DATALOW register.
 */
uint32_t dd_p1Command(INST id, uint16_t command, int readAnswer) {
	dlog(LOG_DEBUG, "\ndd_p1Command(0x%x)\n", command);
	uint16_t regdata = 0;
	int timeoutCnt = 0;

	// Let point word pointer to memory
	uint16_t *q =(uint16_t *)mapped;

	struct timespec start, stop;
	double accum;

	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		perror("clock gettime");
		exit(-1);
	}

	// ---------------------- WRITE VXI_ENGINECMD ----------------------

	uint16_t old_regdata = 0;
	// Read RESPONSE register until instrument is ready for write or timeout.
	// Wait for WRITEREADY bit value to be set.
	while ((regdata != WRITEREADY) && (timeoutCnt < TIMEOUT)) {
		//regdata = q[REG_RESPONSE];
		regdata = iwpeek(&(q[REG_RESPONSE]));
		if (regdata != old_regdata) {
			// trace: dump register data if something changes
			dlog(LOG_TRACE, "\treg[0x%x]=0x%x mask=0x%x masked=%x, %s,%s\n", REG_RESPONSE, regdata, WRITEREADY,
					(WRITEREADY & regdata),
					((regdata&READREADY)? "RR" : ""),
					((regdata&WRITEREADY)? "WR" : "")
			);
			old_regdata = regdata;
		}
		// Mask for the WRITEREADY bit
		regdata = (WRITEREADY & regdata);
		// Increment timeout
		timeoutCnt++;
	}
	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		perror("clock gettime");
		exit(-1);
	}
	printf("\tWR time: %ld us\n", (stop.tv_nsec - start.tv_nsec)/1000L );
	if (timeoutCnt >= TIMEOUT) {
		printf("\tTimeout occurred while checking WRITEREADY.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "\tWRITEREADY after %d tries.\n", timeoutCnt);

	// Write the command to send to the DATALOW register
	//q[REG_DATALOW] = cmd;
	iwpoke(&(q[REG_DATALOW]), VXI_ENGINECMD);

	// ---------------------- WAIT TILL SECOND WORD CAN BE WRITTEN ----------------------

	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		perror("clock gettime");
		exit(-1);
	}

	old_regdata = 0;
	// Read RESPONSE register until instrument is ready for write or timeout.
	// Wait for WRITEREADY bit value to be set.
	while ((regdata != WRITEREADY) && (timeoutCnt < TIMEOUT)) {
		//regdata = q[REG_RESPONSE];
		regdata = iwpeek(&(q[REG_RESPONSE]));
		if (regdata != old_regdata) {
			// trace: dump register data if something changes
			dlog(LOG_TRACE, "\treg[0x%x]=0x%x mask=0x%x masked=%x, %s,%s\n", REG_RESPONSE, regdata, WRITEREADY,
					(WRITEREADY & regdata),
					((regdata&READREADY)? "RR" : ""),
					((regdata&WRITEREADY)? "WR" : "")
			);
			old_regdata = regdata;
		}
		// Mask for the WRITEREADY bit
		regdata = (WRITEREADY & regdata);
		// Increment timeout
		timeoutCnt++;
	}
	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		perror("clock gettime");
		exit(-1);
	}
	printf("\tWR2 time: %ld us\n", (stop.tv_nsec - start.tv_nsec)/1000L );
	if (timeoutCnt >= TIMEOUT) {
		printf("Timeout occurred while checking WRITEREADY2.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "\tWRITEREADY2 after %d tries.\n", timeoutCnt);

	// ---------------------- WRITE SECOND WORD ----------------------

	// Write the command to send to the DATALOW register
	//q[REG_DATALOW] = cmd;
	iwpoke(&(q[REG_DATALOW]), command);

	if (!readAnswer) {
		dlog( LOG_DEBUG, "\tNot asking for answer.\n");
		return 0;
	}

	// ---------------------- READ ANSWER ----------------------

	timeoutCnt = 0;
	old_regdata = 0;
	// Read RESPONSE register until instrument is ready for read or timeout.
	// Wait for READREADY bit to be set.
	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		perror("clock gettime");
		exit(-1);
	}
	while ((regdata != READREADY) && (timeoutCnt < TIMEOUT)) {
		regdata = q[REG_RESPONSE];
		if (regdata != old_regdata) {
			// trace: dump register data if something changes
			dlog(LOG_TRACE, "\treg[0x%x]=0x%x mask=0x%x masked=%x, %s,%s\n", REG_RESPONSE, regdata, READREADY,
					(READREADY & regdata),
					((regdata&READREADY)? "RR" : ""),
					((regdata&WRITEREADY)? "WR" : "")
			);
			old_regdata = regdata;
		}
		// Masking for READREADY
		regdata = (READREADY & regdata);
		// Keep track of timeout time
		timeoutCnt++;
	}
	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		perror("clock gettime");
		exit(-1);
	}
	printf("\tRR time: %ld us\n", (stop.tv_nsec - start.tv_nsec)/1000L );

	//dumpRegisters();

	// If we exited the loop because of a timeout quit the program with an error
	if (timeoutCnt >= TIMEOUT) {
		printf("Timeout occurred during wait for READREADY.\n");
		return -1;
	}
	dlog(LOG_DEBUG, "\tREADREADY after %d tries\n", timeoutCnt);

	// Read result from Datalow
	uint16_t response = q[REG_DATALOW];
	dlog(LOG_DEBUG, "\tResponse: 0x%x\n", response);
	return response;
}

//#define WS_MAIN
#ifdef WS_MAIN
int main(int argc, char *argv[]) {
	uint16_t offset;
	uint16_t regdata;
	INT16 status;
	uint16_t responseReg;

	int timeoutCnt = 0;
	int err;
	int ret;

	setLogLevel(LOG_TRACE);

	INST id = dd_iOpen("vxi,126");

	dlog(LOG_DEBUG, "------------------------------------------------------\n");

	//ret = _dd_sendCommand(id, WS_CMD_RP /*WS_CMD_RMOD /*WS_CMD_RPE*/);
	//dlog(LOG_DEBUG, "_dd_sendCommand WS_CMD_RP result: %x\n", (short)(ret & 0xefff));

	UINT16 response, rpe;
	dd_wsCommand(id, WS_CMD_ANO, &response, &rpe);
	//dd_wsCommand(id, WS_CMD_RMOD, &response, &rpe);
	//dd_wsCommand(id, WS_CMD_RP, &response, &rpe);
	dd_wsCommand(id, WS_CMD_BNO, &response, &rpe);

	// V9054
	dd_wsCommand(id, VXI_GETVERSION, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);

	// Send ENG_TERMINATE with parameter 0
	dd_p1Command(id, 7, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	//dd_p1Command(id, 0);
	//dd_wsCommand(id, WS_CMD_RPE);

}
#endif

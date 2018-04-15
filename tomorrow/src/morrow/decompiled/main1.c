#include <sicl.h>

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include "helper.h"

// gcc enginecmd.c -o enginecmd -lsicl

#if defined(__hp9000s700)
int __getStatus(INST id, int *fifo, int *status) {
	unsigned short cmd = VXI_GETSTATUS;
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error: %d\n", ret);
		return -1;
	}

	// fifo are bits 11..8 in response
	*fifo = (response >> 8) & 0xf;
	*status = response & 0xff;
	dlog(LOG_DEBUG, "fifo: 0x%x, status: 0x%x\n", *fifo, *status);

	// fifo checks
	//if (*fifo == (STAT_EMPTY>>8)&0xff) {
	// dlog(LOG_DEBUG,"Engine has no data\n");
	// }
	if (response & (1 << 8)) {
		// bit8=0 => no data
		dlog(LOG_DEBUG, "Engine has data\n");
	} else {
		dlog(LOG_DEBUG, "Engine has no data\n");
	}

	// status checks
	if (*status == ENG_REPLY_BAD_CMD) {
		dlog(LOG_DEBUG, "ENG_REPLY_BAD_CMD\n");
	}
	if (*status == ENG_REPLY_INMAIN) {
		dlog(LOG_DEBUG, "ENG_REPLY_INMAIN\n");
	}

	return ret;
}

int16_t __sendCommand(INST id, int16_t command) {
	dlog(LOG_DEBUG, "command: %x\n", command);
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

	ret = ivxiws(id, command, &response, &rpe);
	dlog(LOG_DEBUG, "ivxiws -> ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error: %x\n", ret);
		return -1;
	}
	return response;
}

void __initEngine(INST id, int argc) {
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

	unsigned short cmd = 0xc8ff; //ANO
	response = __sendCommand(id, cmd);
	if (response != 0xfffe) {
		dlog(LOG_DEBUG, "Error1: %x\n", response);
		return;
	}
	dlog(LOG_DEBUG, "Abort Normal Operation: OK\n");

	cmd = 0xfcff; // begin normal operation
	response = __sendCommand(id, cmd);
	// See page 16 what to check for success. I do not understand what is said there.
	dlog(LOG_DEBUG, "Begin Normal Operation: OK\n\n");

	cmd = VXI_GETVERSION;// get version
	response = __sendCommand(id, cmd);
	int major = response >> 4;
	int minor = response & 0xf;
	dlog(LOG_DEBUG, "Version: %d.%d\n\n", major, minor);

	int fifo, status;
	ret = __getStatus(id, &fifo, &status);
	dlog(LOG_DEBUG, "VXI_GETSTATUS: OK\n\n");

	/*cmd = VXI_RESETENG;
	 response = __sendCommand(id, cmd);
	 dlog(LOG_DEBUG, "Response: %x\n\n", response);
	 sleep(1);
	 ret = __getStatus(id, &fifo, &status);
	 dlog(LOG_DEBUG, "VXI_GETSTATUS: OK\n\n");
	 */

	cmd = VXI_ENGINECMD;// VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");
	sleep(1);

	cmd = ENG_INIT; // ENG_TERMINATE; // Engine command
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_TERMINATE: OK\n");

#ifdef NOT_YET
	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = ENG_INIT; // ENG_TERMINATE; // Engine command
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_TERMINATE: OK\n");
	ret = __getStatus(id, &fifo, &status);
	dlog(LOG_DEBUG, "VXI_GETSTATUS: OK\n\n");
	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = 0x0; // parameter
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_INIT: OK\n");
	ret = __getStatus(id, &fifo, &status);
	dlog(LOG_DEBUG, "VXI_GETSTATUS: OK\n\n");

	//-------------------------

	cmd = VXI_ENGINECMD;// VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = ENG_SET_TRIGDET; // parameter
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_INIT: OK\n");

	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = 0x24; // parameter1
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_INIT: OK\n");

	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = 0x5; // parameter2
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_INIT: OK\n");

	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = 0x0; // parameter
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_INIT: OK\n");

	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response,
			rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "VXI_ENGINECMD: OK\n");

	cmd = 0x1f5; // parameter
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog(LOG_DEBUG, "ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		dlog(LOG_DEBUG, "Error Engine command: %d, %x\n", ret, response);
		return;
	}
	dlog(LOG_DEBUG, "ENG_INIT: OK\n");

	ret = __getStatus(id, &fifo, &status);
	dlog(LOG_DEBUG, "VXI_GETSTATUS: OK\n\n");

	cmd = VXI_GETVERSION; // get version
	response = __sendCommand(id, cmd);
	major = response >> 4;
	minor = response & 0xf;
	dlog(LOG_DEBUG, "Version: %d.%d\n\n", major, minor);
#endif

}
#endif

readLoop(INST id) {
	unsigned short response, dataResponse;
	unsigned short rpe;
	unsigned int ret;

#if defined(__hp9000s700)
	int i=0;
	while (0) {
		ret = ivxiws(id, VXI_GETSTATUS, &dataResponse, &rpe);
		dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
		if (ret != 0) {
			dlog(LOG_DEBUG,"Error: %d\n", ret);
			return;
		}
		if (i++ % 100 == 0) {
			dlog(LOG_DEBUG,"\n");
		}
		usleep(50);
	}
	while (1) {
		ret = ivxiws(id, VXI_GETSTATUS, &dataResponse, &rpe);
		//dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%x\n", ret, dataResponse, rpe);
		if (ret != 0) {
			dlog(LOG_DEBUG,"S Error: %d\n", ret);
			return;
		}
		int fifo, status;
		fifo = (dataResponse >> 8) & 0xf;
		status = dataResponse & 0xff;
		dlog(LOG_DEBUG,"\tfifo: 0x%x, status: 0x%x\n", fifo, status);

		if (dataResponse & (1 << 8)) {
			ret = ivxiws(id, VXI_ENGINECMD, &response, &rpe);
			//dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
			if (ret != 0) {
				dlog(LOG_DEBUG,"E Error: %d\n", ret);
				return;
			}
			ret = ivxiws(id, VXI_ENGINEDATA, &response, &rpe);
			dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
			if (ret != 0) {
				dlog(LOG_DEBUG,"D Error: %d\n", ret);
				return;
			}
		}
		dlog(LOG_DEBUG,".");
		if (i++ % 20 == 0) {
			dlog(LOG_DEBUG,"\n");
		}
		usleep(1000);

	}
#endif
}


int main(int argc, char **argv) {

	char sessionString[50];
	ViChar message[128];
	ViStatus mr90xxStatus;
	ViSession sessionId;

	setLogLevel(LOG_TRACE);
	printf("main start\n");

	INST id = dd_iOpen("vxi,126");

	dlog(LOG_DEBUG, "------------------------------------------------------\n");

	//ret = _dd_sendCommand(id, WS_CMD_RP /*WS_CMD_RMOD /*WS_CMD_RPE*/);
	//dlog(LOG_DEBUG, "_dd_sendCommand WS_CMD_RP result: %x\n", (short)(ret & 0xefff));

	uint16_t response, rpe;
	dd_wsCommand(id, WS_CMD_ANO, &response, &rpe);
	//dd_wsCommand(id, WS_CMD_RMOD, &response, &rpe);
	//dd_wsCommand(id, WS_CMD_RP, &response, &rpe);
	dd_wsCommand(id, WS_CMD_BNO, &response, &rpe);

	// Send ENG_INIT with parameter 0
	// Testing shows that 3 words are required.
	// In the code, 4 are sent !?!
	dlog(LOG_DEBUG, "--- ENG_INIT\n");
	dd_p1Command(id, ENG_INIT, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	if (checkResponse(response) != 0) {
		return 1;
	}

	// V9054
	//dd_wsCommand(id, VXI_GETVERSION, &response, &rpe);
	//dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	//dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);

#define TEST_ENG_TERMINATE
#ifdef TEST_ENG_TERMINATE
	// Send ENG_TERMINATE with 1 parameter, value 0
	dlog(LOG_DEBUG, "--- ENG_TERMINATE\n");
	dd_p1Command(id, ENG_TERMINATE, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	if (checkResponse(response) != 0) {
		return 1;
	}

#endif

	// Send ENG_SET_TRIGDET with parameter 0x24, 0x5, 0x0, 0x1f5
	dlog(LOG_DEBUG, "--- ENG_SET_TRIGDET\n");
	dd_p1Command(id, ENG_SET_TRIGDET, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0x24, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0, 0x0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0x5, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0, 0x0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0x0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0, 0x0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0x1f5, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	dd_p1Command(id, 0, 0x0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	if (checkResponse(response) != 0) {
		return 1;
	}

}

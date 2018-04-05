#include <sicl.h>
#include <stdio.h>

#include <math.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#define VXI_RESETENG   0x7b00
#define VXI_GETVERSION 0x7c00
#define VXI_ENGINEDATA 0x7d00
#define VXI_GETSTATUS  0x7e00
#define VXI_ENGINECMD  0x7f00

// gcc enginecmd.c -o enginecmd -lsicl

void sysInfo() {
	int i = sizeof(short);
	    printf("short: \t%d\n", i);
	    i = sizeof(int);
	    printf("int\t%d\n", i);
	    i = sizeof(void *);
	    printf("void*\t%d\n", i);
	    i = sizeof(int *);
	    printf("int*\t%d\n", i);
	    i = sizeof(float);
	    printf("float\t%d\n", i);
	    i = sizeof(double);
	    printf("double\t%d\n", i);
}

/*
int _getStatus(INST id, int *fifo, int *status) {
	unsigned short cmd = VXI_GETSTATUS;
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

	ret = ivxiws(id, cmd, &response, &rpe);
	printf("ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		printf("Error: %d\n", ret);
		return -1;
	}

	// fifo are bits 11..8 in response
	*fifo = (response >> 8) & 0xf;
	*status = response & 0xff;
	printf("fifo: 0x%x, status: 0x%x\n", *fifo, *status);

	// fifo checks
	//if (*fifo == (STAT_EMPTY>>8)&0xff) {
	// printf("Engine has no data\n");
	// }
	if (response & (1 << 8)) {
		// bit8=0 => no data
		printf("Engine has data\n");
	} else {
		printf("Engine has no data\n");
	}

	// status checks
	if (*status == ENG_REPLY_BAD_CMD) {
		printf("ENG_REPLY_BAD_CMD\n");
	}
	if (*status == ENG_REPLY_INMAIN) {
		printf("ENG_REPLY_INMAIN\n");
	}

	return ret;
} */

/*int16_t _sendCommand(INST id, int16_t command) {
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

	ret = ivxiws(id, command, &response, &rpe);
	printf("ivxiws -> ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		printf("Error: %x\n", ret);
		return -1;
	}
	return response;
}*/

/*
void _initEngine(INST id, int argc) {
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

	unsigned short cmd = 0xc8ff; //ANO
	response = _sendCommand(id, cmd);
	if (response != 0xfffe) {
		printf("Error1: %x\n", response);
		return;
	}
	printf("Abort Normal Operation: OK\n");

	cmd = 0xfcff; // begin normal operation
	response = _sendCommand(id, cmd);
	// See page 16 what to check for success. I do not understand what is said there.
	printf("Begin Normal Operation: OK\n\n");

	cmd = VXI_GETVERSION; // get version
	response = _sendCommand(id, cmd);
	int major = response >> 4;
	int minor = response & 0xf;
	printf("Version: %d.%d\n\n", major, minor);

	int fifo, status;
	ret = getStatus(id, &fifo, &status);
	printf("VXI_GETSTATUS: OK\n\n");

	cmd = VXI_RESETENG;
	response = _sendCommand(id, cmd);
	printf("Response: %x\n\n", response);


	if (argc > 1) {
		printf("No engine command.\n");
		return;
	}

	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	printf("ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		printf("Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	printf("VXI_ENGINECMD: OK\n");

	cmd = ENG_TERMINATE; // Engine command
	ret = ivxiws(id, cmd, &response, &rpe);
	printf("ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		printf("Error Engine command: %d, %x\n", ret, response);
		return;
	}
	printf("ENG_TERMINATE: OK\n");


	cmd = VXI_ENGINECMD; // VXI_ENGINECMD
	ret = ivxiws(id, cmd, &response, &rpe);
	printf("ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		printf("Error ENGINECMD: %d, %x\n", ret, response);
		return;
	}
	printf("VXI_ENGINECMD: OK\n");

	cmd = ENG_INIT; // Engine command
	ret = ivxiws(id, cmd, &response, &rpe);
	printf("ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
	if (ret != 0) {
		printf("Error Engine command: %d, %x\n", ret, response);
		return;
	}
	printf("ENG_INIT: OK\n");

	ret = getStatus(id, &fifo, &status);
	printf("VXI_GETSTATUS: OK\n\n");

}*/

readLoop(INST id) {
	unsigned short response, dataResponse;
	unsigned short rpe;
	unsigned int ret;

#if defined(__hp9000s700)
	int i=0;
	while (0) {
		ret = ivxiws(id, VXI_GETSTATUS, &dataResponse, &rpe);
		printf("ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
		if (ret != 0) {
			printf("Error: %d\n", ret);
			return;
		}
		if (i++ % 100 == 0) {
			printf("\n");
		}
		usleep(50);
	}
	while (1) {
		ret = ivxiws(id, VXI_GETSTATUS, &dataResponse, &rpe);
		//printf("ret: %u, response=%x, rpe=%x\n", ret, dataResponse, rpe);
		if (ret != 0) {
			printf("S Error: %d\n", ret);
			return;
		}
		int fifo, status;
		fifo = (dataResponse >> 8) & 0xf;
		status = dataResponse & 0xff;
		printf("\tfifo: 0x%x, status: 0x%x\n", fifo, status);

		if (dataResponse & (1 << 8)) {
			ret = ivxiws(id, VXI_ENGINECMD, &response, &rpe);
			//printf("ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
			if (ret != 0) {
				printf("E Error: %d\n", ret);
				return;
			}
			ret = ivxiws(id, VXI_ENGINEDATA, &response, &rpe);
			printf("ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
			if (ret != 0) {
				printf("D Error: %d\n", ret);
				return;
			}
		}
		printf(".");
		if (i++ % 20 == 0) {
			printf("\n");
		}
		usleep(1000);

	}
#endif
}

int main(int argc, char **argv) {

	sysInfo();

	/*INST id = iopen("vxi,126");
	itimeout(id, 10000);
	int ret = isetbuf(id, 0x3, 4000);
	if (ret != 0) {
		printf("isetbuf Error: %d\n", ret);
		return -1;
	}
	_initEngine(id, argc);

	if (argc==1) {
		readLoop(id);
	}
	printf("DONE.\n");
	*/

	char sessionString[50];
	ViChar message[128];
	ViStatus mr90xxStatus;
	ViSession sessionId;

	printf("main start\n");
	sysInfo();

	sprintf(sessionString, "vxi,126");

	mr90xxStatus = mr90xx_init( sessionString, VI_TRUE, VI_TRUE, &sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init");
		exit(-1);
	} else {
		printf("mr90xx_init OK");
	}

	/*mr90xxStatus = mr90xx_SetEngineModel( sessionId, SA9054 );
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_SetEngineModel");
	} else {
		printf("mr90xx_SetEngineModel OK");
	}*/

}

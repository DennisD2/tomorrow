#include <sicl.h>
#include <stdio.h>

#include <math.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include "helper.h"

// gcc enginecmd.c -o enginecmd -lsicl

void sysInfo() {
	int i = sizeof(short);
	dlog(LOG_DEBUG, "short: \t%d\n", i);
	i = sizeof(int);
	dlog(LOG_DEBUG, "int\t%d\n", i);
	i = sizeof(void *);
	dlog(LOG_DEBUG, "void*\t%d\n", i);
	i = sizeof(int *);
	dlog(LOG_DEBUG, "int*\t%d\n", i);
	i = sizeof(float);
	dlog(LOG_DEBUG, "float\t%d\n", i);
	i = sizeof(double);
	dlog(LOG_DEBUG, "double\t%d\n", i);
}

/*
 int _getStatus(INST id, int *fifo, int *status) {
 unsigned short cmd = VXI_GETSTATUS;
 unsigned short response;
 unsigned short rpe;
 unsigned int ret;

 ret = ivxiws(id, cmd, &response, &rpe);
 dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
 if (ret != 0) {
 dlog(LOG_DEBUG,"Error: %d\n", ret);
 return -1;
 }

 // fifo are bits 11..8 in response
 *fifo = (response >> 8) & 0xf;
 *status = response & 0xff;
 dlog(LOG_DEBUG,"fifo: 0x%x, status: 0x%x\n", *fifo, *status);

 // fifo checks
 //if (*fifo == (STAT_EMPTY>>8)&0xff) {
 // dlog(LOG_DEBUG,"Engine has no data\n");
 // }
 if (response & (1 << 8)) {
 // bit8=0 => no data
 dlog(LOG_DEBUG,"Engine has data\n");
 } else {
 dlog(LOG_DEBUG,"Engine has no data\n");
 }

 // status checks
 if (*status == ENG_REPLY_BAD_CMD) {
 dlog(LOG_DEBUG,"ENG_REPLY_BAD_CMD\n");
 }
 if (*status == ENG_REPLY_INMAIN) {
 dlog(LOG_DEBUG,"ENG_REPLY_INMAIN\n");
 }

 return ret;
 } */

/*int16_t _sendCommand(INST id, int16_t command) {
 unsigned short response;
 unsigned short rpe;
 unsigned int ret;

 ret = ivxiws(id, command, &response, &rpe);
 dlog(LOG_DEBUG,"ivxiws -> ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
 if (ret != 0) {
 dlog(LOG_DEBUG,"Error: %x\n", ret);
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
 dlog(LOG_DEBUG,"Error1: %x\n", response);
 return;
 }
 dlog(LOG_DEBUG,"Abort Normal Operation: OK\n");

 cmd = 0xfcff; // begin normal operation
 response = _sendCommand(id, cmd);
 // See page 16 what to check for success. I do not understand what is said there.
 dlog(LOG_DEBUG,"Begin Normal Operation: OK\n\n");

 cmd = VXI_GETVERSION; // get version
 response = _sendCommand(id, cmd);
 int major = response >> 4;
 int minor = response & 0xf;
 dlog(LOG_DEBUG,"Version: %d.%d\n\n", major, minor);

 int fifo, status;
 ret = getStatus(id, &fifo, &status);
 dlog(LOG_DEBUG,"VXI_GETSTATUS: OK\n\n");

 cmd = VXI_RESETENG;
 response = _sendCommand(id, cmd);
 dlog(LOG_DEBUG,"Response: %x\n\n", response);


 if (argc > 1) {
 dlog(LOG_DEBUG,"No engine command.\n");
 return;
 }

 cmd = VXI_ENGINECMD; // VXI_ENGINECMD
 ret = ivxiws(id, cmd, &response, &rpe);
 dlog(LOG_DEBUG,"ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
 if (ret != 0) {
 dlog(LOG_DEBUG,"Error ENGINECMD: %d, %x\n", ret, response);
 return;
 }
 dlog(LOG_DEBUG,"VXI_ENGINECMD: OK\n");

 cmd = ENG_TERMINATE; // Engine command
 ret = ivxiws(id, cmd, &response, &rpe);
 dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
 if (ret != 0) {
 dlog(LOG_DEBUG,"Error Engine command: %d, %x\n", ret, response);
 return;
 }
 dlog(LOG_DEBUG,"ENG_TERMINATE: OK\n");


 cmd = VXI_ENGINECMD; // VXI_ENGINECMD
 ret = ivxiws(id, cmd, &response, &rpe);
 dlog(LOG_DEBUG,"ENGINECMD ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
 if (ret != 0) {
 dlog(LOG_DEBUG,"Error ENGINECMD: %d, %x\n", ret, response);
 return;
 }
 dlog(LOG_DEBUG,"VXI_ENGINECMD: OK\n");

 cmd = ENG_INIT; // Engine command
 ret = ivxiws(id, cmd, &response, &rpe);
 dlog(LOG_DEBUG,"ret: %u, response=%x, rpe=%u\n", ret, response, rpe);
 if (ret != 0) {
 dlog(LOG_DEBUG,"Error Engine command: %d, %x\n", ret, response);
 return;
 }
 dlog(LOG_DEBUG,"ENG_INIT: OK\n");

 ret = getStatus(id, &fifo, &status);
 dlog(LOG_DEBUG,"VXI_GETSTATUS: OK\n\n");

 }*/

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

	sysInfo();
	dlog(LOG_DEBUG, "----------------------------------------\n");

	/*INST id = iopen("vxi,126");
	 itimeout(id, 10000);
	 int ret = isetbuf(id, 0x3, 4000);
	 if (ret != 0) {
	 dlog(LOG_DEBUG,"isetbuf Error: %d\n", ret);
	 return -1;
	 }
	 _initEngine(id, argc);

	 if (argc==1) {
	 readLoop(id);
	 }
	 dlog(LOG_DEBUG,"DONE.\n");
	 */

	char sessionString[50];
	ViChar message[128];
	ViStatus mr90xxStatus;
	ViSession sessionId;

	setLogLevel(LOG_INFO);
	printf("main start\n");
	sysInfo();

	sprintf(sessionString, "vxi,126");

	mr90xxStatus = mr90xx_init(sessionString, VI_TRUE, VI_TRUE, &sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init");
		exit(-1);
	} else {
		printf("mr90xx_init OK");
	}

	/*mr90xxStatus = mr90xx_SetEngineModel( sessionId, SA9054 );
	 if (mr90xxStatus != MR90XX_IE_SUCCESS) {
	 dlog(LOG_DEBUG,"Error mr90xx_SetEngineModel");
	 } else {
	 dlog(LOG_DEBUG,"mr90xx_SetEngineModel OK");
	 }*/

}

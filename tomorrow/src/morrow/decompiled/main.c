#include <sicl.h>

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include "helper.h"


int main(int argc, char **argv) {

	setLogLevel(LOG_DEBUG);
	dlog(LOG_DEBUG, "----------------------------------------\n");

	char sessionString[50];
	ViChar message[128];
	ViStatus mr90xxStatus;
	ViSession sessionId;

	setLogLevel(LOG_SILLY);
	printf("main start\n");

	sprintf(sessionString, "vxi,126");

	mr90xxStatus = mr90xx_init(sessionString, VI_TRUE, VI_TRUE, &sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init\n");
		exit(-1);
	} else {
		printf("mr90xx_init OK\n");
	}

	/*mr90xxStatus = mr90xx_SetEngineModel( sessionId, SA9054 );
	 if (mr90xxStatus != MR90XX_IE_SUCCESS) {
	 dlog(LOG_DEBUG,"Error mr90xx_SetEngineModel");
	 } else {
	 dlog(LOG_DEBUG,"mr90xx_SetEngineModel OK");
	 }*/

}

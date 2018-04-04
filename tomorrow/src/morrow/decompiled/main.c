
#include <stdlib.h>

#include <stdio.h>

#include "../include/mr90xx.h"

#include "../include/wrapper.h"

#include "../include/mr_defin.h"

#include "../include/sapform.h"
#include "../include/sa_defin.h"

#include "../include/visatype.h"

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

int main(int argc, char **argv) {
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

	mr90xxStatus = mr90xx_SetEngineModel( sessionId, SA9054 );
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_SetEngineModel");
	} else {
		printf("mr90xx_SetEngineModel OK");
	}

}

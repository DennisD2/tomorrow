
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <stdio.h>

#include "../include/wrapper.h"
#include "../include/mr_defin.h"

#include "../include/sapform.h"
#include "../include/sa_defin.h"

#include "../include/visatype.h"

int main(int argc, char **argv) {
	char sessionString[50];
	ViChar message[60];
	ViStatus mr90xxStatus;
	ViSession tempId;

	printf("main start\n");

	sprintf(sessionString, "VXI:126:INSTR");

	mr90xxStatus = mr90xx_init( sessionString, VI_TRUE, VI_TRUE, &tempId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init");
	} else {
		printf("mr90xx_init OK");
	}



}

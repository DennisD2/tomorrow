#include <sicl.h>

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>
#include <mrapp.h>

#include "helper.h"

int main(int argc, char **argv) {

	setLogLevel(LOG_INFO);
	dlog(LOG_INFO, "----------------------------------------\n");

	char sessionString[50];
	ViChar message[128];
	ViStatus mr90xxStatus;
	ViSession sessionId;

	printf("main start\n");

	sprintf(sessionString, "vxi,126");

	mr90xxStatus = mr90xx_init(sessionString, VI_TRUE, VI_TRUE, &sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init\n");
		exit(-1);
	} else {
		printf("mr90xx_init OK\n\n");
	}

	mr90xxStatus = mr90xx_SetEngineModel(sessionId, SA9054);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_SetEngineModel\n");
		exit(-1);
	} else {
		dlog(LOG_INFO, "mr90xx_SetEngineModel OK\n\n");
	}

	ViInt16 number_points = 40;
#ifdef SPAN_149_to_150_MHZ
	// 149..150 Mhz
	ViReal64 start_freq = 149000000;
	ViReal64 stop_freq = 150000000;
#else
	// 1..2 Mhz
	ViReal64 start_freq = 1000000;
	ViReal64 stop_freq =  2000000;
#endif
	ViInt16 ref_level = 2;
	mr90xxStatus = mr90xx_InitGuiSweep(sessionId, MR90XX_RBW_AUTO,
			MR90XX_VBW_AUTO, start_freq, stop_freq, ref_level, number_points);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_InitGuiSweep\n");
		exit(-1);
	} else {
		dlog(LOG_INFO, "mr90xx_InitGuiSweep OK\n\n");
	}

	setLogLevel(LOG_INFO);

	while (1) {
		ViReal64 amp_array[40], freq_array[40];
		mr90xxStatus = mr90xx_MeasureAmplWithFreq(sessionId, MR90XX_RBW_AUTO,
			MR90XX_VBW_AUTO, start_freq, stop_freq, ref_level, number_points,
			MR90XX_SWP_MIN,
			MR90XX_DBM_FORMAT, amp_array, freq_array);
		if (mr90xxStatus != MR90XX_IE_SUCCESS) {
			dlog(LOG_ERROR, "Error mr90xx_MeasureAmplWithFreq\n");
		} else {
			dlog(LOG_INFO, "mr90xx_MeasureAmplWithFreq OK\n");
		}

		int i;
		for (i = 0; i < number_points; i++) {
			printf("Amplitude = %10.2f dBm, Frequency = %10.0f Hz\n", amp_array[i],
					freq_array[i]);
		}
	}
}

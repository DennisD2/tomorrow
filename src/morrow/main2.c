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

//#include "compatibility.h"
#include "vximorrow.h"

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
	ViReal64 start_freq =1000000;
	ViReal64 stop_freq = 2000000;
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

	ViReal64 amp_array[40], freq_array[40], b_array[40], c_array[40];
	/*mr90xxStatus = mr90xx_MeasureAmplWithFreq(sessionId, MR90XX_RBW_AUTO,
		MR90XX_VBW_AUTO, start_freq, stop_freq, ref_level, number_points,
		MR90XX_SWP_MIN,
		MR90XX_DBM_FORMAT, amp_array, freq_array);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_MeasureAmplWithFreq\n");
	} else {
		dlog(LOG_INFO, "mr90xx_MeasureAmplWithFreq OK\n");
	}*/
	uint16_t wordPtr[12];
/*
	wordPtr[0]=0x8f40; // 149..150 Mhz
	wordPtr[1]=0x8e1;
	wordPtr[2]=0xd180;
	wordPtr[3]=0x8f0;
	wordPtr[4]=0x100;
	wordPtr[5]=0x6429;
	wordPtr[6]=0x0;
	wordPtr[7]=0x0;
	wordPtr[8]=0x0;
	wordPtr[9]=0x2a;
	wordPtr[10]=0x0;
	wordPtr[11]=0x1;
*/

/*
	wordPtr[0]=0xbba0; // 900K..1100Khz
	wordPtr[1]=0xd;
	wordPtr[2]=0xc8e0;
	wordPtr[3]=0x10;
	wordPtr[4]=0x100;
	wordPtr[5]=0x1408;
	wordPtr[6]=0x0;
	wordPtr[7]=0x0;
	wordPtr[8]=0x0;
	wordPtr[9]=0x2a;
	wordPtr[10]=0x0;
	wordPtr[11]=0x1;
*/


	wordPtr[0]=0x4240; // 1..2Mhz
	wordPtr[1]=0xf;
	wordPtr[2]=0x8480;
	wordPtr[3]=0x1e;
	wordPtr[4]=0x100;
	wordPtr[5]=0x6429;
	wordPtr[6]=0x0;
	wordPtr[7]=0x0;
	wordPtr[8]=0x0;
	wordPtr[9]=0x2a;
	wordPtr[10]=0x0;
	wordPtr[11]=0x1;

	SET9052 *a1 = sessionForId(sessionId);
	uint32_t unused;
	DLFMModeOff(a1, unused);
	VISA_ClearDataFIFO(a1);
	SendCommand(a1, ENG_START_SWP, 12, wordPtr);
	DLFMModeOff(a1, unused);
	//int numDataPoints = RdNumDataPts(sessionId);

	int i;

	int no_data = 1;
	for (i = 0; i < number_points; i++) {
		while (VISA_CheckHWStatus(a1) == STAT_EMPTY) {
		}
		uint32_t v4 = VISA_CheckHWStatus(a1) & 0xf00 /*3840*/; // 0x10002472
		fifoPrint(v4);

		if (v4 != STAT_EMPTY) {
			no_data = 0;
			uint16_t data = 0;
#ifdef DLFM
			// Read from Data Low
			data = readDataWord(a1);
			amp_array[i] = (float64_t) data;
#else
			sendWord(a1, VXI_ENGINEDATA);
			//data = readDataWord(a1);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "data[%d] = 0x%x, %d, %u\n", i, data, data, data);
			amp_array[i] = (float64_t) data;
#endif
		}
	}

	for (i = 0; i < number_points; i++) {
		while (VISA_CheckHWStatus(a1) == STAT_EMPTY) {
		}
		uint32_t v4 = VISA_CheckHWStatus(a1) & 0xf00 /*3840*/; // 0x10002472
		fifoPrint(v4);

		if (v4 != STAT_EMPTY) {
			no_data = 0;
			uint16_t data = 0;
#ifdef DLFM
			// Read from Data Low
			data = readDataWord(a1);
			amp_array[i] = (float64_t) data;
#else
			sendWord(a1, VXI_ENGINEDATA);
			//data = readDataWord(a1);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "data[%d] = 0x%x, %d, %u\n", i, data, data, data);
			b_array[i] = (float64_t) data;
#endif
		}
	}
	for (i = 0; i < number_points; i++) {
		while (VISA_CheckHWStatus(a1) == STAT_EMPTY) {
		}
		uint32_t v4 = VISA_CheckHWStatus(a1) & 0xf00 /*3840*/; // 0x10002472
		fifoPrint(v4);

		if (v4 != STAT_EMPTY) {
			no_data = 0;
			uint16_t data = 0;
#ifdef DLFM
			// Read from Data Low
			data = readDataWord(a1);
			amp_array[i] = (float64_t) data;
#else
			sendWord(a1, VXI_ENGINEDATA);
			//data = readDataWord(a1);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "data[%d] = 0x%x, %d, %u\n", i, data, data, data);
			c_array[i] = (float64_t) data;
#endif
		}
	}


	if (no_data) {
		return 1;
	}

	for (i = 0; i < number_points; i++) {
		float f = start_freq + i*(stop_freq-start_freq)/ number_points;
		printf("[%d, %10.0f] Amplitude = %10.2f\n", i, f, amp_array[i]);
	}
}

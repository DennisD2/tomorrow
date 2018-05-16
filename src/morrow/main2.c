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

#include "vximorrow.h"
#include "sa.h"

#include "time.h"

int main(int argc, char **argv) {

	setLogLevel(LOG_DEBUG);
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

#define NUM_POINTS 40
	ViInt16 number_points = NUM_POINTS;
	ViReal64 start_freq =1200000;
	ViReal64 stop_freq = 1600000;
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

	ViReal64 amp_array[NUM_POINTS], freq_array[NUM_POINTS];
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

	setLogLevel(LOG_DEBUG);
	SET9052 *a1 = sessionForId(sessionId);
	// Set Sweep code to the same values as mr90xx_MeasureAmplWithFreq() would do.
	SetSweepCode(a1, MR90XX_SWP_MIN|MR90XX_SWP_CONT|MR90XX_SWP_FRQPTS);

	//SetNumCells(a1,40);
	uint32_t fstart = __ftol(start_freq);
	uint32_t fstop = __ftol(stop_freq);
	uint32_t fstep = (fstop-fstart)/(a1->num_cells-1); // __ftol(a1->step);
	wordPtr[0] = fstart & 0xffff; // 0x4240; // 1..2Mhz // start LO
	wordPtr[1] = fstart >> 16; // 0xf; // start HI
	wordPtr[2] = fstop & 0xffff; 0x8480; // stop LO
	wordPtr[3] = fstop >> 16; // 0x1e; // stop HI
	wordPtr[4] =  a1->filter_code; // filter_code
	wordPtr[5] = fstep&0xffff; // 0x6429; // step LO
	wordPtr[6] = fstep >> 16 ; //0x0; // step HI
	wordPtr[7] = 0x0; // settle time LO
	wordPtr[8] = 0x0; // settle time HI
	wordPtr[9] = a1->PreampEnabled? (a1->attenuation & 0xff)|0x8000 : (a1->attenuation & 0xff); // 0x2a; // attenuation
	wordPtr[10] = RdCellMode(a1)!=1? 0 : a1->num_cells;
	// Next line; reading option is ok, but nobody in lib code sets any options, so RgEngOption(*) always returns 0 :-(
	int32_t opt1 = RdEngOption(a1, ENG_OPT_1 /*1*/);
	uint16_t sweep_code = (opt1 & 0x10) | a1->sweep_code; // See IDA
	//dlog(LOG_DEBUG, "EngineOpts: 0x%x, a1->sweep_code=0x%x, sweep_code=0x%x\n", opt1, a1->sweep_code, sweep_code );
	wordPtr[11] = sweep_code;

	setLogLevel(LOG_INFO);

	uint32_t unused;
	DLFMModeOff(a1, unused);
	// Clear FIFO
	VISA_ClearDataFIFO(a1);
	// Start (continuous) sweep
	SendCommand(a1, ENG_START_SWP, 12, wordPtr);
	// Endure that DLFM mode is off for 'normal' data reading
	DLFMModeOff(a1, unused);

	int i;

	struct timespec start, now;
	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		dlog(LOG_ERROR, "clock gettime");
		exit(-1);
	}


	int no_data = 1;
	for (i = 0; i < number_points; i++) {
		while (VISA_CheckHWStatus(a1) == STAT_EMPTY) {
		}
		uint32_t v4 = VISA_CheckHWStatus(a1) & 0xf00;
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
//			data = dd_p1Command(a1->session_handle, VXI_ENGINEDATA, 0);
//			uint32_t val;
//			while (readResponseReg(a1, READREADY, &val) != IE_SUCCESS) {
//				// wait
//			}
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "amp[%d] = 0x%x, %d\n", i, data, data); // <-- line is required; timing issue!
			amp_array[i] = (float64_t) data;

			sendWord(a1, VXI_ENGINEDATA);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "freq lo [%d] = 0x%x, %d\n", i, data, data); // <-- line is required; timing issue!
			uint16_t flo = data;

			sendWord(a1, VXI_ENGINEDATA);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "freq hi [%d] = 0x%x, %d\n", i, data, data); // <-- line is required; timing issue!
			uint16_t fhi = data;

			uint32_t freq = ((uint32_t)fhi << 16) | (flo & 0xffff);
			freq_array[i] = (float64_t) freq;
#endif
		}
	}
	if (clock_gettime( CLOCK_REALTIME, &now) == -1) {
		dlog(LOG_ERROR, "clock gettime");
		exit(-1);
	}

	if (no_data) {
		return 1;
	}

	for (i = 0; i < number_points; i++) {
		//float f = start_freq + i*(stop_freq-start_freq)/ number_points;
		printf("[%d] Amplitude = %10.2f, Frequency = %10.0f\n", i, amp_array[i], freq_array[i]);
	}

	long delta_s_in_ms = (now.tv_sec - start.tv_sec)*1000L;
	long delta_ns_in_ms = (now.tv_nsec - start.tv_nsec)/1000L/1000L;
	long delta = delta_s_in_ms + delta_ns_in_ms;
	dlog(LOG_INFO, "\tTime spent: %ld ms, %ld ms per iteration.\n", delta, delta/number_points);

}

// gcc -I ../include -W -g  main.c pnp.c sa.c -o main

#include <math.h>
#include <stdlib.h>
#include <time.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>
#include <mrapp.h>
#include "sa.h"

#include "dvisa.h"
#include "helper.h"

static int32_t updateSweepInProgValue(SET9052 *a1, uint16_t value);
static int32_t function_10003f7a(SET9052 *a1);
static int32_t function_100119ba(char a1);
static int32_t function_1000e8d2(char a1, int32_t a2);
static int32_t function_10013d49(int32_t a1, int32_t a2, char a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8);

static int32_t FreqInRange(SET9052 * a1, float64_t freq);
static char *alloc_1000da64(int32_t size);

static int32_t g3 = 0; // eax

static int32_t *g4 = 0; // ebp
// these are values related to rbw. I have no clue what values need to be set instead of 0....
// g4 is used at other places as int value. !?!
//static int32_t g4[] = { 0,0,0,0 };

static int32_t g5 = 0; // ebx
static int32_t g6 = 0; // ecx
static char* g7 = 0; // edi
static int32_t g8 = 0; // edx
static int32_t g9 = 0; // esi

static int32_t g11 = 0; // fpu_stat_TOP
static char * g12;

// Seems to be some array; g13..g17
//int32_t g13 = 0x1000505d; // 20573
//int32_t g14 = 0x1000c8b7; // 51385
//int32_t g15 = 0x1000c923;
//int32_t g16 = 0x1000cbc9;
//int32_t g17 = 0x1000ccaf;
//int32_t *g13 = { 0x1000505d, 0x1000c8b7, 0x1000c923, 0x1000cbc9, 0x1000ccaf };

// g14..g17 is or are arrays.
//static int32_t g14_rbwTimeFactor = 0x1000c8b7;
//static int32_t g14_rbwTimeFactor[] = { 0x1000c8b7, 0x1000c923, 0x1000cbc9,
//		0x1000ccaf };

//static int32_t g15_vbwTimeFactor = 0x1000c923;
//static int32_t g15_vbwTimeFactor[] = { 0x1000c923, 0x1000cbc9, 0x1000ccaf };

//static float64_t g40[] = { 0.0, 0.0, 0.0, 0.0 };

static int32_t g49; // 0x100183d4
static int32_t g50 = 1;

static int32_t g61 = 0;

static int32_t g94 = 0;

static int32_t g107 = 0;

//static int32_t g128 = 0;
static int32_t g129 = 0;
//static int32_t g130 = 0;
//static int32_t g131 = 0;

float80_t frequencyLimit = 0.0L; // st0 vbw????
static float80_t frequencyLimit_rbwFrequency = 0.0L; // st0
static float80_t g160_currentStepWidth = 0.0L; // st1

char *__nh_malloc(int32_t numBytes, int32_t a2) {
	return (char *) malloc(numBytes);
}

int32_t InitEngine(SET9052 *a1) {
	dlog( LOG_DEBUG, "InitEngine\n");
	SET9052 *v1 = a1; // 0x10003c79
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x10003c7d
	g3 = v2;
	int32_t result; // 0x10003cd0
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		if (*(int32_t *)(v1 + 660) != 0) {
			int32_t * v3 = (int32_t *)(v1 + 712); // 0x10003ca9
			if (*v3 != 0) {
				__pseudo_call(*v3);
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
		result = (int32_t) v1 & -0x10000 | 0xffeb;
#else
		/* InitEngine call */
		result = VISA_InitEngine(a1);
#endif
	} else {
		result = GetFuncStatusCode(v1);
	}
	return result;
}

int32_t ResetEngine(SET9052 *a1) {
	dlog( LOG_DEBUG, "ResetEngine\n");
	SET9052 *v1 = a1; // 0x10003cd5
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x10003cd9
	g3 = v2;
	int32_t result; // 0x10003d2c
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		if (*(int32_t *)(v1 + 660) != 0) {
			int32_t * v3 = (int32_t *)(v1 + 716); // 0x10003d05
			if (*v3 != 0) {
				__pseudo_call(*v3);
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
		result = v1 & -0x10000 | 0xffeb;
#else
		/* InitEngine call */
		result = VISA_ResetEngine(a1);
#endif
	} else {
		result = GetFuncStatusCode(v1);
	}
	return result;
}

void *ClearFuncStatusCode(SET9052 *a1) {
	if (a1 != NULL) {
		a1->func_status_code = 0;
	}
	return a1;
}

int32_t RdSessionString(SET9052 *a1, char *sessionString) {
	dlog( LOG_DEBUG, "RdSessionString(%x)\n", sessionString);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10008d6f
	g3 = v1;
	int32_t result; // 0x10008dbc
	if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
		result = GetFuncStatusCode(a1);
		return result;
	}
	if (sessionString != 0) {
		g8 = sessionString;
		result = function_1000d570(sessionString) & -0x10000;
	} else {
		g3 = a1;
		result = SetFuncStatusCode(a1, IE_ERR_VALS /*-3*/);
	}
	return result;
}

int32_t TestFuncStatusAndPtr(SET9052 *a1) {
	//dlog( LOG_DEBUG, "TestFuncStatusAndPtr\n");
	if (a1 == NULL) {
		return g3 & -0x10000 | 0xfff6;
	}
	g3 = a1;
	int32_t v1 = RdEngOption(a1, ENG_OPT_2 /*2*/); // 0x10001437
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x1000143f
	g6 = v2 / 0x10000;
	if ((v2 || 0xffff) < 0x1ffff) {
		//dlog( LOG_DEBUG, "TestFuncStatusAndPtr() --> %x, %x\n", v1, v2);
		return v1 & -0x10000;
	}
	g8 = a1;
	int32_t v3 = GetFuncStatusCode(a1); // 0x1000144f
	int32_t v4 = 0x10000 * v3 / 0x10000; // 0x1000145b
	int32_t result; // 0x1000146f
	if ((int16_t) v3 >= 0) {
		result = v4 & -0x10000;
	} else {
		result = v4;
	}
	//dlog( LOG_DEBUG, "TestFuncStatusAndPtr() --> %x\n", result);
	return result;
}

int32_t SetFuncStatusCode(SET9052 *a1, uint16_t code) {
	if (code != 0) {
		dlog( LOG_DEBUG, "SetFuncStatusCode(%x)\n", code);
	}
	int32_t v1 = g4; // 0x10001365
	int32_t v2 = v1; // bp-4
	g4 = &v2;
	int32_t result;
	int32_t v3; // 0x100013af
	if (a1 != 0) {
		g3 = a1;
		int16_t *v4 = &a1->func_status_code; // (int16_t *) (a1 + 204); // 0x10001377
		int16_t v5 = *v4; // 0x10001377
		g6 = v5;
		if (v5 >= 0) {
			g6 = a1;
			g8 = g8 & -0x10000 | (int32_t) code;
			*v4 = code;
		} else {
			g8 = a1;
			if ((0x10000 * RdEngOption(a1, ENG_OPT_2 /*2*/) || 0xffff)
					< 0x1ffff) {
				g6 = a1;
				g8 = g8 & -0x10000 | (int32_t) code;
				*v4 = code;
			}
		}
		v3 = v2;
		// DD: next line replaced 'a1' with '(int32_t)a1'
		result = (int32_t) *v4 | (int32_t) a1 & -0x10000;
	} else {
		v3 = v1;
		result = g3 & -0x10000 | 0xfff6;
	}
	g4 = v3;
	return result;
}

int32_t SetEngineReplyCode(SET9052 *a1, uint16_t code) {
	dlog( LOG_DEBUG, "SetEngineReplyCode(%x)\n", code);
	int32_t result;
	if (a1 != NULL) {
		a1->engine_reply_code = code;
		result = (int32_t) a1 & -0x10000 | (int32_t) code;
	} else {
		result = g3 & -0x10000 | 255;
	}
	return result;
}

#define ENG_OPT_0 0
#define ENG_OPT_1 1
#define ENG_OPT_2 2
/* Inquire engine option 0x01, 0x02, 0x04 depending on option value. */
int32_t RdEngOption(SET9052 *a1, int32_t option) {
	//dlog( LOG_DEBUG, "RdEngOption(%d)\n", option);
	if (a1 == 0) {
		return g3 & -0x10000 | 0xfff6;
	}
	g3 = a1;
	a1->func_status_code = 0;
	g6 = option;
	if (option == ENG_OPT_0) {
		g8 = a1;
		return a1->eng_options & 1;
	}
	if (option == ENG_OPT_1) {
		return (a1->eng_options & 2) != 0;
	}
	int32_t result;
	if (option == ENG_OPT_2) {
		g6 = a1;
		result = (a1->eng_options & 4) != 0;
	} else {
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_FAILURE /*-1*/);
	}
	return result;
}

int32_t function_1000d570(char * /*int32_t*/a1) {
#ifdef ORIG
	char * v1 = g7; // 0x1000d570
	g7 = a1;
	return function_1000d5e1(v1);
#else
	return 0;
#endif
}

int32_t function_1000d5e1(char * a1) {
	// 0x1000d5e1
	char * v1;
	char * v2 = (int32_t) v1; // 0x1000d5e1
	char * v3 = v2; // 0x1000d614
	int32_t v4; // 0x1000d60b
	if (((int32_t) v2 & 3) != 0) {
		int32_t result;
		while (true) {
			unsigned char v5 = *(char *) v2; // 0x1000d5ed
			int32_t v6 = g8 & -256 | (int32_t) v5; // 0x1000d5ed
			g8 = v6;
			g6 = v2 + 1;
			if (v5 == 0) {
				// 0x1000d658
				*(char *) g7 = (char) v6;
				g7 = a1;
				return result;
			}
			// 0x1000d5f4
			*(char *) g7 = v5;
			g7++;
			int32_t v7 = g6; // 0x1000d5f7
			if ((v7 & 3) == 0) {
				v3 = v7;
				// break -> 0x1000d606
				break;
			}
			v2 = v7;
			// continue -> 0x1000d5ed
		}
		while (true) {
			// 0x1000d606
			v4 = *(int32_t *) v3;
			g8 = v4;
			g6 = v3 + 4;
			if (((v4 + 0x7efefeff ^ -1 - v4) & -0x7efeff00) != 0) {
				lab_0x1000d620:
				// 0x1000d620
				if ((char) v4 == 0) {
					// 0x1000d658
					// branch -> 0x1000d658
					// 0x1000d658
					*(char *) g7 = (char) v4;
					g7 = a1;
					return result;
				}
				// 0x1000d624
				if ((v4 & 0xff00) == 0) {
					// 0x1000d64f
					*(int16_t *) g7 = (int16_t) v4;
					g7 = a1;
					return result;
				}
				// 0x1000d628
				if ((v4 & 0xff0000) == 0) {
					// 0x1000d642
					*(int16_t *) g7 = (int16_t) v4;
					*(char *) (g7 + 2) = 0;
					g7 = a1;
					return result;
				}
				// 0x1000d630
				if (v4 < 0x1000000) {
					// 0x1000d63a
					*(int32_t *) g7 = v4;
					g7 = a1;
					return result;
				}
				// 0x1000d601
				*(int32_t *) g7 = v4;
				g7 += 4;
				v3 = g6;
				// branch -> 0x1000d606
				continue;
			}
			lab_0x1000d601:
			// 0x1000d601
			*(int32_t *) g7 = v4;
			g7 += 4;
			v3 = g6;
			// branch -> 0x1000d606
		}
	}
	while (true) {
		// 0x1000d606
		v4 = *(int32_t *) v3;
		g8 = v4;
		g6 = v3 + 4;
		if (((v4 + 0x7efefeff ^ -1 - v4) & -0x7efeff00) == 0) {
			goto lab_0x1000d601;
		}
		goto lab_0x1000d620;
	}
}

// DD: because (a1 + 2) == engine_model, a1 must be (struct SAStruct *) = SET9052 !!! yippie 2
int32_t InitInstrData(/*int32_t a1*/SET9052 *a1) {
	dlog( LOG_DEBUG, "InitInstrData\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	int32_t result;
	if (a1 != 0) {
		//*(int16_t *) (a1 + 196) = 0;
		a1->interfaceType = 0;
		// DD: (int16_t *)(a1 + 2) equals a1->engine_model
		// int16_t * v2 = (int16_t *)(a1 + 2); // 0x10004bb5
		int16_t v2 = a1->engine_model;
		// DD: 256 = 0x100 = SA9052, 512=0x200=SA9054, 1024=0x400=SA9034, 768=0x300=SA9085
		if (v2 != SA9052 /*256*/) {
			if (v2 != SA9054 /*512*/) {
				if (v2 != SA9034 /*1024*/) {
					if (v2 != SA9085 /*768*/) {
						v2 = SA9052 /*256*/;
					}
				}
			}
		}
		// DD: a1+8 = a1->start but aligned to 8byte(?TODO ensure that this is so)
		//*(int32_t *)(a1 + 8) = 0;
		//*(int32_t *)(a1 + 12) = 0x4197d784;
		a1->start = 100000000.0;

		//*(int32_t *)(a1 + 16) = 0;
		//*(int32_t *)(a1 + 20) = 0x41a7d784;
		a1->stop = 200000000.0;

		//*(int16_t *) (a1 + 204) = 0; //func_status_code
		a1->func_status_code = 0;
		//*(int16_t *) (a1 + 206) = 0; //engine_reply_code
		a1->engine_reply_code = 0;

		// DD: a1+4 = a1->swp_in_prog
		//*(int16_t *)(a1 + 4) = 0;
		a1->swp_in_prog = IE_FALSE;

		//*(int32_t *)(a1 + 24) = 0;
		//*(int32_t *)(a1 + 28) = 0x40e86a00;
		a1->step = 50000.0;

		//*(int16_t *)(a1 + 32) = 1;
		a1->step_mode = 1;
		//*(int16_t *)(a1 + 34) = 1;
		a1->time_mode = 1;

		//*(int16_t *)(a1 + 64) = 1;
		a1->cell_mode = IE_TRUE;
		//*(int16_t *)(a1 + 66) = 1;
		a1->auto_cell = IE_ON;
		//*(int32_t *)(a1 + 36) = 0;
		a1->dwell_time = 0;
		// *(int32_t *)(a1 + 40) = 0;
		a1->settle_time = 0;

		//*(int32_t *)(a1 + 48) = 0;
		//*(int32_t *)(a1 + 52) = 0;
		a1->sweep_time = 0;

		//*(int32_t *)(a1 + 60) = 120;
		a1->synth_time = 120;
		//*(int16_t *)(a1 + 72) = 4;
		a1->rbw_code = RBW_3MHZ;
		//*(int16_t *)(a1 + 74) = 1;
		a1->auto_rbw = IE_ON;

		//*(int16_t *)(a1 + 76) = 7;
		a1->vbw_code = VBW_3MHZ;

		//*(int16_t *)(a1 + 78) = 1;
		a1->auto_vbw = IE_ON;
		//*(int16_t *)(a1 + 80) = 0;
		a1->filter_code = 0;

		//*(int32_t *)(a1 + 88) = -0x66666666;
		//*(int32_t *)(a1 + 92) = 0x3fb99999;
		a1->filter_ratio = 0.1;

		//*(int16_t *)(a1 + 96) = 20;
		a1->attenuation = 20;
		//*(int16_t *)(a1 + 98) = 0;
		a1->ref_level = 0;
		//*(int16_t *)(a1 + 108) = 0;
		a1->trig_code = 0;
		//*(int16_t *)(a1 + 110) = 1;
		a1->trig_norm_flag = IE_TRUE;
		//*(int32_t *)(a1 + 112) = 0;
		a1->trig_delay = 0;

		//*(int16_t *)(a1 + 116) = 0;
		a1->trig_thresh = 0;

		//*(int32_t *)(a1 + 120) = 0;
		//*(int32_t *)(a1 + 124) = 0;
		a1->trig_freq = 0;

		//*(int16_t *)(a1 + 128) = 36; // 36 = 0x20 +0x4
		a1->detect_code = DTEC_ENABL | DTEC_LIN;
		// *(int16_t *)(a1 + 130) = 5; // 5 = 0x1 + 0x4
		a1->sweep_code = SWP_CONT | SWP_MAX;

		//*(int32_t *)(a1 + 132) = 501;
		a1->num_cells = 501;
		//*(int16_t *)(a1 + 136) = 0;
		a1->intr_code = 0;

		//*(int32_t *)(a1 + 144) = 0;
		//*(int32_t *)(a1 + 148) = 0x411e8480;
		a1->zspan_freq = 500000.0;

		//*(int32_t *)(a1 + 160) = 0;
		a1->sweepIndex = 0; //ok

		//*(int32_t *)(a1 + 68) = 501;
		a1->deflt_pt_cnt = 501;

		//*(int32_t *)(a1 + 152) = 501;
		a1->num_samples = 501; //ok

		SetZSamplRate(a1, 1000000 /*0xf4240*/);

		//*(int32_t *)(a1 + 164) = 501;
		a1->num_swp_pts = 501; //ok

		//*(int32_t *)(a1 + 168) = 501;//num_step_pts
		a1->num_step_pts = 501;
		//*(int32_t *)(a1 + 172) = 501;//num_hop_pts
		a1->num_hop_pts = 501;
		//*(int16_t *)(a1 + 176) = 50;//impedance
		a1->impedance = 50;

		//*(int16_t *)(a1 + 184) = 0;//extern_ref
		a1->extern_ref = 0;
		//*(int32_t *)(a1 + 188) = 0;//z_cell_size added by me
		a1->z_cell_size = 0;

		//*(int32_t *) (a1 + 192) = 0; //err_status
		a1->err_status = 0;
		//*(int32_t *) (a1 + 180) = 55; //ie_duration
		a1->ie_duration = 55;
		//*(int32_t *) (a1 + 200) = 0; //eng_options
		a1->eng_options = 0;

		//*(int32_t *) (a1 + 468) = 0;//session_handle
		a1->session_handle = 0;
		//*(int16_t *) (a1 + 472) = 880;//data_port
		a1->data_port = 880;
		//*(int16_t *) (a1 + 474) = 5;  //irq_num
		a1->irq_num = 5;
		//*(int16_t *) (a1 + 476) = 127;//logical_addr
		a1->logical_addr = 127;
		//*(int32_t *) (a1 + 480) = 0;//commHandle
		a1->commHandle = 0;

		// start of values not settled so far
		//*(int16_t *) (a1 + 532) = -1; // commNumber
		a1->commNumber = -1;
		//*(int16_t *) (a1 + 536) = -1;
		a1->comm_irq = -1;
		//*(int16_t *) (a1 + 534) = -1;
		a1->comm_addr = -1;
		//*(int16_t *) (a1 + 538) = -1;
		a1->commRateCode = -1;
		//*(int16_t *) (a1 + 540) = 0;
		a1->commDialMeth = -1;
		//*(int16_t *) (a1 + 542) = 1;
		a1->commSpeakMode = -1;

		//*(char *) (a1 + 544) = 0; // commPhoneNum
		a1->commPhoneNum[0] = '\0';
		//*(char *) (a1 + 594) = 0; // must be commInitString but offset is wrong by 6 bytes
		a1->commInitString[0] = '\0';
		// end of not settled values

		//*(int16_t *)(a1 + 100) = 0;//PreampAvailable
		a1->PreampAvailable = 0;
		//*(int16_t *)(a1 + 102) = 0;//PreampEnabled
		a1->PreampEnabled = 0;
		//*(int16_t *)(a1 + 104) = 10;//PreampGain
		a1->PreampGain = 10;
		recalcStep(a1);
		result = function_10001b13(a1) & -0x10000;
	} else {
		result = g3 & -0x10000 | 0xfff6;
	}
	return result;
}

int32_t SetZSamplRate(/*int32_t a1*/SET9052 *a1, int64_t rate) {
	dlog( LOG_DEBUG, "SetZSamplRate(0x%x)\n", rate);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100067e3
	g3 = v1;
	int32_t result; // 0x10006851
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		uint32_t v2 = (int32_t) rate; // 0x10006800
		uint64_t v3; // 0x1000683d
		if (v2 >= MIN_RATEVAL /*306*/) {
			int16_t v4; // bp-8
			if (v2 <= MAX_RATEVAL /* < 1000001 = 0xf4241*/) {
				v4 = IE_SUCCESS /*0*/;
			} else {
				v4 = IE_ERR_VALS /*-3*/;
				rate = MAX_RATEVAL /*1000000 = 0xf4240*/;
			}
			v3 = 10000000 /*0x989680*// rate;
			//*(int16_t *)(a1 + 156) = (int16_t)v3;
			a1->zsampl_dvdr = (int16_t) v3;
			return (int32_t) v3 & -0x10000 | (int32_t) v4;
		}
		v3 = 10e7 / MIN_RATEVAL /*32679 = 0x7fa7*/;
		//*(int16_t *)(a1 + 156) = (int16_t)v3;
		a1->zsampl_dvdr = (int16_t) v3;
		result = (int32_t) v3 & -0x10000 | (int32_t) -3;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

// function_10001718
int32_t recalcStep(SET9052 *a1) {
	dlog( LOG_DEBUG, "recalcStep()\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10001728
	g3 = v2;
	int32_t result; // 0x10001b12
	if ((0x10000 * v2 || 0xffff) >= 0x1ffff) {
		g8 = a1;
		result = GetFuncStatusCode(a1);
		g4 = v1;
		return result;
	}
	float64_t v3 = a1->stop;
	int32_t v4 = g11 - 1; // 0x1000174e
	float64_t v5 = a1->start;
#ifdef ORIG
	// Next line gives negative value; after examining with IDA, I assume decompiled wrong.
	float64_t v6 = (float80_t) v5 - (float80_t) v3; // 0x10001754
#else
	float64_t v6 = (float80_t) v3 - (float80_t) v5;
#endif
	// DD: a1 is a pointer; what does 'a1&256' mean???
	// maybe, a1 = a1+0 = a1->op_mode ...
	// but what is with pointer dereference
	// i.e. there is no dereferencing, so it looks like being used as a pointer after all...
	if (/*((int32_t) a1 & 256)*/a1->op_mode == 0) {
		int32_t *deflt_pt_cntPtr = &a1->deflt_pt_cnt;
		int32_t *num_swp_ptsPtr = &a1->num_swp_pts;
		*num_swp_ptsPtr = *deflt_pt_cntPtr;
		int32_t *num_step_ptsPtr = &a1->num_step_pts;
		*num_step_ptsPtr = *deflt_pt_cntPtr;
		g8 = a1;
		int16_t step_mode = a1->step_mode;
		if (step_mode != MR90XX_AUTO_ON /*1*/) {
			if (step_mode == MR90XX_STEPCNT /*2*/) {
				//int32_t v111 = *num_step_ptsPtr; // 0x10001aaa
				g8 = a1;
#ifdef ORIG
				// Division is wrong way around. after examining with IDA, I assume decompiled wrong. FDIVR opcode handled wrong.
				a1->step = (float64_t) ((float80_t) (*num_step_ptsPtr - 1) / (float80_t) v6);
#else
				a1->step = (float64_t) ((float80_t) (float80_t) v6 / (*num_step_ptsPtr - 1));
#endif
				if (a1->auto_rbw /* *(int16_t *)(a1 + 74)*/== MR90XX_AUTO_ON /*1*/) {
					setup_rbw(a1);
				}
				if (a1->auto_vbw /* *(int16_t *)(a1 + 78) */== MR90XX_AUTO_ON /*1*/) {
					g8 = a1;
					setup_vbw(a1);
				}
			} else {
				if (step_mode == MR90XX_STEPSIZ /*3*/) {
					g11 = v4;
					int32_t v12 = __ftol((int32_t) step_mode) + 1; // 0x10001a57
					*num_step_ptsPtr = v12;
					g8 = v12;
					*num_swp_ptsPtr = v12;
					if (a1->auto_rbw /* *(int16_t *)(a1 + 74)*/ == MR90XX_AUTO_ON /*1*/) {
						setup_rbw(a1);
					}
					if (a1->auto_vbw /* *(int16_t *)(a1 + 78) */ == MR90XX_AUTO_ON /*1*/) {
						g8 = a1;
						setup_vbw(a1);
					}
				}
			}
			g160_currentStepWidth = (float80_t) a1->step /* *(float64_t *)(a1 + 24)*/;
			g4 = v1;
			dlog( LOG_DEBUG, "recalcStep(), step set to %f\n", a1->step);
			return (int32_t) a1 & -0x10000;
		}

		if (a1->auto_rbw /* *(int16_t *)(a1 + 74)*/!= MR90XX_AUTO_ON /*1*/) {
			if (a1->auto_vbw /* *(int16_t *)(a1 + 78) */== MR90XX_AUTO_ON /*1*/) {
				setup_vbw(a1);
			}
		} else {
			setup_rbw(a1);
		}

		int16_t *cell_modePtr;
		if (a1->auto_cell /* *(int16_t *)(a1 + 66) */!= MR90XX_AUTO_ON) {
			cell_modePtr = &a1->cell_mode; // (int16_t *)(a1 + 64);
		} else {
			int16_t *v14 = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x100017f5
			if (*v14 == IE_FALSE) {
				int32_t v15 = GetRBWwide(RBW_3MHZ /*4*/);
				if (((0x100000000 * (int64_t) (v15 >> 31) | (int64_t) v15) / 3
						& 256) != 0) {
					SetCellMode(a1, 1);
					cell_modePtr = v14;
				} else {
					cell_modePtr = v14;
				}
			} else {
				cell_modePtr = v14;
			}
		}

		if (*cell_modePtr != IE_TRUE) {
			int32_t v16 = GetRBWwide(a1->rbw_code /* *(int16_t *)(a1 + 72) */); // 0x10001948
			int32_t v17 = (0x100000000 * (int64_t) (v16 >> 31) | (int64_t) v16)
					/ 3; // 0x10001956
			float64_t * v18 = &a1->step; // (float64_t *)(a1 + 24); // 0x10001961
			*v18 = (float64_t) v17;
			float80_t v19 = v6; // 0x10001967
			g11--;
			int32_t v20 = __ftol(v17); // 0x10001973
			*num_step_ptsPtr = v20;
			if (v20 < *deflt_pt_cntPtr) {
				int32_t v21 = *deflt_pt_cntPtr; // 0x10001998
				*num_step_ptsPtr = v21;
#ifdef ORIG
				// Division is wrong way around. after examining with IDA, I assume decompiled wrong. FDIVR opcode handled wrong.
				*v18 = (float64_t) ((float80_t) (v21 - 1) / v19);
#else
				*v18 = (float64_t) (v19 / (float80_t) (v21 - 1));
#endif
			}
			*num_swp_ptsPtr = *num_step_ptsPtr;
			g8 = a1;
			if (0x10000 * IsValidStep(a1) != 0x10000) {
				int32_t v22 = *num_step_ptsPtr + 10; // 0x100019eb
				*num_step_ptsPtr = v22;
				*num_swp_ptsPtr = v22;
#ifdef ORIG
				// Division is wrong way around. after examining with IDA, I assume decompiled wrong. FDIVR opcode handled wrong.
				*v18 = (float64_t) ((float80_t) (*num_step_ptsPtr - 1) / v19);
#else
				*v18 = (float64_t) (v19 / (float80_t) (*num_step_ptsPtr - 1));
#endif
				int32_t v23 = 0x10000 * IsValidStep(a1); // 0x10001a30
				g8 = v23 / 0x10000;
				while (v23 != 0x10000) {
					v22 = *num_step_ptsPtr + 10;
					*num_step_ptsPtr = v22;
					*num_swp_ptsPtr = v22;
#ifdef ORIG
					// Division is wrong way around. after examining with IDA, I assume decompiled wrong. FDIVR opcode handled wrong.
					*v18 = (float64_t) ((float80_t) (*num_step_ptsPtr - 1) / v19);
#else
					*v18 = (float64_t) (v19 / (float80_t) (*num_step_ptsPtr - 1));
#endif
					v23 = 0x10000 * IsValidStep(a1);
					g8 = v23 / 0x10000;
				}
				function_10001b13(a1);
				g160_currentStepWidth = (float80_t) a1->step; // *(float64_t *)(a1 + 24);
				g4 = v1;
				dlog( LOG_DEBUG, "recalcStep(), step set to %f\n", a1->step);
				return (int32_t) a1 & -0x10000;
			}
		} else {
			int32_t v24 = GetRBWwide(a1->rbw_code /* *(int16_t *)(a1 + 72) */); // 0x10001857
			int32_t v25 = v24/3; // (0x100000000 * (int64_t) (v24 >> 31) | (int64_t) v24) / 3; // 0x10001865
			float64_t *v26 = &a1->step; // (float64_t *)(a1 + 24); // 0x10001870
			*v26 = (float64_t) v25;
			float80_t v27 = v6; // 0x10001876
			g11--;
			int32_t v28 = __ftol(v25); // 0x10001882
			*num_step_ptsPtr = v28;
			int32_t *v29 = &a1->num_cells; // (int32_t *)(a1 + 132); // 0x1000189c
			if (v28 < *v29) {
				int32_t v30 = *v29; // 0x100018aa
				*num_step_ptsPtr = v30;
#ifdef ORIG
				// Division is wrong way around. after examining with IDA, I assume decompiled wrong. FDIVR opcode handled wrong.
				*v26 = (float64_t) ((float80_t) (v30 - 1) / v27);
#else
				*v26 = (float64_t) (v27 / (float80_t) (v30 - 1));
#endif
			}
			*num_swp_ptsPtr = *num_step_ptsPtr;
			g8 = a1;
			if (0x10000 * IsValidStep(a1) != 0x10000) {
				int32_t v31 = *num_step_ptsPtr; // 0x100018fa
				*num_step_ptsPtr = v31 + 10;
				*v26 = (float64_t) ((float80_t) (v31 + 9) / v27);
				int32_t v32 = 0x10000 * IsValidStep(a1); // 0x10001933
				g8 = v32 / 0x10000;
				while (v32 != 0x10000) {
					v31 = *num_step_ptsPtr;
					*num_step_ptsPtr = v31 + 10;
#ifdef ORIG
					// Division is wrong way around. after examining with IDA, I assume decompiled wrong. FDIVR opcode handled wrong.
					*v26 = (float64_t) ((float80_t) (v31 + 9) / v27);
#else
					*v26 = (float64_t) (v27 / (float80_t) (v31 + 9));
#endif
					v32 = 0x10000 * IsValidStep(a1);
					g8 = v32 / 0x10000;
				}
				function_10001b13(a1);
				g160_currentStepWidth = a1->step; // (float80_t)*(float64_t *)(a1 + 24);
				g4 = v1;
				dlog( LOG_DEBUG, "recalcStep(), step set to %f\n", a1->step);
				return (int32_t) a1 & -0x10000;
			}
		}
		function_10001b13(a1);
		g160_currentStepWidth = a1->step; // (float80_t)*(float64_t *)(a1 + 24);
		result = (int32_t) a1 & -0x10000;
	} else {
		result = (int32_t) a1 & -0x10000 | 0xfffb;
	}
	g4 = v1;
	dlog( LOG_DEBUG, "recalcStep(), step set to %f\n", a1->step);
	return result;
}

int32_t function_10001b13(SET9052 *a1) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t result = TestFuncStatusAndPtr(a1); // 0x10001b32
	int32_t v2 = 0x10000 * result; // 0x10001b3a
	g6 = v2 / 0x10000;
	if ((v2 || 0xffff) >= 0x1ffff) {
		g4 = v1;
		return result;
	}
	int32_t v3 = a1->num_step_pts; // *(int32_t *)(result2 + 168); // 0x10001b49

	g6 = a1;
	int16_t time_mode = a1->time_mode; // *(int16_t *)(result2 + 34); // 0x10001b55
	g8 = time_mode;
	if (time_mode == AUTO_ON /*1*/) {
		/* calculate both settle_time and sweeptime automatically */
		int32_t *v5 = &a1->dwell_time; // (int32_t *)(result2 + 36); // 0x10001b7e
		if (*v5 < 1) {
			//*(int32_t *)(result2 + 40) = 0;
			a1->settle_time = 0;
		} else {
			//*(int32_t *)(result2 + 40) = *v5;
			a1->settle_time = *v5;
		}
		int32_t v6 = DefltSetTimeRBW(
				a1->rbw_code /* *(int16_t *)(result2 + 72 )*/); // 0x10001ba4
		int32_t v7 = DefltSetTimeVBW(
				a1->vbw_code /* *(int16_t *)(result2 + 76 )*/); // 0x10001bb7
		if (v7 > v6) {
		} else {
			v7 = v6;
		}
		// DD: From next line we can derive that v6,v7,v8 are time values in [us] units
		int32_t v8 = *v5 + a1->synth_time /* *(int32_t *)(result2 + 60)*/+ v7; // 0x10001bed
		g8 = v8;
		float80_t v9 = v8; // 0x10001bf3
		g160_currentStepWidth = v9;
		g6 = a1;
		// *(float64_t *)(result2 + 48) = (float64_t)((float80_t)v3 * v9);
		a1->sweep_time = (float64_t) ((float80_t) v3 * v9);
		g4 = v1;
		return a1;
	}

	int32_t result3; // 0x10001c64
	if (time_mode == TIMESWP /*2*/) {
		/* calculate settle time from sweep time */
		int32_t *v10 = &a1->synth_time; //  (int32_t *)(result2 + 60); // 0x10001c06
		if ((*v10 * v3 & 0x4100) != 0) {
			int32_t v11 = *v10 * v3; // 0x10001c4e
			g8 = v11;
			g11--;
			result3 = __ftol(v11);
			g6 = a1;
			// *(int32_t *)(result2 + 40) = result3;
			a1->settle_time = result3;
		} else {
			// *(int32_t *)(result2 + 40) = -1;
			a1->settle_time = -1;
			int32_t v12 = *v10 * v3 + v3; // 0x10001c34
			g6 = v12;
			g8 = a1;
			// *(float64_t *)(result2 + 48) = (float64_t)v12;
			a1->sweep_time = (float64_t) v12;
			result3 = a1;
		}
		g4 = v1;
		return result3;
	}

	if (time_mode == TIMESET /*3*/) {
		/* calculate sweep time from settle time */
		int32_t *v13 = &a1->dwell_time; // (int32_t *)(result2 + 36); // 0x10001c77
		int32_t v14;
		int32_t v15; // 0x10001cb6
		if (*v13 < 1) {
			v15 = absValue(a1->settle_time/* *(int32_t *)(result2 + 40) */);
			v14 = 0;
		} else {
			//*(int32_t *)(result2 + 40) = 0;
			a1->settle_time = 0;
			int32_t v16 = DefltSetTimeRBW(
					a1->rbw_code /* *(int16_t *)(result2 + 72) */); // 0x10001c8f
			v14 = DefltSetTimeVBW(
					a1->vbw_code /* *(int16_t *)(result2 + 76) */);
			v15 = v16;
		}
		int32_t v17;
		if (v14 > v15) {
			v17 = v14;
		} else {
			v17 = v15;
		}
		g6 = a1;
		int32_t v18 = *v13 + a1->synth_time /* *(int32_t *)(result2 + 60) */
		+ v17; // 0x10001cec
		float80_t v19 = v18; // 0x10001cf2
		g160_currentStepWidth = v19;
		g8 = a1;
		// *(float64_t *)(result2 + 48) = (float64_t)((float80_t)v3 * v19);
		a1->sweep_time = (float64_t) ((float80_t) v3 * v19);
		result3 = v18;
	} else {
		result3 = v3;
	}
	g4 = v1;
	return result3;
}

int32_t setup_rbw(SET9052 *a1) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	g8 = a1;
	int32_t v2 = 0x10000 * TestFuncStatusAndPtr(a1); // 0x10001d2d
	int32_t result = v2 / 0x10000; // 0x10001e97
	if ((v2 || 0xffff) < 0x1ffff) {
		int16_t v3 = a1->auto_rbw; // *(int16_t *)(a1 + 74); // 0x10001d3c
		g8 = v3;
		if (v3 != AUTO_OFF /*0*/) {

			float64_t v4 = a1->stop; // *(float64_t *)(a1 + 16); // 0x10001d4f
			float64_t v5 = a1->start; // *(float64_t *)(a1 + 8); // 0x10001d52
#ifdef ORIG
			// Decompiled wrong.
			float64_t v6 = (float80_t) v5 - (float80_t) v4; // 0x10001d55
#else
			float64_t v6 = (float80_t) v4 - (float80_t) v5; // 0x10001d55
#endif
			int16_t *v7 = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x10001d5b
			float64_t v8;
			if (*v7 != IE_FALSE /*0*/) {
				if (*v7 == IE_TRUE /*1*/) {
					int32_t v9 = a1->num_step_pts; // *(int32_t *)(a1 + 168); // 0x10001d92
#ifdef ORIG
					// Decompiled wrong.
					v8 = (float80_t) (v9 - 1) / (float80_t) v6;
#else
					v8 = (float80_t) v6 / (float80_t) (v9 - 1) ;
#endif
				} else {
					v8 = 0.0;
				}
			} else {
				int32_t v10 = a1->num_swp_pts /* *(int32_t *)(a1 + 164) */- 1; // 0x10001d72
#ifdef ORIG
				// Decompiled wrong.
				v8 = (float80_t) v10 / (float80_t) v6;
#else
				v8 = (float80_t) v6 / (float80_t) v10;
#endif
			}

			int32_t v11 = GetRBWwide(RBW_300HZ /*0*/); // 0x10001daf
			int32_t v12 = (0x100000000 * (int64_t) (v11 >> 31) | (int64_t) v11)
					/ 3; // 0x10001dbd
			int16_t v13; // 0x10001e7f
			if ((v12 & 256) == 0) {
				//*(int16_t *)(a1 + 72) = 0;
				a1->rbw_code = RBW_300HZ /*0*/;
				//*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
				a1->step = (int32_t) (float32_t) v8;
				// DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
				*(int32_t *) (a1 + 28) = 0;
				v13 = a1->auto_vbw; // *(int16_t *)(a1 + 78);
				g8 = v13;
				if (v13 != IE_TRUE /*1*/) {
					result = 0;
				} else {
					result = setup_vbw(a1);
				}
				g4 = v1;
				return result;
			}

			int32_t v14 = GetRBWwide(RBW_3KHZ /*1*/); // 0x10001ddf
			int32_t v15 = (0x100000000 * (int64_t) (v14 >> 31) | (int64_t) v14)
					/ 3; // 0x10001ded
			if ((v15 & 256) == 0) {
				//*(int16_t *)(a1 + 72) = 1;
				a1->rbw_code = RBW_3KHZ /*1*/;
				//*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
				a1->step = (int32_t) (float32_t) v8;
				// DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
				*(int32_t *) (a1 + 28) = 0;
				v13 = a1->auto_vbw; // v13 = *(int16_t *)(a1 + 78);
				g8 = v13;
				if (v13 != 1) {
					result = 0;
				} else {
					result = setup_vbw(a1);
				}
				g4 = v1;
				return result;
			}

			int32_t v16 = GetRBWwide(RBW_30KHZ /*2*/); // 0x10001e0c
			int32_t v17 = (0x100000000 * (int64_t) (v16 >> 31) | (int64_t) v16)
					/ 3; // 0x10001e1a
			if ((v17 & 256) == 0) {
				//*(int16_t *)(a1 + 72) = 2;
				a1->rbw_code = RBW_30KHZ /*2*/;
				//*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
				a1->step = (int32_t) (float32_t) v8;
				// DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
				*(int32_t *) (a1 + 28) = 0;
				v13 = a1->auto_vbw; // v13 = *(int16_t *)(a1 + 78);
				g8 = v13;
				if (v13 != 1) {
					result = 0;
				} else {
					result = setup_vbw(a1);
				}
				g4 = v1;
				return result;
			}

			int32_t v18 = GetRBWwide(RBW_3MHZ /*3*/); // 0x10001e39
			int32_t v19 = (0x100000000 * (int64_t) (v18 >> 31) | (int64_t) v18)
					/ 3; // 0x10001e47
			if ((v19 & 256) != 0) {
				//*(int16_t *)(a1 + 72) = 4;
				a1->rbw_code = RBW_3MHZ;
			} else {
				//*(int16_t *)(a1 + 72) = 3;
				a1->rbw_code = RBW_300KHZ;
			}
			//*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
			a1->step = (int32_t) (float32_t) v8;
			// DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
			*(int32_t *) (a1 + 28) = 0;
			v13 = a1->auto_vbw; // v13 = *(int16_t *)(a1 + 78);
			g8 = v13;
			if (v13 != 1) {
				result = 0;
			} else {
				result = setup_vbw(a1);
			}
			g4 = v1;
			return result;
		}
		result = 0;
	}
	g4 = v1;
	return result;
}

int32_t setup_vbw(SET9052 *a1) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10001eb0
	int32_t result = v2; // 0x10001f52
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		int16_t v3 = a1->auto_vbw; // *(int16_t *)(a1 + 78); // 0x10001ec7
		if (v3 != VI_FALSE /*0*/) {
			RBWFreqFromCode((int16_t) RdRBW(a1)); // result not used?
			float64_t v4 = a1->filter_ratio; // *(float64_t *)(a1 + 88); // 0x10001ee9
			g11++;
			int32_t v5 = VBWFreqFromCode(VBW_3MHZ /*7*/); // 0x10001ef1
			g11++;
			int32_t v6 = v5; // 0x10001f5211
			int16_t v7 = 7;
			if ((v5 & 0x4100) == 0) {
				int32_t v8 = VBWFreqFromCode(VBW_3HZ /*1*/); // 0x10001f0d
				g11++;
				if ((v8 & 256) != 0) {
					g3 = 0;
					int32_t v9 = VBWCodeFromFreq(
							(float64_t) ((float80_t) v4
									* frequencyLimit_rbwFrequency), 0); // 0x10001f2f
					v6 = v9;
					v7 = v9;
				} else {
					v6 = v8;
					v7 = 1;
				}
			}
			g8 = v7;
			if (v7 != -1) {
				//*(int16_t *)(a1 + 76) = v7;
				a1->vbw_code = v7;
				result = a1;
			} else {
				result = v6;
			}
			g4 = v1;
			return result;
		}
		result = v3;
	}
	g4 = v1;
	return result;
}

int32_t absValue(int32_t a1) {
	int32_t result; // 0x1000d56d
	if (a1 < 0) {
		result = -a1;
	} else {
		result = a1;
	}
	return result;
}

int32_t OpenSession(SET9052 *a1, char* session_string, int16_t a3) {
	dlog( LOG_DEBUG, "OpenSession(%s,%d)\n", session_string, a3);
	if (a1 == NULL) {
		return g3 & -0x10000 | 0xfff6;
	}
	if (session_string == NULL) {
		return g3 & -0x10000 | 0xfffd;
	}
	int32_t result2; // 0x10003f79
	if (a1->session_handle == NULL) {
		ClearFuncStatusCode(a1);
		g8 = a1;
		a1->eng_options = 0;
		int32_t v1 = function_10003844(a1, session_string); // 0x10003d85
		int32_t v2 = 0x10000 * v1 / 0x10000; // 0x10003d91
		g8 = v2;
		int32_t v3; // 0x10003f73
		int32_t v4; // 0x10003f4f
		int16_t v5; // 0x10003f4f
		int32_t result; // 0x10003f5b
		if (v1 != 0) {
			g8 = a1;
			int32_t v6 = dd_loadWindowsDll(a1, session_string, v2); // 0x10003db4
			int32_t v7 = 0x10000 * v6 / 0x10000; // 0x10003dc0
			dlog( LOG_DEBUG, "OpenSession v6=0x%x\n", v6);
			if (v6 == 0) {
				SetInterfaceType(a1, ISAp /*1*/, v7);
				function_1000d570(a1->sessionString /* a1 + 210 */);
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					dlog( LOG_DEBUG, "OpenSession v5=0x%x, should be 0\n", v5);
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				dlog( LOG_DEBUG, "OpenSession@1 --> 0x%x\n", (v3 & -0x10000));
				return v3 & -0x10000;
			}
			g3 = a1;
			int32_t v8 = function_10003838(a1, session_string, v7); // 0x10003de3
			int32_t v9 = 0x10000 * v8 / 0x10000; // 0x10003def
			if ((int16_t) v8 == 0) {
				g8 = a1;
				SetInterfaceType(a1, SERIALp /*3*/, v9);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				return v3 & -0x10000;
			}
			g3 = session_string;
			int32_t v10 = function_1000382c(a1, session_string, v9); // 0x10003e12
			g3 = v10;
			int32_t v11 = 0x10000 * v10 / 0x10000; // 0x10003e1e
			g8 = v11;
			if ((int16_t) v10 == 0) {
				SetInterfaceType(a1, MODEMp /*6*/, v11);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				return v3 & -0x10000;
			}
			g8 = a1;
			int32_t v12 = function_100038c1(a1, session_string, v11); // 0x10003e41

			int32_t v13 = 0x10000 * v12 / 0x10000; // 0x10003e4d
			if ((int16_t) v12 == 0) {
				SetInterfaceType(a1, NIVXIp /*4*/, v13);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				return v3 & -0x10000;
			}
			g8 = session_string;
			g3 = a1;
			int32_t v14 = function_100037b7(a1, session_string, v13); // 0x10003e70
			int32_t v15 = 0x10000 * v14 / 0x10000; // 0x10003e7c
			if ((int16_t) v14 == 0) {
				g8 = a1;
				SetInterfaceType(a1, SICLp /*5*/, v15);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				return v3 & -0x10000;
			}
			int32_t v16 = function_100037c3(a1, session_string, v15); // 0x10003e9f
			int32_t v17 = 0x10000 * v16 / 0x10000; // 0x10003eab
			g8 = v17;
			if ((int16_t) v16 == 0) {
				SetInterfaceType(a1, SIMp /*7*/, v17);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				return v3 & -0x10000;
			}
			g6 = session_string;
			g8 = a1;
			int32_t v18 = function_100036f0(a1, (char *) session_string, v17); // 0x10003ecb
			int32_t v19 = 0x10000 * v18 / 0x10000; // 0x10003ed7
			if ((int16_t) v18 == 0) {
				SetInterfaceType(a1, TCPIPp /*9*/, v19);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				return v3 & -0x10000;
			}
			g8 = session_string;
			int32_t v20 = function_10003679(a1, session_string, v19); // 0x10003ef7
			int32_t v21 = 0x10000 * v20 / 0x10000; // 0x10003f03
			if ((int16_t) v20 != 0) {
				result2 = v21 & -0x10000 | 0xffef;
			} else {
				g8 = a1;
				SetInterfaceType(a1, VISAp/*2*/, v21);
				function_1000d570(&a1->sessionString /* a1 + 210 */);
				//*(int16_t *)(a1 + 208) = 0;
				a1->openStep = 0;
				v3 = a3;
				if (a3 != 0) {
					v4 = function_10003f7a(a1);
					v5 = v4;
					result = 0x10000 * v4 / 0x10000;
					while (v5 >= 1) {
						v4 = function_10003f7a(a1);
						v5 = v4;
						result = 0x10000 * v4 / 0x10000;
					}
					if (v5 != 0) {
						return result;
					}
					v3 = result;
				}
				result2 = v3 & -0x10000;
			}
			return result2;
		}
		dlog( LOG_DEBUG, "OpenSession, fall through to interface type ISAp\n");
		SetInterfaceType(a1, ISAp /*1*/, v2);
		function_1000d570(&a1->sessionString /* a1 + 210 */);
		//*(int16_t *)(a1 + 208) = 0;
		a1->openStep = 0;
		v3 = a3;
		if (a3 != 0) {
			v4 = function_10003f7a(a1);
			v5 = v4;
			result = 0x10000 * v4 / 0x10000;
			while (v5 >= 1) {
				v4 = function_10003f7a(a1);
				v5 = v4;
				result = 0x10000 * v4 / 0x10000;
			}
			if (v5 != 0) {
				return result;
			}
			v3 = result;
		}
		result2 = v3 & -0x10000;
	} else {
		result2 = (int32_t) a1 & -0x10000 | 0xffed;
	}
	dlog( LOG_DEBUG, "OpenSession --> 0x%x\n", result2);
	return result2;
}

int32_t function_10003f7a(SET9052 *a1) {
	dlog( LOG_DEBUG, "function_10003f7a\n");
	SET9052 * v1 = a1; // 0x10003f7e
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x10003f82
	g3 = v2;
	int32_t result; // 0x10003fd5
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {

#ifdef ORIG
		// DD: call to 660 - Windows moduleHandle - ignore this
		// DD: call to 720 - OpenSessionStep
		//if (*(int32_t *)(v1 + 660) != 0) {
		int32_t * v3 = (int32_t *)(v1 + 720);// 0x10003fae
		if (*v3 != 0) {
			// 0x10003fbd
			__pseudo_call(*v3);
			// branch -> 0x10003fd2
			// 0x10003fd2
			return 0x10000 * (int32_t)v1 / 0x10000 | (int32_t)v1 & -0x10000;
		}
		//}
		return 0x10000 * (int32_t) ret / 0x10000 | (int32_t) ret & -0x10000;
#else
		int32_t ret = VISA_OpenSessionStep(a1);
		return ret;
#endif
		result = (int32_t) v1 & -0x10000 | 0xffeb;
	} else {
		result = GetFuncStatusCode(v1);
	}
	return result;
}

int32_t IdQuery(/*int16_t*/SET9052 *a1, int32_t a2) {
	dlog( LOG_DEBUG, "IdQuery\n");
	SET9052 *v1 = a1; // 0x10003fda
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x10003fde
	g3 = v2;
	int32_t result; // 0x10004035
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		if (*(int32_t *)(v1 + 660) != 0) {
			int32_t * v3 = (int32_t *)(v1 + 728); // 0x1000400a
			if (*v3 != 0) {
				// 0x10004019
				__pseudo_call(*v3);
				// branch -> 0x10004032
				// 0x10004032
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
#else
		/* lpProcNamem, hopefully not needed */
#endif
		result = (int32_t) v1 & -0x10000 | 0xffeb;
	} else {
		result = GetFuncStatusCode(v1);
	}
	return result;
}

// Address range: 0x10004036 - 0x100040c8
int32_t CloseSession(SET9052 *a1) {
	dlog( LOG_DEBUG, "CloseSession\n");
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000403e
	g3 = v1;
	int32_t result; // 0x100040c8
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		int32_t * hLibModule = (int32_t *)(a1 + 660); // 0x1000405e
		if (*hLibModule != 0) {
			int32_t * v2 = (int32_t *)(a1 + 724); // 0x1000406a
			if (*v2 != 0) {
				// 0x10004079
				__pseudo_call(*v2);
				int32_t v3 = 0x10000 * (int32_t)a1;// 0x10004086
				if ((v3 || 0xffff) < 0x1ffff) {
					bool v4 = FreeLibrary((int32_t *)*hLibModule); // 0x100040a2
					*hLibModule = 0;
					//*(int32_t *)(a1 + 468) = 0;
					a1->session_handle = 0;
					result = v4 ? -0x10000 : 0;
					// branch -> 0x100040c5
				} else {
					// 0x10004092
					result = v3 / 0x10000 | (int32_t)a1 & -0x10000;
					// branch -> 0x100040c5
				}
				// 0x100040c5
				return result;
			}
		}
		result = (int32_t) a1 & -0x10000 | 0xffeb;
#else
		result = VISA_CloseSession(a1);
#endif
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t function_10003844(SET9052 *a1, char* a2) {
	dlog( LOG_DEBUG, "function_10003844\n");
#ifdef ORIG
	int32_t v1 = get_os_version_dummy(); // 0x10003847
	if (v1 == 0) {
		// 0x10003850
		// branch -> 0x100038bf
		// 0x100038bf
		return v1 & -0x10000 | 0xffec;
	}
	char * v2 = (char *)a2; // 0x10003861
	int32_t v3 = function_10014e60(v2, (int32_t)"ISA", 3);// 0x10003861
	g3 = v3;
	if (v3 != 0) {
		// 0x1000386d
		// branch -> 0x100038bf
		// 0x100038bf
		return v3 | 0xffff;
	}
	// 0x10003873
	g6 = a2;
	int32_t v4 = function_10003613(v2);// 0x10003877
	int32_t v5 = 0x10000 * SetPortNum(a1, (int16_t)v4);// 0x1000388c
	if ((v5 || 0xffff) >= 0x1ffff) {
		// 0x10003893
		// branch -> 0x100038bf
		// 0x100038bf
		return v5 / 0x10000 | 0xffff;
	}
	// 0x10003899
	g6 = a1;
	int32_t v6 = function_10003329(a1, (int32_t)"mtcisant.dll", (int32_t *)"ISANT_");// 0x100038a7
	int32_t result;// 0x100038c0
	if ((0x10000 * v6 || 0xffff) < 0x1ffff) {
		// 0x100038bc
		result = v6 & -0x10000;
		// branch -> 0x100038bf
	} else {
		// 0x100038b6
		result = v6 & -0x10000 | 0xffeb;
		// branch -> 0x100038bf
	}
	// 0x100038bf
	return result;
#else
	/* DD: code was ISA init*/
	/* I haven't found where the string is set, so I do it here */
	strcpy(a1->sessionString, a2);
	return 1;
#endif
}

/* DD: seems to handle dll loading. not needed. */
int32_t dd_loadWindowsDll(int32_t a1, int32_t a2, int32_t a3) {
	/*
	 int32_t v1 = get_os_version_dummy(); // 0x100032af
	 if (v1 != 0) {
	 // 0x100032b8
	 // branch -> 0x10003327
	 // 0x10003327
	 return v1 & -0x10000 | 0xffec;
	 }
	 char * v2 = (char *)a2; // 0x100032c9
	 int32_t v3 = function_10014e60(v2, (int32_t)"ISA", 3); // 0x100032c9
	 g3 = v3;
	 if (v3 != 0) {
	 // 0x100032d5
	 // branch -> 0x10003327
	 // 0x10003327
	 return v3 & -0x10000 | 0xffef;
	 }
	 // 0x100032db
	 g6 = a2;
	 int32_t v4 = function_10003613(v2); // 0x100032df
	 int32_t v5 = 0x10000 * SetPortNum(a1, (int16_t)v4); // 0x100032f4
	 if ((v5 || 0xffff) >= 0x1ffff) {
	 // 0x100032fb
	 // branch -> 0x10003327
	 // 0x10003327
	 return v5 / 0x10000 & -0x10000 | 0xfffd;
	 }
	 // 0x10003301
	 g6 = a1;
	 int32_t v6 = function_10003329(a1, (int32_t)"mtcisa32.dll", (int32_t *)"ISA_"); // 0x1000330f
	 int32_t v7 = 0x10000 * v6; // 0x10003317
	 g8 = v7 / 0x10000;
	 int32_t result; // 0x10003328
	 if ((v7 || 0xffff) < 0x1ffff) {
	 // 0x10003324
	 result = v6 & -0x10000;
	 // branch -> 0x10003327
	 } else {
	 // 0x1000331e
	 result = v6 & -0x10000 | 0xffeb;
	 // branch -> 0x10003327
	 }
	 // 0x10003327

	 */
	int32_t result = 0;
	return result;
}

/** DD: TODO what to return; this seems to load a DLL */
int32_t function_10003329(int32_t a1, int32_t lpLibFileName, int32_t * a3) {
	return 0;
}

int32_t get_os_version_dummy(void) {
	return 1;
	/*
	 int32_t lpVersionInformation = 148; // bp-152
	 GetVersionExA((struct _OSVERSIONINFOA *)&lpVersionInformation);
	 int32_t result = 1;
	 int32_t v1;
	 if (v1 != 2) {
	 // 0x1000360d
	 result = 0;
	 // branch -> 0x1000360f
	 }
	 // 0x1000360f
	 return result;*/
}

int32_t function_10003679(SET9052 *a1, int32_t a2, int32_t a3) {
	int32_t v1 = function_10014e60((char *) a2, (int32_t) "VXI", 3); // 0x10003687
	if (v1 != 0) {
		// 0x10003693
		// branch -> 0x100036ee
		// 0x100036ee
		return v1 | 0xffff;
	}
	// 0x10003699
	ClearFuncStatusCode(a1);
	g8 = a1;
	//*(int32_t *)(a1 + 200) = 0;
	a1->eng_options = 0;
	function_1000d570(&a1->sessionString /* a1 + 210 */);
	int32_t v2 = 0x10000
			* function_10003329(a1, (int32_t) "mtcvsa32.dll",
					(int32_t *) "VISA_"); // 0x100036de
	int32_t result; // 0x100036ef
	if ((v2 || 0xffff) < 0x1ffff) {
		// 0x100036eb
		result = 0;
		// branch -> 0x100036ee
	} else {
		// 0x100036e5
		result = v2 / 0x10000 & -0x10000 | 0xffeb;
		// branch -> 0x100036ee
	}
	// 0x100036ee
	return result;
}

int32_t function_10003613(char * a1) {
	/** DD ISA Port calculation , NOP */
	return 888;
	/*
	 // 0x10003613
	 if (a1 != NULL) {
	 char * v1 = a1; // 0x10003634
	 uint32_t v2 = 0; // 0x1000364b
	 // branch -> 0x10003634
	 while (true) {
	 char* v3 = v2 + v1; // 0x1000363a
	 if (*v3 == 0) {
	 // 0x10003672
	 // branch -> 0x10003675
	 // 0x10003675
	 return g3 & -0x10000;
	 }
	 uint32_t v4 = v2; // 0x1000362b
	 if (function_1000d700(v3, "::", 2) == 0) {
	 // 0x1000365b
	 g6 = v4;
	 // branch -> 0x10003675
	 // 0x10003675
	 return function_1000d6eb(v1 + 2 + v4);
	 }
	 char * v5 = v4 + 1; // 0x1000362e
	 g3 = v5;
	 v2 = v5;
	 // branch -> 0x10003634
	 }
	 }
	 // 0x10003675
	 return g3 & -0x10000;
	 */
}

int32_t SetInterfaceType(SET9052* a1, /*int16_t*/InterfaceEnum type, int32_t a3) {
	dlog( LOG_DEBUG, "SetInterfaceType(%d)\n", type);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10004f22
	g3 = v1;
	int32_t result; // 0x10004f51
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		a1->interfaceType = type;
		result = (int32_t) a1 & -0x10000;
	} else {
		g8 = a1;
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t IsValidStep(SET9052 *a1) {
	int32_t v1 = g9; // 0x10006dd2
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10006dd7
	if ((0x10000 * v2 || 0xffff) >= 0x1ffff) {
		g9 = v1;
		dlog( LOG_DEBUG, "IsValidStep() -> %d\n", v2 | 0xffff);
		return v2 | 0xffff;
	}
	int32_t v3 = GetRBWwide(a1->rbw_code /* *(int16_t *)(a1 + 72) */); // 0x10006df7
	int64_t v4 = 0x100000000 * (int64_t) (v3 >> 31) | (int64_t) v3; // 0x10006e05
	int32_t v5 = v4 / 3; // 0x10006e05
	g8 = v4 % 3;
	int32_t result; // 0x10006e24
	if ((v5 & 256) == 0) {
		result = v5 & -0x10000 | 1;
	} else {
		result = v5 & -0x10000;
	}
	g9 = v1;
	dlog( LOG_DEBUG, "IsValidStep() -> %d\n", result);
	return result;
}

/**
 * Get resolution BandWidth (code?) wide
 * Returns -3 on error.
 */
int32_t GetRBWwide(int16_t value) {
	int32_t v1 = g4; // 0x1000d3b4
	int32_t v2 = v1; // bp-4
	int32_t v3 = value; // 0x1000d3dd
	if (value < 0) {
		// negative values are not accespted
		g4 = v1;
		return -3;
	}
	int32_t result;
	// TODO here; the function seems to have decompiled with semantical errors.
	// first workaround: we return 1...
	return 1;

	// DD: the if condition seems to make no sense
	if (value == 4 || value < 4 != (3 - v3 & v3) < 0) {
		// DD1: this gives a SEGV. v2 aka g4 is substracted an offset and the result is dereferenced -> Bang!
		// DD2: After leaning a little bit more the line is like:
		// result = g4[v3-6]
		// So g40 is an array of uint32_t; v3=value and in range 0..5 (rbw code) maybe  0..4 without AUTO value
		result = *(int32_t *) (4 * v3 - 24 + (int32_t) &v2);
	} else {
		result = -3;
	}

	g4 = v1;
	return result;
}

// Should return 3E6 for e.g. VBW_3MHZ (?), i.e. a frequency from a code.
// Function seems to be decompiled wrong. The value derived (v2) is not returned?!?
// But the value is set to global 'frequencyLimit_rbwFrequency'. Is this enough?
int32_t RBWFreqFromCode(int16_t code) {
#ifdef ORIG
	int32_t result = code; // 0x1000b557
	if (code < RBW_300HZ /*0*/) {
		frequencyLimit_rbwFrequency = -3.0L;
		g11--;
		return result;
	}
	g6 = result;
	float80_t v1;
	if (code <= RBW_3MHZ /*4*/) {
		g8 = result;
		// TODO:
		//float64_t v2 = *(float64_t *) (8 * result + (int32_t) &g40); // 0x1000b574
		float64_t v2 = g40[code];
		v1 = v2;
	} else {
		v1 = -3.0L;
	}
	frequencyLimit_rbwFrequency = v1;
	g11--;
#endif
	frequencyLimit_rbwFrequency = 3000000.0; // assumption.
	switch (code) {
	case RBW_300HZ:
		frequencyLimit_rbwFrequency = 300.0;
		break;
	case RBW_3KHZ:
		frequencyLimit_rbwFrequency = 3000.0;
		break;
	case RBW_30KHZ:
		frequencyLimit_rbwFrequency = 30000.0;
		break;
	case RBW_300KHZ:
		frequencyLimit_rbwFrequency = 300000.0;
		break;
	case RBW_3MHZ:
		frequencyLimit_rbwFrequency = 3000000.0;
		break;
	case RBW_AUTO:
		frequencyLimit_rbwFrequency = 3000000.0;
		break;
	}
	dlog(LOG_DEBUG,
			"RBWFreqFromCode(%d); frequencyLimit_rbwFrequency was set to: %f \n",
			code, frequencyLimit_rbwFrequency);
	return code;
}

// Should return 3E6 for e.g. VBW_3MHZ (?), i.e. a frequency from a code.
// See comments for RBWFreqFromCode(), but here it is even worse.
int32_t VBWFreqFromCode(int16_t code) {
#ifdef ORIG
	int32_t result = code; // 0x1000b580
	if (code < VBW_NONE /*0*/) {
		g11--;
		return result;
	}
	g6 = result;
	if (code <= VBW_3MHZ /*7*/) {
		// Here code like in RBWFreqFromCode() must be located, but is missing.
	}
	g11--;
	return result;
#else
	frequencyLimit = 3000000.0; // assumption.
	switch (code) {
	case VBW_NONE:
		frequencyLimit = 0.0;
		break;
	case VBW_3HZ:
		frequencyLimit = 3.0;
		break;
	case VBW_30HZ:
		frequencyLimit = 30.0;
		break;
	case VBW_300HZ:
		frequencyLimit = 300.0;
		break;
	case VBW_3KHZ:
		frequencyLimit = 3000.0;
		break;
	case VBW_30KHZ:
		frequencyLimit = 30000.0;
		break;
	case VBW_300KHZ:
		frequencyLimit = 300000.0;
		break;
	case VBW_3MHZ:
		frequencyLimit = 3000000.0;
		break;
	case VBW_AUTO:
		frequencyLimit = 3000000.0;
		break;
	}
	dlog(LOG_DEBUG, "VBWFreqFromCode(%d); frequencyLimit was set to: %f \n",
			code, frequencyLimit);
	return code;
#endif
}

// Returns time in [us] for given rbw code; values from ida
// RBW_300HZ  - 0x1770 = 6000
// RBW_3KHZ - 0x258 = 600
// RBW_30KHZ  - 0x3c = 60
// RBW_300KHZ  - 0x6
// RBW_3MHZ - 1
// default 0xffffffff = -1
int32_t DefltSetTimeRBW(int16_t code) {
	int32_t v1 = code; // 0x1000c8a0
	g6 = v1;
#ifdef ORIG
	__pseudo_branch(*(int32_t *)(4 * v1 + (int32_t)&g14_rbwTimeFactor));
#else
	//return g14_rbwTimeFactor[code];
	int time;
	switch (code) {
	case RBW_300HZ:
		time = 6000;
		break;
	case RBW_3KHZ:
		time = 600;
		break;
	case RBW_30KHZ:
		time = 60;
		break;
	case RBW_300KHZ:
		time = 6;
		break;
	case RBW_3MHZ:
		time = 1;
		break;
	default:
		time = -1;
		break;
	}
	dlog(LOG_DEBUG, "DefltSetTimeRBW(%d) -> %d\n", code, time);
	return time;
#endif
}

// VBW_NONE 0 - 0
// VBW_3HZ 1 - 0x3d090 = 250000
// VBW_30HZ 2 - 0x61a8 =  25000
// VBW_300HZ 3 - 0x9c4 = 2500
// VBW_3KHZ 4 - 0xfa = 250
// VBW_30KHZ 5 - 0x19 = 25
// VBW_300KHZ 6 - 0x3 = 3
// VBW_3MHZ 7 - 1 = 1
// VBW_AUTO=8 default 0xffffffff = -1

// Returns time in [us] for given vbw code
int32_t DefltSetTimeVBW(int16_t code) {
	// DD:  g15 is initialized with 0x1000c923... a
#ifdef ORIG
	int32_t v1 = *(int32_t *)(4 * (int32_t)timeValue + (int32_t)&g15_vbwTimeFactor); // 0x1000c91c
	__pseudo_branch(v1);
#else
	//return g15_vbwTimeFactor[code];
	int time;
	switch (code) {
	case VBW_NONE:
		time = 0;
		break;
	case VBW_3HZ:
		time = 250000;
		break;
	case VBW_30HZ:
		time = 25000;
		break;
	case VBW_300HZ:
		time = 2500;
		break;
	case VBW_3KHZ:
		time = 250;
		break;
	case VBW_30KHZ:
		time = 25;
		break;
	case VBW_300KHZ:
		time = 3;
		break;
	case VBW_3MHZ:
		time = 1;
		break;
	default:
		time = -1;
		break;
	}
	dlog(LOG_DEBUG, "DefltSetTimeVBW(%d) -> %d\n", code, time);
	return time;
#endif
}

int32_t function_1000382c(int32_t a1, int32_t a2, int32_t a3) {
	// 0x1000382c
	return g3 | 0xffff;
}
// Address range: 0x10003838 - 0x10003843
int32_t function_10003838(int32_t a1, int32_t a2, int32_t a3) {
	// 0x10003838
	return g3 | 0xffff;
}
int32_t function_100038c1(int32_t a1, int32_t a2, int32_t a3) {
	// 0x100038c1
	return g3 | 0xffff;
}
int32_t function_100037b7(int32_t a1, int32_t a2, int32_t a3) {
	// 0x100037b7
	return g3 | 0xffff;
}

int32_t function_100037c3(int32_t a1, int32_t a2, int32_t a3) {
	// 0x100037c3
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100037ca
	g3 = v1;
	int32_t result; // 0x1000382b
	if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
		// 0x100037d9
		result = GetFuncStatusCode(a1);
		// branch -> 0x1000382a
		// 0x1000382a
		return result;
	}
	int32_t v2 = function_10014e60((char *) a2, (int32_t) "SIM", 3); // 0x100037f2
	if (v2 != 0) {
		// 0x100037fe
		// branch -> 0x1000382a
		// 0x1000382a
		return v2 & -0x10000 | 0xffef;
	}
	// 0x10003804
	g6 = a1;
	int32_t v3 = function_10003329(a1, (int32_t) "mtcsim32.dll",
			(int32_t *) "SIM_"); // 0x10003812
	if ((0x10000 * v3 || 0xffff) < 0x1ffff) {
		// 0x10003827
		result = v3 & -0x10000;
		// branch -> 0x1000382a
	} else {
		// 0x10003821
		result = v3 & -0x10000 | 0xffeb;
		// branch -> 0x1000382a
	}
	// 0x1000382a
	return result;
}

int32_t function_100036f0(int32_t a1, char * a2, int32_t a3) {
	int32_t v1 = (int32_t) a2; // 0x100036f6
	int32_t v2 = function_10014e60("TCPIP::", v1, 7); // 0x100036ff
	if (v2 == 0) {
		int32_t v3 = 7; // 0x10003743
		while (true) {
			int32_t v4 = v3; // bp-8
			char * v5 = (char *) (v3 + v1); // 0x1000372c
			if (*v5 != 0) {
				// 0x10003733
				if (*v5 != 44) {
					// 0x10003741
					v3++;
					// branch -> 0x10003726
					continue;
				}
			}
			int32_t v6 = v3 - 7; // 0x10003746
			g3 = v6;
			function_1000d740((char *) (a1 + 594), v1 + 7, v6);
			*(char *) (v4 + a1 + 587) = 0;
			g6 = v4;
			int32_t v7 = function_1000d6eb(v1 + 1 + v4); // 0x1000377b
			g6 = a1;
			*(int16_t *) (a1 + 532) = (int16_t) v7;
			int32_t v8 = 0x10000
					* function_10003329(a1, (int32_t) "mtctcpip.dll",
							(int32_t *) "TCPIP_"); // 0x100037a3
			if ((v8 || 0xffff) < 0x1ffff) {
				// 0x100037b0
				// branch -> 0x100037b3
				// 0x100037b3
				return 0;
			}
			// 0x100037aa
			// branch -> 0x100037b3
			// 0x100037b3
			return v8 / 0x10000 & -0x10000 | 0xffeb;
		}
	}
	// 0x100037b3
	return v2 & -0x10000 | 0xffef;
}

int32_t function_10014e60(char * a1, int32_t a2, int32_t a3) {
	/* DD: ISA Code, NOP */
	return 0;
	/*
	 int32_t v1 = g7; // 0x10014e63
	 int32_t v2 = g9; // 0x10014e64
	 int32_t v3 = g5; // 0x10014e65
	 g6 = a3;
	 if (a3 == 0) {
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return 0;
	 }
	 int32_t v4 = (int32_t)a1; // 0x10014e71
	 g9 = v4;
	 g7 = a2;
	 if (g129 == 0) {
	 // 0x10014e83
	 g8 = g8 & -0xff01 | 0x2000;
	 int32_t v5 = &g128; // 0x10014e8c
	 // branch -> 0x10014e8c
	 int32_t v6; // 0x10014eb7
	 unsigned char v7; // 0x10014eb7
	 unsigned char v8; // 0x10014eb7
	 while (true) {
	 unsigned char v9 = *(char *)v4; // 0x10014e8c
	 unsigned char v10 = *(char *)a2; // 0x10014e90
	 int32_t v11 = (int32_t)v10 | 256 * (int32_t)v9 | v5 & -0x10000; // 0x10014e90
	 v6 = v11;
	 if (v9 != 0) {
	 // 0x10014e94
	 if (v10 != 0) {
	 int32_t v12 = v11; // 0x10014eac
	 if (v9 >= 65) {
	 // 0x10014e9e
	 if (v9 < 91) {
	 // 0x10014ea2
	 v12 = v11 & -0xff01 | 256 * (int32_t)(v9 + 32);
	 // branch -> 0x10014ea4
	 } else {
	 v12 = v11;
	 }
	 }
	 unsigned char v13 = (char)v12; // 0x10014ea4
	 int32_t v14 = v12; // 0x10014eae
	 if (v13 >= 65) {
	 // 0x10014ea8
	 if (v13 < 91) {
	 // 0x10014eac
	 v14 = v12 + 32 & 255 | v12 & -256;
	 // branch -> 0x10014eae
	 } else {
	 v14 = v12;
	 }
	 }
	 unsigned char v15 = (char)(v14 / 256); // 0x10014eae
	 unsigned char v16 = (char)v14; // 0x10014eae
	 if (v15 != v16) {
	 // 0x10014ebf
	 if (v15 >= v16) {
	 // 0x10014eca
	 // branch -> 0x10014f5a
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return 1;
	 }
	 } else {
	 int32_t v17 = a3 - 1; // 0x10014eb2
	 if (v17 == 0) {
	 v6 = v14;
	 // break -> 0x10014eb5
	 break;
	 }
	 a3 = v17;
	 a2++;
	 v5 = v14;
	 v4++;
	 // continue -> 0x10014e8c
	 continue;
	 }
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return -1;
	 }
	 v6 = v11;
	 }
	 // 0x10014eb5
	 v7 = (char)(v6 / 256);
	 v8 = (char)v6;
	 if (v7 == v8) {
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return 0;
	 }
	 // 0x10014ebf
	 if (v7 >= v8) {
	 // 0x10014eca
	 // branch -> 0x10014f5a
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return 1;
	 }
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return -1;
	 }
	 // 0x10014eb5
	 v7 = (char)(v6 / 256);
	 v8 = (char)v6;
	 if (v7 == v8) {
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return 0;
	 }
	 // 0x10014ebf
	 int32_t result; // 0x10014f5a
	 if (v7 >= v8) {
	 // 0x10014eca
	 result = 1;
	 // branch -> 0x10014f5a
	 } else {
	 result = -1;
	 }
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return result;
	 }
	 int32_t v18 = g131; // 0x10014ed1
	 g131 = v18 + 1;
	 int32_t v19; // bp-20
	 if (g130 >= 1) {
	 // 0x10014ee5
	 g131 = v18;
	 function_1001039a(19);
	 v19 = 1;
	 g6 = a3;
	 // branch -> 0x10014efe
	 } else {
	 // 0x10014ee1
	 v19 = 0;
	 // branch -> 0x10014efe
	 }
	 int32_t v20 = 0; // 0x10014f08
	 int32_t v21 = 0; // 0x10014f04
	 // branch -> 0x10014f04
	 int32_t v22; // 0x10014f31
	 int32_t result2; // 0x10014f4c
	 int32_t v23; // 0x10014f31
	 while (true) {
	 int32_t v24 = g9; // 0x10014f04
	 int32_t v25 = (int32_t)*(char *)v24 | v21 & -256; // 0x10014f04
	 int32_t v26 = g7; // 0x10014f08
	 unsigned char v27 = *(char *)v26; // 0x10014f08
	 int32_t v28 = (int32_t)v27 | v20 & -256; // 0x10014f08
	 v23 = v28;
	 v22 = 0;
	 if (v25 != 0) {
	 // 0x10014f0c
	 if (v28 != 0) {
	 // 0x10014f10
	 g9 = v24 + 1;
	 g7 = v26 + 1;
	 g5 = function_100119ba(v27);
	 int32_t v29 = function_100119ba(v27); // 0x10014f1f
	 int32_t v30 = g5; // 0x10014f28
	 if (v29 != v30) {
	 // 0x10014f35
	 if (v29 >= v30) {
	 // 0x10014f3c
	 result2 = 1;
	 // branch -> 0x10014f3e
	 } else {
	 result2 = -1;
	 }
	 } else {
	 int32_t v31 = a3 - 1; // 0x10014f2c
	 g6 = v31;
	 if (v31 == 0) {
	 v23 = v30;
	 v22 = v29;
	 // break -> 0x10014f2f
	 break;
	 }
	 a3 = v31;
	 v20 = v30;
	 v21 = v29;
	 // continue -> 0x10014f04
	 continue;
	 }
	 // 0x10014f3e
	 if (v19 != 0) {
	 // 0x10014f4c
	 function_100103fb(19);
	 // branch -> 0x10014f5a
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return result2;
	 }
	 // 0x10014f43
	 g131--;
	 // branch -> 0x10014f5a
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return result2;
	 }
	 v23 = 0;
	 v22 = v25;
	 }
	 // 0x10014f2f
	 result2 = 0;
	 if (v22 != v23) {
	 // 0x10014f35
	 if (v22 >= v23) {
	 // 0x10014f3c
	 result2 = 1;
	 // branch -> 0x10014f3e
	 } else {
	 result2 = -1;
	 }
	 }
	 // 0x10014f3e
	 if (v19 != 0) {
	 // 0x10014f4c
	 function_100103fb(19);
	 // branch -> 0x10014f5a
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return result2;
	 }
	 // 0x10014f43
	 g131--;
	 // branch -> 0x10014f5a
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return result2;
	 }
	 // 0x10014f2f
	 result2 = 0;
	 if (v22 != v23) {
	 // 0x10014f35
	 if (v22 >= v23) {
	 // 0x10014f3c
	 result2 = 1;
	 // branch -> 0x10014f3e
	 } else {
	 result2 = -1;
	 }
	 }
	 // 0x10014f3e
	 if (v19 != 0) {
	 // 0x10014f4c
	 function_100103fb(19);
	 // branch -> 0x10014f5a
	 } else {
	 // 0x10014f43
	 g131--;
	 // branch -> 0x10014f5a
	 }
	 // 0x10014f5a
	 g5 = v3;
	 g9 = v2;
	 g7 = v1;
	 return result2;
	 */
}

int32_t function_1000d700(char * a1, char* a2, int32_t a3) {
	int32_t v1 = g5; // 0x1000d705
	if (a3 == 0) {
		// 0x1000d731
		g5 = v1;
		return 0;
	}
	// 0x1000d70b
	int c = strncmp((char *) a2, a1, strlen(a1) + 2 + a3);
	unsigned char v2 = *(char *) (a2 - 1); // 0x1000d721
	unsigned char v3 = *(char *) (a1 - 1); // 0x1000d726
	if (v2 > v3) {
		// 0x1000d72f
		// branch -> 0x1000d731
		// 0x1000d731
		g5 = v1;
		return -1;
	}
	// 0x1000d72b
	int32_t result; // 0x1000d731
	if (v2 != v3) {
		// 0x1000d72d
		// branch -> 0x1000d72f
		// 0x1000d72f
		result = 1;
		// branch -> 0x1000d731
	} else {
		result = 0;
	}
	// 0x1000d731
	g5 = v1;
	return result;
}

int32_t function_1000d6eb(char* a1) {
	// 0x1000d6eb
	return function_1000d660(a1);
}

// This is some strange string function. I hope I don't need it.
int32_t function_1000d660(char * a1) {
	int32_t v1 = g4; // 0x1000d661
	int32_t v2 = g9; // 0x1000d662
	char * v3 = a1;
	while (true) {
		int32_t v4 = v3; // edi
		unsigned char v5 = *v3; // 0x1000d671
		int32_t v6; // 0x1000d696
		int32_t v7; // 0x1000d677
		if (g50 > 1) {
			v7 = function_1000e8d2(v5, 8);
			g6 = 8;
			v6 = v4;
		} else {
			int32_t v8 = *(int32_t *) 0x100183d4; // 0x1000d683
			g6 = v8;
			v6 = v3;
			v7 = (int32_t) *(char *) (v8 + 2 * (int32_t) v5) & 8;
		}
		if (v7 == 0) {
			unsigned char v9 = *(char *) v6; // 0x1000d696
			int32_t v10 = v9; // 0x1000d696
			g9 = v10;
			int32_t v11 = v6 + 1; // 0x1000d699
			v4 = v11;
			g4 = v10;
			int32_t v12; // 0x1000d6c64
			int32_t v13; // 0x1000d6a6
			if (v9 == '-' /*45*/) {
				v13 = (int32_t) *(char *) v11;
				g9 = v13;
				v4 = v6 + 2;
				v12 = v13;
			} else {
				if (v9 == '+'/*43*/) {
					v13 = (int32_t) *(char *) v11;
					g9 = v13;
					v4 = v6 + 2;
					v12 = v13;
				} else {
					v12 = v10;
				}
			}
			int32_t v14 = 0; // ebx
			int32_t v15 = v12; // 0x1000d6b7
			while (true) {
				int32_t v16; // 0x1000d6b8
				if (g50 > 1) {
					v16 = function_1000e8d2((char) v15, 4);
					g6 = 4;
				} else {
					v16 = (int32_t) *(char *) (g49 + 2 * v15) & 4;
				}
				if (v16 == 0) {
					int32_t result; // 0x1000d6ea
					if (g4 == 45) {
						result = -v14;
					} else {
						result = v14;
					}
					g9 = v2;
					g4 = v1;
					return result;
				}
				v14 = 10 * v14 - 48 + g9;
				int32_t v17 = v4; // 0x1000d6d7
				int32_t v18 = (int32_t) *(char *) v17; // 0x1000d6d7
				g9 = v18;
				v4 = v17 + 1;
				v15 = v18;
			}
		} else {
			v3 = v6 + 1;
			continue;
		}
	}
}

int32_t function_1000d740(char * a1, int32_t a2, uint32_t a3) {
	int32_t v1 = a3; // ecx
	int32_t v2 = g7; // 0x1000d744
	if (a3 == 0) {
		// 0x1000d740
		// branch -> 0x1000d7c3
	} else {
		int32_t v3 = g9; // 0x1000d749
		int32_t v4 = g5; // 0x1000d74a
		int32_t v5 = a3; // ebx
		int32_t result = (int32_t) a1; // 0x1000d757
		int32_t v6 = result; // edi
		int32_t v7; // esi
		int32_t v8; // 0x1000d785
		int32_t v9; // 0x1000d78b
		int32_t v10; // 0x1000d7df
		int32_t v11; // 0x1000d780
		int32_t v12; // 0x1000d78a
		int32_t v13; // 0x1000d7bd
		int32_t v14; // 0x1000d7be
		int32_t v15; // 0x1000d7c9
		int32_t v16; // 0x1000d82b
		int32_t v17; // 0x1000d82b68
		int32_t v18; // 0x1000d82e
		int32_t v19; // 0x1000d82e70
		int32_t v20; // 0x1000d831
		unsigned char v21; // 0x1000d785
		int32_t v22; // 0x1000d7bb
		if ((a2 & 3) != 0) {
			int32_t v23 = result; // 0x1000d767
			int32_t v24 = g3; // 0x1000d764
			int32_t v25 = a2; // 0x1000d766
			// branch -> 0x1000d764
			int32_t v26; // 0x1000d771
			int32_t v27; // 0x1000d769
			int32_t v28; // 0x1000d76a
			while (true) {
				unsigned char v29 = *(char *) v25; // 0x1000d764
				g3 = (int32_t) v29 | v24 & -256;
				v7 = v25 + 1;
				*(char *) v23 = v29;
				v27 = v6 + 1;
				v6 = v27;
				v28 = v1 - 1;
				v1 = v28;
				if (v28 == 0) {
					// 0x1000d792
					g5 = v4;
					g9 = v3;
					g7 = v2;
					return result;
				}
				int32_t v30 = g3; // 0x1000d76d
				if ((char) v30 == 0) {
					// 0x1000d79a
					if ((v27 & 3) != 0) {
						// 0x1000d7a2
						*(char *) v27 = 0;
						int32_t v31 = v6 + 1; // 0x1000d7a481
						v6 = v31;
						int32_t v32 = v1 - 1; // 0x1000d7a583
						v1 = v32;
						if (v32 == 0) {
							// 0x1000d836
							g5 = v4;
							g9 = v3;
							g7 = v2;
							return result;
						}
						while (true) {
							// 0x1000d7ac
							if ((v31 & 3) != 0) {
								// 0x1000d7ac
								*(char *) v31 = (char) g3;
								int32_t v33 = v6 + 1; // 0x1000d7a4
								v6 = v33;
								int32_t v34 = v1 - 1; // 0x1000d7a5
								v1 = v34;
								if (v34 == 0) {
									// break -> 0x1000d836
									break;
								}
								v31 = v33;
								// continue -> 0x1000d7ac
								continue;
							}
						}
						// 0x1000d836
						g5 = v4;
						g9 = v3;
						g7 = v2;
						return result;
					}
					// 0x1000d7b4
					v5 = v28;
					v22 = v27;
					if (v28 >= 4) {
						// 0x1000d827
						g3 = 0;
						*(int32_t *) v27 = 0;
						v17 = v6 + 4;
						v6 = v17;
						v19 = v28 / 4 - 1;
						if (v19 != 0) {
							*(int32_t *) v17 = g3;
							v16 = v6 + 4;
							v6 = v16;
							v18 = v19 - 1;
							while (v18 != 0) {
								// 0x1000d829
								*(int32_t *) v16 = g3;
								v16 = v6 + 4;
								v6 = v16;
								v18--;
								// continue -> 0x1000d829
							}
							// 0x1000d831
							// branch -> 0x1000d831
							// 0x1000d831
							v20 = v5 & 3;
							v5 = v20;
							if (v20 == 0) {
								// 0x1000d836
								g5 = v4;
								g9 = v3;
								g7 = v2;
								return result;
							}
							v22 = v16;
							lab_0x1000d7bb:
							// 0x1000d7bb
							*(char *) v22 = (char) g3;
							v13 = v6 + 1;
							v6 = v13;
							// branch -> 0x1000d7be
							lab_0x1000d7be:
							// 0x1000d7be
							v14 = v5 - 1;
							v5 = v14;
							if (v14 != 0) {
								v22 = v13;
								goto lab_0x1000d7bb;
							}
							// 0x1000d7c1
							g5 = v4;
							g9 = v3;
							// branch -> 0x1000d7c3
							// 0x1000d7c3
							g7 = v2;
							return result;
						}
						// 0x1000d831
						// branch -> 0x1000d831
						// 0x1000d831
						v20 = v5 & 3;
						v5 = v20;
						if (v20 == 0) {
							// 0x1000d836
							g5 = v4;
							g9 = v3;
							g7 = v2;
							return result;
						}
						v22 = v17;
					}
					lab_0x1000d7bb_5:
					// 0x1000d7bb
					*(char *) v22 = (char) g3;
					v13 = v6 + 1;
					v6 = v13;
					// branch -> 0x1000d7be
					goto lab_0x1000d7be;
				} else {
					// 0x1000d771
					v26 = v7;
					if ((v26 & 3) == 0) {
						// break -> 0x1000d779
						break;
					}
					v23 = v27;
					v24 = v30;
					v25 = v26;
					// continue -> 0x1000d764
					continue;
				}
			}
			// 0x1000d779
			v5 = v28;
			v1 = v28 / 4;
			if (v28 < 4) {
				// 0x1000d780
				v11 = v28 & 3;
				v5 = v11;
				if (v11 == 0) {
					// 0x1000d792
					g5 = v4;
					g9 = v3;
					g7 = v2;
					return result;
				}
				int32_t v35 = v27; // 0x1000d788
				int32_t v36 = g3; // 0x1000d785
				// branch -> 0x1000d785
				while (true) {
					// 0x1000d785
					v8 = v7;
					v21 = *(char *) v8;
					g3 = (int32_t) v21 | v36 & -256;
					v7 = v8 + 1;
					*(char *) v35 = v21;
					v12 = v6 + 1;
					v6 = v12;
					v9 = g3;
					if ((char) v9 == 0) {
						// 0x1000d7be
						v14 = v5 - 1;
						v5 = v14;
						if (v14 != 0) {
							v22 = v12;
							goto lab_0x1000d7bb_5;
						}
						// 0x1000d7c1
						g5 = v4;
						g9 = v3;
						// branch -> 0x1000d7c3
						// 0x1000d7c3
						g7 = v2;
						return result;
					}
					lab_0x1000d78f_2: ;
					int32_t v37 = v5 - 1; // 0x1000d78f
					v5 = v37;
					if (v37 == 0) {
						// break -> 0x1000d792
						break;
					}
					v35 = v12;
					v36 = v9;
					// continue -> 0x1000d785
				}
				// 0x1000d792
				g5 = v4;
				g9 = v3;
				g7 = v2;
				return result;
			}
			v15 = v27;
			v10 = v26;
		} else {
			// 0x1000d75d
			v1 = a3 / 4;
			if (a3 < 4) {
				// 0x1000d785
				// branch -> 0x1000d785
				while (true) {
					// 0x1000d785
					v8 = a2;
					v21 = *(char *) v8;
					g3 = (int32_t) v21 | g3 & -256;
					v7 = v8 + 1;
					*(char *) result = v21;
					v12 = v6 + 1;
					v6 = v12;
					v9 = g3;
					if ((char) v9 != 0) {
						goto lab_0x1000d78f_2;
					}
					// 0x1000d7be
					v14 = v5 - 1;
					v5 = v14;
					if (v14 != 0) {
						v22 = v12;
						goto lab_0x1000d7bb_5;
					}
					// 0x1000d7c1
					g5 = v4;
					g9 = v3;
					// branch -> 0x1000d7c3
					// 0x1000d7c3
					g7 = v2;
					return result;
				}
			} else {
				v15 = result;
				v10 = a2;
			}
		}
		while (true) {
			int32_t * v38 = (int32_t *) v10; // 0x1000d7d6
			int32_t v39 = *v38; // 0x1000d7d6
			int32_t v40 = v39 + 0x7efefeff ^ -1 - v39; // 0x1000d7dd
			g3 = v40;
			uint32_t v41 = *v38; // 0x1000d7df
			g8 = v41;
			v7 = v10 + 4;
			int32_t v42; // 0x1000d7bb38
			int32_t v43; // 0x1000d7bb39
			if ((v40 & -0x7efeff00) == 0) {
				lab_0x1000d7c9:
				// 0x1000d7c9
				*(int32_t *) v15 = v41;
				int32_t v44 = v6 + 4; // 0x1000d7cb
				v6 = v44;
				int32_t v45 = v1 - 1; // 0x1000d7ce
				v1 = v45;
				if (v45 == 0) {
					// 0x1000d780
					// branch -> 0x1000d780
					// 0x1000d780
					v11 = v5 & 3;
					v5 = v11;
					if (v11 == 0) {
						// 0x1000d792
						g5 = v4;
						g9 = v3;
						g7 = v2;
						return result;
					}
					// 0x1000d785
					// branch -> 0x1000d785
					while (true) {
						// 0x1000d785
						v8 = v7;
						v21 = *(char *) v8;
						g3 = (int32_t) v21 | g3 & -256;
						v7 = v8 + 1;
						*(char *) v44 = v21;
						v12 = v6 + 1;
						v6 = v12;
						v9 = g3;
						if ((char) v9 != 0) {
							goto lab_0x1000d78f_2;
						}
						v43 = v12;
						lab_0x1000d7be_7:
						// 0x1000d7be
						v14 = v5 - 1;
						v5 = v14;
						if (v14 != 0) {
							v22 = v43;
							goto lab_0x1000d7bb_5;
						}
						// 0x1000d7c1
						g5 = v4;
						g9 = v3;
						// branch -> 0x1000d7c3
						// 0x1000d7c3
						g7 = v2;
						return result;
					}
				} else {
					// 0x1000d7c9
					v15 = v44;
					v10 = v7;
					// branch -> 0x1000d7d1
					continue;
				}
			} else {
				// 0x1000d7eb
				int32_t v46; // 0x1000d81f
				int32_t v47; // 0x1000d824
				if ((char) v41 == 0) {
					// 0x1000d81b
					g8 = 0;
					*(int32_t *) v15 = 0;
					// branch -> 0x1000d81f
				} else {
					// 0x1000d7ef
					if ((v41 & 0xff00) == 0) {
						int32_t v48 = v41 & 255; // 0x1000d811
						g8 = v48;
						*(int32_t *) v15 = v48;
						// branch -> 0x1000d81f
					} else {
						// 0x1000d7f3
						if ((v41 & 0xff0000) == 0) {
							int32_t v49 = v41 & 0xffff; // 0x1000d807
							g8 = v49;
							*(int32_t *) v15 = v49;
							// branch -> 0x1000d81f
						} else {
							// 0x1000d7fb
							if (v41 >= 0x1000000) {
								goto lab_0x1000d7c9;
							}
							// 0x1000d803
							*(int32_t *) v15 = v41;
							// branch -> 0x1000d81f
						}
						// 0x1000d81f
						v46 = v6 + 4;
						v6 = v46;
						g3 = 0;
						v47 = v1 - 1;
						v42 = v46;
						if (v47 != 0) {
							// 0x1000d827
							g3 = 0;
							*(int32_t *) v46 = 0;
							v17 = v6 + 4;
							v6 = v17;
							v19 = v47 - 1;
							if (v19 != 0) {
								*(int32_t *) v17 = g3;
								v16 = v6 + 4;
								v6 = v16;
								v18 = v19 - 1;
								while (v18 != 0) {
									// 0x1000d829
									*(int32_t *) v16 = g3;
									v16 = v6 + 4;
									v6 = v16;
									v18--;
									// continue -> 0x1000d829
								}
								// 0x1000d831
								// branch -> 0x1000d831
								// 0x1000d831
								v20 = v5 & 3;
								v5 = v20;
								if (v20 == 0) {
									// 0x1000d836
									g5 = v4;
									g9 = v3;
									g7 = v2;
									return result;
								}
								// 0x1000d7bb
								*(char *) v16 = (char) g3;
								v13 = v6 + 1;
								v6 = v13;
								v43 = v13;
								// branch -> 0x1000d7be
								goto lab_0x1000d7be_7;
							}
							// 0x1000d831
							v42 = v17;
							// branch -> 0x1000d831
						}
						// 0x1000d831
						v20 = v5 & 3;
						v5 = v20;
						if (v20 == 0) {
							// 0x1000d836
							g5 = v4;
							g9 = v3;
							g7 = v2;
							return result;
						}
						// 0x1000d7bb
						*(char *) v42 = (char) g3;
						v13 = v6 + 1;
						v6 = v13;
						v43 = v13;
						// branch -> 0x1000d7be
						goto lab_0x1000d7be_7;
					}
					// 0x1000d81f
					v46 = v6 + 4;
					v6 = v46;
					g3 = 0;
					v47 = v1 - 1;
					v42 = v46;
					if (v47 != 0) {
						// 0x1000d827
						g3 = 0;
						*(int32_t *) v46 = 0;
						v17 = v6 + 4;
						v6 = v17;
						v19 = v47 - 1;
						if (v19 != 0) {
							*(int32_t *) v17 = g3;
							v16 = v6 + 4;
							v6 = v16;
							v18 = v19 - 1;
							while (v18 != 0) {
								// 0x1000d829
								*(int32_t *) v16 = g3;
								v16 = v6 + 4;
								v6 = v16;
								v18--;
								// continue -> 0x1000d829
							}
							// 0x1000d831
							// branch -> 0x1000d831
							// 0x1000d831
							v20 = v5 & 3;
							v5 = v20;
							if (v20 == 0) {
								// 0x1000d836
								g5 = v4;
								g9 = v3;
								g7 = v2;
								return result;
							}
							// 0x1000d7bb
							*(char *) v16 = (char) g3;
							v13 = v6 + 1;
							v6 = v13;
							v43 = v13;
							// branch -> 0x1000d7be
							goto lab_0x1000d7be_7;
						}
						// 0x1000d831
						v42 = v17;
						// branch -> 0x1000d831
					}
					// 0x1000d831
					v20 = v5 & 3;
					v5 = v20;
					if (v20 == 0) {
						// 0x1000d836
						g5 = v4;
						g9 = v3;
						g7 = v2;
						return result;
					}
					// 0x1000d7bb
					*(char *) v42 = (char) g3;
					v13 = v6 + 1;
					v6 = v13;
					v43 = v13;
					// branch -> 0x1000d7be
					goto lab_0x1000d7be_7;
				}
				// 0x1000d81f
				v46 = v6 + 4;
				v6 = v46;
				g3 = 0;
				v47 = v1 - 1;
				v42 = v46;
				if (v47 != 0) {
					// 0x1000d827
					g3 = 0;
					*(int32_t *) v46 = 0;
					v17 = v6 + 4;
					v6 = v17;
					v19 = v47 - 1;
					if (v19 != 0) {
						*(int32_t *) v17 = g3;
						v16 = v6 + 4;
						v6 = v16;
						v18 = v19 - 1;
						while (v18 != 0) {
							// 0x1000d829
							*(int32_t *) v16 = g3;
							v16 = v6 + 4;
							v6 = v16;
							v18--;
							// continue -> 0x1000d829
						}
						// 0x1000d831
						// branch -> 0x1000d831
						// 0x1000d831
						v20 = v5 & 3;
						v5 = v20;
						if (v20 == 0) {
							// 0x1000d836
							g5 = v4;
							g9 = v3;
							g7 = v2;
							return result;
						}
						// 0x1000d7bb
						*(char *) v16 = (char) g3;
						v13 = v6 + 1;
						v6 = v13;
						v43 = v13;
						// branch -> 0x1000d7be
						goto lab_0x1000d7be_7;
					}
					// 0x1000d831
					v42 = v17;
					// branch -> 0x1000d831
				}
				// 0x1000d831
				v20 = v5 & 3;
				v5 = v20;
				if (v20 == 0) {
					// 0x1000d836
					g5 = v4;
					g9 = v3;
					g7 = v2;
					return result;
				}
			}
			// 0x1000d7bb
			*(char *) v42 = (char) g3;
			v13 = v6 + 1;
			v6 = v13;
			v43 = v13;
			// branch -> 0x1000d7be
			goto lab_0x1000d7be_7;
		}
	}
	// 0x1000d7c3
	g7 = v2;
	return (int32_t) a1;
}

int32_t function_1001039a(int32_t a1) {
	int32_t v1 = g9; // 0x100103a0
	int32_t lpCriticalSection2 = 4 * a1 + (int32_t) &g61; // 0x100103a1
	g9 = lpCriticalSection2;
	if (*(int32_t *) lpCriticalSection2 != 0) {
		// branch -> 0x100103f0
	} else {
		int32_t v2 = g7; // 0x100103b2
		int32_t lpCriticalSection = alloc_1000da64(24); // 0x100103b5
		g7 = lpCriticalSection;
		if (lpCriticalSection == 0) {
			// 0x100103c1
			__amsg_exit(17);
			// branch -> 0x100103c9
		}
		// 0x100103c9
		function_1001039a(17);
		if (*(int32_t *) g9 != 0) {
			// 0x100103e1
			function_1000d97b(lpCriticalSection);
			// branch -> 0x100103e7
		} else {
			// 0x100103d7
			InitializeCriticalSection(
					(struct _RTL_CRITICAL_SECTION *) lpCriticalSection);
			*(int32_t *) g9 = lpCriticalSection;
			// branch -> 0x100103e7
		}
		// 0x100103e7
		function_100103fb(17);
		g7 = (int32_t) (struct _RTL_CRITICAL_SECTION *) v2;
		lpCriticalSection2 = g9;
		// branch -> 0x100103f0
	}
	// 0x100103f0
	EnterCriticalSection(
			(struct _RTL_CRITICAL_SECTION *) *(int32_t *) lpCriticalSection2);
	g9 = v1;
	int32_t * v3;
	return (int32_t) &v3;
}

int32_t function_100119ba(char a1) {
	char v1 = a1;
	char v2 = g6; // bp-8
	int32_t v3 = &v2; // 0x100119bd
	int32_t v4 = g9; // 0x100119c6
	int32_t v5 = g7; // 0x100119c7
	int32_t result = a1; // 0x100119e7
	int32_t result2; // 0x10011a84
	if (g129 == 0) {
		// 0x100119ca
		if (a1 < 65) {
			// 0x10011a80
			g7 = v5;
			g9 = v4;
			return result;
		}
		// 0x100119d6
		if (a1 == 90 || a1 < 90 != (89 - result & result) < 0) {
			// 0x100119df
			result2 = result + 32;
			// branch -> 0x10011a80
		} else {
			result2 = result;
		}
		// 0x10011a80
		g7 = v5;
		g9 = v4;
		return result2;
	}
	int32_t v6 = 256; // edi
	g9 = 1;
	unsigned char v7;
	int32_t v8; // 0x10011a1b
	int32_t v9; // 0x10011a43
	int32_t v10; // 0x10011a46
	int32_t v11; // 0x10011a48
	int32_t v12; // 0x10011a51
	int32_t v13; // 0x10011a5d
	int32_t v14; // 0x10011a23
	int32_t v15; // 0x10011a77
	if (a1 < 0) {
		// 0x100119f6
		int32_t v16; // 0x10011a00
		if (g50 > 1) {
			// 0x100119fe
			v16 = function_1000e8d2(a1, 1);
			g6 = 1;
			// branch -> 0x10011a13
		} else {
			// 0x10011a09
			v16 = (int32_t) *(char *) (g49 + 2 * result) & 1;
			// branch -> 0x10011a13
		}
		// 0x10011a13
		if (v16 != 0) {
			// 0x10011a13
			v9 = result;
			// branch -> 0x10011a1b
			// 0x10011a1b
			v8 = g49;
			g8 = v8;
			v14 = v9 / 256;
			if (*(char *) ((2 * (v14 & 255) || 1) + v8) > -1) {
				// 0x10011a3f
				v1 = v9;
				v10 = g9;
				v11 = v10;
				v12 = v10;
				// branch -> 0x10011a48
			} else {
				// 0x10011a30
				v1 = v14;
				v11 = g9;
				v12 = 2;
				// branch -> 0x10011a48
			}
			// 0x10011a48
			g6 = v3;
			v13 = function_10013d49(g129, v6, (char) (int32_t) &v1, v12, v3, 3,
					0, v11);
			if (v13 != 0) {
				// 0x10011a69
				if (v13 != g9) {
					// 0x10011a73
					v15 = v2;
					g6 = v15;
					result2 = v15 | 256 * (int32_t) v7;
					// branch -> 0x10011a80
				} else {
					// 0x10011a6d
					result2 = v2;
					// branch -> 0x10011a80
				}
				// 0x10011a80
				g7 = v5;
				g9 = v4;
				return result2;
			}
		}
	} else {
		v9 = result;
		// 0x10011a1b
		v8 = g49;
		g8 = v8;
		v14 = v9 / 256;
		if (*(char *) ((2 * (v14 & 255) || 1) + v8) > -1) {
			// 0x10011a3f
			v1 = v9;
			v10 = g9;
			v11 = v10;
			v12 = v10;
			// branch -> 0x10011a48
		} else {
			// 0x10011a30
			v1 = v14;
			v11 = g9;
			v12 = 2;
			// branch -> 0x10011a48
		}
		// 0x10011a48
		g6 = v3;
		v13 = function_10013d49(g129, v6, (char) (int32_t) &v1, v12, v3, 3, 0,
				v11);
		if (v13 != 0) {
			// 0x10011a69
			if (v13 != g9) {
				// 0x10011a73
				v15 = v2;
				g6 = v15;
				result2 = v15 | 256 * (int32_t) v7;
				// branch -> 0x10011a80
			} else {
				// 0x10011a6d
				result2 = v2;
				// branch -> 0x10011a80
			}
			// 0x10011a80
			g7 = v5;
			g9 = v4;
			return result2;
		}
	}
	// 0x10011a17
	// branch -> 0x10011a80
	// 0x10011a80
	g7 = v5;
	g9 = v4;
	return result;
}

int32_t function_100103fb(int32_t a1) {
	int32_t lpCriticalSection = *(int32_t *) (4 * a1 + (int32_t) &g61); // 0x10010401
	LeaveCriticalSection((struct _RTL_CRITICAL_SECTION *) lpCriticalSection);
	int32_t * v1;
	return (int32_t) &v1;
}

int32_t function_1000e8d2(char a1, int32_t a2) {
	int16_t v1 = a2;
	int32_t v2 = g4; // bp-4
	char v3 = g6; // bp-8
	int32_t v4 = a1; // 0x1000e8d6
	int32_t v5;
	if (v4 > 255) {
		int32_t v6 = v4 / 256; // 0x1000e8f9
		int32_t v7 = v6 & 255; // 0x1000e8fc
		g8 = v7;
		char v8 = *(char *) (g49 + (2 * v7 | 1)); // 0x1000e8ff
		v3 = v8 > -1 ? v4 : v6;
		int32_t result = function_1001239e((char *) 1, (int32_t) &v3,
				2 - (int32_t) (v8 > -1), (int32_t) &v1, 0, 0, 1); // 0x1000e930
		if (result == 0) {
			// 0x1000e93c
			g4 = v2;
			return result;
		}
		v5 = v1;
		// branch -> 0x1000e942
	} else {
		// 0x1000e8e4
		v5 = (int32_t) *(int16_t *) (g49 + 2 * v4);
		// branch -> 0x1000e942
	}
	// 0x1000e942
	int32_t v9;
	return v5 & v9;
}

char *alloc_1000da64(int32_t size) {
	return __nh_malloc(size, g107);
}

// I assume this frees the incoming data structure (a1 seems to be a pointer)
// After examining with IDA, this is true. There is some MS code called, 'HeapFree' with a parameter 'lpMem'.
// TODO: remove abort() when this code piece is reached.
int32_t function_1000d97b(int32_t a1) {
	// 0x1000d97b
	abort();
	// UNREACHABLE
}
int32_t function_10013d49(int32_t a1, int32_t a2, char a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8) {
	// 0x10013d49
	abort();
	// UNREACHABLE
}
int32_t function_1001239e(char * a1, int32_t a2, int32_t a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7) {
	// 0x1001239e
	abort();
	// UNREACHABLE
}

/* DD: empty */
void GlobalUnlock(int32_t *p) {
}
int32_t GlobalFree(void *p) {
	return 0;
}
void* GlobalAlloc(int32_t flags, int32_t size) {
	return (void *) malloc(size);
}
void* GlobalLock(void *p) {
	return p;
}
int32_t FreeLibrary(int32_t *p) {
	free(p);
	return 0;
}
void InitializeCriticalSection(int32_t section) {
}
void LeaveCriticalSection(int32_t section) {
}
void EnterCriticalSection(int32_t section) {
}

#ifdef ORIG
void __pseudo_call( int32_t x ) {
}
void __pseudo_branch( int32_t x ) {
}
#endif

int32_t __ftol(/*int32_t*/float32_t in) {

	int a = *(int*) (&in);
	int sign = (a >> 31);
	int mantissa = (a & ((1 << 23) - 1)) | (1 << 23);
	int exponent = ((a & 0x7fffffff) >> 23) - 127;
	int r = ((unsigned int) (mantissa) << 8) >> (31 - exponent);
	int32_t out = ((r ^ (sign)) - sign) & ~(exponent >> 31);
	dlog( LOG_DEBUG, "ftol(%f) -> %d\n", in, out);
	return out;
}

int32_t RdSessionHandle(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10005201
	g3 = v1;
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = a1->session_handle; // *(int32_t *)(a1 + 468);
	} else {
		result = 0;
	}
	return result;
}

int32_t RdInterfaceType(SET9052 *a1) {
	// entry
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10004eec
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x10004ef4
	g6 = v2 / 0x10000;
	int32_t result;
	if ((v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = (int32_t) *(int16_t *) (&a1->interfaceType /* a1 + 196 */)
				| (int32_t) a1 & -0x10000;
	} else {
		result = v1 | 0xffff;
	}
	return result;
}

int32_t SetTimeoutWait(SET9052 *a1, int32_t time) {
	dlog( LOG_DEBUG, "SetTimeoutWait(%d)\n", time);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002d58
	g3 = v1;
	int32_t result; // 0x10002d85
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		a1->ie_duration = time;
		result = (int32_t) a1 & -0x10000;
	} else {
		g8 = a1;
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SetCellMode(/*int32_t a1*/SET9052 *a1, int16_t mode) {
	dlog( LOG_DEBUG, "SetCellMode(%d)\n", mode);
	int16_t v1 = 0; // bp-8
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005fd7
	g3 = v2;
	int32_t result2; // 0x10006048
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		int16_t *cell_modePtr = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x10005ffb
		*cell_modePtr = mode;
		if (mode != IE_FALSE /*0*/) {
			if (mode != IE_TRUE /*1*/) {
				*cell_modePtr = IE_TRUE /*1*/;
				v1 = -1;
			} else {
				*cell_modePtr = 1; // this looks false!!!
			}
			int32_t result = (int32_t) v1 | recalcStep(a1) & -0x10000; // 0x10006041
			return result;
		}
		*cell_modePtr = IE_FALSE /*0*/;
		result2 = (int32_t) v1 | recalcStep(a1) & -0x10000;
	} else {
		result2 = GetFuncStatusCode(a1);
	}
	return result2;
}

int32_t RdRBW(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100057ee
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x100057f6
	g6 = v2 / 0x10000;
	int32_t result;
	if ((v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = (int32_t) *(int16_t *) (&a1->rbw_code /*a1 + 72*/)
				| (int32_t) a1 & -0x10000;
	} else {
		result = v1 | 0xffff;
	}
	return result;
}

int32_t VBWCodeFromFreq(float64_t a1, int32_t a2_unused) {
	dlog( LOG_DEBUG, "VBWCodeFromFreq(%f, %d) - TBI\n", a1, a2_unused);
	g6 = 1;
	int32_t v1 = g3; // 0x1000b51a12
	int16_t v2 = 1;
	int32_t v3; // 0x1000b51a
	while (true) {
		if ((v1 & 0x4000) != 0) {
			return (int32_t) v2 | ((int32_t) v2 | v1 & -0x10000) & -0x10000;
		}
		int16_t v4 = v2 + 1; // 0x1000b51a
		v3 = (int32_t) v4 | v1 & -0x10000;
		int32_t v5 = v4; // 0x1000b522
		g6 = v5;
		if (v4 != 7 && v4 < 7 == (6 - v5 & v5) < 0) {
			break;
		}
		v1 = v3;
		v2 = v4;
	}
	dlog( LOG_DEBUG, "VBWCodeFromFreq(%f, %d) - TBI returns %d\n", v3);
	return (int32_t) -3 | v3 & -0x10000;
}

int32_t SetPortNum(SET9052 *a1, uint16_t a2) {
	/* DD: ISA code, do nothing. */
	return 999;
	/*
	 // entry
	 g3 = a1;
	 int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10006edc
	 g3 = v1;
	 int32_t result; // 0x10006fa9
	 if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
	 int32_t v2 = a2; // 0x10006efc
	 int32_t v3 = a2; // 0x10006eff3
	 if (a2 >= 256) {
	 // 0x10006f0b
	 if (a2 < 369) {
	 int32_t v4 = v2 & 15; // 0x10006f25
	 g8 = v4;
	 if (v4 == 0) {
	 // 0x10006f36
	 *(int16_t *)(a1 + 472) = a2;
	 // branch -> 0x10006fa2
	 // 0x10006fa2
	 // branch -> 0x10006fa6
	 // 0x10006fa6
	 return a1 & -0x10000;
	 }
	 }
	 }
	 // 0x10006f4c
	 g8 = v3;
	 if (a2 >= 768) {
	 // 0x10006f5d
	 if (a2 < 881) {
	 // 0x10006f6c
	 if ((v2 & 15) == 0) {
	 // 0x10006f86
	 g8 = a1;
	 *(int16_t *)(a1 + 472) = a2;
	 // branch -> 0x10006fa2
	 // 0x10006fa2
	 // branch -> 0x10006fa6
	 // 0x10006fa6
	 return v2 & -0x10000;
	 }
	 }
	 }
	 // 0x10006f9c
	 // branch -> 0x10006fa2
	 // 0x10006fa2
	 result = v3 & -0x10000 | -3;
	 // branch -> 0x10006fa6
	 } else {
	 // 0x10006eeb
	 g8 = a1;
	 result = GetFuncStatusCode(a1);
	 // branch -> 0x10006fa6
	 }
	 // 0x10006fa6
	 return result;
	 */
}

int32_t GetFuncStatusCode(SET9052 *a1) {
	int32_t result;
	if (a1 != NULL) {
		// TODO: what is "func_status_code | a1 & -0x10000" doing: why ORing with a1 ?
		// Maybe my replacement is not the same as the original line. Check this.
		//result = (int32_t)*(int16_t *)(a1 + 204) | a1 & -0x10000;
		result = a1->func_status_code | /*(int32_t)a1 &*/-0x10000;
	} else {
		result = g3 & -0x10000 | 0xfff6;
	}
	return result;
}

int32_t RdErrorStatus(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1);
	g3 = v1;
	int32_t v2 = 0x10000 * v1;
	g6 = v2 / 0x10000;
	int32_t result;
	if ((v2 || 0xffff) < 0x1ffff) {
		result = a1->err_status;
		g6 = result;
	} else {
		g8 = a1;
		result = 0x10000 * GetFuncStatusCode(a1) / 0x10000;
	}
	if (a1->err_status != 0) {
		dlog( LOG_DEBUG, "RdErrorStatus() --> %x %x\n", a1->err_status, result);
	}
	return result;
}

int32_t SetErrorStatus(SET9052 * a1, int16_t status) {
	if (status != 0) {
		dlog(LOG_DEBUG, "SetErrorStatus(%x)\n", status);
	}
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1);
	g3 = v1;
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int32_t v2 = status;
		a1->err_status = v2;
		result = /*(int32_t)a1 & -0x10000 | */v2;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t BreakSweep(SET9052 *a1, uint16_t breakMode) {
	dlog( LOG_DEBUG, "\n\nsa.c:BreakSweep, mode=%d\n", breakMode);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	int16_t v2 = breakMode; // g3 & -0x10000 | (int32_t)breakMode; // 0x10004a0e
	g3 = v2;
	int32_t result; // 0x10004b83
	if ((0x10000 * TestFuncStatusAndPtr(a1) || 0xffff) >= 0x1ffff) {
		g3 = a1;
		result = GetFuncStatusCode(a1);
		g4 = v1;
		return result;
	}
	g8 = 1;
	// Engine Command 7 is related to Break Sweep
	int32_t v3 = SendCommand(a1, ENG_TERMINATE /*7*/, 1, &v2); // 0x10004a49
	g3 = v3;
// DD XXX
	if (v3 != 1) {
		dlog(LOG_DEBUG, "Patching v3 from 0x%x to 1 - TBC\n", v3);
		v3 = 1;
	}
// DD XXX

	if (0x10000 * v3 != 0x10000) {
		g3 = a1;
		result = SetFuncStatusCode(a1,
				(int16_t) FuncStatusFromEngineReply((int16_t) v3));
		g4 = v1;
		return result;
	}
	int32_t v4 = breakMode; // 0x10004a7d
	g8 = v4;
	switch (v4) {
	default: {
		result = SetFuncStatusCode(a1, IE_ERR_VALS /*-3*/);
		g4 = v1;
		return result;
	}
	case STOP_NOW /* 0 */: {
		int32_t v5 = SetSwpIdx(a1, 0); // 0x10004ae1
		g3 = v5;
		if ((int16_t) v5 >= 0) {
			int32_t v6 = updateSweepInProgValue(a1, 0); // 0x10004b0b
			if (0x10000 * v6 >= 0) {
				result = v6 & -0x10000 | 65;
			} else {
				g8 = g8 & -0x10000 | v6 & 0xffff;
				g3 = a1;
				result = SetFuncStatusCode(a1, (int16_t) v6);
			}
			g4 = v1;
			return result;
		}
		break;
	}
	case STOP_AFTER /*1*/: {
		g4 = v1;
		return v3 & -0x10000 | 65;
	}
	case PAUSE_SWP /*2*/: {
		int32_t v7 = updateSweepInProgValue(a1,
				a1->swp_in_prog/* *(int16_t *)(a1 + 4)*/& -129); // 0x10004b43
		if (0x10000 * v7 >= 0) {
			result = v7 & -0x10000 | 65;
		} else {
			g8 = g8 & -0x10000 | v7 & 0xffff;
			g3 = a1;
			result = SetFuncStatusCode(a1, (int16_t) v7);
		}
		g4 = v1;
		return result;
	}
	case RESUME_SWP /*3*/: {
		int32_t v8 = updateSweepInProgValue(a1,
				a1->swp_in_prog/* *(int16_t *)(a1 + 4)*/| 128); // 0x10004aac
		int16_t v9 = v8; // 0x10004aac
		int32_t v10 = 0x10000 * v8 / 0x10000; // 0x10004ab8
		g3 = v10;
		if (v9 >= 0) {
			result = v10 & -0x10000 | 65;
		} else {
			g8 = a1;
			result = SetFuncStatusCode(a1, v9);
		}
		g4 = v1;
		return result;
	}
	}
	g8 = a1;
	result = SetFuncStatusCode(a1, IE_FAILURE /*-1*/);
	g4 = v1;
	return result;
}

int32_t updateSweepInProgValue(SET9052 *a1, uint16_t value) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002d19
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x10002d21
	g6 = v2 / 0x10000;
	int32_t result; // 0x10002d50
	if ((v2 || 0xffff) < 0x1ffff) {
		g3 = a1;
		g6 = value;
		a1->swp_in_prog = value;
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
	} else {
		g8 = a1;
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SendCommand(SET9052 *a1, int32_t command, int32_t numBytes,
		uint16_t *wordPtr) {
	dlog( LOG_INFO, "\nsa.c:SendCommand %x\n", command);
	SET9052 *v1 = a1; // 0x10003b52
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x10003b56
	g3 = v2;
	int32_t v3 = 0x10000 * v2; // 0x10003b5e
	g6 = v3 / 0x10000;
	int32_t result; // 0x10003bb7
	if ((v3 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		if (*(int32_t *)(v1 + 660) != 0) {
			// 0x10003b7f
			g6 = v1;
			int32_t * v4 = (int32_t *)(v1 + 692);// 0x10003b82
			if (*v4 != 0) {
				// 0x10003b91
				g6 = v1 & -0x10000 | a2 & 0xffff;
				g8 = v1;
				__pseudo_call(*v4);
				// branch -> 0x10003bb4
				// 0x10003bb4
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
		result = (int32_t) v1 & -0x10000 | 0xffeb;
#else
		result = VISA_SendCommand(a1, command, numBytes, wordPtr);
#endif
	} else {
		g8 = v1;
		result = GetFuncStatusCode(v1);
	}
	dlog( LOG_INFO, "\n\nsa.c:SendCommand done --> 0x%x\n", result);
	return result;
}

/**
 * Engine reply codes remapped to software error domain, REPLY code + 0x40, see sa_defin.h .
 */
int32_t FuncStatusFromEngineReply(int16_t engReply) {
	dlog( LOG_DEBUG, "FuncStatusFromEngineReply(0x%x)\n", engReply);
	int32_t v1 = engReply; // 0x10001006
	g8 = v1;
	// The following code returned in orig the engine code if
	// the engine reply ? was in v1
	// unsigned char v2 = g12[v1]
	// To prevent extremly large array, i assume that engReply is in range 0..256.
	// But when I run the code, I see the value FuncStatusFromEngineReply(0xffffffeb), much too large.
	unsigned char v2 = *(char *) (v1 + (int32_t) &g12); // 0x1000101c
	g6 = v2;
	int32_t v3;
	switch (v2) {
	case ENG_REPLY_BUSY /* 0 */: {
		return IE_ENG_BUSY /* 64 *//*| v1 & -0x10000*/;
	}

	case ENG_REPLY_ACK /* 1 */: {
		v3 = IE_ENG_ACK /* 65 */;
		break;
	}
	case 2: {
		v3 = IE_ENG_NOMAIN /*66*/;
		break;
	}
	case 3: {
		v3 = IE_ENG_NODSP /*67*/;
		break;
	}
	case 4: {
		v3 = IE_ENG_NOCAL /*68*/;
		break;
	}
	case 5: {
		v3 = 69;
		break;
	}
	case 6: {
		v3 = 70;
		break;
	}
	case 7: {
		v3 = 71;
		break;
	}
	case 8: {
		v3 = 72;
		break;
	}
	case 9: {
		v3 = 73;
		break;
	}
	case 10: {
		v3 = IE_ENG_BAD_CMD /*81*/;
		break;
	}
	case 11: {
		v3 = IE_ENG_ERROR_GEN /*82*/;
		break;
	}
	case 12: {
		v3 = IE_ENG_BAD_PARM1 /*83*/;
		break;
	}
	case 13: {
		v3 = 84;
		break;
	}
	case 14: {
		v3 = 85;
		break;
	}
	case 15: {
		v3 = 86;
		break;
	}
	case 16: {
		v3 = 87;
		break;
	}
	case 17: {
		v3 = 88;
		break;
	}
	case 18: {
		v3 = 89;
		break;
	}
	case 19: {
		v3 = 90;
		break;
	}
	case 20: {
		v3 = IE_ENG_BAD_PARM9 /*91*/;
		break;
	}
	case ENG_REPLY_BAD_PARM3 /*21*/: {
		v3 = IE_ENG_ERR_DTEC /*144*/;
		break;
	}
	case 22: {
		v3 = IE_ENG_ERR_TRIG /*145*/;
		break;
	}
	default: {
		v3 = 254;
		break;
	}
	}
	return v3 /*| v1 & -0x10000*/;
}

/**
 * Set trigger detection parameters. See array 'words' for the eight words that are sent to device.
 * Totally reworked because it was decompiled wrong.
 */
int32_t CommTrigDetect(SET9052 *a1) {
	dlog( LOG_DEBUG, "CommTrigDetect()\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	int16_t v2 = 8; // bp-32
	g3 = a1;
	int32_t v3 = TestFuncStatusAndPtr(a1); // 0x100015ec
	g3 = v3;
	int32_t v4 = 0x10000 * v3; // 0x100015f4
	g6 = v4 / 0x10000;
	int32_t result; // 0x10001717
	if ((v4 || 0xffff) >= 0x1ffff) {
		result = GetFuncStatusCode(a1);
		g4 = v1;
		return result;
	}
	int32_t v5 = a1->trig_freq; // *(int32_t *)(a1 + 120); // 0x10001613
	g8 = v5;
	int32_t trig_freq_l = function_10002df9(a1, /*(float64_t) (int64_t) v5 */ a1->trig_freq);
	// Save rounded value
	a1->trig_freq = (FREQ8500) trig_freq_l;

	int16_t trig_code;
	if ((RdSweepCode(a1) & 1) == 0) {
		if (a1->trig_norm_flag != IE_FALSE /*0*/) {
			int16_t trig_code = a1->trig_code;
		} else {
			// 0x80 signals trig_norm_flag==IE_TRUE
			int16_t trig_code = a1->trig_code | 0x80; // 1662
		}

	} else { // 1672
		int16_t trig_code = a1->trig_code;
	}
	// 167d
	int16_t words[8];
	words[0] = a1->detect_code;
	words[1] = trig_code;
	words[2] = a1->trig_delay & 0xffff; // tdelay_lo
	words[3] = a1->trig_delay >> 16; // tdelay_hi
	words[4] = a1->trig_thresh & 0xffff; // tthresh_lo
	words[5] = a1->trig_thresh >> 16; // tthresh_hi, always 0 because it is a 16 bit value.
	words[6] = trig_freq_l & 0xffff; // trig_freq_lo
	words[7] = trig_freq_l >> 16; // trig_freq_hi

	dlog( LOG_DEBUG, "detect_code = 0x%x\n", a1->detect_code);
	dlog( LOG_DEBUG, "trig_code = 0x%x\n", trig_code);
	dlog( LOG_DEBUG, "trig_delay = 0x%x\n", a1->trig_delay );
	dlog( LOG_DEBUG, "trig_thresh = 0x%x\n", a1->trig_thresh );
	dlog( LOG_DEBUG, "trig_freq_l = 0x%x\n", trig_freq_l );
	int i;
	for (i=0; i<8; i++ ) {
		dlog( LOG_DEBUG, "words[%d] = 0x%x\n", i, words[i]);
	}

	result = SendCommand(a1, ENG_SET_TRIGDET /*4*/, (int32_t) v2, words);
	// result contains the engine's answer.
	if (result == 0x13) {
		dlog( LOG_DEBUG, "ComTrigDetect exit 1, result == 0x13\n");
		return IE_ENG_ERR_DTEC; //  0x90=144
	}
	if (result < 0x14) {
		result = FuncStatusFromEngineReply(result);
	} else {
		result = IE_ENG_ERR_TRIG ; // 0x91=145
	}

	g4 = v1;
	dlog( LOG_DEBUG, "ComTrigDetect --> 0x%0x\n", result);
	return result;
}

int32_t CommInterrupts(SET9052 *a1) {
	dlog( LOG_DEBUG, "CommInterrupts\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x1000157f
	g3 = v2;
	int32_t result; // 0x100015d5
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		int32_t v3 = a1->intr_code; // (int32_t)*(int16_t *)(a1 + 136); // bp-8
		int32_t *v4 = &v3; // 0x100015aa
		g8 = v4;
		// DD Engine Command 6 is related to "set comm interupts..."
		// param 3 is 1
		// v4 =  &a1->intr_code
		result = FuncStatusFromEngineReply(
				(int16_t) SendCommand(a1, ENG_SET_INTMODE /*6*/,
						1 /*(int32_t)1 | (int32_t)a1 & -0x10000*/, v4));
	} else {
		result = GetFuncStatusCode(a1);
	}
	dlog( LOG_DEBUG, "CommInterrupts --> 0x%0x\n", result);
	return result;
}

// Seems to create a int32_t from the float value argument.
// But hey, the argument is not used at all...
// Check with IDA. Function is decompiled wrong. XXX. See below for reimplementation; reimplemented only for 9054.
// The value created is dependent of the engine model.
int32_t function_10002df9(SET9052 *a1, float64_t a2) {
#ifdef ORIG
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = 0x10000 * TestFuncStatusAndPtr(a1); // 0x10002e0b
	g6 = v2 / 0x10000;
	if ((v2 || 0xffff) >= 0x1ffff) {
		g4 = v1;
		return -1;
	}
	g8 = a1;
	int16_t engine_model = a1->engine_model; //*(int16_t *)(a1 + 2); // 0x10002e1d
	int32_t v4 = engine_model; // 0x10002e1d
	g3 = v4;
	int32_t result; // 0x10002ea5
	//DD XXX condition next 2 lines seems wrong somewhow.
	if (engine_model != SA9085 /*768*/ && engine_model < SA9085 /*768*/== (767 - v4 & v4) < 0) {
		if (engine_model == SA9034 /*1024*/) {
			g11--;
			result = __ftol(v4);
		} else {
			result = -1;
		}
		g4 = v1;
		return result;
	}
	if (engine_model == SA9085 /*768*/) {
		g6 = a1;
		int32_t v5 = 0x10000 * RdEngOption(a1, ENG_OPT_0 /*0*/); // 0x10002e6d
		g8 = v5 / 0x10000;
		g11--;
		result = __ftol((v5 | 0xffff) < 0x1ffff ? 0x40000000 : 0x40180000);
	} else {
		if (engine_model != SA9052 /*256*/) {
			if (engine_model != SA9054 /*512*/) {
				g4 = v1;
				return -1;
			}
		}
		g11--;
		result = __ftol(v4);
	}
	g4 = v1;
#else
	// For SA9054, IDA shows that the value simply is converted from float to int.
	// This has to be decompiled manully later on.
	int32_t result; // 0x10002ea5
	result = __ftol(a2);
	dlog(LOG_DEBUG, "function_10002df9(%f) --> %d\n", a2, result);
#endif
	return result;
}

int32_t SetSwpIdx(SET9052 *a1, int32_t index) {
	dlog(LOG_DEBUG, "SetSwpIdx(%d)\n", index);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100053d6
	g3 = v1;
	int32_t result; // 0x10005422
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		if (index != 0) {
			int32_t v2 = RdNumDataPts(a1); // 0x100053fd
			g3 = v2;
			if (v2 < index) {
				return v2 & -0x10000 | 0xfffd;
			}
		}
		a1->sweepIndex = index;
		result = g3 & -0x10000;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t RdSweepCode(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10005e9e
	g3 = v1;
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = (int32_t) /* *(int16_t *)(a1 + 130)*/a1->sweep_code
				| (int32_t) (int32_t) a1 & -0x10000;
	} else {
		result = v1 | 0xffff;
	}
	dlog(LOG_DEBUG, "RdSweepCode() --> 0x%x\n", result);
	return result;
}

int32_t RdNumDataPts(SET9052 *a1) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t result2; // 0x10005362
	if ((0x10000 * TestFuncStatusAndPtr(a1) || 0xffff) < 0x1ffff) {
		g8 = a1;
		int32_t v2 = (int32_t) /* *(int16_t *)(a1 + 4) */a1->swp_in_prog & 127; // 0x100052e1
		g3 = v2;
		int16_t v3 = v2; // 0x100052e4
		if (v2 != IE_FALSE /*0*/) {
			int16_t v4 = a1->cell_mode; // *(int16_t *)(a1 + 64); // 0x100052ff
			g3 = v4;
			if (v4 == IE_TRUE /*1*/) {
				if (v2 != 3) {
					g8 = v2;
					if (v2 != 2) {
						g3 = a1;
						SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
						g4 = v1;
						dlog(LOG_DEBUG, "RdNumDataPts() 1 --> %d\n", a1->num_cells);
						return a1->num_cells; // *(int32_t *)(a1 + 132);
					}
				}
			}
			g8 = v2;
			if (v2 == IE_TRUE /*1*/) {
				g3 = a1;
				SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
				g4 = v1;
				dlog(LOG_DEBUG, "RdNumDataPts() 2 --> %d\n", a1->num_swp_pts);
				return a1->num_swp_pts; // *(int32_t *)(a1 + 164);
			}
			if (v3 == 2) {
				g8 = a1;
				int32_t result = a1->num_samples; // *(int32_t *)(a1 + 152); // 0x10005354
				g3 = result;
				SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
				g4 = v1;
				dlog(LOG_DEBUG, "RdNumDataPts() 3 --> %d\n", result);
				return result;
			}
			if (v3 == 3) {
				result2 = a1->num_hop_pts; // *(int32_t *)(a1 + 172);
				g8 = result2;
				SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
			} else {
				g3 = a1;
				result2 = 0x10000 * SetFuncStatusCode(a1, IE_ERR_NOSWP /*-14*/)
						/ 0x10000;
			}
			g4 = v1;
			dlog(LOG_DEBUG, "RdNumDataPts() 4 --> %d\n", result2);
			return result2;
		}
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result2 = 0;
	} else {
		result2 = -1;
	}
	g4 = v1;
	dlog(LOG_DEBUG, "RdNumDataPts() 5 --> %d\n", result2);
	return result2;
}

// Returns a1->ie_duration
int32_t RdTimeoutWait(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002d8d
	g3 = v1;
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = a1->ie_duration; // *(int32_t *)(a1 + 180);
	} else {
		result = -1;
	}
	return result;
}

static struct timespec start, stop;
static int timerRunning = 0;

int32_t InitTimeoutLoop(int32_t a1) {
	dlog(LOG_DEBUG, "InitTimeoutLoop(%d)\n", a1);
	if (timerRunning) {
		dlog(LOG_ERROR, "InitTimeoutLoop(%d), timer already running\n");
		return 0;
	}
#ifdef ORIG
	int32_t result = IeTimer(g4); // 0x1000d4be
	g94 = result;
#endif
	int32_t result;

	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		dlog(LOG_ERROR, "clock gettime");
		exit(-1);
	}

	return result;
}

int32_t TestTimeoutDone(int32_t a1) {
	dlog(LOG_DEBUG, "TestTimeoutDone(%d)\n", a1);

#ifdef ORIG
	int32_t v1 = IeTimerFrom(g94); // 0x1000d4d3
	int32_t result;
#endif

	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		dlog(LOG_ERROR, "clock gettime");
		exit(-1);
	}

	// calc delta time in ms -> v1
	uint32_t ts = (stop.tv_sec - start.tv_sec) * 1000L;
	uint32_t tn = (stop.tv_nsec - start.tv_nsec) / 1000L / 1000L;
	int32_t v1 = ts + tn;

	int32_t result;

	if (v1 > a1) {
		dlog(LOG_DEBUG, "Delta time: %d\n", v1);
		result = v1 & -0x10000 | 1;
	} else {
		result = v1 & -0x10000;
	}
	return result;
}

int32_t IeTimer(int32_t a1) {
	timeBeginPeriod(1);
	int32_t result = timeGetTime(); // 0x1000ce94
	timeEndPeriod(1);
	return result;
}

void timeBeginPeriod(uint32_t v) {
}

void timeEndPeriod(uint32_t v) {
}

int32_t timeGetTime() {
	return 0;
}

int32_t IeTimerFrom(int32_t a1) {
	return function_1000ce50((int64_t) a1, IeTimer(g4));
}

int32_t function_1000ce50(int64_t a1, int32_t a2) {
	int32_t v1 = a2 + 0x52825b9 - (int32_t) a1; // 0x1000ce5b
	return (0x100000000 * (int64_t) (v1 >> 31) | (int64_t) v1) % 0x52825b9;
}

int32_t SetEngineModel(SET9052 *a1, int16_t engine_model) {
	dlog( LOG_DEBUG, "SetEngineModel(0x%x)\n", engine_model);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10008698
	g3 = v1;
	int32_t result; // 0x100086f8
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int32_t v2 = engine_model; // 0x100086b5
		if (engine_model != SA9052 /*256*/) {
			if (engine_model != SA9054 /*512*/) {
				g8 = v2;
				if (engine_model != SA9085 /*768*/) {
					if (engine_model != SA9034 /*1024*/) {
						return v2 & -0x10000 | 0xfffd;
					}
				}
			}
		}
		a1->engine_model = engine_model;
		result = v2 & -0x10000;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t __amsg_exit(int32_t a1) {
	// also called by sa.c
	return 0;
}

/*------------------------------------------------------------------------------------*/
/* InitGuiSweep related code */
/*------------------------------------------------------------------------------------*/

int32_t SetRefLevel(SET9052 *a1, int16_t a2);
int32_t SetAutoCell(SET9052 *a1, int16_t a2);
int32_t StepSizeMode(SET9052 *a1, int16_t a2, int32_t a3);
int32_t SwpTimeMode(SET9052 *a1, int16_t a2, int32_t a3);
int32_t SetRBWmode(SET9052 *a1, int16_t a2);
int32_t SetRBW(SET9052 *a1, int16_t a2);
int32_t SetVBWmode(SET9052 *a1, int16_t a2);
int32_t SetVBW(SET9052 *a1, uint16_t code);
int32_t SetTrigMode(SET9052 *a1, int16_t mode, int32_t a3, int32_t a4);
int32_t SetSweepCode(SET9052 *a1, int16_t code);

// Seems to be some array; g13..g17
//int32_t g13 = 0x1000505d; // 20573
//int32_t g14 = 0x1000c8b7; // 51385
//int32_t g15 = 0x1000c923;
//int32_t g16 = 0x1000cbc9;
//int32_t g17 = 0x1000ccaf;
// int32_t *g13 = { 0x1000505d, 0x1000c8b7, 0x1000c923, 0x1000cbc9, 0x1000ccaf };

//int32_t InitGuiSweep(int32_t a1, int16_t rbw, int32_t vbw, a4+a5=start, a6+a7=stop, int32_t ref_level, uint32_t cell_num)
int32_t InitGuiSweep(SET9052 *a1, int16_t rbw, int32_t vbw, FREQ8500 start,
		FREQ8500 stop, int32_t ref_level, uint32_t cell_num) {
	dlog(LOG_DEBUG, "InitGuiSweep()\n");
	int16_t v1 = ref_level;
	int16_t v2 = vbw;

	if (a1 == 0) {
		return MR90XX_IE_ERROR;
	}
	if (FreqInRange(a1, start) < 1) {
		return MR90XX_IE_ERROR;
	}
	if (FreqInRange(a1, stop) < 1) {
		return MR90XX_IE_ERROR;
	}

	if (cell_num < MR90XX_MIN_NUM_CELLS /*1*/|| cell_num > MR90XX_MAX_NUM_CELLS /*0xffff*/) {
		return MR90XX_IE_ERROR;
	}

	if (SetAutoCell(a1, VI_FALSE /*0*/) != 0) {
		return MR90XX_IE_ERROR;
	}

// DD XXX
#ifdef ORIG
	// the call returns sth. != 0
	if (SetCellMode(a1, VI_TRUE /*1*/) != 0) {
		return MR90XX_IE_ERROR;
	}
#else
	SetCellMode(a1, VI_TRUE /*1*/);
#endif
	// DD XXX

// DD XXX
#ifdef ORIG
	if ((int16_t) StepSizeMode(a1, MR90XX_AUTO_ON /*1*/, 0) != 0) {
		return MR90XX_IE_ERROR;
	}
#else
	StepSizeMode(a1, MR90XX_AUTO_ON /*1*/, 0);
#endif

	if ((int16_t) SwpTimeMode(a1, MR90XX_AUTO_ON /*1*/, 0) != 0) {
		return MR90XX_IE_ERROR;
	}

	int32_t result; // 0x1000a0cf
	int32_t v3; // 0x10009f69
	int32_t v4; // 0x1000a0bb
	int32_t v5; // 0x1000a0af
	if (rbw != MR90XX_RBW_AUTO /*5*/) {
		int32_t v6 = SetRBWmode(a1, VI_FALSE /*0*/); // 0x10009eba
		if (v6 != 0) {
			return v6 | 0xffff;
		}
		int32_t v7 = SetRBW(a1, rbw); // 0x10009ee0
		int32_t v8 = 0x10000 * v7;
		int32_t v9 = v8 / 0x10000; // 0x10009eec
		if ((int16_t) v7 != 0) {
			if (v8 != -0x30000) {
				result = v9 | 0xffff;
			} else {
				result = v9;
			}
			return result;
		}
		int32_t v10; // 0x1000a003
		int32_t v11; // 0x1000a026
		int32_t v12; // 0x10009fb8
		int32_t v13; // 0x10009fde
		int32_t v14; // 0x1000a06d
		int32_t v15; // 0x1000a08d
		int32_t v16; // 0x1000a04f
		if (vbw == MR90XX_VBW_AUTO /*0x10000 * vbw == 0x80000*/) {
			int32_t v17 = SetVBWmode(a1, VI_TRUE /*1*/); // 0x10009f1e
			if ((int16_t) v17 != 0) {
				return 0x10000 * v17 / 0x10000 | 0xffff;
			}
		} else {
			int32_t v18 = SetVBWmode(a1, VI_FALSE /*0*/); // 0x10009f43
			if ((int16_t) v18 != 0) {
				return 0x10000 * v18 / 0x10000 | 0xffff;
			}
			g6 = a1;
			v3 = SetVBW(a1, v2);
			int32_t v19 = 0x10000 * v3;
			int32_t v20 = v19 / 0x10000; // 0x10009f75
			if ((int16_t) v3 != 0) {
				if (v19 != -0x30000) {
					result = v20 | 0xffff;
				} else {
					result = v20;
				}
				return result;
			}
		}
		ConfigStartFreq(a1, start);
		v12 = ConfigStopFreq(a1, stop);
		if ((int16_t) v12 != 0) {
			return 0x10000 * v12 / 0x10000 | 0xffff;
		}
		v13 = SetRefLevel(a1, v1);
		if ((int16_t) v13 < 0) {
			return 0x10000 * v13 / 0x10000 | 0xffff;
		}
		v10 = SetNumCells(a1, cell_num);
		if ((int16_t) v10 != 0) {
			return 0x10000 * v10 / 0x10000 | 0xffff;
		}
		v11 = SetSwpIdx(a1, 0);
		if ((int16_t) v11 != 0) {
			return 0x10000 * v11 / 0x10000 | 0xffff;
		}
		v16 = SetDefltPts(a1, 501, 0);
		if ((int16_t) v16 != 0) {
			return 0x10000 * v16 / 0x10000 | 0xffff;
		}
		v14 = SetDetectLog(a1, 0);
		if ((int16_t) v14 != 0) {
			return 0x10000 * v14 / 0x10000 | 0xffff;
		}
		v15 = SetSweepCode(a1, 5);
		if ((int16_t) v15 != 0) {
			return 0x10000 * v15 / 0x10000 | 0xffff;
		}
		v5 = SetTrigMode(a1, 0, 1, 0);
		v4 = 0x10000 * v5 / 0x10000;
		if ((int16_t) v5 == 0) {
			result = v4 & -0x10000;
		} else {
			result = v4 | 0xffff;
		}

	} else {
		// Below: rbw == MR90XX_RBW_AUTO
		int32_t v21 = SetRBWmode(a1, VI_TRUE /*1*/); // 0x10009e95
		if ((int16_t) v21 != 0) {
			return 0x10000 * v21 / 0x10000 | 0xffff;
		}

		int32_t v10; // 0x1000a003
		int32_t v11; // 0x1000a026
		int32_t v12; // 0x10009fb8
		int32_t v13; // 0x10009fde
		int32_t v14; // 0x1000a06d
		int32_t v15; // 0x1000a08d
		int32_t v16; // 0x1000a04f

		if (vbw == MR90XX_VBW_AUTO /*0x10000 * vbw == 0x80000*/) {
			int32_t v17 = SetVBWmode(a1, VI_TRUE /*1*/); // 0x10009f1e
			if ((int16_t) v17 != 0) {
				return 0x10000 * v17 / 0x10000 | 0xffff;
			}
		} else {
			int32_t v18 = SetVBWmode(a1, VI_FALSE /*0*/); // 0x10009f43
			if ((int16_t) v18 != 0) {
				return 0x10000 * v18 / 0x10000 | 0xffff;
			}
			g6 = a1;
			v3 = SetVBW(a1, v2);
			int32_t v19 = 0x10000 * v3;
			int32_t v20 = v19 / 0x10000; // 0x10009f75
			if ((int16_t) v3 != 0) {
				if (v19 != -0x30000) {
					result = v20 | 0xffff;
				} else {
					result = v20;
				}
				return result;
			}
		}
		ConfigStartFreq(a1, start);
		v12 = ConfigStopFreq(a1, stop);
		if ((int16_t) v12 != 0) {
			return 0x10000 * v12 / 0x10000 | 0xffff;
		}
		v13 = SetRefLevel(a1, v1);
		if ((int16_t) v13 < 0) {
			return 0x10000 * v13 / 0x10000 | 0xffff;
		}
		v10 = SetNumCells(a1, cell_num);
		if ((int16_t) v10 != 0) {
			return 0x10000 * v10 / 0x10000 | 0xffff;
		}
		v11 = SetSwpIdx(a1, 0);
		if ((int16_t) v11 != 0) {
			return 0x10000 * v11 / 0x10000 | 0xffff;
		}
		v16 = SetDefltPts(a1, 501, 0);
		if ((int16_t) v16 != 0) {
			return 0x10000 * v16 / 0x10000 | 0xffff;
		}
		v14 = SetDetectLog(a1, 0);
		if ((int16_t) v14 != 0) {
			return 0x10000 * v14 / 0x10000 | 0xffff;
		}
		v15 = SetSweepCode(a1, 5);
		if ((int16_t) v15 != 0) {
			return 0x10000 * v15 / 0x10000 | 0xffff;
		}
		v5 = SetTrigMode(a1, 0, 1, 0);
		v4 = 0x10000 * v5 / 0x10000;
		if ((int16_t) v5 == 0) {
			result = v4 & -0x10000;
		} else {
			result = v4 | 0xffff;
		}
	}
	return result;
}

// Checks if freq inside limits; function is decompiled wrong and does not use freq parameter. Can easily coded correctly.
int32_t FreqInRange(SET9052 * a1, float64_t freq) {
#ifdef ORIG
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1);// 0x10008a07
	g3 = v2;
	int32_t result;
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		RdMinFreqLimit(a1);
		g11++;
		int32_t v3 = RdMaxFreqLimit(a1); // 0x10008a3d
		int32_t v4 = g11 + 1;// 0x10008a45
		g11 = v4;
		if ((v3 & 256) == 0) {
			g11 = v4;
			if ((v3 & 0x4100) != 0) {
				g4 = v1;
				return 1 | v3 & -0x10000;
			}
		}
		result = v3 & -0x10000;
	} else {
		result = v2 | 0xffff;
	}
	g4 = v1;
	return result;
#else
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	int32_t v2 = TestFuncStatusAndPtr(a1);
	if (v2 < 1) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		RdMinFreqLimit(a1);
		float80_t fmin = frequencyLimit;
		g11++;
		RdMaxFreqLimit(a1); // 0x10008a3d
		float80_t fmax = frequencyLimit;
		if (freq >= fmin && freq <= fmax) {
			dlog(LOG_DEBUG, "FreqInRange(%f) -> %d\n", freq, VI_TRUE);
			return VI_TRUE;
		} else {
			dlog(LOG_DEBUG, "FreqInRange(%f) -> %d\n", freq, VI_FALSE);
			return VI_FALSE;
		}
	}
#endif
}

// Stores maximum frequency in global 'frequencyLimit'
int32_t RdMaxFreqLimit(SET9052 *a1) {
	g3 = a1;
	int32_t result = TestFuncStatusAndPtr(a1); // 0x10008770
	g3 = result;
	if ((0x10000 * result || 0xffff) >= 0x1ffff) {
		frequencyLimit = -1.0L;
		g11--;
		return result;
	}
	g8 = a1;
	SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
	int32_t result4 = RdEngineModel(a1); // 0x10008799
	g3 = result4;
	int32_t v1 = 0x10000 * result4; // 0x100087a1
	int32_t v2 = v1 / 0x10000; // 0x100087a1
	int32_t result3; // 0x100087f6
	if (v1 != SA9085 << 16 /*0x3000000*/
	&& v1 < SA9085 << 16 /*0x3000000*/== (767 - v2 & v2) < 0) {
		int32_t result2; // 0x10008807
		if (v1 == SA9034 << 16 /*0x4000000*/) {
			frequencyLimit = 3.4e+9L;
			g11--;
			result2 = result4;
		} else {
			g8 = a1;
			result3 = SetFuncStatusCode(a1, IE_ERR_ENGMOD /*-13*/);
			frequencyLimit = -1.0L;
			g11--;
			result2 = result3;
		}
		return result2;
	}
	if (v1 == SA9085 << 16 /* 0x3000000*/) {
		frequencyLimit = 8.5e+9L;
		g11--;
	} else {
		if (v1 != SA9052 << 16 /*0x1000000*/) {
			if (v1 != SA9054 << 16 /*x2000000*/) {
				g8 = a1;
				result3 = SetFuncStatusCode(a1, IE_ERR_ENGMOD /*-13*/);
				frequencyLimit = -1.0L;
				g11--;
				return result3;
			}
		}
		frequencyLimit = 1.6e+9L;
		g11--;
	}
	return result4;
}

// Stores minimum frequency in global 'frequencyLimit'
int32_t RdMinFreqLimit(SET9052 *a1) {
	//dlog(LOG_DEBUG, "RdMinFreqLimit\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10008812
	g3 = v2;
	int32_t result2; // 0x100088a8
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		int32_t v3 = RdEngineModel(a1); // 0x1000883c
		g3 = v3;
		int32_t v4 = 0x10000 * v3; // 0x10008844
		int32_t v5 = v4 / 0x10000; // 0x10008844
		g8 = v5;
		int32_t result; // 0x10008897
		if (v4 != SA9085 << 16 /*0x3000000*/
		&& v4 < SA9085 << 16 /*0x3000000*/== (767 - v5 & v5) < 0) {
			if (v4 != SA9034 << 16 /*0x4000000*/) {
				result = SetFuncStatusCode(a1, IE_ERR_ENGMOD /*-13*/);
				frequencyLimit = -1.0L;
				g11--;
				g4 = v1;
				dlog(LOG_DEBUG, "RdMinFreqLimit 1 --> 0x%x\n", result);
				return result;
			}
		} else {
			if (v4 != SA9085 << 16 /*0x3000000*/) {
				if (v4 != SA9052 << 16 /*0x1000000*/) {
					if (v4 != SA9054 << 16 /*x0x2000000*/) {
						result = SetFuncStatusCode(a1, IE_ERR_ENGMOD /*-13*/);
						frequencyLimit = -1.0L;
						g11--;
						g4 = v1;
						dlog(LOG_DEBUG, "RdMinFreqLimit 2 --> 0x%x\n", result);
						return result;
					}
				}
			}
		}
		g3 = a1;
		frequencyLimit = 1.0e+5L;
		g11--;
		result2 = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
	} else {
		g8 = a1;
		int32_t v6 = 0x10000 * GetFuncStatusCode(a1) / 0x10000; // 0x1000882d
		frequencyLimit = v6;
		g11--;
		result2 = v6;
	}
	g4 = v1;
	dlog(LOG_DEBUG, "RdMinFreqLimit 3 --> 0x%x\n", result2);
	return result2;
}

int32_t RdEngineModel(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10008666
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x1000866e
	g6 = v2 / 0x10000;
	int32_t result;
	if ((v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		//result = (int32_t)*(int16_t *)(a1 + 2) | a1 & -0x10000;
		result = a1->engine_model; // | (int32_t) a1 & -0x10000;
	} else {
		result = v1 & -0x10000;
	}
	return result;
}

int32_t SetDetectLog(SET9052 *a1, int32_t mode_unused) {
	dlog(LOG_DEBUG, "SetDetectLog(%d)\n", mode_unused);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10005bd1
	g3 = v1;
	int32_t result; // 0x10005c51
	if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
		result = GetFuncStatusCode(a1);
		return result;
	}
	int16_t *v2 = &a1->detect_code; // (int16_t *)(a1 + 128); // 0x10005bf1
	int32_t v3 = (int32_t) *v2 | 6; // 0x10005bfb
	*v2 = (int16_t) v3;
	*v2 = (int16_t) (v3 & -42);
	int32_t v4 = SetRefLevel(a1, a1->ref_level /* *(int16_t *) (a1 + 98) */); // 0x10005c31
	int32_t v5 = 0x10000 * v4 / 0x10000; // 0x10005c3d
	if ((int16_t) v4 >= 0) {
		result = v5 & -0x10000;
	} else {
		result = v5 & -0x10000 | 0xfff1;
	}
	return result;
}

int32_t SetRefLevel(SET9052 *a1, int16_t level) {
	dlog(LOG_DEBUG, "SetRefLevel(%d)\n", level);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	int32_t v2 = g9; // 0x100063ec
	g3 = a1;
	int32_t v3 = TestFuncStatusAndPtr(a1); // 0x100063f7
	g3 = v3;
	int32_t result; // 0x1000664a
	if ((0x10000 * v3 || 0xffff) < 0x1ffff) {
		//*(int16_t *) (a1 + 98) = level;
		a1->ref_level = level;
		int32_t v4 = 0x10000 * RdDetect(a1); // 0x1000642e
		int32_t v5 = level; // 0x10006560
		int32_t v6 = 0x10000 * RdMaxAttLimit(a1) / 0x10000 + MIN_REFL /* - 40*/; // 0x10006573
		g8 = v6;
		int32_t v7; // eax
		int16_t v8;
		int32_t v9;
		if (v4 != 0x200000) {
			int16_t v10;
			int32_t v11;
			if ((int16_t) v5 > (int16_t) v6) {
				v10 = 0x10000 * RdMaxAttLimit(a1) / 0x10000 + 0xffd8;
				v11 = 1;
			} else {
				g8 = v5;
				if (level < MIN_REFL /*-40*/) {
					g8 = 0;
					v10 = MIN_REFL /*-40*/;
					v11 = 1;
				} else {
					v10 = level;
					v11 = 0;
				}
			}
			int32_t v12 = (int32_t) v10 - MIN_REFL /*+ 40*/; // 0x100065d8
			int16_t * v13; // 0x10006606
			if (v10 < MIN_REFL /*-40*/) {
				if (a1->PreampAvailable /**(int16_t *) (a1 + 100)*/!= IE_FALSE /*0*/) {
					//*(int16_t *) (a1 + 102) = 1;
					a1->PreampEnabled = IE_TRUE;
					v13 = &a1->detect_code; // (int16_t *) (a1 + 128);
					*v13 = *v13 | 64;
					//*(int16_t *) (a1 + 96) = (int16_t) v12;
					a1->attenuation = (int16_t) v12;
					v8 = v10;
					//*(int16_t *) (a1 + 106) = v8;
					a1->EngineRefLevel = v8;
					g9 = v2;
					g4 = v1;
					return (v12 & -0x10000 | (int32_t) v8) & -0x10000
							| v11 & 0xffff;
				}
			}
			//*(int16_t *) (a1 + 102) = 0;
			a1->PreampEnabled = IE_FALSE;
			v13 = &a1->detect_code; // (int16_t *) (a1 + 128);
			*v13 = *v13 | 64;
			v7 = v12;
			//*(int16_t *) (a1 + 96) = (int16_t) v12;
			a1->attenuation = (int16_t) v12;
			v8 = v10;
			v9 = v11;
		} else {
			int16_t v14;
			int32_t v15;
			if ((int16_t) v5 > (int16_t) v6) {
				v14 = 0x10000 * RdMaxAttLimit(a1) / 0x10000 + 0xffd8;
				v15 = 1;
			} else {
				g8 = v5;
				if (level < -70) {
					g8 = 0;
					v14 = -70;
					v15 = 1;
				} else {
					v14 = level;
					v15 = 0;
				}
			}
			int32_t v16 = v14; // 0x100064ae
			int32_t v17 = v16 + 70; // 0x100064b2
			int32_t v18;
			int32_t v19; // 0x100064e5
			char v20; // 0x10006501
			int16_t * v21; // 0x100064fa
			int16_t v22; // 0x100064fa
			int32_t v23; // 0x100064fa
			if (v14 < -70) {
				if (a1->PreampAvailable /**(int16_t *) (a1 + 100)*/!= IE_FALSE /*0*/) {
					//*(int16_t *) (a1 + 102) = 1;
					a1->PreampEnabled = IE_TRUE;
					v19 = RdMaxAttLimit(a1);
					v21 = &a1->detect_code; // (int16_t *) (a1 + 128);
					v22 = *v21;
					v23 = v22;
					v20 = v22;
					if ((int16_t) v16
							> (int16_t) (0x10000 * v19 / 0x10000 + 0xffba)) {
						v18 = (int32_t) (v20 & -65) | v23 & -256;
					} else {
						v18 = (int32_t) (v20 | 64) | v23 & -256;
					}
					*v21 = (int16_t) v18;
					g8 = a1;
					RdLinearAttn(a1);
					//*(int16_t *) (a1 + 96) = (int16_t) v17;
					a1->attenuation = (int16_t) v17;
					v8 = v14;
					//*(int16_t *) (a1 + 106) = v8;
					a1->EngineRefLevel = v8;
					g9 = v2;
					g4 = v1;
					return ((int32_t) a1 & -0x10000 | (int32_t) v8) & -0x10000
							| v15 & 0xffff;
				}
			}
			//*(int16_t *) (a1 + 102) = 0;
			a1->PreampEnabled = IE_FALSE;
			v19 = RdMaxAttLimit(a1);
			v21 = &a1->detect_code; // (int16_t *) (a1 + 128);
			v22 = *v21;
			v23 = v22;
			v20 = v22;
			if ((int16_t) v16 > (int16_t) (0x10000 * v19 / 0x10000 + 0xffba)) {
				v18 = (int32_t) (v20 & -65) | v23 & -256;
			} else {
				v18 = (int32_t) (v20 | 64) | v23 & -256;
			}
			*v21 = (int16_t) v18;
			g8 = a1;
			RdLinearAttn(a1);
			v7 = a1;
			//*(int16_t *) (a1 + 96) = (int16_t) v17;
			a1->attenuation = (int16_t) v17;
			v8 = v14;
			v9 = v15;
		}
		//*(int16_t *) (a1 + 106) = v8;
		a1->EngineRefLevel = v8;
		int32_t v24 = v7 & -0x10000 | (int32_t) v8; // 0x10006642
		result = v24 & -0x10000 | v9 & 0xffff;
	} else {
		result = GetFuncStatusCode(a1);
	}
	g9 = v2;
	g4 = v1;
	return result;
}

int32_t RdMaxAttLimit(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10006366
	g3 = v1;
	if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
		return v1 | 0xffff;
	}
	g8 = a1;
	SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
	g3 = a1;
	int16_t v2 = a1->engine_model; // *(int16_t *) (a1 + 2); // 0x1000638c
	int32_t v3 = v2; // 0x1000638c
	int32_t result; // 0x100063e5
	if (v2 != SA9085 /*768*/&& v2 < SA9085 /*768*/== (767 - v3 & v3) < 0) {
		if (v2 == SA9034 /*1024*/) {
			result = (int32_t) a1 & -0x10000 | 60;
		} else {
			g8 = a1;
			result = SetFuncStatusCode(a1, IE_ERR_ENGMOD /*-13*/) | 0xffff;
		}
		return result;
	}
	if (v2 == SA9085 /*768*/) {
		result = (int32_t) a1 & -0x10000 | 70;
	} else {
		if (v2 != SA9052 /*256*/) {
			if (v2 != SA9054 /*512*/) {
				g8 = a1;
				int32_t result2 = SetFuncStatusCode(a1, IE_ERR_ENGMOD /*-13*/)
						| 0xffff; // 0x100063de
				return result2;
			}
		}
		result = (int32_t) a1 & -0x10000 | 60;
	}
	return result;
}

int32_t RdDetect(SET9052 *a1) {
	int16_t v1 = 0; // bp-8
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005d72
	g3 = v2;
	int32_t result; // 0x10005de9
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		int16_t * v3 = &a1->detect_code; // (int16_t *) (a1 + 128); // 0x10005d92
		if ((*v3 & DTEC_LOG /*2*/) != 0) {
			v1 = DTEC_LOG /*2*/;
		}
		if ((*v3 & DTEC_LIN /*32*/) != 0) {
			v1 = DTEC_LIN /*32*/;
		}
		int32_t v4 = (int32_t) *v3 & DTEC_3IF /*8*/; // 0x10005dc7
		g8 = v4;
		if (v4 != 0) {
			v1 = DTEC_3IF /*8*/;
		}
		g3 = a1;
		result = (int32_t) v1
				| SetFuncStatusCode(a1, IE_SUCCESS /*0*/) & -0x10000;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t RdLinearAttn(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002cd3
	g3 = v1;
	int32_t result; // 0x10002d11
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		g3 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = ((int32_t) /**(int16_t *) (a1 + 128)*/a1->detect_code
				& DTEC_ATTOFF /*64*/) / 64 + 1;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SetAutoCell(SET9052 *a1, int16_t auto_cell) {
	dlog(LOG_DEBUG, "SetAutoCell(0x%x)\n", auto_cell);
	int16_t v1 = 0; // bp-8
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10006090
	g3 = v2;
	int32_t result; // 0x100060ea
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		int32_t v3 = auto_cell; // eax
		if (auto_cell != IE_FALSE) {
			if (auto_cell != IE_TRUE) {
				//*(int16_t *)(a1 + 66) = 1;
				a1->auto_cell = IE_TRUE;
				v1 = -1;
			} else {
				v3 = a1;
				//*(int16_t *)(a1 + 66) = 1;
				a1->auto_cell = IE_TRUE;
			}
			return v3 & -0x10000 | (int32_t) v1;
		}
		//*(int16_t *)(a1 + 66) = 0;
		a1->auto_cell = IE_FALSE;
		result = v3 & -0x10000 | (int32_t) v1;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SetNumCells(SET9052 *a1, uint32_t num_cells) {
	dlog(LOG_DEBUG, "SetNumCells(%d)\n", num_cells);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000612c
	g3 = v1;
	int32_t result; // 0x10006185
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int32_t v2 = v1; // 0x1000617e
		int32_t v3 = -3;
		if (num_cells >= 1) {
			int32_t v4 = num_cells - 0xffff; // 0x1000614f
			if (v4
					< 0 /*v4 == 0 || v4 < 0 != (0xfffe - num_cells & num_cells) < 0*/) {
				//*(int32_t *)(a1 + 132) = a2;
				a1->num_cells = num_cells;
				v2 = recalcStep(a1);
				v3 = 0;
				// branch -> 0x1000617e
			} else {
				v2 = v1;
				v3 = -3;
			}
		}
		result = v3 | v2 & -0x10000;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SetDefltPts(SET9052 *a1, uint32_t num_points, int32_t a3_unused) {
	dlog(LOG_DEBUG, "SetDefltPts(%d,%d)\n", num_points, a3_unused);
	int16_t v1 = 0; // bp-8
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x100050e4
	g3 = v2;
	int32_t v3 = v2; // 0x100051234
	if ((0x10000 * v2 || 0xffff) >= 0x1ffff) {
		int32_t v4 = GetFuncStatusCode(a1); // 0x100050f7
		v1 = v4;
		v3 = v4;
	}
	if (num_points < 1 || num_points > 1000000000L /*0x3b9aca00*/) {
		return v3 & -0x10000 | -3;
	}
	//*(int32_t *) (a1 + 68) = num_points;
	a1->deflt_pt_cnt = num_points;
	return (int32_t) a1 & -0x10000 | (int32_t) v1;
}

int32_t SetTrigMode(SET9052 *a1, int16_t mode, int32_t a3, int32_t a4) {
	dlog(LOG_DEBUG, "SetTrigMode(%d,%d,%d)\n", mode, a3, a4);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100069e7
	g3 = v1;
	int32_t result; // 0x10006a59
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int32_t v2 = mode; // 0x10006a04
		if (mode >= 0) {
			if (mode == 6 || mode < 6 != (5 - v2 & v2) < 0) {
				//*(int16_t *)(a1 + 108) = a2;
				a1->trig_code = mode;
				int16_t v3 = 0; // bp-8
				if ((int16_t) a3 != 0) {
					if (mode != 0) {
						//*(int16_t *)(a1 + 110) = 1;
						a1->trig_norm_flag = 1;
						return (v2 & -0x10000 | (int32_t) mode) & -0x10000
								| (int32_t) v3;
					}
				}
				//*(int16_t *)(a1 + 110) = 0;
				a1->trig_norm_flag = 0;
				return (int32_t) a1 & -0x10000 | (int32_t) v3;
			}
		}
		result = v2 & -0x10000 | (int32_t) -3;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t StepSizeMode(SET9052 *a1, int16_t mode, int32_t unused) {
	dlog(LOG_DEBUG, "StepSizeMode(mode=%d, unused=0x%x)\n", mode, unused);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005015
	g3 = v2;
	int32_t result; // 0x100050c5
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		// Next line : v3 = g13[a2]; g13
		//int32_t v3 = *(int32_t *)(4 * (int32_t)mode + (int32_t)&g13); // 0x10005045
#ifdef ORIG
		// We cannot ignore this.
		// What was the value v3 used for; and what if I ignore it?
		// But what is __pseudo_branch ?
		__pseudo_branch(v3);

		//*(int16_t *)(a1 + 32) = 1;
		a1->step_mode = AUTO_ON /*1*/;
#else
		// derived manually From idafree
		switch (mode) {
		case AUTO_OFF /*0*/:
			break;
		case AUTO_ON /*1*/:
			a1->num_swp_pts = a1->deflt_pt_cnt;
			break;
		case STEPCNT /*2*/:
		case STEPSIZ /*3*/:
			SetAutoCell(a1, VI_FALSE);
			SetCellMode(a1, VI_FALSE);
			break;
		default:
			v1 = 1;
			mode = AUTO_ON /*1*/;
		}

		a1->step_mode = mode;
#endif
		result = recalcStep(a1) & -0x10000 | 1;
	} else {
		result = GetFuncStatusCode(a1);
	}
	g4 = v1;
	return result;
}

int32_t SwpTimeMode(SET9052 *a1, int16_t mode, int32_t unused) {
	dlog(LOG_DEBUG, "SwpTimeMode(mode=0x%x, unused=0x%x)\n", mode, unused);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005433
	g3 = v2;
	int32_t result; // 0x100054cf
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		if ( /* *(int32_t *)(a1 + 36) */a1->dwell_time >= 1) {
			if (mode != MR90XX_AUTO_ON /*1*/) {
				g4 = v1;
				return 0xfff9 | (int32_t) a1 & -0x10000;
			}
		}
		int32_t v3;
		switch (mode) {
		default: {
			//*(int16_t *)(a1 + 34) = 1;
			a1->time_mode = MR90XX_AUTO_ON;
			v3 = 1;
			break;
		}
		case MR90XX_AUTO_OFF /*0*/: {
			//*(int16_t *)(a1 + 34) = 0;
			a1->time_mode = MR90XX_AUTO_OFF;
			v3 = 0;
			break;
		}
		case MR90XX_AUTO_ON /*1*/: {
			//*(int16_t *)(a1 + 34) = 1;
			a1->time_mode = MR90XX_AUTO_ON;
			v3 = 0;
			break;
		}
		case MR90XX_STEPCNT /*2*/: {
			*(int16_t *) (a1 + 34) = 2;
			a1->time_mode = MR90XX_STEPCNT;
			v3 = 0;
			break;
		}
		case MR90XX_STEPSIZ /*3*/: {
			*(int16_t *) (a1 + 34) = 3;
			a1->time_mode = MR90XX_STEPSIZ;
			v3 = 0;
			break;
		}
		}
		result = v3 & 0xffff | function_10001b13(a1) & -0x10000;
	} else {
		result = GetFuncStatusCode(a1);
	}
	g4 = v1;
	return result;
}

int32_t SetRBWmode(SET9052 *a1, int16_t mode) {
	dlog(LOG_DEBUG, "SetRBWmode(mode=0x%x)\n", mode);
	int16_t v1 = 0; // bp-8
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005828
	g3 = v2;
	int32_t result; // 0x1000589b
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		int32_t v3; // 0x10005894
		if (mode != VI_FALSE /*0*/) {
			if (mode != VI_TRUE /*1*/) {
				v1 = 1;
			}
			//*(int16_t *)(a1 + 74) = 1;
			a1->auto_rbw = VI_TRUE;
			setup_rbw(a1);
			recalcStep(a1);
			v3 = function_10001b13(a1);
		} else {
			//*(int16_t *)(a1 + 74) = 0;
			a1->auto_rbw = VI_FALSE;
			v3 = mode;
		}
		result = (int32_t) v1 | v3 & -0x10000;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t function_10001e98(SET9052 *a1) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10001eb0
	int32_t result = v2; // 0x10001f52
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		int16_t v3 = a1->auto_vbw; // *(int16_t *) (a1 + 78); // 0x10001ec7
		if (v3 != VI_FALSE /*0*/) {
			RBWFreqFromCode((int16_t) RdRBW(a1));
			float64_t v4 = a1->filter_ratio; // *(float64_t *) (a1 + 88); // 0x10001ee9
			g11++;
			int32_t v5 = VBWFreqFromCode(VBW_3MHZ /*7*/); // 0x10001ef1
			g11++;
			int32_t v6 = v5; // 0x10001f5211
			int16_t v7 = 7;
			if ((v5 & 0x4100) == 0) {
				int32_t v8 = VBWFreqFromCode(VBW_3HZ /*1*/); // 0x10001f0d
				g11++;
				if ((v8 & 256) != 0) {
					g3 = 0;
					int32_t v9 = VBWCodeFromFreq(
							(float64_t) ((float80_t) v4 * frequencyLimit), 0); // 0x10001f2f
					v6 = v9;
					v7 = v9;
				} else {
					v6 = v8;
					v7 = 1;
				}
			}
			g8 = v7;
			if (v7 != -1) {
				//*(int16_t *) (a1 + 76) = v7;
				a1->vbw_code = v7;
				result = a1;
			} else {
				result = v6;
			}
			g4 = v1;
			return result;
		}
		result = v3;
	}
	g4 = v1;
	return result;
}

int32_t SetRBW(SET9052 *a1, int16_t code) {
	dlog(LOG_DEBUG, "SetRBW(0x%x)\n", code);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000576c
	g3 = v1;
	int32_t result; // 0x100057e6
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int32_t v2; // 0x100057df
		int32_t v3; // 0x100057df
		if (a1->auto_rbw /**(int16_t *) (a1 + 74)*/!= VI_TRUE /*1*/) {
			int32_t v4 = code; // 0x1000579d
			g8 = v4;
			int32_t v5 = a1; // 0x100057df4
			if (code >= 0) {
				//if (code == 4 || code < 4 != (3 - v4 & v4) < 0) { // what?
				if (code <= 5) {
					g8 = v4 & -0x10000 | (int32_t) code;
					//*(int16_t *) (a1 + 72) = a2;
					a1->rbw_code = code;
					recalcStep(a1);
					v3 = function_10001b13(a1);
					return v3 & -0x10000;
				}
				v5 = v4;
			}
			v3 = v5;
			v2 = -3;
		} else {
			v3 = a1;
			v2 = -4;
		}
		result = v3 & -0x10000 | v2;
	} else {
		g8 = a1;
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SetVBWmode(SET9052 *a1, int16_t mode) {
	dlog(LOG_DEBUG, "SetVBWmode(0x%x)\n", mode);
	int16_t v1 = 0; // bp-8
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005993
	g3 = v2;
	int32_t v3 = 0x10000 * v2; // 0x1000599b
	g6 = v3 / 0x10000;
	int32_t result; // 0x100059ed
	if ((v3 || 0xffff) < 0x1ffff) {
		int32_t v4 = mode; // 0x100059b0
		int32_t v5 = v4; // eax
		if (mode != VI_FALSE /*0*/) {
			g8 = v4;
			if (mode != VI_TRUE /*1*/) {
				g6 = a1;
				//*(int16_t *)(a1 + 78) = 1;
				a1->auto_vbw = VI_TRUE;
				v1 = 1;
			} else {
				v5 = a1;
				//*(int16_t *)(a1 + 78) = 1;
				a1->auto_vbw = VI_TRUE;
			}
			return v5 & -0x10000 | (int32_t) v1;
		}
		g6 = a1;
		//*(int16_t *)(a1 + 78) = 0;
		a1->auto_vbw = VI_FALSE;
		result = v5 & -0x10000 | (int32_t) v1;
	} else {
		g8 = a1;
		result = GetFuncStatusCode(a1);
	}
	return result;
}

int32_t SetVBW(SET9052 *a1, uint16_t code) {
	dlog(LOG_DEBUG, "SetVBW(0x%x)\n", code);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100058d7
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x100058df
	g6 = v2 / 0x10000;
	if ((v2 || 0xffff) >= 0x1ffff) {
		g8 = a1;
		int32_t v3 = GetFuncStatusCode(a1); // 0x100058ea
		return 0x10000 * v3 >> 16 | v3 & -0x10000;
	}
	int16_t v4 = a1->auto_vbw; // *(int16_t *)(a1 + 78); // 0x100058fb
	g6 = v4;
	int32_t v5; // 0x10005942
	int32_t v6; // 0x10005942
	if (v4 != 1) {
		int32_t v7 = code; // 0x1000590c
		g8 = v7;
		int32_t v8 = a1; // 0x100059424
		if (code >= 0) {
			if (code <= 7) {
				g8 = v7 & -0x10000 | (int32_t) code;
				//*(int16_t *)(a1 + 76) = code;
				a1->vbw_code = code;
				v6 = function_10001b13(a1);
				return v6 & -0x10000;
			}
			v8 = v7;
		}
		v6 = v8;
		v5 = -3;
	} else {
		v6 = a1;
		v5 = -4;
	}
	return v5 | v6 & -0x10000;
}

// a2+a3 = float value
int32_t ConfigStartFreq(SET9052 *a1, FREQ8500 start) {
	dlog(LOG_DEBUG, "ConfigStartFreq(%f)\n", start);
	// entry
	g8 = a1;
	int32_t v1 = /* 0x10000 * */ FreqInRange(a1, start); // 0x1000b75b
	g3 = v1 /*/ 0x10000*/;
	int32_t result; // 0x1000b7d6
	if (v1 < 1 /*(v1 || 0xffff) < 0x1ffff*/) {
		result = SetFuncStatusCode(a1, IE_ERR_VALS /*-3*/);
		return result;
	}
	//*(int32_t *)(a1 + 8) = a2;
	//*(int32_t *)(a1 + 12) = a3;
	a1->start = start;
	g8 = a1;
	g3 = a1;
	if (((int32_t) a1 & 0x4100) == 0) { // what does this mean?
		result = SetFuncStatusCode(a1, IE_WARN_SPAN /*3*/);
		return result;
	}
	g8 = a1;
	int32_t v2 = 0x10000 * recalcStep(a1); // 0x1000b7b0
	g3 = v2 / 0x10000;
	if ((v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
	} else {
		result = SetFuncStatusCode(a1, IE_ERR_STEP /*-6*/);
	}
	return result;
}

int32_t ConfigStopFreq(SET9052 *a1, FREQ8500 stop) {
	dlog(LOG_DEBUG, "ConfigStartFreq(%f)\n", stop);
	g8 = a1;
	int32_t v1 = FreqInRange(a1, stop); // 0x1000b89d
	g3 = v1;
	int32_t result; // 0x1000b918
	if (v1 < 1) {
		result = SetFuncStatusCode(a1, IE_ERR_VALS /*-3*/);
		return result;
	}
	//*(int32_t *)(a1 + 16) = a2;
	//*(int32_t *)(a1 + 20) = a3;
	a1->stop = stop;
	g8 = a1;
	g3 = a1;
	if (0 /*((int32_t) a1 & 0x4100) == 0*/) { // what does this mean?
		result = SetFuncStatusCode(a1, IE_WARN_SPAN /*3*/);
		return result;
	}
	g8 = a1;
	int32_t v2 = 0x10000 * recalcStep(a1); // 0x1000b8f2
	g3 = v2 / 0x10000;
	if ((v2 || 0xffff) < 0x1ffff) {
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
	} else {
		result = SetFuncStatusCode(a1, IE_ERR_STEP /*-6*/);
	}
	return result;
}

int32_t SetSweepCode(SET9052 *a1, int16_t code) {
	dlog(LOG_DEBUG, "SetSweepCode(%d)\n", code);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10005e2d
	g3 = v1;
	int32_t result; // 0x10005e96
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int32_t v2; // 0x10005e8f
		int32_t v3; // 0x10005e8f
		if (code < 16) {
			//*(int16_t *)(a1 + 130) = code;
			a1->sweep_code = code;
			recalcStep(a1);
			v3 = function_10001b13(a1);
			v2 = code < 16 ? 0 : -3;
		} else {
			v3 = code;
			v2 = -3;
		}
		result = v3 & -0x10000 | v2;
	} else {
		result = GetFuncStatusCode(a1);
	}
	return result;
}

/*------------------------------------------------------------------------------------*/
/* MeasureAmplWithFreq related code */
/*------------------------------------------------------------------------------------*/

static int32_t function_10002d12(SET9052 *a1, uint16_t sweep_in_progress);
int32_t GetDbmForAmpl(SET9052 *a1, int16_t a2);
int32_t GetnVForAmpl(SET9052 *a1, int16_t a2);
int32_t getAttenuationSetting(SET9052 *a1);
int32_t function_1000def9(int32_t a1, int32_t a2, char a3, uint32_t a4);
float80_t function_1000e0d5(void);
float80_t function_100136eb(float64_t a1, int32_t a2);

float64_t g42 = 0.5;

float80_t g67 = INFINITY;

float80_t g68 = -INFINITY;
float80_t g69 = 0.0L;

int32_t g96 = 0;

float80_t g159 = 0.0L; // st0
float80_t g160 = 0.0L; // st1
bool g161 = false; // zf

// ra_data contains amplitude data, ra_freq contains frequency data for sweep points.
int32_t MeasureAmplWithFreq(SET9052 *a1, int16_t rbw, int32_t vbw,
		FREQ8500 start, FREQ8500 stop, int16_t ref_level, int32_t num_points,
		int16_t min_or_max, int16_t data_format, ViReal64 ra_data[],
		ViReal64 ra_freq[]) {
	int16_t v1 = data_format;
	int16_t v2 = vbw;
	dlog(LOG_DEBUG, "MeasureAmplWithFreq\n");
	if (ra_freq == 0) {
		return IE_ERROR;
	}
	if (ra_data == 0) {
		return IE_ERROR;
	}
	if ((1/* XXX g3 & 0x4100 what does this mean */) == 0) {
		return IE_ERROR;
	}
	if (FreqInRange(a1, start) == 0) {
		return IE_ERROR;
	}
	if (FreqInRange(a1, stop) == 0) {
		return IE_ERROR;
	}

#ifdef ORIG
	int32_t v3 = 0x10000 * min_or_max;
	int32_t v4 = v3 / 0x10000; // 0x1000a3a5
	if (v3 != 0x20000) {
		if (v3 != 0x40000) {
			return v4 & -0x10000 | 0xfffd;
		}
	}
#else
	int32_t v4 = min_or_max;
	if (min_or_max != 2 && min_or_max != 4) {
		return min_or_max & -0x10000 | 0xfffd;
	}
#endif

#ifdef ORIG
	int32_t v5 = 0x10000 * data_format;
	if (v1 != 0) {
		if (v5 != 0x10000) {
			if (v5 != 0x20000) {
				return v5 / 0x10000 & -0x10000 | 0xfffd;
			}
		}
	}
#else
	if (data_format != 0 && data_format != 1 && data_format != 2) {
		return data_format & -0x10000 | 0xfffd;
	}
#endif

	if ((int16_t) SetSweepCode(a1, (int16_t) (v4 || 9)) != 0) {
		return IE_ERROR;
	}

	int32_t v6;
	int32_t v7; // 0x1000a5bc
	int16_t *points; // 0x1000a5cf
	int32_t v9; // 0x1000a589
	int32_t v10; // 0x1000a4ef
	int32_t result2; // 0x1000a73f

	if (rbw != RBW_AUTO /*5*/) {
		/*
		 * rbw != AUTO
		 */
		int32_t v11 = SetRBWmode(a1, VI_FALSE /*0*/); // 0x1000a440
		if ((int16_t) v11 != 0) {
			return 0x10000 * v11 / 0x10000 | 0xffff;
		}
		int32_t v12 = SetRBW(a1, rbw); // 0x1000a466
		int32_t v13 = 0x10000 * v12;
		int32_t v14 = v13 / 0x10000; // 0x1000a472
		int32_t result; // 0x1000a746
		if ((int16_t) v12 != 0) {
			if (v13 != -0x30000) {
				result = v14 | 0xffff;
			} else {
				result = v14 & -0x10000 | v12 & 0xffff;
			}
			return result;
		}
		int32_t v15; // 0x1000a53e
		int32_t v16; // 0x1000a564
		int32_t v17; // 0x1000a595

		if (vbw == VBW_AUTO /*0x10000 * vbw == 0x80000*/) {
			/*
			 * vbw == AUTO
			 */
			int32_t v18 = SetVBWmode(a1, VI_TRUE /*1*/); // 0x1000a4a4
			if ((int16_t) v18 != 0) {
				return 0x10000 * v18 / 0x10000 | 0xffff;
			}
			ConfigStartFreq(a1, start);
			v15 = ConfigStopFreq(a1, stop);
			if ((int16_t) v15 != 0) {
				return 0x10000 * v15 / 0x10000 | 0xffff;
			}
			v16 = SetRefLevel(a1, (int16_t) ref_level);
			if ((int16_t) v16 < 0) {
				return 0x10000 * v16 / 0x10000 | 0xffff;
			}
			v9 = SetNumCells(a1, num_points);
			v6 = 0x10000 * v9;
			v17 = v6 / 0x10000;
			g6 = v17;
			if ((int16_t) v9 != 0) {
				if (v6 != -0x30000) {
					result = v17 | 0xffff;
				} else {
					result = v17 & -0x10000 | v9 & 0xffff;
				}
				return result;
			}
			v7 = RdNumSwpPts(a1);
			points = (int16_t *) alloc_1000da64(2 * v7 + 2);
			if (points != 0) {
				g3 = a1;
#ifdef ORIG
				if (0x10000 * BreakSweep(a1, STOP_NOW /*0*/) == 0x410000) {
#else
				// Break sweep seems to retun 0x41 if ok
				int32_t v111 = BreakSweep(a1, STOP_NOW /*0*/);
				if (v111 != 0x410000) {
					dlog(LOG_DEBUG,
							"Patching v111 from 0x%x to 0x410000 - TBC\n",
							v111);
					v111 = 0x410000;
				}
				if (v111 == 0x410000) {
#endif
					if (0x10000 * StartSweep(a1) == 0x410000) {
						while (true) {
							// We get the frequency values directly from GetAmplWithFreqExt().
							// the amplitude values values need to be recalculated. We get only raw values
							// in 'points' array and need to do some conversation below.
							if ((int16_t) GetAmplWithFreqExt(a1, points, ra_freq) == 0) {
								goto lab_0x1000a65b_3;
							}
							result2 = function_1000d97b(points) & -0x10000
									| 0xffff;
							return result2;
						}
					}
				}
				result = function_1000d97b(points) & -0x10000 | 0xffff;
			} else {
				result = (int32_t) points | 0xffff;
			}
			return result;

		} else {
			/*
			 * vbw != AUTO
			 */
			int32_t v19 = SetVBWmode(a1, VI_FALSE /*0*/); // 0x1000a4c9
			if ((int16_t) v19 != 0) {
				return 0x10000 * v19 / 0x10000 | 0xffff;
			}
			g6 = a1;
			v10 = SetVBW(a1, v2);
			int32_t v20 = 0x10000 * v10;
			int32_t v21 = v20 / 0x10000; // 0x1000a4fb
			if ((int16_t) v10 != 0) {
				if (v20 != -0x30000) {
					result = v21 | 0xffff;
				} else {
					result = v21 & -0x10000 | v10 & 0xffff;
				}
				return result;
			}
			ConfigStartFreq(a1, start);
			v15 = ConfigStopFreq(a1, stop);
			if ((int16_t) v15 != 0) {
				return 0x10000 * v15 / 0x10000 | 0xffff;
			}
			v16 = SetRefLevel(a1, ref_level);
			if ((int16_t) v16 < 0) {
				return 0x10000 * v16 / 0x10000 | 0xffff;
			}
			v9 = SetNumCells(a1, num_points);
			v6 = 0x10000 * v9;
			v17 = v6 / 0x10000;
			g6 = v17;
			if ((int16_t) v9 != 0) {
				if (v6 != -0x30000) {
					result = v17 | 0xffff;
				} else {
					result = v17 & -0x10000 | v9 & 0xffff;
				}
				return result;
			}
			v7 = RdNumSwpPts(a1);
			points = alloc_1000da64(2 * v7 + 2);
			if (points != 0) {
				g3 = a1;
				int32_t v22 = 0xffff;
				if (0x10000 * BreakSweep(a1, STOP_NOW /*0*/) == 0x410000) {
					if (0x10000 * StartSweep(a1) == 0x410000) {
						while (true) {
							if ((int16_t) GetAmplWithFreqExt(a1, points,
									ra_freq) != 0) {
								result2 = function_1000d97b(points) & -0x10000
										| 0xffff;
								return result2;
							}
							lab_0x1000a65b_3: if (RdSwpIdx(a1) >= v7) {
								break;
							}
						}
						if (v7 > 0) {
							int32_t v23 = 0;
							while (true) {
								// v1 = data_format
								int32_t v24; // 0x1000a68b
								if (v1 == MR90XX_DBM_FORMAT /*0*/) {
									GetDbmForAmpl(a1, *(int16_t *) (2 * v23 + points));
									*(float64_t *) (8 * v23 + ra_data) = (float64_t) g159;
									g11++;
								} else {
									if (v1 == MR90XX_UV_FORMAT /*1*/) {
										GetnVForAmpl(a1, *(int16_t *) (2 * v23 + points));
										*(float64_t *) (8 * v23 + ra_data) = (float64_t) (1000.0L / g159);
										g11++;
									} else {
										if (v1 == MR90XX_NV_FORMAT /*2*/) {
											GetnVForAmpl(a1, *(int16_t *) (2 * v23 + points));
											*(float64_t *) (8 * v23 + ra_data) = (float64_t) g159;
											g11++;
										}
									}
									v24 = v23 + 1;
									if (v24 == v7) {
										break;
									}
									v23 = v24;
									continue;
								}
								v24 = v23 + 1;
								if (v24 == v7) {
									break;
								}
								v23 = v24;
							}
							result2 = function_1000d97b(points) & -0x10000;
							return result2;
						}
						v22 = 0;
					} else {
						v22 = 0xffff;
					}
				}
				result = function_1000d97b(points) & -0x10000 | v22;
			} else {
				result = (int32_t) points | 0xffff;
			}
			return result;
		}
	} else {
		/*
		 * rbw == AUTO
		 */
		int32_t v25 = SetRBWmode(a1, AUTO_ON /*1*/); // 0x1000a41b
		if ((int16_t) v25 != 0) {
			return 0x10000 * v25 / 0x10000 | 0xffff;
		}
		if (vbw != VBW_AUTO /*0x10000 * vbw != 0x80000*/) {
			/*
			 * vbw != AUTO
			 */
			if ((int16_t) SetVBWmode(a1, AUTO_OFF /*0*/) != 0) {
				return IE_ERROR;
			}
			g6 = a1;
			v10 = SetVBW(a1, v2);
			if ((int16_t) v10 == 0) {
				return IE_ERROR;
			}
			ConfigStartFreq(a1, start);
			if ((int16_t) ConfigStopFreq(a1, stop) != 0) {
				return IE_ERROR;
			}
			if ((int16_t) SetRefLevel(a1, ref_level) < 0) {
				return IE_ERROR;
			}
			v9 = SetNumCells(a1, num_points);
			v6 = 0x10000 * v9;
			g6 = v6 / 0x10000;
			if ((int16_t) v9 != 0) {
				return IE_ERROR;
			}
			v7 = RdNumSwpPts(a1);
			points = alloc_1000da64(2 * v7 + 2);
			if (points != 0) {
				g3 = a1;
				if (0x10000 * BreakSweep(a1, STOP_NOW /*0*/) == 0x410000) {
					if (0x10000 * StartSweep(a1) == 0x410000) {
						while (true) {
							if ((int16_t) GetAmplWithFreqExt(a1, points, ra_freq) == 0) {
								goto lab_0x1000a65b_3;
							}
							result2 = function_1000d97b(points) & -0x10000
									| 0xffff;
							return result2;
						}
					}
				}
				function_1000d97b(points);
				// Detected a possible infinite recursion (goto support failed); quitting...
			} else {
				// 0x1000a59d
				if (v6 != -0x30000) {
					// 0x1000a5af
					// branch -> 0x1000a743
				}
			}

		} else {
			/*
			 * vbw == AUTO
			 */

			if ((int16_t) SetVBWmode(a1, AUTO_ON /*1*/) != 0) {
				return IE_ERROR;
			}

			ConfigStartFreq(a1, start);
			if ((int16_t) ConfigStopFreq(a1, stop) != 0) {
				return IE_ERROR;
			}
			if ((int16_t) SetRefLevel(a1, ref_level) < 0) {
				return IE_ERROR;
			}
			v9 = SetNumCells(a1, num_points);
			v6 = 0x10000 * v9;
			g6 = v6 / 0x10000;
			if ((int16_t) v9 != 0) {
				return IE_ERROR;
			}
			v7 = RdNumSwpPts(a1);
			points = alloc_1000da64(2 * v7 + 2);
			if (points != 0) {
				g3 = a1;
				if (0x10000 * BreakSweep(a1, STOP_NOW /*0*/) == 0x410000) {
					if (0x10000 * StartSweep(a1) == 0x410000) {
						while (true) {
							if ((int16_t) GetAmplWithFreqExt(a1, points, ra_freq) == 0) {
								goto lab_0x1000a65b_3;
							}
							function_1000d97b(points);
						}
					}
					dlog(LOG_INFO, "here1\n");

				}
				function_1000d97b(points);
			}
		}
	}
}

/**
 * Returns, depending on 'cell mode', the number of sweep points.
 * If cell mode equals true, the value num_swp_pts of the SET9052 struct is returned.
 * If cell mode equals false, the value num_cells of the SET9052 struct is returned.
 *
 */
int32_t RdNumSwpPts(SET9052 *a1) {
	g3 = a1;
	int32_t result;
	if ((0x10000 * TestFuncStatusAndPtr(a1) || 0xffff) < 0x1ffff) {
		int16_t v1 = a1->cell_mode; // *(int16_t *)(a1 + 64); // 0x10005281
		g3 = v1;
		int32_t *v2;
		if (v1 != VI_TRUE /*1*/) {
			g3 = a1;
			v2 = &a1->num_swp_pts; // a1 + 164;
		} else {
			v2 = &a1->num_cells; //  a1 + 132;
		}
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = *(int32_t *) v2;
	} else {
		result = -1;
	}
	dlog(LOG_DEBUG, "RdNumSwpPts --> %d\n", result);
	return result;
}

int32_t StartSweep(SET9052 *a1) {
	dlog(LOG_DEBUG, "StartSweep\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10004270
	g3 = v2;
	int32_t result; // 0x100044b1
	if ((0x10000 * v2 || 0xffff) >= 0x1ffff) {
		result = GetFuncStatusCode(a1);
		g4 = v1;
		return result;
	}
#ifdef ORIG
	int32_t v3 = function_10002df9(a1, (float64_t)(int64_t)*(int32_t *)a1->start /*(a1 + 8)*/); // 0x1000429f
	function_10002df9(a1, (float64_t)(int64_t)*(int32_t *)a1->stop /*(a1 + 16)*/);
	function_10002df9(a1, (float64_t)(int64_t)*(int32_t *)a1->step /*(a1 + 24)*/);
#else
	int32_t fstart_l = function_10002df9(a1, a1->start);
	int32_t fstop_l = function_10002df9(a1, a1->stop);
	int32_t fstep_l = function_10002df9(a1, a1->step);
#endif
	g3 = a1;
	BreakSweep(a1, STOP_NOW /*0*/);
	ClearDataFIFO(a1);
	int32_t v4 = CommTrigDetect(a1); // 0x100042fc
	int32_t v5 = 0x10000 * v4;
// DD XXX
	if (v5 != 0x410000) {
		dlog(LOG_DEBUG, "Patching v5 from 0x%x to 0x41000 - TBC\n", v5);
		v5 = 0x410000;
	}
// DD XXX
	if (v5 != 0x410000) {
		g4 = v1;
		return v5 / 0x10000 & -0x10000 | v4 & 0xffff;
	}
	int16_t v6 = a1->rbw_code; // *(int16_t *)(a1 + 72); // 0x10004327
	//*(int16_t *)(a1 + 80) = v6 | 256 * *(int16_t *)(a1 + 76);
	a1->filter_code = v6 | (a1->vbw_code << 8);
#ifdef ORIG
	// Uh huh decompiled totally wrong :-(
	int32_t *v7 = v3; // bp-36
	if (/* *(int16_t *)(a1 + 64)*/a1->cell_mode == 1) {
		// 0x100043d6
		// branch -> 0x100043eb
	}
	// 0x100043eb
	g3 = a1;
	RdEngOption(a1, ENG_OPT_1 /*1*/);
#else
	uint16_t words[12];
	words[0] = fstart_l & 0xffff; // fstart_lo
	words[1] = fstart_l >> 16; // fstart_hi
	words[2] = fstop_l & 0xffff; // fstop_lo
	words[3] = fstop_l >> 16; // fstop_hi
	words[4] = a1->filter_code; // (vbw_code << 8)|rbw_code
	words[5] = fstep_l & 0xffff; // fstep_lo
	words[6] = fstep_l >> 16; // fstep_hi
	words[7] = a1->settle_time & 0xffff; // settlet_lo
	words[8] = a1->settle_time >> 16; // settlet_hi
	words[9] = a1->PreampEnabled? (a1->attenuation & 0ff)|0x8000 : (a1->attenuation & 0ff);
	words[10] = a1->cell_mode!=0? 0 : a1->num_cells;
	words[11] = a1->sweep_code; // Check code with IDA; there is RdEngOption which does sth. with sweep_code...

#endif
	int32_t v8 = SendCommand(a1, ENG_START_SWP /*1*/, 12, words); // 0x10004433
// DD XXX
	if (v8 != 1) {
		dlog(LOG_DEBUG, "Patching v8 from 0x%x to 0x41000 - TBC\n", v8);
		v8 = 1;
	}
// DD XXX
	if (0x10000 * v8 != 0x10000) {
		result = FuncStatusFromEngineReply((int16_t) v8);
		g4 = v1;
		return result;
	}
	int32_t v9 = SetSwpIdx(a1, 0); // 0x1000444e
	if ((int16_t) v9 != 0) {
		g4 = v1;
		return 0x10000 * v9 / 0x10000 & -0x10000 | 0xfff0;
	}
	int32_t v10 = function_10002d12(a1, 0x81 /*129*/); // 0x10004471
	g3 = v10;
	if ((int16_t) v10 == 0) {
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/) & -0x10000 | 0x41 /*65*/;
	} else {
		result = 0x10000 * v10 / 0x10000 & -0x10000 | 0xfff0;
	}
	g4 = v1;
// DD XXX
	if (result != 0x41) {
		dlog(LOG_DEBUG, "Patching result from 0x%x to 0x41 - TBC\n", result);
		result = 0x41;
	}
// DD XXX
	return result;
}

// Sets sweep in progress flag ?
int32_t function_10002d12(SET9052 *a1, uint16_t sweep_in_progress) {
	dlog(LOG_DEBUG, "function_10002d12(0x%x)\n", sweep_in_progress);
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002d19
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x10002d21
	g6 = v2 / 0x10000;
	int32_t result; // 0x10002d50
	if ((v2 || 0xffff) < 0x1ffff) {
		// 0x10002d36
		g3 = a1;
		g6 = sweep_in_progress;
		//*(int16_t *)(a1 + 4) = a2;
		a1->swp_in_prog = sweep_in_progress;
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		// branch -> 0x10002d4f
	} else {
		// 0x10002d28
		g8 = a1;
		result = GetFuncStatusCode(a1);
		// branch -> 0x10002d4f
	}
	// 0x10002d4f
	return result;
}

int32_t RdSwpIdx(SET9052 *a1) {
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000539c
	g3 = v1;
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		// 0x100053af
		g8 = a1;
		SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		result = a1->sweepIndex; // *(int32_t *)(a1 + 160);
		// branch -> 0x100053c6
	} else {
		// 0x100053ab
		result = 0;
		// branch -> 0x100053c6
	}
	// 0x100053c6
	dlog(LOG_DEBUG, "RdSwpIdx() -> %d\n", result);
	return result;
}

int32_t ClearDataFIFO(SET9052 *a1) {
	dlog(LOG_DEBUG, "ClearDataFIFO\n");
	g3 = a1;
	int32_t result = TestFuncStatusAndPtr(a1); // 0x100038d5
	if ((0x10000 * result || 0xffff) >= 0x1ffff) {
		return result;
	}
	int32_t result2; // 0x10003917
#ifdef ORIG
	if (*(int32_t *)(a1 + 660) != 0) {
		int32_t * v1 = (int32_t *)(a1 + 664); // 0x100038f5
		if (*v1 != 0) {
			// 0x10003900
			__pseudo_call(*v1);
			result2 = a1;
			// branch -> 0x10003914
		} else {
			result2 = a1;
		}
	} else {
		result2 = result;
	}
#else
	result = VISA_ClearDataFIFO(a1);
#endif
	return result2;
}

int32_t GetAmplWithFreqExt(SET9052 *a1, int16_t points[], ViReal64 ra_freq[]) {
	dlog(LOG_DEBUG, "GetAmplWithFreqExt\n");
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	int16_t v2 = 0; // bp-20
	int16_t v3 = 0; // bp-40
	g3 = a1;
	int32_t v4 = TestFuncStatusAndPtr(a1); // 0x1000bb45
	g3 = v4;
	int32_t result; // 0x1000be99
	if ((0x10000 * v4 || 0xffff) >= 0x1ffff) {
		result = GetFuncStatusCode(a1);
		g4 = v1;
		return result;
	}
	int32_t v5 = IsSweeping(a1); // 0x1000bb69
	g3 = v5;
	if ( /*(0x10000 * v5 || 0xffff) < 0x1ffff*/v5 < IE_TRUE) {
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_ERR_NOSWP /*-14*/);
		g4 = v1;
		return result;
	}
	g3 = a1;
	int32_t v6 = GetFuncStatusCode(a1); // 0x1000bb8f
	if ((int16_t) v6 < 0) {
		g4 = v1;
		return 0x10000 * v6 / 0x10000 & -0x10000 | v6 & 0xffff;
	}
	int32_t swpIndex = RdSwpIdx(a1); // 0x1000bbb0
	g3 = a1;
	int32_t v8 = GetFuncStatusCode(a1); // 0x1000bbbf
	if ((int16_t) v8 < 0) {
		g4 = v1;
		return 0x10000 * v8 / 0x10000 & -0x10000 | v8 & 0xffff;
	}
	int32_t numDataPoints = RdNumDataPts(a1); // 0x1000bbe0
	g3 = a1;
	int32_t v10 = GetFuncStatusCode(a1); // 0x1000bbef
	g3 = v10;
	if ((int16_t) v10 < 0) {
		g4 = v1;
		return 0x10000 * v10 / 0x10000 & -0x10000 | v10 & 0xffff;
	}
	g8 = swpIndex;
	if (numDataPoints == swpIndex) {
		g3 = a1;
		result = SetFuncStatusCode(a1, IE_WARN_SWPDONE /*4*/);
		g4 = v1;
		return result;
	}
	if (numDataPoints < swpIndex) {
		g8 = a1;
		result = SetFuncStatusCode(a1, IE_ERROR /*-2*/);
		g4 = v1;
		return result;
	}
	//char *pointPtr = 2 * swpIndex + points; // 0x1000bc48
	int16_t *pointPtr = &points[swpIndex];
	SET9052 *v12 = a1; // 0x1000bc71
	int32_t v13; // bp-44
	int32_t v14 = wrapGetDataBlock(v12, numDataPoints - swpIndex, 3, &v13, &v3, pointPtr); // 0x1000bc71
	if ((0x10000 * v14 || 0xffff) >= 0x1ffff) {
		g4 = v1;
		return v14 & -0x10000 | 0xfffe;
	}
	int32_t v15 = v13; // 0x1000bc89

// DDD XXX
#ifndef __hp9000s700
	if (v15 == 0) {
		v15 = 1;
		dlog(LOG_DEBUG, "GetAmplWithFreqExt, patched v15 to 1 - TBC\n");
	}
#endif
// DDD XXX
	if (v15 != 0) {
		v2 = v3;
		int16_t *v16 = &v2; // 0x1000bce5
		g8 = 0;
		int32_t v17; // 0x1000be7d
		int32_t v18; // 0x1000be5e
		int32_t v19; // 0x1000be92
		int32_t v20; // 0x1000be55
		if (v15 > 0) {
			int32_t v21 = 0; // 0x1000bcb367
			int16_t v22 = 0;
			// branch -> 0x1000bcd4

			lab_0x1000bcd4: while (true) {
				int32_t v23 = 0;
				// branch -> 0x1000bcdd
				while (true) {
					// DD: inside the while loop, groups of 3 words are fetched.
					// 1st word seems to be an 16bit index and is stored in pointPtr array at position 'v21'.
					// 2nd word is LO, 3rd word is HI byte of a 4byte int value.
					// The 4byte int value is created/handled in function_10002ea6() and there stored in 'g159'.
					// Then, the g159 is stored as a float value in ra_freq[] array at position 'v21+swpIndex'.

					// v21 is increased by 1 via other values v22,v34,v35

					// 0x1000bcdd
					v2 = v3;
					// DD Next line calls FetchDataWord()
					// Value fetched seems to be a index value. This value is stored in pointPtr[] array at position 'v21'.
					// function_100039d0() returns fetched word. v16 contains something different which seems not to be used.
					int32_t v24 = function_100039d0(v12, v16); // 0x1000bced
					g8 = a1;
					if (RdErrorStatus(a1) != 0) {
						int32_t v25 = v23 + 1;
						if (v25 < 3) {
							// 0x1000bd0b
							v23 = v25;
							// branch -> 0x1000bcdd
							continue;
						}
					}
					// 0x1000bd0d
					if (RdErrorStatus(a1) == 0) {
						int16_t v26 = v2; // 0x1000bd22
						v3 = v26;
						g6 = (g6 | (int32_t) v26) & -0x10000 | v24 & 0xffff;
						dlog(LOG_DEBUG, "GetAmplWithFreqExt, pointPtr[%d] becomes 0x%x\n", v21, v24);
						// DD XXX I have changed pointPtr from char* to int16_t*. So 2*v21 shall become v21 only. Check this.
						*(int16_t *) (pointPtr + 2 * v21) = (int16_t) v24;
						// Replace line above with this: pointPtr[v21] = (int16_t) v24;

						int32_t v27 = 0;
						// branch -> 0x1000bd56
						while (true) {
							// 0x1000bd56
							v2 = v3;
							g8 = v16;
							// v28 is LO 2 bytes of a 4 byte float value
							int32_t v28 = function_100039d0(v12, v16); // 0x1000bd66
							dlog(LOG_DEBUG, "GetAmplWithFreqExt, read LO 0x%x\n", v28);
							if (RdErrorStatus(a1) != 0) {
								int32_t v29 = v27 + 1;
								if (v29 >= 3) {
									// break -> 0x1000bd86
									break;
								}
								v27 = v29;
								// continue -> 0x1000bd56
								continue;
							}
							// 0x1000bd86
							g8 = a1;
							if (RdErrorStatus(a1) == 0) {
								int16_t v30 = v2; // 0x1000bd9b
								v3 = v30;
								int32_t v31 = 0;
								// branch -> 0x1000bdcc
								while (true) {
									// 0x1000bdcc
									v2 = v30;
									g8 = v16;
									// v32 is HI 2 bytes of a 4 byte float value
									int32_t v32 = function_100039d0(v12, v16); // 0x1000bddc
									dlog(LOG_DEBUG, "GetAmplWithFreqExt, read HI 0x%x\n", v32);
									if (RdErrorStatus(a1) != 0) {
										int32_t v33 = v31 + 1;
										if (v33 < 3) {
											// 0x1000bdfa
											v30 = v3;
											v31 = v33;
											// branch -> 0x1000bdcc
											continue;
										}
									}
									// 0x1000bdfc
									g8 = a1;
									if (RdErrorStatus(a1) == 0) {
										// 0x1000be0e
										v3 = v2;
										// Arg: 64 bit value made from last 2 words read in
										// This function sets g159 as a float incarnation of the arg.
										function_10002ea6(a1,(int64_t) (0x10000 * v32 | v28 & 0xffff));
										// copy new float value to result array at position 'swpIndex'
										dlog(LOG_DEBUG, "GetAmplWithFreqExt, ra_freq[%d] becomes 0x%x\n", v21, g159);
										*(float64_t *) (8 * v21 + 8 * swpIndex + ra_freq) = (float64_t) g159;
										g11++;
										int16_t v34 = v22 + 1; // 0x1000bcab
										int32_t v35 = v34; // 0x1000bcb3
										g8 = v35;
										if (v35 >= v13) {
											// break (via goto) -> 0x1000be55
											goto lab_0x1000be55;
										}
										v21 = v35;
										v22 = v34;
										// continue (via goto) -> 0x1000bcd4
										goto lab_0x1000bcd4;
									}
								}
								int16_t v36 = v3; // 0x1000be55
								int32_t v37 = g8; // 0x1000be55
								v20 = v37 & -0x10000 | (int32_t) v36;
								g8 = v20;
								v18 = function_10003bb8(v12, v20);
								v19 = v18;
								int32_t v38; // 0x1000be98
								if ((0x10000 * v18 || 0xffff) < 0x1ffff) {
									int32_t v39 = v13; // 0x1000be75
									v17 = SetSwpIdx(a1, v39 + swpIndex);
									if ((0x10000 * v17 || 0xffff) >= 0x1ffff) {
										int32_t v40 = v17 | 0xffff; // 0x1000be8c
										result = v40;
										// branch -> 0x1000be96
										// 0x1000be96
										v38 = v1;
										g4 = v38;
										return result;
									}
									v19 = v17;
								}
								int32_t v41 = v19 & -0x10000 | v18 & 0xffff; // 0x1000be92
								result = v41;
								// branch -> 0x1000be96
								// 0x1000be96
								v38 = v1;
								g4 = v38;
								return result;
							}
						}
					}
				}
			}
		}
		lab_0x1000be55: v20 = g8 & -0x10000 | (int32_t) v3;
		g8 = v20;
		v18 = function_10003bb8(v12, v20);
		v19 = v18;
		if ((0x10000 * v18 || 0xffff) < 0x1ffff) {
			v17 = SetSwpIdx(a1, v13 + swpIndex);
			if ((0x10000 * v17 || 0xffff) >= 0x1ffff) {
				g4 = v1;
				return v17 | 0xffff;
			}
			v19 = v17;
		}
		result = v19 & -0x10000 | v18 & 0xffff;
	} else {
		result = v14 & -0x10000;
	}
	g4 = v1;
	return result;
}

/**
 * Returns the value of swp_in_prog in the SET9052 structure.
 */
int32_t IsSweeping(SET9052 *a1) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10006e2f
	int32_t result;
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		uint16_t v3 = a1->swp_in_prog; // *(int16_t *)(a1 + 4); // 0x10006e46
		int32_t v4;
		if ((char) v3 <= 255) {
			v4 = (int32_t) v3 & 127 | (int32_t) v3 & -256;
		} else {
			v4 = 0;
		}
		result = v4 | v2 & -0x10000;
	} else {
		result = v2 & -0x10000;
	}
	g4 = v1;
	dlog(LOG_DEBUG, "IsSweeping() -> %d\n", result);
	return result;
}

// function_100040c9
int32_t wrapGetDataBlock(SET9052 *a1, int32_t reversePointIndex, int32_t a3,
		int32_t *a4, int16_t *a5, int16_t *pointPtr) {
	dlog(LOG_DEBUG, "wrapGetDataBlock(reversePointIndex=%d,a3=%d)\n",
			reversePointIndex, a3);
	SET9052 *v1 = a1; // 0x100040cd
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x100040d1
	g3 = v2;
	int32_t v3 = 0x10000 * v2; // 0x100040d9
	g6 = v3 / 0x10000;
	int32_t result; // 0x10004134
	if ((v3 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		// 0x100040ee
		if (*(int32_t *)(v1 + 660) != 0) {
			// 0x100040fa
			g6 = v1;
			// 676 = GetDataBlock()
			int32_t * v4 = (int32_t *)(v1 + 676);// 0x100040fd
			if (*v4 != 0) {
				// 0x1000410c
				g8 = a2;
				g6 = v1;
				__pseudo_call(*v4);
				// branch -> 0x10004131
				// 0x10004131
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
		// 0x10004106
		result = v1 & -0x10000 | 0xffeb;
		// branch -> 0x10004131
#else
		// DD Note that VISA_GetDataBlock has only 5 parameters!!!
		// decided to remove last parameter because:
		// it is not used in VISA_GetDataBlock()
		// a4, a5 look "correctly" used in VISA_GetDataBlock()
		result = VISA_GetDataBlock(a1, (int64_t)reversePointIndex, a3, a4, a5 /*, pointPtr*/);
#endif
	} else {
		// 0x100040e0
		g8 = v1;
		result = GetFuncStatusCode(v1);
		// branch -> 0x10004131
	}
	// 0x10004131
	return result;
}

int32_t GetDbmForAmpl(SET9052 *a1, int16_t ampl) {
	dlog(LOG_DEBUG, "GetDbmForAmpl(%d)\n", ampl);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x1000ceb6
	int32_t result = v2; // 0x1000cf42
	float80_t v3 = -1000.0L;
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		// 0x1000cecd
		int32_t v4;
		float80_t v5;
		if ((a1->detect_code /* *(int16_t *) (a1 + 128) */ & 32) == 0) {
			// 0x1000cf00
			g6 = ampl;
			g8 = a1;
			int32_t v6 = 0x10000 * getAttenuationSetting(a1) / 0x10000; // 0x1000cf1f
			g3 = v6;
			v4 = g11 - 1;
#ifdef ORIG
			// DD XXX suspicious code FDIV
			v5 = DB_CONVERT_CONST /* 128.0L */ / (float80_t) ampl + (float80_t) v6;
#else
			// See sa_defin.h line 367
			v5 = (float80_t) ampl / DB_CONVERT_CONST  + (float80_t) v6;
#endif
			// branch -> 0x1000cf2e
		} else {
			// 0x1000cede
			g8 = a1;
			GetnVForAmpl(a1, ampl);
			g11++;
			g3 = GetDbmForVoltage(a1, (float64_t) g159);
			v4 = g11;
			v5 = g159;
			// branch -> 0x1000cf2e
		}
		// 0x1000cf2e
		g11 = v4 + 1;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		v3 = v5;
		// branch -> 0x1000cf3f
	}
	// 0x1000cf3f
	g159 = v3;
	g11--;
	g4 = v1;
	return result;
}

int32_t GetDbmForVoltage(SET9052 *a1, float64_t volts) {
	dlog(LOG_DEBUG, "GetDbmForVoltage(%f) - TBI, decompiled wrong\n", volts);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t result = TestFuncStatusAndPtr(a1); // 0x1000d22f
	if ((0x10000 * result || 0xffff) >= 0x1ffff) {
		// 0x1000d23e
		g159 = -1.0L;
		g11--;
		// branch -> 0x1000d2ad
		// 0x1000d2ad
		g4 = v1;
		return result;
	}
	// 0x1000d246
	int32_t result2; // 0x1000d2b0
	// DD XXX in IDA, it can be seen that volts is tested against 0.0 ; So if-condition is wrong.
	if ((result & 0x4100) == 0) {
#ifdef ORIG
		// Decompiled wrong.
		float80_t v2 = 1.0e+9L / (float80_t) volts; // 0x1000d261
#else
		float80_t v2 =  (float80_t) volts / 1.0e+9L; // 0x1000d261
#endif
		int16_t v3 = a1->impedance /* *(int16_t *) (a1 + 176)*/; // 0x1000d270
		float80_t v4 = 0.001L * (float80_t) v3; // 0x1000d27d
		g160 = v4;
		// DD XXX suspicious code FDIV - checked, and ok.
		float80_t v5 = v2 * v2 / v4; // 0x1000d283
		g159 = v5;
		g161 = false;
		// DD XXX function_1000e114() what is this doing, looks complex, see IDA...
		g3 = function_1000e114((int32_t) (float32_t) v5, (int32_t) v3);
		g159 *= 10.0L;
		result2 = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		// branch -> 0x1000d2ad
	} else {
		// 0x1000d256
		g159 = -1000.0L;
		g11--;
		result2 = result;
		// branch -> 0x1000d2ad
	}
	// 0x1000d2ad
	g4 = v1;
	return result2;
}

int32_t GetnVForDbm(SET9052 *a1, float64_t dbm) {
	dlog(LOG_DEBUG, "GetnVForDbm(%f)\n", dbm);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x1000d2bb
	int32_t result = v2; // 0x1000d33a
	float80_t v3 = -1.0L;
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		// DD XXX TODO code below suspected to be wrong; FDIVR decompile bug. Check this.
		// Checked.
#ifdef ORIG
		float80_t v4 = 1000.0L / (float80_t) a1->impedance /* *(int16_t *) (a1 + 176)*/; // 0x1000d2e2
		float80_t v5 = 10.0L / (float80_t) dbm; // 0x1000d2ee
#else
		float80_t v4 = (float80_t) a1->impedance / 1000.0L ;
		float80_t v5 = (float80_t) dbm / 10.0L ;
#endif
		g159 = v5;
		function_1000def9(0, 0x40240000, (char) (int32_t) (float32_t) v5,
				(int32_t) (float32_t) v4);
		float80_t v6 = (float80_t) (float64_t) v4 * g159; // 0x1000d309
		g159 = v6;
		g161 = false;
		g3 = function_1000e1e4((int32_t) (float32_t) v6);
		g11 += 2;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		v3 = 1.0e+9L * g159;
		// branch -> 0x1000d337
	}
	// 0x1000d337
	g159 = v3;
	g11--;
	g4 = v1;
	return result;
}

int32_t GetnVForAmpl(SET9052 *a1, int16_t ampl) {
	dlog(LOG_DEBUG, "GetnVForAmpl(%f)\n", ampl);
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t v2 = TestFuncStatusAndPtr(a1); // 0x1000cfb0
	int32_t result = v2; // 0x1000d05a
	float80_t v3 = -1.0L;
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
		// 0x1000cfca
		float80_t v4;
		if (a1->detect_code /* *(int16_t *) (a1 + 128) & 32) */ == 0) {
			// 0x1000d026
			g8 = a1;
			GetDbmForAmpl(a1, ampl);
			g11++;
			g3 = GetnVForDbm(a1, (float64_t) g159);
			v4 = g159;
			// branch -> 0x1000d046
		} else {
			// 0x1000cfdb
			g6 = ampl;
			int32_t v5 = 0x10000 * function_1000d05b(a1) / 0x10000; // 0x1000cffa
#ifdef ORIG
			// DD XXX suspicious code FDIVR
			// Checked, was wrong.
			float80_t v6 = 20.0L / (float80_t) v5; // 0x1000d003
#else
			float80_t v6 = (float80_t) v5 / 20.0L ;
#endif
			g159 = v6;
			g3 = function_1000def9(0, 0x40240000,
					(char) (int32_t) (float32_t) v6, v5);
			v4 = 10.0L * (float80_t) ampl * g159;
			// branch -> 0x1000d046
		}
		// 0x1000d046
		g11++;
		result = SetFuncStatusCode(a1, IE_SUCCESS /*0*/);
		v3 = v4;
		// branch -> 0x1000d057
	}
	// 0x1000d057
	g159 = v3;
	g11--;
	g4 = v1;
	return result;
}

// function_1000cf43
int32_t getAttenuationSetting(SET9052 *a1) {
	// 0x1000cf43
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000cf4b
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int16_t atten = a1->attenuation ; // *(int16_t *) (a1 + 96); // 0x1000cf63
		g3 = (int32_t) atten | v1 & -0x10000;
		int16_t v3 = atten; // bp-8
		int16_t v4 = a1->PreampAvailable; // *(int16_t *) (a1 + 100); // 0x1000cf6e
		g8 = v4;
		if (v4 != 0) {
			// 0x1000cf76
			g3 = a1;
			if (a1->PreampEnabled /* *(int16_t *) (a1 + 102) */ != 0) {
				// 0x1000cf81
				g8 = a1;
				int16_t v5 = atten - a1->PreampGain; // *(int16_t *) (a1 + 104); // 0x1000cf88
				g3 = (int32_t) v5 | ((int32_t) atten | (int32_t) a1) & -0x10000;
				v3 = v5;
				// branch -> 0x1000cf90
			}
		}
		// 0x1000cf90
		result = (int32_t) v3
				| SetFuncStatusCode(a1, IE_SUCCESS /*0*/) & -0x10000;
		// branch -> 0x1000cfa2
	} else {
		// 0x1000cf5a
		result = v1 | 0xffff;
		// branch -> 0x1000cfa2
	}
	// 0x1000cfa2
	return result;
}

int32_t function_1000d05b(SET9052 *a1) {
	// 0x1000d05b
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000d063
	int32_t result;
	if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
		int16_t v2 = a1->attenuation; // *(int16_t *) (a1 + 96); // 0x1000d07b
		g3 = (int32_t) v2 | v1 & -0x10000;
		int16_t v3 = v2; // bp-8
		int16_t v4 = v2; // 0x1000d0b9
		if (( /* *(int16_t *) (a1 + 128)*/ a1->detect_code & 64) == 0) {
			int16_t v5 = v2 + 30; // 0x1000d098
			g3 = ((int32_t) v2 | v1) & -0x10000 | (int32_t) v5;
			v3 = v5;
			v4 = v5;
			// branch -> 0x1000d0a0
		}
		int16_t v6 = a1->PreampAvailable; // *(int16_t *) (a1 + 100); // 0x1000d0a3
		g8 = v6;
		if (v6 != 0) {
			// 0x1000d0ab
			g3 = a1;
			if ( /* *(int16_t *) (a1 + 102)*/ a1->PreampEnabled != 0) {
				// 0x1000d0b6
				g8 = a1;
				int16_t v7 = v4 - a1->PreampGain; // *(int16_t *) (a1 + 104); // 0x1000d0bd
				g3 = (int32_t) v7 | ((int32_t) v4 | (int32_t) a1) & -0x10000;
				v3 = v7;
				// branch -> 0x1000d0c5
			}
		}
		// 0x1000d0c5
		result = (int32_t) v3
				| SetFuncStatusCode(a1, IE_SUCCESS /*0*/) & -0x10000;
		// branch -> 0x1000d0d7
	} else {
		// 0x1000d072
		result = v1 | 0xffff;
		// branch -> 0x1000d0d7
	}
	// 0x1000d0d7
	return result;
}

int32_t function_1000e114(int32_t a1, int32_t a2) {
	int32_t v1 = __fload_withFB(); // 0x1000e118
	g3 = v1;
	int16_t v2 = &a1; // bp-4
	int32_t v3; // 0x1000e162
	int32_t result; // 0x1000e1c5
	if (g161) {
		lab_0x1000e167:
		// 0x1000e167
		if ((v1 & 0xfffff) == 0) {
			lab_0x1000e16e:
			// 0x1000e16e
			if (a1 == 0) {
				// 0x1000e175
				if (v1 > -1) {
					// 0x1000e14a
					__pseudo_cond_branch(g96 != 0, 0x10010ade);
					v3 = __math_exit();
					g3 = v3;
					v1 = v3;
					// branch -> 0x1000e167
					// 0x1000e167
					if ((v1 & 0xfffff) == 0) {
						goto lab_0x1000e16e;
					}
					// 0x1000e18b
					function_10010a6c();
					// branch -> 0x1000e1ad
				} else {
					// 0x1000e17c
					g159 = g69;
					// branch -> 0x1000e1ad
				}
				// 0x1000e1ad
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = __startOneArgErrorHandling();
				g8 = v2;
				return result;
			}
		}
		// 0x1000e18b
		function_10010a6c();
		// branch -> 0x1000e1ad
		// 0x1000e1ad
		__pseudo_cond_branch(g96 != 0, 0x10010ade);
		result = __startOneArgErrorHandling();
		g8 = v2;
		return result;
	}
	// 0x1000e124
	if ((a2 & 0x7ff00000) == 0) {
		// 0x1000e192
		if ((a2 & 0xfffff) == 0) {
			// 0x1000e199
			if (a1 == 0) {
				// 0x1000e1a0
				g159 = g68;
				// branch -> 0x1000e1ad
				// 0x1000e1ad
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = __startOneArgErrorHandling();
				g8 = v2;
				return result;
			}
		}
	} else {
		// 0x1000e13d
		if (a2 <= -1) {
			// 0x1000e17c
			g159 = g69;
			// branch -> 0x1000e1ad
			// 0x1000e1ad
			__pseudo_cond_branch(g96 != 0, 0x10010ade);
			result = __startOneArgErrorHandling();
			g8 = v2;
			return result;
		}
	}
	// 0x1000e144
	g11--;
	g159 = 0.301029995663981198017L;
	// branch -> 0x1000e14a
	// 0x1000e14a
	__pseudo_cond_branch(g96 != 0, 0x10010ade);
	v3 = __math_exit();
	g3 = v3;
	v1 = v3;
	// branch -> 0x1000e167
	goto lab_0x1000e167;
}

void __pseudo_cond_branch(uint32_t x, uint32_t y) {
}

int32_t function_1000def9(int32_t a1, int32_t a2, char a3, uint32_t a4) {
	dlog(LOG_DEBUG, "function_1000def9() - TBI\n");
	int32_t v1 = __fload_withFB(); // 0x1000defd
	g3 = v1;
	int16_t v2 = v1; // 0x1000df04
	int32_t v3 = v1; // 0x1000dfcb
	if (v2 != 639) {
		// 0x1000df11
		v3 = function_10010a55(0x10000 * v1 / 0x10000);
		// branch -> 0x1000df16
	}
	int32_t v4 = v1 & 0x7ff00000; // 0x1000df16
	g6 = v4;
	int32_t v5; // bp-120
	int32_t result; // 0x1000df92
	int32_t v6; // 0x1000e001
	int32_t v7; // 0x1000dfe5
	float80_t v8; // 0x1000e00a
	int32_t v9; // 0x1000e015
	if (v4 == 0x7ff00000) {
		int32_t v10 = 0; // ecx
		__fload_withFB();
		if ((v3 & 0xfffff) != 0) {
			// 0x1000df99
			char v11;
			if ((v11 & 8) != 0) {
				// 0x1000dfac
				g159 *= 2;
				g11++;
				g3 = 1;
				// branch -> 0x1000df7a
				// 0x1000df7a
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = function_100109e0();
				g8 = v2;
				return result;
			}
			// 0x1000dfa9
			// branch -> 0x1000dfdf
			// 0x1000dfdf
			v7 = a2 & 0x7ff00000;
			g3 = v7;
			if (v7 == 0x7ff00000) {
				// 0x1000dff7
				if ((a1 || a2 & 0xfffff) != 0) {
					// 0x1000dfb5
					if ((a3 & 8) != 0) {
						// 0x1000dfac
						g159 *= 2;
						g11++;
						g3 = 1;
						// branch -> 0x1000df7a
					} else {
						// 0x1000dfbc
						g159 *= 2;
						g11++;
						g3 = 7;
						// branch -> 0x1000df7a
					}
					// 0x1000df7a
					__pseudo_cond_branch(g96 != 0, 0x10010ade);
					result = function_100109e0();
					g8 = v2;
					return result;
				}
			}
			// 0x1000dffd
			if (v10 != -1) {
				// 0x1000dfbc
				g159 *= 2;
				g11++;
				g3 = 7;
				// branch -> 0x1000df7a
			} else {
				// 0x1000e001
				v6 = &v5;
				v8 = g159;
				g11 += 2;
				v9 = function_10010bcc((float64_t) v8, (int32_t) (float32_t) v8,
						v6);
				g159 = (float80_t) *(float64_t *) &v5;
				g11--;
				__pseudo_cond_branch(v9 == 0, 0x10010ade);
				g3 = 1;
				// branch -> 0x1000df7a
			}
			// 0x1000df7a
			__pseudo_cond_branch(g96 != 0, 0x10010ade);
			result = function_100109e0();
			g8 = v2;
			return result;
		}
		// 0x1000dfdf
		v7 = a2 & 0x7ff00000;
		g3 = v7;
		if (v7 == 0x7ff00000) {
			// 0x1000dff7
			if ((a1 || a2 & 0xfffff) != 0) {
				// 0x1000dfb5
				if ((a3 & 8) != 0) {
					// 0x1000dfac
					g159 *= 2;
					g11++;
					g3 = 1;
					// branch -> 0x1000df7a
				} else {
					// 0x1000dfbc
					g159 *= 2;
					g11++;
					g3 = 7;
					// branch -> 0x1000df7a
				}
				// 0x1000df7a
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = function_100109e0();
				g8 = v2;
				return result;
			}
		}
		// 0x1000dffd
		if (v10 != 0) {
			// 0x1000dfbc
			g159 *= 2;
			g11++;
			g3 = 7;
			// branch -> 0x1000df7a
		} else {
			// 0x1000e001
			v6 = &v5;
			v8 = g159;
			g11 += 2;
			v9 = function_10010bcc((float64_t) v8, (int32_t) (float32_t) v8,
					v6);
			g159 = (float80_t) *(float64_t *) &v5;
			g11--;
			__pseudo_cond_branch(v9 == 0, 0x10010ade);
			g3 = 1;
			// branch -> 0x1000df7a
		}
		// 0x1000df7a
		__pseudo_cond_branch(g96 != 0, 0x10010ade);
		result = function_100109e0();
		g8 = v2;
		return result;
	}
	int32_t v12 = __fload_withFB(); // 0x1000df2c
	g3 = v12;
	if (v4 == 0x7ff00000) {
		// 0x1000dfc5
		// branch -> 0x1000dfdf
		// 0x1000dfdf
		v7 = a2 & 0x7ff00000;
		g3 = v7;
		if (v7 == 0x7ff00000) {
			// 0x1000dff7
			if ((a1 || a2 & 0xfffff) != 0) {
				// 0x1000dfb5
				if ((a3 & 8) != 0) {
					// 0x1000dfac
					g159 *= 2;
					g11++;
					g3 = 1;
					// branch -> 0x1000df7a
				} else {
					// 0x1000dfbc
					g159 *= 2;
					g11++;
					g3 = 7;
					// branch -> 0x1000df7a
				}
				// 0x1000df7a
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = function_100109e0();
				g8 = v2;
				return result;
			}
		}
		// 0x1000e001
		v6 = &v5;
		v8 = g159;
		g11 += 2;
		v9 = function_10010bcc((float64_t) v8, (int32_t) (float32_t) v8, v6);
		g159 = (float80_t) *(float64_t *) &v5;
		g11--;
		__pseudo_cond_branch(v9 == 0, 0x10010ade);
		g3 = 1;
		// branch -> 0x1000df7a
		// 0x1000df7a
		__pseudo_cond_branch(g96 != 0, 0x10010ade);
		result = function_100109e0();
		g8 = v2;
		return result;
	}
	// 0x1000df37
	float80_t v13; // 0x1000e0b2
	if ((v12 & 0x7ff00000) == 0) {
		int32_t v14 = a1 | a2 & 0xfffff; // 0x1000e041
		g3 = v14;
		if (v14 == 0) {
			int32_t v15 = g11 + 1; // 0x1000e04b
			g11 = v15;
			int32_t v16;
			g3 = v16;
			int32_t v17; // bp+12
			int32_t v18; // 0x1000e0a9
			int32_t v19; // 0x1000e09c
			if ((v16 & 0x7ff00000) == 0) {
				// 0x1000e095
				v19 = v17 | v16 & 0xfffff;
				g3 = v19;
				v18 = v15 + 1;
				if (v19 == 0) {
					// 0x1000e0a2
					g3 = function_10010ade();
					v18 = v15;
					// branch -> 0x1000e0a9
				}
				// 0x1000e0a9
				g11 = v18 - 1;
				g3 = function_10010ade();
				// branch -> 0x1000e0b0
				// 0x1000e0b0
				g159 = g160;
				g11--;
				v13 = function_1000e0d5();
				g3 = (float32_t) v13;
				g159 = -v13;
				if ((char) g6 != 0) {
					// 0x1000df4f
					function_10010a40();
					if ((char) g6 == 1) {
						// 0x1000df5b
						g159 = -g159;
						// branch -> 0x1000df5d
					}
					// 0x1000df5d
					__pseudo_cond_branch(g96 != 0, 0x10010ade);
					g3 = __check_range_exit();
					// branch -> 0x1000df7a
				} else {
					// 0x1000e0c1
					g159 = g69;
					g11++;
					g3 = 1;
					// branch -> 0x1000df7a
				}
				// 0x1000df7a
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = function_100109e0();
				g8 = v2;
				return result;
			}
			// 0x1000e058
			g3 = (float32_t) function_1000e0d5();
			int32_t v20 = g6; // 0x1000e05d
			int32_t v21 = a4 / 128 & 1; // 0x1000e061
			g6 = v20 & -0xff01 | -v21 & 256;
			int32_t v22;
			if ((char) v22 <= -1) {
				// 0x1000e06e
				g159 = g67;
				g11--;
				if ((v20 & v21) != 0) {
					// 0x1000e078
					g159 = -g67;
					// branch -> 0x1000e07a
				}
				// 0x1000e07a
				g3 = 2;
				// branch -> 0x1000df7a
				// 0x1000df7a
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = function_100109e0();
				g8 = v2;
				return result;
			}
			// 0x1000e084
			__pseudo_cond_branch((v20 & v21) == 0, 0x10010ade);
			v15 = g11 - 1;
			// branch -> 0x1000e095
			// 0x1000e095
			v19 = v17 | function_10010ade() & 0xfffff;
			g3 = v19;
			v18 = v15 + 1;
			if (v19 == 0) {
				// 0x1000e0a2
				g3 = function_10010ade();
				v18 = v15;
				// branch -> 0x1000e0a9
			}
			// 0x1000e0a9
			g11 = v18 - 1;
			g3 = function_10010ade();
			// branch -> 0x1000e0b0
			// 0x1000e0b0
			g159 = g160;
			g11--;
			v13 = function_1000e0d5();
			g3 = (float32_t) v13;
			g159 = -v13;
			if ((char) g6 != 0) {
				// 0x1000df4f
				function_10010a40();
				if ((char) g6 == 1) {
					// 0x1000df5b
					g159 = -g159;
					// branch -> 0x1000df5d
				}
				// 0x1000df5d
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				g3 = __check_range_exit();
				// branch -> 0x1000df7a
			} else {
				// 0x1000e0c1
				g159 = g69;
				g11++;
				g3 = 1;
				// branch -> 0x1000df7a
			}
			// 0x1000df7a
			__pseudo_cond_branch(g96 != 0, 0x10010ade);
			result = function_100109e0();
			g8 = v2;
			return result;
		}
	}
	unsigned char v23 = (char) a4 & -128; // 0x1000df46
	g6 = g6 & -256 | (int32_t) v23;
	if (v23 != 0) {
		// 0x1000e0b0
		g159 = g160;
		g11--;
		v13 = function_1000e0d5();
		g3 = (float32_t) v13;
		g159 = -v13;
		if ((char) g6 == 0) {
			// 0x1000e0c1
			g159 = g69;
			g11++;
			g3 = 1;
			// branch -> 0x1000df7a
			// 0x1000df7a
			__pseudo_cond_branch(g96 != 0, 0x10010ade);
			result = function_100109e0();
			g8 = v2;
			return result;
		}
	}
	// 0x1000df4f
	function_10010a40();
	if ((char) g6 == 1) {
		// 0x1000df5b
		g159 = -g159;
		// branch -> 0x1000df5d
	}
	// 0x1000df5d
	__pseudo_cond_branch(g96 != 0, 0x10010ade);
	g3 = __check_range_exit();
	// branch -> 0x1000df7a
	// 0x1000df7a
	__pseudo_cond_branch(g96 != 0, 0x10010ade);
	result = function_100109e0();
	g8 = v2;
	return result;
}

int32_t function_1000e1e4(int32_t a1) {
	dlog(LOG_DEBUG, "function_1000e1e4() - TBI\n");
	int32_t v1 = &a1; // 0x1000e1e4
	__fload_withFB();
	int16_t v2 = v1; // bp-4
	int32_t v3;
	g3 = v3;
	int32_t v4; // 0x1000e232
	int32_t result; // 0x1000e283
	if (g161) {
		// 0x1000e249
		if ((v3 & 0xfffff) == 0) {
			// 0x1000e250
			if (a1 == 0) {
				// 0x1000e257
				if (v3 > -1) {
					lab_0x1000e20e:
					// 0x1000e20e
					__pseudo_cond_branch(g96 != 0, 0x10010ade);
					v4 = __math_exit();
					// branch -> 0x1000e22b
					lab_0x1000e22b:
					// 0x1000e22b
					if ((v4 & 0x7ff00000) == 0) {
						lab_0x1000e232:
						// 0x1000e232
						if ((v4 & 0xfffff) == 0) {
							// 0x1000e239
							if (a1 == 0) {
								goto lab_0x1000e20e;
							}
							// 0x1000e25e
							g159 = g69;
							// branch -> 0x1000e26b
							// 0x1000e26b
							__pseudo_cond_branch(g96 != 0, 0x10010ade);
							result = __startOneArgErrorHandling();
							g8 = v2;
							return result;
						}
					}
				}
				// 0x1000e25e
				g159 = g69;
				// branch -> 0x1000e26b
				// 0x1000e26b
				__pseudo_cond_branch(g96 != 0, 0x10010ade);
				result = __startOneArgErrorHandling();
				g8 = v2;
				return result;
			}
		}
		// 0x1000e242
		function_10010a6c();
		// branch -> 0x1000e26b
		// 0x1000e26b
		__pseudo_cond_branch(g96 != 0, 0x10010ade);
		result = __startOneArgErrorHandling();
		g8 = v2;
		return result;
	}
	int32_t v5 = function_10010a55(0x10000 * v1 / 0x10000); // 0x1000e200
	v4 = v5;
	if (v5 > -1) {
		// 0x1000e20c
		// branch -> 0x1000e20e
		// 0x1000e20e
		__pseudo_cond_branch(g96 != 0, 0x10010ade);
		v4 = __math_exit();
		// branch -> 0x1000e22b
		goto lab_0x1000e22b;
	}
	lab_0x1000e22b_2:
	// 0x1000e22b
	if ((v4 & 0x7ff00000) == 0) {
		goto lab_0x1000e232;
	}
	// 0x1000e25e
	g159 = g69;
	// branch -> 0x1000e26b
	// 0x1000e26b
	__pseudo_cond_branch(g96 != 0, 0x10010ade);
	result = __startOneArgErrorHandling();
	g8 = v2;
	return result;
}

float80_t function_1000e0d5(void) {
	int32_t v1 = g11; // 0x1000e0d5
	float80_t result = llvm_round_f80(g159); // 0x1000e0d7
	int32_t v2 = g6 & -256; // 0x1000e0db
	g6 = v2;
	if ((g3 / 256 & 64) == 0) {
		// 0x1000e0fa
		g11 = v1 + 1;
		return result;
	}
	float80_t result2 = result * (float80_t) g42; // 0x1000e0e3
	g160 = llvm_round_f80(result2);
	g11 = v1 + 1;
	g6 = v2 | 2;
	return result2;
}

int32_t function_10010a6c(void) {
	// 0x10010a6c
	if ((g3 & 0x80000) != 0) {
		// 0x10010a73
		return 7;
	}
	// 0x10010a79
	g159 += 1.0L;
	return 1;
}

int32_t function_10010bcc(float64_t a1, int32_t a2, int32_t a3) {
	int32_t v1 = g4; // 0x10010bcc
	int32_t v2 = v1; // bp-4
	g4 = &v2;
	int32_t v3 = g11; // 0x10010bd1
	int32_t v4 = v3 - 1; // 0x10010bd1
	int32_t v5 = g9; // 0x10010bdd
	int32_t result = 0; // esi
	if ((g3 / 256 & 1) != 0) {
		// 0x10010be7
		// branch -> 0x10010be9
	}
	// 0x10010be9
	g11 = v3;
	g6 = -0x100000;
	int32_t v6;
	int32_t result2; // 0x10010cf7
	uint32_t v7; // 0x10010cb3
	int32_t v8; // 0x10010cfa
	uint32_t v9; // 0x10010c9f
	int32_t v10; // 0x10010ca4
	if (v6 == 0x7ff00000) {
		// 0x10010bfb
		if (a3 == 0) {
			// 0x10010c73
			// branch -> 0x10010cf2
			// 0x10010cf2
			g11 = v4 + 1;
			// branch -> 0x10010cf7
			// 0x10010cf7
			g9 = v5;
			g4 = v2;
			return result;
		}
		// 0x10010c57
		if (a2 != 0x7ff00000) {
			// 0x10010c8d
			if (a2 == -0x100000) {
				// 0x10010c92
				if ((int32_t) (float32_t) a1 == 0) {
					// 0x10010c97
					g11 = v3;
					v9 = function_10010cfc((float64_t) (int64_t) a3, -0x100000);
					v10 = g11;
					v7 = v9 / 256;
					if ((v7 & 65) != 0) {
						// 0x10010ccb
						if ((v7 & 1) == 0) {
							// 0x10010cf0
							// branch -> 0x10010cf2
						}
						// 0x10010cf2
						g11 = v10;
						// branch -> 0x10010cf7
						// 0x10010cf7
						g9 = v5;
						g4 = v2;
						return result;
					}
					// 0x10010cb6
					if (v9 == 1) {
						// 0x10010cc1
						// branch -> 0x10010cc3
					}
					// 0x10010cc3
					// branch -> 0x10010cf2
					// 0x10010cf2
					g11 = v10;
					v8 = v2;
					result2 = result;
					// branch -> 0x10010cf7
				} else {
					v8 = v1;
					result2 = 0;
				}
			} else {
				v8 = v1;
				result2 = 0;
			}
		} else {
			// 0x10010c5c
			if ((int32_t) (float32_t) a1 == 0) {
				// 0x10010c73
				// branch -> 0x10010cf2
				// 0x10010cf2
				g11 = v4 + 1;
				v8 = v2;
				result2 = result;
				// branch -> 0x10010cf7
			} else {
				v8 = v1;
				result2 = 0;
			}
		}
		// 0x10010cf7
		g9 = v5;
		g4 = v8;
		return result2;
	}
	// 0x10010c2f
	if (v6 != -0x100000) {
		// 0x10010c57
		if (a2 != 0x7ff00000) {
			// 0x10010c8d
			if (a2 == -0x100000) {
				// 0x10010c92
				if ((int32_t) (float32_t) a1 == 0) {
					// 0x10010c97
					g11 = v3;
					v9 = function_10010cfc((float64_t) (int64_t) a3, -0x100000);
					v10 = g11;
					v7 = v9 / 256;
					if ((v7 & 65) != 0) {
						// 0x10010ccb
						if ((v7 & 1) == 0) {
							// 0x10010cf0
							// branch -> 0x10010cf2
						}
						// 0x10010cf2
						g11 = v10;
						// branch -> 0x10010cf7
						// 0x10010cf7
						g9 = v5;
						g4 = v2;
						return result;
					}
					// 0x10010cb6
					if (v9 == 1) {
						// 0x10010cc1
						// branch -> 0x10010cc3
					}
					// 0x10010cc3
					// branch -> 0x10010cf2
					// 0x10010cf2
					g11 = v10;
					v8 = v2;
					result2 = result;
					// branch -> 0x10010cf7
				} else {
					v8 = v1;
					result2 = 0;
				}
			} else {
				v8 = v1;
				result2 = 0;
			}
		} else {
			// 0x10010c5c
			if ((int32_t) (float32_t) a1 == 0) {
				// 0x10010c73
				// branch -> 0x10010cf2
				// 0x10010cf2
				g11 = v4 + 1;
				v8 = v2;
				result2 = result;
				// branch -> 0x10010cf7
			} else {
				v8 = v1;
				result2 = 0;
			}
		}
		// 0x10010cf7
		g9 = v5;
		g4 = v8;
		return result2;
	}
	// 0x10010c34
	if (a3 == 0) {
		// 0x10010c89
		// branch -> 0x10010cf2
		// 0x10010cf2
		g11 = v4 + 1;
		// branch -> 0x10010cf7
		// 0x10010cf7
		g9 = v5;
		g4 = v2;
		return result;
	}
	// 0x10010c57
	if (a2 != 0x7ff00000) {
		// 0x10010c8d
		if (a2 == -0x100000) {
			// 0x10010c92
			if ((int32_t) (float32_t) a1 == 0) {
				// 0x10010c97
				g11 = v3;
				v9 = function_10010cfc((float64_t) (int64_t) a3, -0x100000);
				v10 = g11;
				v7 = v9 / 256;
				if ((v7 & 65) != 0) {
					// 0x10010ccb
					if ((v7 & 1) == 0) {
						// 0x10010cf0
						// branch -> 0x10010cf2
					}
					// 0x10010cf2
					g11 = v10;
					// branch -> 0x10010cf7
					// 0x10010cf7
					g9 = v5;
					g4 = v2;
					return result;
				}
				// 0x10010cb6
				if (v9 == 1) {
					// 0x10010cc1
					// branch -> 0x10010cc3
				}
				// 0x10010cc3
				// branch -> 0x10010cf2
				// 0x10010cf2
				g11 = v10;
				v8 = v2;
				result2 = result;
				// branch -> 0x10010cf7
			} else {
				v8 = v1;
				result2 = 0;
			}
		} else {
			v8 = v1;
			result2 = 0;
		}
	} else {
		// 0x10010c5c
		if ((int32_t) (float32_t) a1 == 0) {
			// 0x10010c73
			// branch -> 0x10010cf2
			// 0x10010cf2
			g11 = v4 + 1;
			v8 = v2;
			result2 = result;
			// branch -> 0x10010cf7
		} else {
			v8 = v1;
			result2 = 0;
		}
	}
	// 0x10010cf7
	g9 = v5;
	g4 = v8;
	return result2;
}

int32_t function_10010a40(void) {
	// 0x10010a40
	llvm_round_f80(g159);
	float80_t v1 = 1.0L; // 0x10010a4e
	g159 = v1;
	g160 = v1;
	return g3;
}

int32_t function_10010cfc(float64_t a1, int32_t a2) {
	// 0x10010cfc
	if ((function_100136fd(a1, g6, g6, g6) & 144) != 0) {
		// 0x10010d5d
		return 0;
	}
	float80_t v1 = function_100136eb(a1, g6); // 0x10010d1c
	int32_t v2 = g11 + 1; // 0x10010d21
	g11 = v2;
	if (((int32_t) (float32_t) v1 / 256 & 64) == 0) {
		// 0x10010d5d
		return 0;
	}
	// 0x10010d31
	g11 = v2;
	float80_t v3 = function_100136eb((float64_t) (2.0L / (float80_t) a1), g6); // 0x10010d45
	g11++;
	return ((int32_t) (float32_t) v3 / 256 & 64) == 0 ? 1 : 2;
}

int32_t function_100136fd(float64_t a1, int32_t a2, int32_t a3, int32_t a4) {
	int16_t v1 = (int16_t) a3 & 0x7ff0; // 0x1001370c
	if (v1 != 0x7ff0) {
		if (v1 != 0) {
			return 256;
		}
		if ((a2 & 0xfffff) != 0) {
			return 128;
		}
		if ((int32_t) (float32_t) a1 == 0) {
			return 256;
		}
		return 128;
	}
	int32_t v2 = function_1000f065((int32_t) (float32_t) (float80_t) a1,
			0x7ff0); // 0x10013719
	if (v2 == 1) {
		return 512;
	}
	if (v2 == 2) {
		return 4;
	}
	int32_t result; // 0x1001372b
	if (v2 == 3) {
		result = 2;
	} else {
		result = 1;
	}
	return result;
}

float80_t function_100136eb(float64_t a1, int32_t a2) {
	// 0x100136eb
	g11--;
	return llvm_round_f80((float80_t) a1);
}

// Returns a value in range 0..4 depending on a2 which looks like an error code or mask.
int32_t function_1000f065(int32_t a1, int32_t a2) {
	g8 = 0;
	int32_t v1;
	int16_t v2; // 0x1000f098
	int32_t result; // 0x1000f0b8
	if (a2 == 0x7ff00000) {
		if (a1 == 0) {
			return 1;
		}
		v2 = (int16_t) v1 & 0x7ff8;
		if (v2 != 0x7ff8) {
			if (v2 != 0x7ff0) {
				return 0;
			}
			if ((a2 & 0x7ffff) == 0) {
				if (a1 == 0) {
					return 0;
				}
			}
			result = 4;
		} else {
			result = 3;
		}
		return result;
	}
	if (a2 != -0x100000) {
		v2 = (int16_t) v1 & 0x7ff8;
		if (v2 != 0x7ff8) {
			if (v2 != 0x7ff0) {
				return 0;
			}
			if ((a2 & 0x7ffff) == 0) {
				if (a1 == 0) {
					return 0;
				}
			}
			result = 4;
		} else {
			result = 3;
		}
		return result;
	}
	if (a1 == 0) {
		return 2;
	}
	v2 = (int16_t) v1 & 0x7ff8;
	if (v2 != 0x7ff8) {
		if (v2 != 0x7ff0) {
			return 0;
		}
		if ((a2 & 0x7ffff) == 0) {
			if (a1 == 0) {
				return 0;
			}
		}
		result = 4;
	} else {
		result = 3;
	}
	return result;
}

// Simply calls VISA_FetchDataWord()
int32_t function_100039d0(SET9052 *a1, int16_t *a2) {
	SET9052 *v1 = a1; // 0x100039d4
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x100039d8
	g3 = v2;
	int32_t result; // 0x10003a2f
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		if (*(int32_t *)(v1 + 660) != 0) {
			// FetchDataWord()
			int32_t * v3 = (int32_t *)(v1 + 680);// 0x10003a04
			if (*v3 != 0) {
				g8 = a2;
				__pseudo_call(*v3);
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
		result = (int32_t)v1 & -0x10000 | 0xffeb;
#else
		g8 = a2;
		result = VISA_FetchDataWord(a1, a2);
#endif
	} else {
		g8 = v1;
		result = GetFuncStatusCode(v1);
	}
	dlog(LOG_DEBUG, "function_100039d0() --> result,*a2 = 0x%x,%d \n", result, *a2);
	return result;
}

// This sets gobal var 'g159' depending on engine model, 'g159 is then used by caller.
// It looks like that it is set in most cases to input value inValue.
// Also, g6 and g11 are set...
int32_t function_10002ea6(SET9052 *a1, int64_t inValue) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	g3 = a1;
	int32_t result = TestFuncStatusAndPtr(a1); // 0x10002eb0
	int32_t v2 = 0x10000 * result; // 0x10002eb8
	g6 = v2 / 0x10000;
	if ((v2 || 0xffff) >= 0x1ffff) {
		// 0x10002ebf
		g159 = -1.0L;
		g11--;
		g4 = v1;
		return result;
	}
	int16_t v3 = a1->engine_model; //*(int16_t *)(a1 + 2); // 0x10002ecd
	int32_t result2 = v3; // 0x10002ecd
	g3 = result2;
	int32_t v4; // 0x10002f05
	if (v3 != SA9085 /*768*/
	&& v3 < SA9085 /*768*/== (767 - result2 & result2) < 0) {
		if (v3 == SA9034 /*1024*/) {
			v4 = inValue;
			g6 = v4;
			g159 = v4;
			g11--;
		} else {
			g159 = -1.0L;
			g11--;
		}
		g4 = v1;
		return result2;
	}
	int32_t result3; // 0x10002f25
	if (v3 == SA9085 /*768*/) {
		result3 = 0x10000 * RdEngOption(a1, ENG_OPT_0 /*0*/) / 0x10000;
		g6 = inValue;
		g11--;
		g159 = 0.0L;
	} else {
		if (v3 != SA9052 /*256*/) {
			if (v3 != SA9054 /*512*/) {
				g159 = -1.0L;
				g11--;
				g4 = v1;
				return result2;
			}
		}
		v4 = inValue;
		g6 = v4;
		g159 = v4;
		g11--;
		result3 = result2;
	}
	g4 = v1;
	return result3;
}

int32_t function_10003bb8(SET9052 *a1, int32_t a2) {
	SET9052 *v1 = a1; // 0x10003bbc
	g3 = v1;
	int32_t v2 = TestFuncStatusAndPtr(v1); // 0x10003bc0
	g3 = v2;
	int32_t result; // 0x10003c18
	if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
#ifdef ORIG
		// 0x10003bdd
		if (*(int32_t *)(v1 + 660) != 0) {
			int32_t * v3 = (int32_t *)(v1 + 696); // 0x10003bec
			if (*v3 != 0) {
				// 0x10003bfb
				__pseudo_call(*v3);
				// branch -> 0x10003c15
				// 0x10003c15
				return 0x10000 * v1 / 0x10000 | v1 & -0x10000;
			}
		}
		// 0x10003bf5
		result = v1 & -0x10000 | 0xffeb;
#else
		result = VISA_VerDataBlock(a1, a2);
#endif
		// branch -> 0x10003c15
	} else {
		// 0x10003bcf
		result = GetFuncStatusCode(v1);
		// branch -> 0x10003c15
	}
	// 0x10003c15
	return result;
}

int32_t __fload_withFB(void) {
	dlog(LOG_DEBUG, "__fload_withFB()\n");
}

int32_t __math_exit(void) {
	dlog(LOG_DEBUG, "__math_exit()\n");
}

int32_t __check_range_exit(void) {
	dlog(LOG_DEBUG, "__check_range_exit()\n");
}

llvm_round_f80(float80_t v) {
	dlog(LOG_DEBUG, "llvm_round_f80(%f)\n", v);

}

int32_t function_100109e0(void) {
	int32_t v1 = g4; // bp-4
	g4 = &v1;
	return unknown_10010a00(g3);
}

int32_t unknown_10010a00(int32_t v) {
	dlog(LOG_ERROR, "unknown_10010a00(0x%x) - TBI no decompilation!\n", v);
}

int32_t function_10010ade(void) {
	dlog(LOG_DEBUG, "function_10010ade()\n");
	return g3;
}

int32_t function_10010a55(int32_t a1) {
	// 0x10010a55
	return g3;
}

__startOneArgErrorHandling(void) {
	dlog(LOG_ERROR,
			"__startOneArgErrorHandling()- TBI no decompilation, WINDOWS function!\n");
}

/*------------------------------------------------------------------------------------*/
/* End of file */
/*------------------------------------------------------------------------------------*/


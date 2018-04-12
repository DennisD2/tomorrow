// gcc -I ../include -W -g  main.c pnp.c sa.c -o main

#include <math.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include "sa.h"

#include "dvisa.h"
#include "helper.h"

static int32_t function_10002d12(SET9052 *a1, uint16_t a2);
static int32_t function_10003f7a(SET9052 *a1);
static int32_t function_100119ba(char a1);
static int32_t function_1000e8d2(char a1, int32_t a2);
static int32_t function_10013d49(int32_t a1, int32_t a2, char a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7, int32_t a8);



static int32_t g3 = 0; // eax
static int32_t g4 = 0; // ebp
static int32_t g5 = 0; // ebx
static int32_t g6 = 0; // ecx
static char* g7 = 0; // edi
static int32_t g8 = 0; // edx
static int32_t g9 = 0; // esi

static int32_t g11 = 0; // fpu_stat_TOP
static char * g12;
static int32_t g14_rbwTimeFactor = 0x1000c8b7;
static int32_t g15_vbwTimeFactor = 0x1000c923;

static float64_t * g40 = NULL;

static int32_t g49; // 0x100183d4
static int32_t g50 = 1;

static int32_t g61 = 0;

static int32_t g94 = 0;

static int32_t g107 = 0;

//static int32_t g128 = 0;
static int32_t g129 = 0;
//static int32_t g130 = 0;
//static int32_t g131 = 0;

static float80_t g159_rbwFrequency = 0.0L; // st0
static float80_t g160_currentStepWidth = 0.0L; // st1

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
#else
        /* InitEngine call */
        VISA_InitEngine(a1);
#endif
        result = (int32_t)v1 & -0x10000 | 0xffeb;
    } else {
        result = GetFuncStatusCode(v1);
    }
    return result;
}

int32_t ResetEngine(int16_t a1) {
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
        VISA_ResetEngine(a1);
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
		result = SetFuncStatusCode(a1, -3);
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
	dlog( LOG_DEBUG, "SetFuncStatusCode(%x)\n", code);
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
			if ((0x10000 * RdEngOption(a1, ENG_OPT_2 /*2*/) || 0xffff) < 0x1ffff) {
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
        result = (int32_t)a1 & -0x10000 | (int32_t)code;
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
		result = SetFuncStatusCode(a1, -1);
	}
	return result;
}

int32_t function_1000d570(char * /*int32_t*/ a1) {
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
	if (((int32_t)v2 & 3) != 0) {
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
// Address range: 0x10004b94 - 0x10004ee4
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
		function_10001718(a1);
		result = function_10001b13(a1) & -0x10000;
		// branch -> 0x10004ee3
	} else {
		// 0x10004b9d
		result = g3 & -0x10000 | 0xfff6;
		// branch -> 0x10004ee3
	}
	// 0x10004ee3
	return result;
}

// Address range: 0x100067d5 - 0x10006851
int32_t SetZSamplRate(/*int32_t a1*/ SET9052 *a1, int64_t rate) {
	dlog( LOG_DEBUG, "SetZSamplRate\n");
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100067e3
    g3 = v1;
    int32_t result; // 0x10006851
    if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
        uint32_t v2 = (int32_t)rate; // 0x10006800
        uint64_t v3; // 0x1000683d
        if (v2 >= 306) {
            // 0x10006818
            int16_t v4; // bp-8
            if (v2 < 0xf4241) {
                // 0x10006830
                v4 = 0;
                // branch -> 0x10006836
            } else {
                // 0x10006821
                v4 = -3;
                rate = 0xf4240;
                // branch -> 0x10006836
            }
            // 0x10006836
            v3 = 0x989680 / rate;
            //*(int16_t *)(a1 + 156) = (int16_t)v3;
            a1->zsampl_dvdr = (int16_t)v3;
            // branch -> 0x1000684e
            // 0x1000684e
            return (int32_t)v3 & -0x10000 | (int32_t)v4;
        }
        // 0x10006809
        // branch -> 0x10006836
        // 0x10006836
        v3 = 0x7fa7;
        //*(int16_t *)(a1 + 156) = (int16_t)v3;
        a1->zsampl_dvdr = (int16_t)v3;
       result = (int32_t)v3 & -0x10000 | (int32_t)-3;
        // branch -> 0x1000684e
    } else {
        // 0x100067f2
        result = GetFuncStatusCode(a1);
        // branch -> 0x1000684e
    }
    // 0x1000684e
    return result;
}

int32_t function_10001718(SET9052 *a1) {
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
    float64_t v6 = (float80_t)v5 - (float80_t)v3; // 0x10001754
    // DD: a1 is a pointer; what does 'a1&256' mean???
    if (((int32_t)a1 & 256) == 0) {
    	int32_t *v7 = &a1->deflt_pt_cnt;
        int32_t * v8 = &a1->num_swp_pts;
        *v8 = *v7;
        int32_t * v9 = &a1->num_step_pts;
        *v9 = *v7;
        g8 = a1;
        int16_t step_mode = a1->step_mode;
        if (step_mode != MR90XX_AUTO_ON /*1*/) {
            if (step_mode == MR90XX_STEPCNT /*2*/) {
                int32_t v11 = *v9; // 0x10001aaa
                g8 = a1;
                a1->step = (float64_t)((float80_t)(v11 - 1) / (float80_t)v6);
                if (a1->auto_rbw /* *(int16_t *)(a1 + 74)*/ == MR90XX_AUTO_ON /*1*/) {
                    setup_rbw(a1);
                }
                if (a1->auto_vbw /* *(int16_t *)(a1 + 78) */ == MR90XX_AUTO_ON /*1*/) {
                    g8 = a1;
                    setup_vbw(a1);
                 }
            } else {
                if (step_mode == MR90XX_STEPSIZ /*3*/) {
                    g11 = v4;
                    int32_t v12 = __ftol((int32_t)step_mode) + 1; // 0x10001a57
                    *v9 = v12;
                    g8 = v12;
                    *v8 = v12;
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
            return (int32_t)a1 & -0x10000;
        }
        if (a1->auto_rbw /* *(int16_t *)(a1 + 74)*/ != MR90XX_AUTO_ON /*1*/) {
            if (a1->auto_vbw /* *(int16_t *)(a1 + 78) */ == MR90XX_AUTO_ON /*1*/) {
                 setup_vbw(a1);
            }
        } else {
            setup_rbw(a1);
        }
        int16_t *cell_modePtr;
        if (a1->auto_cell /* *(int16_t *)(a1 + 66) */ != MR90XX_AUTO_ON) {
        	cell_modePtr = &a1->cell_mode; // (int16_t *)(a1 + 64);
        } else {
            int16_t * v14 = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x100017f5
            if (*v14 == IE_FALSE) {
                int32_t v15 = GetRBWwide(4);
                if (((0x100000000 * (int64_t)(v15 >> 31) | (int64_t)v15) / 3 & 256) != 0) {
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
            int32_t v17 = (0x100000000 * (int64_t)(v16 >> 31) | (int64_t)v16) / 3; // 0x10001956
            float64_t * v18 = &a1->step; // (float64_t *)(a1 + 24); // 0x10001961
            *v18 = (float64_t)v17;
            float80_t v19 = v6; // 0x10001967
            g11--;
            int32_t v20 = __ftol(v17); // 0x10001973
            *v9 = v20;
            if (v20 < *v7) {
                int32_t v21 = *v7; // 0x10001998
                *v9 = v21;
                *v18 = (float64_t)((float80_t)(v21 - 1) / v19);
            }
            *v8 = *v9;
            g8 = a1;
            if (0x10000 * IsValidStep(a1) != 0x10000) {
                int32_t v22 = *v9 + 10; // 0x100019eb
                *v9 = v22;
                *v8 = v22;
                *v18 = (float64_t)((float80_t)(*v9 - 1) / v19);
                int32_t v23 = 0x10000 * IsValidStep(a1); // 0x10001a30
                g8 = v23 / 0x10000;
                while (v23 != 0x10000) {
                    v22 = *v9 + 10;
                    *v9 = v22;
                    *v8 = v22;
                    *v18 = (float64_t)((float80_t)(*v9 - 1) / v19);
                    v23 = 0x10000 * IsValidStep(a1);
                    g8 = v23 / 0x10000;
                }
                function_10001b13(a1);
                g160_currentStepWidth = (float80_t) a1->step; // *(float64_t *)(a1 + 24);
                g4 = v1;
                return (int32_t)a1 & -0x10000;
            }
        } else {
            int32_t v24 = GetRBWwide(a1->rbw_code /* *(int16_t *)(a1 + 72) */); // 0x10001857
            int32_t v25 = (0x100000000 * (int64_t)(v24 >> 31) | (int64_t)v24) / 3; // 0x10001865
            float64_t * v26 = &a1->step; // (float64_t *)(a1 + 24); // 0x10001870
            *v26 = (float64_t)v25;
            float80_t v27 = v6; // 0x10001876
            g11--;
            int32_t v28 = __ftol(v25); // 0x10001882
            *v9 = v28;
            int32_t * v29 = &a1->num_cells; // (int32_t *)(a1 + 132); // 0x1000189c
            if (v28 < *v29) {
                int32_t v30 = *v29; // 0x100018aa
                *v9 = v30;
                *v26 = (float64_t)((float80_t)(v30 - 1) / v27);
            }
            *v8 = *v9;
            g8 = a1;
            if (0x10000 * IsValidStep(a1) != 0x10000) {
                int32_t v31 = *v9; // 0x100018fa
                *v9 = v31 + 10;
                *v26 = (float64_t)((float80_t)(v31 + 9) / v27);
                int32_t v32 = 0x10000 * IsValidStep(a1); // 0x10001933
                g8 = v32 / 0x10000;
                while (v32 != 0x10000) {
                    v31 = *v9;
                    *v9 = v31 + 10;
                    *v26 = (float64_t)((float80_t)(v31 + 9) / v27);
                    v32 = 0x10000 * IsValidStep(a1);
                    g8 = v32 / 0x10000;
                }
                function_10001b13(a1);
                g160_currentStepWidth = a1->step; // (float80_t)*(float64_t *)(a1 + 24);
                g4 = v1;
                return (int32_t)a1 & -0x10000;
            }
        }
        function_10001b13(a1);
        g160_currentStepWidth = a1->step; // (float80_t)*(float64_t *)(a1 + 24);
        result = (int32_t)a1 & -0x10000;
    } else {
        result = (int32_t)a1 & -0x10000 | 0xfffb;
    }
    g4 = v1;
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
        int32_t v6 = DefltSetTimeRBW(a1->rbw_code /* *(int16_t *)(result2 + 72 )*/); // 0x10001ba4
        int32_t v7 = DefltSetTimeVBW(a1->vbw_code /* *(int16_t *)(result2 + 76 )*/); // 0x10001bb7
        if (v7 > v6) {
        } else {
            v7 = v6;
        }
        int32_t v8 = *v5 + a1->synth_time /* *(int32_t *)(result2 + 60)*/ + v7; // 0x10001bed
        g8 = v8;
        float80_t v9 = v8; // 0x10001bf3
        g160_currentStepWidth = v9;
        g6 = a1;
        // *(float64_t *)(result2 + 48) = (float64_t)((float80_t)v3 * v9);
        a1->sweep_time = (float64_t)((float80_t)v3 * v9);
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
            a1->sweep_time = (float64_t)v12;
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
            int32_t v16 = DefltSetTimeRBW( a1->rbw_code /* *(int16_t *)(result2 + 72) */ ); // 0x10001c8f
            v14 = DefltSetTimeVBW( a1->vbw_code /* *(int16_t *)(result2 + 76) */ );
            v15 = v16;
        }
        int32_t v17;
        if (v14 > v15) {
            v17 = v14;
        } else {
            v17 = v15;
        }
        g6 = a1;
        int32_t v18 = *v13 + a1->synth_time /* *(int32_t *)(result2 + 60) */ + v17; // 0x10001cec
        float80_t v19 = v18; // 0x10001cf2
        g160_currentStepWidth = v19;
        g8 = a1;
        // *(float64_t *)(result2 + 48) = (float64_t)((float80_t)v3 * v19);
        a1->sweep_time = (float64_t)((float80_t)v3 * v19);
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
            float64_t v6 = (float80_t)v5 - (float80_t)v4; // 0x10001d55
            int16_t * v7 = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x10001d5b
            float64_t v8;
            if (*v7 != IE_FALSE /*0*/) {
                if (*v7 == IE_TRUE /*1*/) {
                    int32_t v9 = a1->num_step_pts; // *(int32_t *)(a1 + 168); // 0x10001d92
                    v8 = (float80_t)(v9 - 1) / (float80_t)v6;
                } else {
                    v8 = 0.0;
                }
            } else {
                int32_t v10 = a1->num_swp_pts /* *(int32_t *)(a1 + 164) */ - 1; // 0x10001d72
                v8 = (float80_t)v10 / (float80_t)v6;
            }

            int32_t v11 = GetRBWwide(RBW_300HZ /*0*/); // 0x10001daf
            int32_t v12 = (0x100000000 * (int64_t)(v11 >> 31) | (int64_t)v11) / 3; // 0x10001dbd
            int16_t v13; // 0x10001e7f
            if ((v12 & 256) == 0) {
                //*(int16_t *)(a1 + 72) = 0;
                a1->rbw_code = RBW_300HZ /*0*/;
                //*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
                a1->step = (int32_t)(float32_t)v8;
                // DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
                *(int32_t *)(a1 + 28) = 0;
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
            int32_t v15 = (0x100000000 * (int64_t)(v14 >> 31) | (int64_t)v14) / 3; // 0x10001ded
            if ((v15 & 256) == 0) {
                //*(int16_t *)(a1 + 72) = 1;
                a1->rbw_code = RBW_3KHZ /*1*/;
                //*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
                a1->step = (int32_t)(float32_t)v8;
                // DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
                *(int32_t *)(a1 + 28) = 0;
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
            int32_t v17 = (0x100000000 * (int64_t)(v16 >> 31) | (int64_t)v16) / 3; // 0x10001e1a
            if ((v17 & 256) == 0) {
                //*(int16_t *)(a1 + 72) = 2;
                a1->rbw_code = RBW_30KHZ /*2*/;
                //*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
                a1->step = (int32_t)(float32_t)v8;
                // DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
                *(int32_t *)(a1 + 28) = 0;
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
            int32_t v19 = (0x100000000 * (int64_t)(v18 >> 31) | (int64_t)v18) / 3; // 0x10001e47
            if ((v19 & 256) != 0) {
                 //*(int16_t *)(a1 + 72) = 4;
                a1->rbw_code = RBW_3MHZ;
            } else {
                //*(int16_t *)(a1 + 72) = 3;
            	a1->rbw_code = RBW_300KHZ;
            }
            //*(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
            a1->step = (int32_t)(float32_t)v8;
            // DD: TODO a1+28 is inside a1->step? an error in original code? can the line be commented out?
            *(int32_t *)(a1 + 28) = 0;
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
        if (v3 != 0) {
            RBWFreqFromCode((int16_t)RdRBW(a1));
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
                    int32_t v9 = VBWCodeFromFreq((float64_t)((float80_t)v4 * g159_rbwFrequency), 0); // 0x10001f2f
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
	dlog( LOG_DEBUG, "OpenSession(%s,%d)\n", session_string,a3);
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
            if ((int16_t)v8 == 0) {
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
            if ((int16_t)v10 == 0) {
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
            if ((int16_t)v12 == 0) {
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
            if ((int16_t)v14 == 0) {
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
            if ((int16_t)v16 == 0) {
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
            int32_t v18 = function_100036f0(a1, (char *)session_string, v17); // 0x10003ecb
            int32_t v19 = 0x10000 * v18 / 0x10000; // 0x10003ed7
            if ((int16_t)v18 == 0) {
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
            if ((int16_t)v20 != 0) {
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
        result2 = (int32_t)a1 & -0x10000 | 0xffed;
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
            int32_t * v3 = (int32_t *)(v1 + 720); // 0x10003fae
            if (*v3 != 0) {
                // 0x10003fbd
                __pseudo_call(*v3);
                // branch -> 0x10003fd2
                // 0x10003fd2
                return 0x10000 * (int32_t)v1 / 0x10000 | (int32_t)v1 & -0x10000;
            }
        //}
#else
        int32_t ret = VISA_OpenSessionStep(a1);
        return 0x10000 * (int32_t)ret / 0x10000 | (int32_t)ret & -0x10000;
#endif
        result = (int32_t)v1 & -0x10000 | 0xffeb;
    } else {
        result = GetFuncStatusCode(v1);
    }
    return result;
}

int32_t IdQuery(int16_t a1, int32_t a2) {
	dlog( LOG_DEBUG, "IdQuery\n");
    int32_t v1 = a1; // 0x10003fda
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
        result = v1 & -0x10000 | 0xffeb;
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
                int32_t v3 = 0x10000 * (int32_t)a1; // 0x10004086
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
#else
        VISA_CloseSession(a1);
#endif
        result = (int32_t)a1 & -0x10000 | 0xffeb;
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
    int32_t v3 = function_10014e60(v2, (int32_t)"ISA", 3); // 0x10003861
    g3 = v3;
    if (v3 != 0) {
        // 0x1000386d
        // branch -> 0x100038bf
        // 0x100038bf
        return v3 | 0xffff;
    }
    // 0x10003873
    g6 = a2;
    int32_t v4 = function_10003613(v2); // 0x10003877
    int32_t v5 = 0x10000 * SetPortNum(a1, (int16_t)v4); // 0x1000388c
    if ((v5 || 0xffff) >= 0x1ffff) {
        // 0x10003893
        // branch -> 0x100038bf
        // 0x100038bf
        return v5 / 0x10000 | 0xffff;
    }
    // 0x10003899
    g6 = a1;
    int32_t v6 = function_10003329(a1, (int32_t)"mtcisant.dll", (int32_t *)"ISANT_"); // 0x100038a7
    int32_t result; // 0x100038c0
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
    int32_t v1 = function_10014e60((char *)a2, (int32_t)"VXI", 3); // 0x10003687
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
    int32_t v2 = 0x10000 * function_10003329(a1, (int32_t)"mtcvsa32.dll", (int32_t *)"VISA_"); // 0x100036de
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
        result = (int32_t)a1 & -0x10000;
    } else {
        g8 = a1;
        result = GetFuncStatusCode(a1);
    }
    return result;
}

int32_t IsValidStep(SET9052 *a1) {
	dlog( LOG_DEBUG, "IsValidStep\n");
    int32_t v1 = g9; // 0x10006dd2
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10006dd7
    if ((0x10000 * v2 || 0xffff) >= 0x1ffff) {
        // 0x10006de6
        // branch -> 0x10006e20
        // 0x10006e20
        g9 = v1;
        return v2 | 0xffff;
    }
    int32_t v3 = GetRBWwide(a1->rbw_code /* *(int16_t *)(a1 + 72) */); // 0x10006df7
    int64_t v4 = 0x100000000 * (int64_t)(v3 >> 31) | (int64_t)v3; // 0x10006e05
    int32_t v5 = v4 / 3; // 0x10006e05
    g8 = v4 % 3;
    int32_t result; // 0x10006e24
    if ((v5 & 256) == 0) {
        result = v5 & -0x10000 | 1;
    } else {
        result = v5 & -0x10000;
    }
    g9 = v1;
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
    // first workaround: we return -3...
    return 1;

    // DD: the if condition seems to make no sense
    if (value == 4 || value < 4 != (3 - v3 & v3) < 0) {
    	// DD: this gives a SEGV. v2 aka g4 is substracted an offset and the result is dereferenced -> Bang!
       result = *(int32_t *)(4 * v3 - 24 + (int32_t)&v2);
    } else {
        result = -3;
    }

    g4 = v1;
    return result;
}

int32_t RBWFreqFromCode(int16_t a1) {
    int32_t result = a1; // 0x1000b557
    if (a1 < 0) {
        g159_rbwFrequency= -3.0L;
        g11--;
        return result;
    }
    g6 = result;
    float80_t v1;
    if (a1 <= 4) {
        g8 = result;
        float64_t v2 = *(float64_t *)(8 * result + (int32_t)&g40); // 0x1000b574
        v1 = v2;
    } else {
        v1 = -3.0L;
    }
    g159_rbwFrequency = v1;
    g11--;
    return result;
}

// Address range: 0x1000b57d - 0x1000b5a5
int32_t VBWFreqFromCode(int16_t a1) {
    int32_t result = a1; // 0x1000b580
    if (a1 < 0) {
        g11--;
        return result;
    }
    g6 = result;
    if (a1 <= 7) {
    }
    g11--;
    return result;
}

int32_t DefltSetTimeRBW(int16_t timeValue) {
    int32_t v1 = timeValue; // 0x1000c8a0
    g6 = v1;
#ifdef ORIG
    __pseudo_branch(*(int32_t *)(4 * v1 + (int32_t)&g14_rbwTimeFactor));
#endif
    return -1;
}

// Address range: 0x1000c906 - 0x1000c978
int32_t DefltSetTimeVBW(int16_t timeValue) {
	// DD:  g15 is initialized with 0x1000c923... a
#ifdef ORIG
    int32_t v1 = *(int32_t *)(4 * (int32_t)timeValue + (int32_t)&g15_vbwTimeFactor); // 0x1000c91c
    __pseudo_branch(v1);
#endif
    return -1;
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
    int32_t v2 = function_10014e60((char *)a2, (int32_t)"SIM", 3); // 0x100037f2
    if (v2 != 0) {
        // 0x100037fe
        // branch -> 0x1000382a
        // 0x1000382a
        return v2 & -0x10000 | 0xffef;
    }
    // 0x10003804
    g6 = a1;
    int32_t v3 = function_10003329(a1, (int32_t)"mtcsim32.dll", (int32_t *)"SIM_"); // 0x10003812
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
    int32_t v1 = (int32_t)a2; // 0x100036f6
    int32_t v2 = function_10014e60("TCPIP::", v1, 7); // 0x100036ff
    if (v2 == 0) {
        int32_t v3 = 7; // 0x10003743
        while (true) {
            int32_t v4 = v3; // bp-8
            char * v5 = (char *)(v3 + v1); // 0x1000372c
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
            function_1000d740((char *)(a1 + 594), v1 + 7, v6);
            *(char *)(v4 + a1 + 587) = 0;
            g6 = v4;
            int32_t v7 = function_1000d6eb(v1 + 1 + v4); // 0x1000377b
            g6 = a1;
            *(int16_t *)(a1 + 532) = (int16_t)v7;
            int32_t v8 = 0x10000 * function_10003329(a1, (int32_t)"mtctcpip.dll", (int32_t *)"TCPIP_"); // 0x100037a3
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
    int c = strncmp((char *)a2, a1, strlen(a1) + 2 + a3);
    unsigned char v2 = *(char *)(a2 - 1); // 0x1000d721
    unsigned char v3 = *(char *)(a1 - 1); // 0x1000d726
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

int32_t function_1000d660(char * a1) {
    int32_t v1 = g4; // 0x1000d661
    int32_t v2 = g9; // 0x1000d662
    char * v3 = a1;
    // branch -> 0x1000d668
    while (true) {
        int32_t v4 = v3; // edi
        unsigned char v5 = *v3; // 0x1000d671
        int32_t v6; // 0x1000d696
        int32_t v7; // 0x1000d677
        if (g50 > 1) {
            // 0x1000d671
            v7 = function_1000e8d2(v5, 8);
            g6 = 8;
            v6 = v4;
            // branch -> 0x1000d68f
        } else {
            int32_t v8 = *(int32_t *)0x100183d4; // 0x1000d683
            g6 = v8;
            v6 = v3;
            v7 = (int32_t)*(char *)(v8 + 2 * (int32_t)v5) & 8;
            // branch -> 0x1000d68f
        }
        // 0x1000d68f
        if (v7 == 0) {
            unsigned char v9 = *(char *)v6; // 0x1000d696
            int32_t v10 = v9; // 0x1000d696
            g9 = v10;
            int32_t v11 = v6 + 1; // 0x1000d699
            v4 = v11;
            g4 = v10;
            int32_t v12; // 0x1000d6c64
            int32_t v13; // 0x1000d6a6
            if (v9 == '-' /*45*/) {
                // 0x1000d6a6
                v13 = (int32_t)*(char *)v11;
                g9 = v13;
                v4 = v6 + 2;
                v12 = v13;
                // branch -> 0x1000d6aa
            } else {
                // 0x1000d6a1
                if (v9 == '+'/*43*/) {
                    // 0x1000d6a6
                    v13 = (int32_t)*(char *)v11;
                    g9 = v13;
                    v4 = v6 + 2;
                    v12 = v13;
                    // branch -> 0x1000d6aa
                } else {
                    v12 = v10;
                }
            }
            int32_t v14 = 0; // ebx
            int32_t v15 = v12; // 0x1000d6b7
            // branch -> 0x1000d6ac
            while (true) {
                // 0x1000d6ac
                int32_t v16; // 0x1000d6b8
                if (g50 > 1) {
                    // 0x1000d6b5
                    v16 = function_1000e8d2((char)v15, 4);
                    g6 = 4;
                    // branch -> 0x1000d6cc
                } else {
                    // 0x1000d6c1
                    v16 = (int32_t)*(char *)(g49 + 2 * v15) & 4;
                    // branch -> 0x1000d6cc
                }
                // 0x1000d6cc
                if (v16 == 0) {
                    // 0x1000d6dd
                    int32_t result; // 0x1000d6ea
                    if (g4 == 45) {
                        // 0x1000d6e4
                        result = -v14;
                        // branch -> 0x1000d6e6
                    } else {
                        result = v14;
                    }
                    // 0x1000d6e6
                    g9 = v2;
                    g4 = v1;
                    return result;
                }
                // 0x1000d6d0
                v14 = 10 * v14 - 48 + g9;
                int32_t v17 = v4; // 0x1000d6d7
                int32_t v18 = (int32_t)*(char *)v17; // 0x1000d6d7
                g9 = v18;
                v4 = v17 + 1;
                v15 = v18;
                // branch -> 0x1000d6ac
            }
        } else {
            // 0x1000d693
            v3 = v6 + 1;
            // branch -> 0x1000d668
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
        int32_t result = (int32_t)a1; // 0x1000d757
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
                unsigned char v29 = *(char *)v25; // 0x1000d764
                g3 = (int32_t)v29 | v24 & -256;
                v7 = v25 + 1;
                *(char *)v23 = v29;
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
                if ((char)v30 == 0) {
                    // 0x1000d79a
                    if ((v27 & 3) != 0) {
                        // 0x1000d7a2
                        *(char *)v27 = 0;
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
                                *(char *)v31 = (char)g3;
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
                        *(int32_t *)v27 = 0;
                        v17 = v6 + 4;
                        v6 = v17;
                        v19 = v28 / 4 - 1;
                        if (v19 != 0) {
                            *(int32_t *)v17 = g3;
                            v16 = v6 + 4;
                            v6 = v16;
                            v18 = v19 - 1;
                            while (v18 != 0) {
                                // 0x1000d829
                                *(int32_t *)v16 = g3;
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
                            *(char *)v22 = (char)g3;
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
                    *(char *)v22 = (char)g3;
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
                    v21 = *(char *)v8;
                    g3 = (int32_t)v21 | v36 & -256;
                    v7 = v8 + 1;
                    *(char *)v35 = v21;
                    v12 = v6 + 1;
                    v6 = v12;
                    v9 = g3;
                    if ((char)v9 == 0) {
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
                  lab_0x1000d78f_2:;
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
                    v21 = *(char *)v8;
                    g3 = (int32_t)v21 | g3 & -256;
                    v7 = v8 + 1;
                    *(char *)result = v21;
                    v12 = v6 + 1;
                    v6 = v12;
                    v9 = g3;
                    if ((char)v9 != 0) {
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
            int32_t * v38 = (int32_t *)v10; // 0x1000d7d6
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
                *(int32_t *)v15 = v41;
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
                        v21 = *(char *)v8;
                        g3 = (int32_t)v21 | g3 & -256;
                        v7 = v8 + 1;
                        *(char *)v44 = v21;
                        v12 = v6 + 1;
                        v6 = v12;
                        v9 = g3;
                        if ((char)v9 != 0) {
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
                if ((char)v41 == 0) {
                    // 0x1000d81b
                    g8 = 0;
                    *(int32_t *)v15 = 0;
                    // branch -> 0x1000d81f
                } else {
                    // 0x1000d7ef
                    if ((v41 & 0xff00) == 0) {
                        int32_t v48 = v41 & 255; // 0x1000d811
                        g8 = v48;
                        *(int32_t *)v15 = v48;
                        // branch -> 0x1000d81f
                    } else {
                        // 0x1000d7f3
                        if ((v41 & 0xff0000) == 0) {
                            int32_t v49 = v41 & 0xffff; // 0x1000d807
                            g8 = v49;
                            *(int32_t *)v15 = v49;
                            // branch -> 0x1000d81f
                        } else {
                            // 0x1000d7fb
                            if (v41 >= 0x1000000) {
                                goto lab_0x1000d7c9;
                            }
                            // 0x1000d803
                            *(int32_t *)v15 = v41;
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
                            *(int32_t *)v46 = 0;
                            v17 = v6 + 4;
                            v6 = v17;
                            v19 = v47 - 1;
                            if (v19 != 0) {
                                *(int32_t *)v17 = g3;
                                v16 = v6 + 4;
                                v6 = v16;
                                v18 = v19 - 1;
                                while (v18 != 0) {
                                    // 0x1000d829
                                    *(int32_t *)v16 = g3;
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
                                *(char *)v16 = (char)g3;
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
                        *(char *)v42 = (char)g3;
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
                        *(int32_t *)v46 = 0;
                        v17 = v6 + 4;
                        v6 = v17;
                        v19 = v47 - 1;
                        if (v19 != 0) {
                            *(int32_t *)v17 = g3;
                            v16 = v6 + 4;
                            v6 = v16;
                            v18 = v19 - 1;
                            while (v18 != 0) {
                                // 0x1000d829
                                *(int32_t *)v16 = g3;
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
                            *(char *)v16 = (char)g3;
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
                    *(char *)v42 = (char)g3;
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
                    *(int32_t *)v46 = 0;
                    v17 = v6 + 4;
                    v6 = v17;
                    v19 = v47 - 1;
                    if (v19 != 0) {
                        *(int32_t *)v17 = g3;
                        v16 = v6 + 4;
                        v6 = v16;
                        v18 = v19 - 1;
                        while (v18 != 0) {
                            // 0x1000d829
                            *(int32_t *)v16 = g3;
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
                        *(char *)v16 = (char)g3;
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
            *(char *)v42 = (char)g3;
            v13 = v6 + 1;
            v6 = v13;
            v43 = v13;
            // branch -> 0x1000d7be
            goto lab_0x1000d7be_7;
        }
    }
    // 0x1000d7c3
    g7 = v2;
    return (int32_t)a1;
}

int32_t function_1001039a(int32_t a1) {
    int32_t v1 = g9; // 0x100103a0
    int32_t lpCriticalSection2 = 4 * a1 + (int32_t)&g61; // 0x100103a1
    g9 = lpCriticalSection2;
    if (*(int32_t *)lpCriticalSection2 != 0) {
        // branch -> 0x100103f0
    } else {
        int32_t v2 = g7; // 0x100103b2
        int32_t lpCriticalSection = function_1000da64(24); // 0x100103b5
        g7 = lpCriticalSection;
        if (lpCriticalSection == 0) {
            // 0x100103c1
            __amsg_exit(17);
            // branch -> 0x100103c9
        }
        // 0x100103c9
        function_1001039a(17);
        if (*(int32_t *)g9 != 0) {
            // 0x100103e1
            function_1000d97b(lpCriticalSection);
            // branch -> 0x100103e7
        } else {
            // 0x100103d7
            InitializeCriticalSection((struct _RTL_CRITICAL_SECTION *)lpCriticalSection);
            *(int32_t *)g9 = lpCriticalSection;
            // branch -> 0x100103e7
        }
        // 0x100103e7
        function_100103fb(17);
        g7 = (int32_t)(struct _RTL_CRITICAL_SECTION *)v2;
        lpCriticalSection2 = g9;
        // branch -> 0x100103f0
    }
    // 0x100103f0
    EnterCriticalSection((struct _RTL_CRITICAL_SECTION *)*(int32_t *)lpCriticalSection2);
    g9 = v1;
    int32_t * v3;
    return (int32_t)&v3;
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
            v16 = (int32_t)*(char *)(g49 + 2 * result) & 1;
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
            if (*(char *)((2 * (v14 & 255) || 1) + v8) > -1) {
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
            v13 = function_10013d49(g129, v6, (char)(int32_t)&v1, v12, v3, 3, 0, v11);
            if (v13 != 0) {
                // 0x10011a69
                if (v13 != g9) {
                    // 0x10011a73
                    v15 = v2;
                    g6 = v15;
                    result2 = v15 | 256 * (int32_t)v7;
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
        if (*(char *)((2 * (v14 & 255) || 1) + v8) > -1) {
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
        v13 = function_10013d49(g129, v6, (char)(int32_t)&v1, v12, v3, 3, 0, v11);
        if (v13 != 0) {
            // 0x10011a69
            if (v13 != g9) {
                // 0x10011a73
                v15 = v2;
                g6 = v15;
                result2 = v15 | 256 * (int32_t)v7;
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
    int32_t lpCriticalSection = *(int32_t *)(4 * a1 + (int32_t)&g61); // 0x10010401
    LeaveCriticalSection((struct _RTL_CRITICAL_SECTION *)lpCriticalSection);
    int32_t * v1;
    return (int32_t)&v1;
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
        char v8 = *(char *)(g49 + (2 * v7 | 1)); // 0x1000e8ff
        v3 = v8 > -1 ? v4 : v6;
        int32_t result = function_1001239e((char *)1, (int32_t)&v3, 2 - (int32_t)(v8 > -1), (int32_t)&v1, 0, 0, 1); // 0x1000e930
        if (result == 0) {
            // 0x1000e93c
            g4 = v2;
            return result;
        }
        v5 = v1;
        // branch -> 0x1000e942
    } else {
        // 0x1000e8e4
        v5 = (int32_t)*(int16_t *)(g49 + 2 * v4);
        // branch -> 0x1000e942
    }
    // 0x1000e942
    int32_t v9;
    return v5 & v9;
}

int32_t function_1000da64(int32_t a1) {
    // 0x1000da64
    return __nh_malloc(a1, g107);
}

int32_t function_1000d97b(int32_t a1) {
    // 0x1000d97b
    abort();
    // UNREACHABLE
}
int32_t function_10013d49(int32_t a1, int32_t a2, char a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7, int32_t a8) {
    // 0x10013d49
    abort();
    // UNREACHABLE
}
int32_t function_1001239e(char * a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7) {
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
	return (void *)malloc(size);
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

	int a         = *(int*)(&in);
	int sign      = (a >> 31);
	int mantissa  = (a & ((1 << 23) - 1)) | (1 << 23);
	int exponent  = ((a & 0x7fffffff) >> 23) - 127;
	int r         = ((unsigned int)(mantissa) << 8) >> (31 - exponent);
	int32_t out = ((r ^ (sign)) - sign ) &~ (exponent >> 31);
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
        SetFuncStatusCode(a1, 0);
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
        SetFuncStatusCode(a1, 0);
        result = (int32_t)*(int16_t *)(&a1->interfaceType /* a1 + 196 */) | (int32_t)a1 & -0x10000;
    } else {
        result = v1 | 0xffff;
    }
    return result;
}

int32_t SetTimeoutWait(SET9052 *a1, int32_t time) {
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002d58
    g3 = v1;
    int32_t result; // 0x10002d85
    if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
        a1->ie_duration = time;
        result = (int32_t)a1 & -0x10000;
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
                *cell_modePtr = 1;
            }
            int32_t result = (int32_t)v1 | function_10001718(a1) & -0x10000; // 0x10006041
            return result;
        }
        *cell_modePtr = IE_FALSE /*0*/;
        result2 = (int32_t)v1 | function_10001718(a1) & -0x10000;
    } else {
        result2 = GetFuncStatusCode(a1);
    }
    return result2;
}

int32_t RdRBW(SET9052 *a1) {
    // entry
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100057ee
    g3 = v1;
    int32_t v2 = 0x10000 * v1; // 0x100057f6
    g6 = v2 / 0x10000;
    int32_t result;
    if ((v2 || 0xffff) < 0x1ffff) {
        // 0x10005803
        g8 = a1;
        SetFuncStatusCode(a1, 0);
        result = (int32_t)*(int16_t *)(&a1->rbw_code /*a1 + 72*/) | (int32_t)a1 & -0x10000;
        // branch -> 0x10005818
    } else {
        // 0x100057fd
        result = v1 | 0xffff;
        // branch -> 0x10005818
    }
    // 0x10005818
    return result;
}

int32_t VBWCodeFromFreq(float64_t a1, int32_t a2) {
    // entry
    g6 = 1;
    int32_t v1 = g3; // 0x1000b51a12
    int16_t v2 = 1;
    // branch -> 0x1000b52b
    int32_t v3; // 0x1000b51a
    while (true) {
        // 0x1000b52b
        if ((v1 & 0x4000) != 0) {
            // 0x1000b540
            // branch -> 0x1000b54c
            // 0x1000b54c
            return (int32_t)v2 | ((int32_t)v2 | v1 & -0x10000) & -0x10000;
        }
        int16_t v4 = v2 + 1; // 0x1000b51a
        v3 = (int32_t)v4 | v1 & -0x10000;
        int32_t v5 = v4; // 0x1000b522
        g6 = v5;
        if (v4 != 7 && v4 < 7 == (6 - v5 & v5) < 0) {
            // break -> 0x1000b54c
            break;
        }
        v1 = v3;
        v2 = v4;
        // continue -> 0x1000b52b
    }
    // 0x1000b54c
    // branch -> 0x1000b54c
    // 0x1000b54c
    return (int32_t)-3 | v3 & -0x10000;
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
    	result = a1->func_status_code | (int32_t)a1 & -0x10000;
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
        result = (int32_t)a1 & -0x10000 | v2;
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
    v3=1;
// DD XXX
    if (0x10000 * v3 != 0x10000) {
        g3 = a1;
        result = SetFuncStatusCode(a1, (int16_t)FuncStatusFromEngineReply((int16_t)v3));
        g4 = v1;
        return result;
    }
    int32_t v4 = breakMode; // 0x10004a7d
    g8 = v4;
    switch (v4) {
        default: {
            result = SetFuncStatusCode(a1, -3);
            g4 = v1;
            return result;
        }
        case STOP_NOW /* 0 */: {
            int32_t v5 = SetSwpIdx(a1, 0); // 0x10004ae1
            g3 = v5;
            if ((int16_t)v5 >= 0) {
                int32_t v6 = function_10002d12(a1, 0); // 0x10004b0b
                if (0x10000 * v6 >= 0) {
                    result = v6 & -0x10000 | 65;
                } else {
                    g8 = g8 & -0x10000 | v6 & 0xffff;
                    g3 = a1;
                    result = SetFuncStatusCode(a1, (int16_t)v6);
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
            int32_t v7 = function_10002d12(a1, a1->swp_in_prog/* *(int16_t *)(a1 + 4)*/ & -129); // 0x10004b43
            if (0x10000 * v7 >= 0) {
                result = v7 & -0x10000 | 65;
            } else {
                g8 = g8 & -0x10000 | v7 & 0xffff;
                g3 = a1;
                result = SetFuncStatusCode(a1, (int16_t)v7);
            }
            g4 = v1;
            return result;
        }
        case RESUME_SWP /*3*/: {
            int32_t v8 = function_10002d12(a1, a1->swp_in_prog/* *(int16_t *)(a1 + 4)*/ | 128); // 0x10004aac
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
    result = SetFuncStatusCode(a1, -1);
    g4 = v1;
    return result;
}

int32_t function_10002d12(SET9052 *a1, uint16_t a2) {
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002d19
    g3 = v1;
    int32_t v2 = 0x10000 * v1; // 0x10002d21
    g6 = v2 / 0x10000;
    int32_t result; // 0x10002d50
    if ((v2 || 0xffff) < 0x1ffff) {
        g3 = a1;
        g6 = a2;
        a1->swp_in_prog = a2;
        g8 = a1;
        result = SetFuncStatusCode(a1, 0);
    } else {
        g8 = a1;
        result = GetFuncStatusCode(a1);
    }
    return result;
}

int32_t SendCommand(SET9052 *a1, int32_t command, int32_t numBytes, uint16_t *wordPtr) {
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
            int32_t * v4 = (int32_t *)(v1 + 692); // 0x10003b82
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
#else
        v1 = VISA_SendCommand(a1, command, numBytes, wordPtr);
#endif
        result = (int32_t)v1 & -0x10000 | 0xffeb;
    } else {
        g8 = v1;
        result = GetFuncStatusCode(v1);
    }
    return result;
	dlog( LOG_INFO, "\n\nsa.c:SendCommand done\n");
}

int32_t FuncStatusFromEngineReply(int16_t a1) {
	//dlog( LOG_DEBUG, "FuncStatusFromEngineReply\n");
    int32_t v1 = a1; // 0x10001006
    g8 = v1;
    unsigned char v2 = *(char *)(v1 + (int32_t)&g12); // 0x1000101c
    g6 = v2;
    int32_t v3;
    switch (v2) {
        default: {
            // 0x100010f6
            v3 = 254;
            // branch -> 0x100010fc
            break;
        }
        case 0: {
            // 0x100010fc
            return 64 | v1 & -0x10000;
        }
        case 1: {
            // 0x10001034
            v3 = 65;
            // branch -> 0x100010fc
            break;
        }
        case 2: {
            // 0x1000103f
            v3 = 66;
            // branch -> 0x100010fc
            break;
        }
        case 3: {
            // 0x1000104a
            v3 = 67;
            // branch -> 0x100010fc
            break;
        }
        case 4: {
            // 0x10001055
            v3 = 68;
            // branch -> 0x100010fc
            break;
        }
        case 5: {
            // 0x10001060
            v3 = 69;
            // branch -> 0x100010fc
            break;
        }
        case 6: {
            // 0x1000106b
            v3 = 70;
            // branch -> 0x100010fc
            break;
        }
        case 7: {
            // 0x10001076
            v3 = 71;
            // branch -> 0x100010fc
            break;
        }
        case 8: {
            // 0x1000107e
            v3 = 72;
            // branch -> 0x100010fc
            break;
        }
        case 9: {
            // 0x10001086
            v3 = 73;
            // branch -> 0x100010fc
            break;
        }
        case 10: {
            // 0x1000108e
            v3 = 81;
            // branch -> 0x100010fc
            break;
        }
        case 11: {
            // 0x10001096
            v3 = 82;
            // branch -> 0x100010fc
            break;
        }
        case 12: {
            // 0x1000109e
            v3 = 83;
            // branch -> 0x100010fc
            break;
        }
        case 13: {
            // 0x100010a6
            v3 = 84;
            // branch -> 0x100010fc
            break;
        }
        case 14: {
            // 0x100010ae
            v3 = 85;
            // branch -> 0x100010fc
            break;
        }
        case 15: {
            // 0x100010b6
            v3 = 86;
            // branch -> 0x100010fc
            break;
        }
        case 16: {
            // 0x100010be
            v3 = 87;
            // branch -> 0x100010fc
            break;
        }
        case 17: {
            // 0x100010c6
            v3 = 88;
            // branch -> 0x100010fc
            break;
        }
        case 18: {
            // 0x100010ce
            v3 = 89;
            // branch -> 0x100010fc
            break;
        }
        case 19: {
            // 0x100010d6
            v3 = 90;
            // branch -> 0x100010fc
            break;
        }
        case 20: {
            // 0x100010de
            v3 = 91;
            // branch -> 0x100010fc
            break;
        }
        case 21: {
            // 0x100010e6
            v3 = 144;
            // branch -> 0x100010fc
            break;
        }
        case 22: {
            // 0x100010ee
            v3 = 145;
            // branch -> 0x100010fc
            break;
        }
    }
    // 0x100010fc
    return v3 | v1 & -0x10000;
}

int32_t CommTrigDetect(SET9052 *a1) {
	dlog( LOG_DEBUG, "CommTrigDetect\n");
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
    function_10002df9(a1, (float64_t)(int64_t)v5);
    /*int32_t*/ int16_t *v6 = /*g8 & -0x10000 | <-- what the heck does this mean?*/ a1->detect_code ; // (int32_t)*(int16_t *)(a1 + 128); // bp-24
    int32_t v7;
    int32_t v8; // 0x100016e9
    int32_t v9; // 0x100016dd
    int16_t v10; // 0x100016dd

   	// DD: Engine Command 4 is related to "set trigger ...".
	// v2 = 8 !
	// v6 is sth. like a1->detect_code, see above
	dlog( LOG_DEBUG, "detect_code: %d\n", a1->detect_code);
    dlog( LOG_DEBUG, "sweep_code: %d\n", a1->sweep_code);
    dlog( LOG_DEBUG, "num_cells: %d\n\n", a1->num_cells);

    int16 *p6 =&(a1->detect_code) ;
	dlog( LOG_DEBUG, "detect_code1: %d\n", *p6);
    dlog( LOG_DEBUG, "sweep_code1: %d\n", *(p6+1));
    dlog( LOG_DEBUG, "num_cells1: %d\n\n", *(p6+2));

    int16 *p7 = &(a1->detect_code) ;
    uint32_t ii =0;
	dlog( LOG_DEBUG, "detect_code1: %d\n", p7[ii]);
    dlog( LOG_DEBUG, "sweep_code1: %d\n", p7[ii+1]);
    dlog( LOG_DEBUG, "num_cells1: %d\n\n", p7[ii+2]);

    uint8_t *ppp = &(a1->detect_code);
	dlog( LOG_DEBUG, "detect_codeV: %d\n", *(ppp));
    dlog( LOG_DEBUG, "sweep_codeV: %d\n", *(ppp+2));
    int32 *pppp = ppp+4;
    dlog( LOG_DEBUG, "num_cellsV: %d\n\n", *(pppp));

    if ((RdSweepCode(a1) & 1) == 0) {
    	// DD: Engine Command 4 is related to "set trigger details".
    	// v2 = 8 !
    	// v6 is sth. like a1->detect_code, see above
    	// but why are sent v2=8 words?
        v9 = SendCommand(a1, ENG_SET_TRIGDET /*4*/, (int32_t)v2, ppp);
        v10 = v9;
        v7 = 0x10000 * v9;
        v8 = v7 / 0x10000;
        if (v7 == 0x130000) {
            g4 = v1;
            dlog( LOG_DEBUG, "ComTrigDetect exit 1, v7 == 0x130000\n");
            return v8 & -0x10000 | 144;
        }
        if (v10 < 20) {
            result = FuncStatusFromEngineReply(v10);
        } else {
            result = v8 & -0x10000 | 145;
        }
        g4 = v1;
        dlog( LOG_DEBUG, "ComTrigDetect exit 2\n");
        return result;
    }
    if (a1->trig_norm_flag /* *(int16_t *)(a1 + 110)*/  != IE_FALSE /*0*/) {
        dlog( LOG_DEBUG, "ComTrigDetect exit ->a1->trig_norm_flag != IE_FALSE =>  NOP ???\n");
    }

    v9 = SendCommand(a1, ENG_SET_TRIGDET /*4*/, (int32_t)v2, ppp);
    v10 = v9;
    v7 = 0x10000 * v9;
    v8 = v7 / 0x10000;
    if (v7 == 0x130000) {
        g4 = v1;
        dlog( LOG_DEBUG, "ComTrigDetect exit 1, v7 == 0x130000\n");
        return v8 & -0x10000 | 144;
    }
    if (v10 < 20) {
        result = FuncStatusFromEngineReply(v10);
    } else {
        result = v8 & -0x10000 | 145;
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
        int32_t v4 = &v3; // 0x100015aa
        g8 = v4;
        // DD Engine Command 6 is related to "set comm interupts..."
        // param 3 is sth. like 1
        // v4 =  a1->intr_code
        result = FuncStatusFromEngineReply((int16_t)SendCommand(a1, ENG_SET_INTMODE /*6*/, 1 /*(int32_t)1 | (int32_t)a1 & -0x10000*/, v4));
    } else {
        result = GetFuncStatusCode(a1);
    }
    return result;
}

int32_t function_10002df9(SET9052 *a1, float64_t triggerFreq) {
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
    if (engine_model != SA9085 /*768*/
    		&& engine_model < SA9085 /*768*/ == (767 - v4 & v4) < 0) {
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
    return result;
}

int32_t SetSwpIdx(SET9052 *a1, int32_t a2) {
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x100053d6
    g3 = v1;
    int32_t result; // 0x10005422
    if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
        if (a2 != 0) {
            int32_t v2 = RdNumDataPts(a1); // 0x100053fd
            g3 = v2;
            if (v2 < a2) {
                return v2 & -0x10000 | 0xfffd;
            }
        }
        a1->sweepIndex = a2;
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
        SetFuncStatusCode(a1, 0);
        result = (int32_t) /* *(int16_t *)(a1 + 130)*/ a1->sweep_code | (int32_t)(int32_t)a1 & -0x10000;
    } else {
        result = v1 | 0xffff;
    }
    return result;
}

int32_t RdNumDataPts(SET9052 *a1) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    int32_t result2; // 0x10005362
    if ((0x10000 * TestFuncStatusAndPtr(a1) || 0xffff) < 0x1ffff) {
        g8 = a1;
        int32_t v2 = (int32_t) /* *(int16_t *)(a1 + 4) */ a1->swp_in_prog & 127; // 0x100052e1
        g3 = v2;
        int16_t v3 = v2; // 0x100052e4
        if (v2 != 0) {
            int16_t v4 = a1->cell_mode; // *(int16_t *)(a1 + 64); // 0x100052ff
            g3 = v4;
            if (v4 == 1) {
                if (v2 != 3) {
                    g8 = v2;
                    if (v2 != 2) {
                        g3 = a1;
                        SetFuncStatusCode(a1, 0);
                        g4 = v1;
                        return a1->num_cells; // *(int32_t *)(a1 + 132);
                    }
                }
            }
            g8 = v2;
            if (v2 == 1) {
                g3 = a1;
                SetFuncStatusCode(a1, 0);
                g4 = v1;
                return a1->num_swp_pts; // *(int32_t *)(a1 + 164);
            }
            if (v3 == 2) {
                g8 = a1;
                int32_t result = a1->num_samples; // *(int32_t *)(a1 + 152); // 0x10005354
                g3 = result;
                SetFuncStatusCode(a1, 0);
                g4 = v1;
                return result;
            }
            if (v3 == 3) {
                result2 = a1->num_hop_pts; // *(int32_t *)(a1 + 172);
                g8 = result2;
                SetFuncStatusCode(a1, 0);
            } else {
                g3 = a1;
                result2 = 0x10000 * SetFuncStatusCode(a1, -14) / 0x10000;
            }
            g4 = v1;
            return result2;
        }
        SetFuncStatusCode(a1, 0);
        result2 = 0;
    } else {
        result2 = -1;
    }
    g4 = v1;
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
        SetFuncStatusCode(a1, 0);
        result = a1->ie_duration; // *(int32_t *)(a1 + 180);
    } else {
        result = -1;
    }
    return result;
}

int32_t InitTimeoutLoop(void) {
    int32_t result = IeTimer(g4); // 0x1000d4be
    g94 = result;
    return result;
}

int32_t IeTimer(int32_t a1) {
    timeBeginPeriod(1);
    int32_t result = timeGetTime(); // 0x1000ce94
    timeEndPeriod(1);
    return result;
}

void timeBeginPeriod( uint32_t v) {
}
void timeEndPeriod( uint32_t v) {
}
int32_t timeGetTime() {
	return 0;
}

int32_t IeTimerFrom(int32_t a1) {
    return function_1000ce50((int64_t)a1, IeTimer(g4));
}

int32_t function_1000ce50(int64_t a1, int32_t a2) {
    int32_t v1 = a2 + 0x52825b9 - (int32_t)a1; // 0x1000ce5b
    return (0x100000000 * (int64_t)(v1 >> 31) | (int64_t)v1) % 0x52825b9;
}

int32_t SetEngineModel(SET9052 *a1, int16_t engine_model) {
	dlog( LOG_DEBUG, "SetEngineModel\n");
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

/*------------------------------------------------------------------------------------*/
/* InitGuiSweep related code */
/*------------------------------------------------------------------------------------*/

#ifdef InitGuiSweep_is_on

int32_t SetRefLevel(SET9052 *a1, int16_t a2);
int32_t SetAutoCell(SET9052 *a1, int16_t a2);
int32_t StepSizeMode(SET9052 *a1, int16_t a2, int32_t a3);
int32_t SwpTimeMode(SET9052 *a1, int16_t a2, int32_t a3);
int32_t SetRBWmode(SET9052 *a1, int16_t a2);
int32_t SetRBW(SET9052 *a1, int16_t a2);

float80_t g159 = 0.0L; // st0
int32_t g13 = 0x1000505d;

int32_t InitGuiSweep(SET9052 *a1, int16_t a2, int32_t a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8, uint32_t a9) {
    int16_t v1 = a8;
    int16_t v2 = a3;
    if (a1 != 0) {
        // 0x10009d9a
        if ((0x10000 * FreqInRange(a1, (float64_t)(int64_t)a4) || 0xffff) >= 0x1ffff) {
            // 0x10009dbe
            if ((0x10000 * FreqInRange(a1, (float64_t)(int64_t)a6) || 0xffff) >= 0x1ffff) {
                // 0x10009de2
                if (a9 >= 1) {
                    // 0x10009de8
                    if (a9 <= 0xffff) {
                        // 0x10009dfa
                        if ((int16_t)SetAutoCell(a1, 0) == 0) {
                            // 0x10009e1d
                            if ((int16_t)SetCellMode(a1, 1) == 0) {
                                // 0x10009e40
                                if ((int16_t)StepSizeMode(a1, 1, 0) == 0) {
                                    // 0x10009e63
                                    if ((int16_t)SwpTimeMode(a1, 1, 0) == 0) {
                                        // 0x10009e86
                                        int32_t result; // 0x1000a0cf
                                        int32_t v3; // 0x10009f69
                                        int32_t v4; // 0x1000a0bb
                                        int32_t v5; // 0x1000a0af
                                        if (a2 != 5) {
                                            int32_t v6 = SetRBWmode(a1, 0); // 0x10009eba
                                            if ((int16_t)v6 != 0) {
                                                // 0x10009ece
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v6 / 0x10000 | 0xffff;
                                            }
                                            int32_t v7 = SetRBW(a1, a2); // 0x10009ee0
                                            int32_t v8 = 0x10000 * v7;
                                            int32_t v9 = v8 / 0x10000; // 0x10009eec
                                            if ((int16_t)v7 != 0) {
                                                // 0x10009ef4
                                                if (v8 != -0x30000) {
                                                    // 0x10009f06
                                                    result = v9 | 0xffff;
                                                    // branch -> 0x1000a0cc
                                                } else {
                                                    // 0x10009efd
                                                    result = v9;
                                                    // branch -> 0x1000a0cc
                                                }
                                                // 0x1000a0cc
                                                return result;
                                            }
                                            // 0x10009f0f
                                            int32_t v10; // 0x1000a003
                                            int32_t v11; // 0x1000a026
                                            int32_t v12; // 0x10009fb8
                                            int32_t v13; // 0x10009fde
                                            int32_t v14; // 0x1000a06d
                                            int32_t v15; // 0x1000a08d
                                            int32_t v16; // 0x1000a04f
                                            if (0x10000 * a3 == 0x80000) {
                                                int32_t v17 = SetVBWmode(a1, 1); // 0x10009f1e
                                                if ((int16_t)v17 != 0) {
                                                    // 0x10009f32
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v17 / 0x10000 | 0xffff;
                                                }
                                                // 0x10009f98
                                                ConfigStartFreq(a1, a4, 0x10000 * a5 / 0x10000);
                                                v12 = ConfigStopFreq(a1, a6, 0x10000 * a7 / 0x10000);
                                                if ((int16_t)v12 != 0) {
                                                    // 0x10009fcc
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v12 / 0x10000 | 0xffff;
                                                }
                                                // 0x10009fd5
                                                v13 = SetRefLevel(a1, v1);
                                                if ((int16_t)v13 < 0) {
                                                    // 0x10009ff2
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v13 / 0x10000 | 0xffff;
                                                }
                                                // 0x10009ffb
                                                v10 = SetNumCells(a1, 0x10000 * a9 / 0x10000);
                                                if ((int16_t)v10 != 0) {
                                                    // 0x1000a017
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v10 / 0x10000 | 0xffff;
                                                }
                                                // 0x1000a020
                                                v11 = SetSwpIdx(a1, 0);
                                                if ((int16_t)v11 != 0) {
                                                    // 0x1000a03a
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v11 / 0x10000 | 0xffff;
                                                }
                                                // 0x1000a043
                                                v16 = SetDefltPts(a1, 501, 0);
                                                if ((int16_t)v16 != 0) {
                                                    // 0x1000a063
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v16 / 0x10000 | 0xffff;
                                                }
                                                // 0x1000a069
                                                v14 = SetDetectLog(a1, 0);
                                                if ((int16_t)v14 != 0) {
                                                    // 0x1000a081
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v14 / 0x10000 | 0xffff;
                                                }
                                                // 0x1000a087
                                                v15 = SetSweepCode(a1, 5);
                                                if ((int16_t)v15 != 0) {
                                                    // 0x1000a0a1
                                                    // branch -> 0x1000a0cc
                                                    // 0x1000a0cc
                                                    return 0x10000 * v15 / 0x10000 | 0xffff;
                                                }
                                                // 0x1000a0a7
                                                v5 = SetTrigMode(a1, 0, 1, 0);
                                                v4 = 0x10000 * v5 / 0x10000;
                                                if ((int16_t)v5 == 0) {
                                                    // 0x1000a0c9
                                                    result = v4 & -0x10000;
                                                    // branch -> 0x1000a0cc
                                                } else {
                                                    // 0x1000a0c3
                                                    result = v4 | 0xffff;
                                                    // branch -> 0x1000a0cc
                                                }
                                                // 0x1000a0cc
                                                return result;
                                            }
                                            int32_t v18 = SetVBWmode(a1, 0); // 0x10009f43
                                            if ((int16_t)v18 != 0) {
                                                // 0x10009f57
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v18 / 0x10000 | 0xffff;
                                            }
                                            // 0x10009f60
                                            g6 = a1;
                                            v3 = SetVBW(a1, v2);
                                            int32_t v19 = 0x10000 * v3;
                                            int32_t v20 = v19 / 0x10000; // 0x10009f75
                                            if ((int16_t)v3 != 0) {
                                                // 0x10009f7d
                                                if (v19 != -0x30000) {
                                                    // 0x10009f8f
                                                    result = v20 | 0xffff;
                                                    // branch -> 0x1000a0cc
                                                } else {
                                                    // 0x10009f86
                                                    result = v20;
                                                    // branch -> 0x1000a0cc
                                                }
                                                // 0x1000a0cc
                                                return result;
                                            }
                                            // 0x10009f98
                                            ConfigStartFreq(a1, a4, 0x10000 * a5 / 0x10000);
                                            v12 = ConfigStopFreq(a1, a6, 0x10000 * a7 / 0x10000);
                                            if ((int16_t)v12 != 0) {
                                                // 0x10009fcc
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v12 / 0x10000 | 0xffff;
                                            }
                                            // 0x10009fd5
                                            v13 = SetRefLevel(a1, v1);
                                            if ((int16_t)v13 < 0) {
                                                // 0x10009ff2
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v13 / 0x10000 | 0xffff;
                                            }
                                            // 0x10009ffb
                                            v10 = SetNumCells(a1, 0x10000 * a9 / 0x10000);
                                            if ((int16_t)v10 != 0) {
                                                // 0x1000a017
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v10 / 0x10000 | 0xffff;
                                            }
                                            // 0x1000a020
                                            v11 = SetSwpIdx(a1, 0);
                                            if ((int16_t)v11 != 0) {
                                                // 0x1000a03a
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v11 / 0x10000 | 0xffff;
                                            }
                                            // 0x1000a043
                                            v16 = SetDefltPts(a1, 501, 0);
                                            if ((int16_t)v16 != 0) {
                                                // 0x1000a063
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v16 / 0x10000 | 0xffff;
                                            }
                                            // 0x1000a069
                                            v14 = SetDetectLog(a1, 0);
                                            if ((int16_t)v14 != 0) {
                                                // 0x1000a081
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v14 / 0x10000 | 0xffff;
                                            }
                                            // 0x1000a087
                                            v15 = SetSweepCode(a1, 5);
                                            if ((int16_t)v15 != 0) {
                                                // 0x1000a0a1
                                                // branch -> 0x1000a0cc
                                                // 0x1000a0cc
                                                return 0x10000 * v15 / 0x10000 | 0xffff;
                                            }
                                            // 0x1000a0a7
                                            v5 = SetTrigMode(a1, 0, 1, 0);
                                            v4 = 0x10000 * v5 / 0x10000;
                                            if ((int16_t)v5 == 0) {
                                                // 0x1000a0c9
                                                result = v4 & -0x10000;
                                                // branch -> 0x1000a0cc
                                            } else {
                                                // 0x1000a0c3
                                                result = v4 | 0xffff;
                                                // branch -> 0x1000a0cc
                                            }
                                            // 0x1000a0cc
                                            return result;
                                        }
                                        int32_t v21 = SetRBWmode(a1, 1); // 0x10009e95
                                        if ((int16_t)v21 != 0) {
                                            // 0x10009ea9
                                            // branch -> 0x1000a0cc
                                            // 0x1000a0cc
                                            return 0x10000 * v21 / 0x10000 | 0xffff;
                                        }
                                        // 0x10009f0f
                                        if (0x10000 * a3 != 0x80000) {
                                            // 0x10009f3d
                                            if ((int16_t)SetVBWmode(a1, 0) == 0) {
                                                // 0x10009f60
                                                g6 = a1;
                                                v3 = SetVBW(a1, v2);
                                                if ((int16_t)v3 == 0) {
                                                    // 0x10009f98
                                                    ConfigStartFreq(a1, a4, 0x10000 * a5 / 0x10000);
                                                    if ((int16_t)ConfigStopFreq(a1, a6, 0x10000 * a7 / 0x10000) == 0) {
                                                        // 0x10009fd5
                                                        if ((int16_t)SetRefLevel(a1, v1) >= 0) {
                                                            // 0x10009ffb
                                                            if ((int16_t)SetNumCells(a1, 0x10000 * a9 / 0x10000) == 0) {
                                                                // 0x1000a020
                                                                if ((int16_t)SetSwpIdx(a1, 0) == 0) {
                                                                    // 0x1000a043
                                                                    if ((int16_t)SetDefltPts(a1, 501, 0) == 0) {
                                                                        // 0x1000a069
                                                                        if ((int16_t)SetDetectLog(a1, 0) == 0) {
                                                                            // 0x1000a087
                                                                            if ((int16_t)SetSweepCode(a1, 5) == 0) {
                                                                                // 0x1000a0a7
                                                                                v5 = SetTrigMode(a1, 0, 1, 0);
                                                                                v4 = 0x10000 * v5 / 0x10000;
                                                                                if ((int16_t)v5 == 0) {
                                                                                    // 0x1000a0c9
                                                                                    result = v4 & -0x10000;
                                                                                    // branch -> 0x1000a0cc
                                                                                } else {
                                                                                    // 0x1000a0c3
                                                                                    result = v4 | 0xffff;
                                                                                    // branch -> 0x1000a0cc
                                                                                }
                                                                                // 0x1000a0cc
                                                                                return result;
                                                                            }
                                                                            // 0x1000a0a1
                                                                            // branch -> 0x1000a0cc
                                                                            // Detected a possible infinite recursion (goto support failed); quitting...
                                                                        }
                                                                        // Detected a possible infinite recursion (goto support failed); quitting...
                                                                    }
                                                                    // Detected a possible infinite recursion (goto support failed); quitting...
                                                                }
                                                                // Detected a possible infinite recursion (goto support failed); quitting...
                                                            }
                                                            // Detected a possible infinite recursion (goto support failed); quitting...
                                                        }
                                                        // Detected a possible infinite recursion (goto support failed); quitting...
                                                    }
                                                    // Detected a possible infinite recursion (goto support failed); quitting...
                                                } else {
                                                    // 0x10009f7d
                                                    if (0x10000 * v3 != -0x30000) {
                                                        // 0x10009f8f
                                                        // branch -> 0x1000a0cc
                                                    }
                                                    // Detected a possible infinite recursion (goto support failed); quitting...
                                                }
                                                // Detected a possible infinite recursion (goto support failed); quitting...
                                            }
                                            // Detected a possible infinite recursion (goto support failed); quitting...
                                        } else {
                                            // 0x10009f18
                                            if ((int16_t)SetVBWmode(a1, 1) != 0) {
                                                // 0x10009f32
                                                // branch -> 0x1000a0cc
                                                // Detected a possible infinite recursion (goto support failed); quitting...
                                            }
                                        }
                                        // 0x10009f98
                                        ConfigStartFreq(a1, a4, 0x10000 * a5 / 0x10000);
                                        if ((int16_t)ConfigStopFreq(a1, a6, 0x10000 * a7 / 0x10000) == 0) {
                                            // 0x10009fd5
                                            if ((int16_t)SetRefLevel(a1, v1) >= 0) {
                                                // 0x10009ffb
                                                if ((int16_t)SetNumCells(a1, 0x10000 * a9 / 0x10000) == 0) {
                                                    // 0x1000a020
                                                    if ((int16_t)SetSwpIdx(a1, 0) == 0) {
                                                        // 0x1000a043
                                                        if ((int16_t)SetDefltPts(a1, 501, 0) == 0) {
                                                            // 0x1000a069
                                                            if ((int16_t)SetDetectLog(a1, 0) == 0) {
                                                                // 0x1000a087
                                                                if ((int16_t)SetSweepCode(a1, 5) == 0) {
                                                                    // 0x1000a0a7
                                                                    if ((int16_t)SetTrigMode(a1, 0, 1, 0) == 0) {
                                                                        // 0x1000a0c9
                                                                        // branch -> 0x1000a0cc
                                                                    }
                                                                    // Detected a possible infinite recursion (goto support failed); quitting...
                                                                }
                                                                // Detected a possible infinite recursion (goto support failed); quitting...
                                                            }
                                                            // Detected a possible infinite recursion (goto support failed); quitting...
                                                        }
                                                        // Detected a possible infinite recursion (goto support failed); quitting...
                                                    }
                                                    // Detected a possible infinite recursion (goto support failed); quitting...
                                                }
                                                // Detected a possible infinite recursion (goto support failed); quitting...
                                            }
                                            // Detected a possible infinite recursion (goto support failed); quitting...
                                        }
                                        // Detected a possible infinite recursion (goto support failed); quitting...
                                    }
                                    // Detected a possible infinite recursion (goto support failed); quitting...
                                }
                                // Detected a possible infinite recursion (goto support failed); quitting...
                            }
                            // Detected a possible infinite recursion (goto support failed); quitting...
                        }
                        // Detected a possible infinite recursion (goto support failed); quitting...
                    }
                }
                // 0x10009df1
                // branch -> 0x1000a0cc
            }
            // Detected a possible infinite recursion (goto support failed); quitting...
        }
        // Detected a possible infinite recursion (goto support failed); quitting...
    }
    // Detected a possible infinite recursion (goto support failed); quitting...
}

int32_t FreqInRange(SET9052 * a1, float64_t a2) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10008a07
    g3 = v2;
    int32_t result;
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        // 0x10008a1c
        g8 = a1;
        SetFuncStatusCode(a1, 0);
        RdMinFreqLimit(a1);
        g11++;
        int32_t v3 = RdMaxFreqLimit(a1); // 0x10008a3d
        int32_t v4 = g11 + 1; // 0x10008a45
        g11 = v4;
        if ((v3 & 256) == 0) {
            // 0x10008a55
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
}

int32_t RdMaxFreqLimit(SET9052 *a1) {
    g3 = a1;
    int32_t result = TestFuncStatusAndPtr(a1); // 0x10008770
    g3 = result;
    if ((0x10000 * result || 0xffff) >= 0x1ffff) {
        g159 = -1.0L;
        g11--;
        return result;
    }
    g8 = a1;
    SetFuncStatusCode(a1, 0);
    int32_t result4 = RdEngineModel(a1); // 0x10008799
    g3 = result4;
    int32_t v1 = 0x10000 * result4; // 0x100087a1
    int32_t v2 = v1 / 0x10000; // 0x100087a1
    int32_t result3; // 0x100087f6
    if (v1 != 0x3000000 && v1 < 0x3000000 == (767 - v2 & v2) < 0) {
        int32_t result2; // 0x10008807
        if (v1 == 0x4000000) {
            g159 = 3.4e+9L;
            g11--;
            result2 = result4;
        } else {
            g8 = a1;
            result3 = SetFuncStatusCode(a1, -13);
            g159 = -1.0L;
            g11--;
            result2 = result3;
        }
        return result2;
    }
    if (v1 == 0x3000000) {
        g159 = 8.5e+9L;
        g11--;
    } else {
        if (v1 != 0x1000000) {
            if (v1 != 0x2000000) {
                g8 = a1;
                result3 = SetFuncStatusCode(a1, -13);
                g159 = -1.0L;
                g11--;
                return result3;
            }
        }
        g159 = 1.6e+9L;
        g11--;
    }
    return result4;
}

int32_t RdMinFreqLimit(SET9052 *a1) {
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
        if (v4 != 0x3000000 && v4 < 0x3000000 == (767 - v5 & v5) < 0) {
            if (v4 != 0x4000000) {
                result = SetFuncStatusCode(a1, -13);
                g159 = -1.0L;
                g11--;
                g4 = v1;
                return result;
            }
        } else {
            if (v4 != 0x3000000) {
                if (v4 != 0x1000000) {
                    if (v4 != 0x2000000) {
                        result = SetFuncStatusCode(a1, -13);
                        g159 = -1.0L;
                        g11--;
                        g4 = v1;
                        return result;
                    }
                }
            }
        }
        g3 = a1;
        g159 = 1.0e+5L;
        g11--;
        result2 = SetFuncStatusCode(a1, 0);
    } else {
        g8 = a1;
        int32_t v6 = 0x10000 * GetFuncStatusCode(a1) / 0x10000; // 0x1000882d
        g159 = v6;
        g11--;
        result2 = v6;
    }
    g4 = v1;
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
        SetFuncStatusCode(a1, 0);
        //result = (int32_t)*(int16_t *)(a1 + 2) | a1 & -0x10000;
        a1->engine_model; // | (int32_t) a1 & -0x10000;
    } else {
        result = v1 & -0x10000;
    }
    return result;
}

int32_t SetDetectLog(SET9052 *a1, int32_t a2) {
    // entry
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10005bd1
    g3 = v1;
    int32_t result; // 0x10005c51
    if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
        // 0x10005be0
        result = GetFuncStatusCode(a1);
        // branch -> 0x10005c4e
        // 0x10005c4e
        return result;
    }
    int16_t * v2 = (int16_t *)(a1 + 128); // 0x10005bf1
    int32_t v3 = (int32_t)*v2 | 6; // 0x10005bfb
    *v2 = (int16_t)v3;
    *v2 = (int16_t)(v3 & -42);
    int32_t v4 = SetRefLevel(a1, *(int16_t *)(a1 + 98)); // 0x10005c31
    int32_t v5 = 0x10000 * v4 / 0x10000; // 0x10005c3d
    if ((int16_t)v4 >= 0) {
        // 0x10005c4b
        result = v5 & -0x10000;
        // branch -> 0x10005c4e
    } else {
        // 0x10005c45
        result = v5 & -0x10000 | 0xfff1;
        // branch -> 0x10005c4e
    }
    // 0x10005c4e
    return result;
}

int32_t SetRefLevel(SET9052 *a1, int16_t a2) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    int32_t v2 = g9; // 0x100063ec
    g3 = a1;
    int32_t v3 = TestFuncStatusAndPtr(a1); // 0x100063f7
    g3 = v3;
    int32_t result; // 0x1000664a
    if ((0x10000 * v3 || 0xffff) < 0x1ffff) {
        // 0x10006417
        *(int16_t *)(a1 + 98) = a2;
        int32_t v4 = 0x10000 * RdDetect(a1); // 0x1000642e
        int32_t v5 = a2; // 0x10006560
        int32_t v6 = 0x10000 * RdMaxAttLimit(a1) / 0x10000 - 40; // 0x10006573
        g8 = v6;
        int32_t v7; // eax
        int16_t v8;
        int32_t v9;
        if (v4 != 0x200000) {
            // 0x10006560
            int16_t v10;
            int32_t v11;
            if ((int16_t)v5 > (int16_t)v6) {
                // 0x1000657a
                v10 = 0x10000 * RdMaxAttLimit(a1) / 0x10000 + 0xffd8;
                v11 = 1;
                // branch -> 0x100065d4
            } else {
                // 0x10006598
                g8 = v5;
                if (a2 < -40) {
                    // 0x100065b5
                    g8 = 0;
                    v10 = -40;
                    v11 = 1;
                    // branch -> 0x100065d4
                } else {
                    v10 = a2;
                    v11 = 0;
                }
            }
            int32_t v12 = (int32_t)v10 + 40; // 0x100065d8
            int16_t * v13; // 0x10006606
            if (v10 < -40) {
                // 0x100065dd
                if (*(int16_t *)(a1 + 100) != 0) {
                    // 0x100065f8
                    *(int16_t *)(a1 + 102) = 1;
                    v13 = (int16_t *)(a1 + 128);
                    *v13 = *v13 | 64;
                    *(int16_t *)(a1 + 96) = (int16_t)v12;
                    v8 = v10;
                    // branch -> 0x10006637
                    // 0x10006637
                    *(int16_t *)(a1 + 106) = v8;
                    // branch -> 0x10006646
                    // 0x10006646
                    g9 = v2;
                    g4 = v1;
                    return (v12 & -0x10000 | (int32_t)v8) & -0x10000 | v11 & 0xffff;
                }
            }
            // 0x100065f1
            // branch -> 0x100065f8
            // 0x100065f8
            *(int16_t *)(a1 + 102) = 0;
            v13 = (int16_t *)(a1 + 128);
            *v13 = *v13 | 64;
            v7 = v12;
            *(int16_t *)(a1 + 96) = (int16_t)v12;
            v8 = v10;
            v9 = v11;
            // branch -> 0x10006637
        } else {
            // 0x1000643a
            int16_t v14;
            int32_t v15;
            if ((int16_t)v5 > (int16_t)v6) {
                // 0x10006454
                v14 = 0x10000 * RdMaxAttLimit(a1) / 0x10000 + 0xffd8;
                v15 = 1;
                // branch -> 0x100064ae
            } else {
                // 0x10006472
                g8 = v5;
                if (a2 < -70) {
                    // 0x1000648f
                    g8 = 0;
                    v14 = -70;
                    v15 = 1;
                    // branch -> 0x100064ae
                } else {
                    v14 = a2;
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
                // 0x100064b7
                if (*(int16_t *)(a1 + 100) != 0) {
                    // 0x100064d2
                    *(int16_t *)(a1 + 102) = 1;
                    v19 = RdMaxAttLimit(a1);
                    v21 = (int16_t *)(a1 + 128);
                    v22 = *v21;
                    v23 = v22;
                    v20 = v22;
                    if ((int16_t)v16 > (int16_t)(0x10000 * v19 / 0x10000 + 0xffba)) {
                        // 0x100064f7
                        v18 = (int32_t)(v20 & -65) | v23 & -256;
                        // branch -> 0x10006525
                    } else {
                        // 0x1000650f
                        v18 = (int32_t)(v20 | 64) | v23 & -256;
                        // branch -> 0x10006525
                    }
                    // 0x10006525
                    *v21 = (int16_t)v18;
                    g8 = a1;
                    RdLinearAttn(a1);
                    *(int16_t *)(a1 + 96) = (int16_t)v17;
                    v8 = v14;
                    // branch -> 0x10006637
                    // 0x10006637
                    *(int16_t *)(a1 + 106) = v8;
                    // branch -> 0x10006646
                    // 0x10006646
                    g9 = v2;
                    g4 = v1;
                    return ((int32_t)a1 & -0x10000 | (int32_t)v8) & -0x10000 | v15 & 0xffff;
                }
            }
            // 0x100064cb
            // branch -> 0x100064d2
            // 0x100064d2
            *(int16_t *)(a1 + 102) = 0;
            v19 = RdMaxAttLimit(a1);
            v21 = (int16_t *)(a1 + 128);
            v22 = *v21;
            v23 = v22;
            v20 = v22;
            if ((int16_t)v16 > (int16_t)(0x10000 * v19 / 0x10000 + 0xffba)) {
                // 0x100064f7
                v18 = (int32_t)(v20 & -65) | v23 & -256;
                // branch -> 0x10006525
            } else {
                // 0x1000650f
                v18 = (int32_t)(v20 | 64) | v23 & -256;
                // branch -> 0x10006525
            }
            // 0x10006525
            *v21 = (int16_t)v18;
            g8 = a1;
            RdLinearAttn(a1);
            v7 = a1;
            *(int16_t *)(a1 + 96) = (int16_t)v17;
            v8 = v14;
            v9 = v15;
            // branch -> 0x10006637
        }
        // 0x10006637
        *(int16_t *)(a1 + 106) = v8;
        int32_t v24 = v7 & -0x10000 | (int32_t)v8; // 0x10006642
        result = v24 & -0x10000 | v9 & 0xffff;
        // branch -> 0x10006646
    } else {
        // 0x10006406
        result = GetFuncStatusCode(a1);
        // branch -> 0x10006646
    }
    // 0x10006646
    g9 = v2;
    g4 = v1;
    return result;
}

int32_t RdMaxAttLimit(SET9052 *a1) {
    // entry
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10006366
    g3 = v1;
    if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
        // 0x10006375
        // branch -> 0x100063e2
        // 0x100063e2
        return v1 | 0xffff;
    }
    // 0x1000637b
    g8 = a1;
    SetFuncStatusCode(a1, 0);
    g3 = a1;
    int16_t v2 = *(int16_t *)(a1 + 2); // 0x1000638c
    int32_t v3 = v2; // 0x1000638c
    int32_t result; // 0x100063e5
    if (v2 != 768 && v2 < 768 == (767 - v3 & v3) < 0) {
        // 0x100063b9
        if (v2 == 1024) {
            // 0x100063c4
            result = (int32_t)a1 & -0x10000 | 60;
            // branch -> 0x100063e2
        } else {
            // 0x100063d0
            g8 = a1;
            result = SetFuncStatusCode(a1, -13) | 0xffff;
            // branch -> 0x100063e2
        }
        // 0x100063e2
        return result;
    }
    // 0x1000639c
    if (v2 == 768) {
        // 0x100063ca
        result = (int32_t)a1 & -0x10000 | 70;
        // branch -> 0x100063e2
    } else {
        // 0x100063a5
        if (v2 != 256) {
            // 0x100063ae
            if (v2 != 512) {
                // 0x100063d0
                g8 = a1;
                int32_t result2 = SetFuncStatusCode(a1, -13) | 0xffff; // 0x100063de
                // branch -> 0x100063e2
                // 0x100063e2
                return result2;
            }
        }
        // 0x100063c4
        result = (int32_t)a1 & -0x10000 | 60;
        // branch -> 0x100063e2
    }
    // 0x100063e2
    return result;
}

int32_t RdDetect(SET9052 *a1) {
    int16_t v1 = 0; // bp-8
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005d72
    g3 = v2;
    int32_t result; // 0x10005de9
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        int16_t * v3 = (int16_t *)(a1 + 128); // 0x10005d92
        if ((*v3 & 2) != 0) {
            // 0x10005da0
            v1 = 2;
            // branch -> 0x10005da6
        }
        // 0x10005da6
        if ((*v3 & 32) != 0) {
            // 0x10005db7
            v1 = 32;
            // branch -> 0x10005dbd
        }
        int32_t v4 = (int32_t)*v3 & 8; // 0x10005dc7
        g8 = v4;
        if (v4 != 0) {
            // 0x10005dce
            v1 = 8;
            // branch -> 0x10005dd4
        }
        // 0x10005dd4
        g3 = a1;
        result = (int32_t)v1 | SetFuncStatusCode(a1, 0) & -0x10000;
        // branch -> 0x10005de6
    } else {
        // 0x10005d81
        result = GetFuncStatusCode(a1);
        // branch -> 0x10005de6
    }
    // 0x10005de6
    return result;
}

int32_t RdLinearAttn(SET9052 *a1) {
    // entry
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10002cd3
    g3 = v1;
    int32_t result; // 0x10002d11
    if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
        // 0x10002cf0
        g3 = a1;
        SetFuncStatusCode(a1, 0);
        result = ((int32_t)*(int16_t *)(a1 + 128) & 64) / 64 + 1;
        // branch -> 0x10002d10
    } else {
        // 0x10002ce2
        result = GetFuncStatusCode(a1);
        // branch -> 0x10002d10
    }
    // 0x10002d10
    return result;
}

int32_t SetAutoCell(SET9052 *a1, int16_t a2) {
    int16_t v1 = 0; // bp-8
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10006090
    g3 = v2;
    int32_t result; // 0x100060ea
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        int32_t v3 = a2; // eax
        if (a2 != 0) {
            // 0x100060c0
            if (a2 != 1) {
                // 0x100060d4
                *(int16_t *)(a1 + 66) = 1;
                v1 = -1;
                // branch -> 0x100060e3
            } else {
                // 0x100060c9
                v3 = a1;
                *(int16_t *)(a1 + 66) = 1;
                // branch -> 0x100060e3
            }
            // 0x100060e3
            // branch -> 0x100060e7
            // 0x100060e7
            return v3 & -0x10000 | (int32_t)v1;
        }
        // 0x100060b5
        *(int16_t *)(a1 + 66) = 0;
        // branch -> 0x100060e3
        // 0x100060e3
        result = v3 & -0x10000 | (int32_t)v1;
        // branch -> 0x100060e7
    } else {
        // 0x1000609f
        result = GetFuncStatusCode(a1);
        // branch -> 0x100060e7
    }
    // 0x100060e7
    return result;
}

int32_t StepSizeMode(SET9052 *a1, int16_t a2, int32_t a3) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005015
    g3 = v2;
    int32_t result; // 0x100050c5
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
#ifdef ORIG
        int32_t v3 = *(int32_t *)(4 * (int32_t)a2 + (int32_t)&g13); // 0x10005045
        __pseudo_branch(v3);
#else
        dlog( LOG_DEBUG, "StepSizeMode() - TBI\n");
#endif
        *(int16_t *)(a1 + 32) = 1;
        result = function_10001718(a1) & -0x10000 | 1;
        // branch -> 0x100050c2
    } else {
        // 0x10005024
        result = GetFuncStatusCode(a1);
        // branch -> 0x100050c2
    }
    // 0x100050c2
    g4 = v1;
    return result;
}

int32_t SwpTimeMode(SET9052 *a1, int16_t a2, int32_t a3) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005433
    g3 = v2;
    int32_t result; // 0x100054cf
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        // 0x10005450
        if (*(int32_t *)(a1 + 36) >= 1) {
            // 0x10005459
            if (a2 != 1) {
                // 0x100054c8
                // branch -> 0x100054cc
                // 0x100054cc
                g4 = v1;
                return 0xfff9 | (int32_t)a1 & -0x10000;
            }
        }
        // 0x1000546a
        int32_t v3;
        switch ((int32_t)a2) {
            default: {
                // 0x100054ad
                *(int16_t *)(a1 + 34) = 1;
                v3 = 1;
                // branch -> 0x100054bc
                break;
            }
            case 0: {
                // 0x1000548c
                *(int16_t *)(a1 + 34) = 0;
                v3 = 0;
                // branch -> 0x100054bc
                break;
            }
            case 1: {
                // 0x10005481
                *(int16_t *)(a1 + 34) = 1;
                v3 = 0;
                // branch -> 0x100054bc
                break;
            }
            case 2: {
                // 0x10005497
                *(int16_t *)(a1 + 34) = 2;
                v3 = 0;
                // branch -> 0x100054bc
                break;
            }
            case 3: {
                // 0x100054a2
                *(int16_t *)(a1 + 34) = 3;
                v3 = 0;
                // branch -> 0x100054bc
                break;
            }
        }
        // 0x100054bc
        // branch -> 0x100054c8
        // 0x100054c8
        result = v3 & 0xffff | function_10001b13(a1) & -0x10000;
        // branch -> 0x100054cc
    } else {
        // 0x10005442
        result = GetFuncStatusCode(a1);
        // branch -> 0x100054cc
    }
    // 0x100054cc
    g4 = v1;
    return result;
}

int32_t SetRBWmode(SET9052 *a1, int16_t a2) {
    int16_t v1 = 0; // bp-8
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005828
    g3 = v2;
    int32_t result; // 0x1000589b
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        // 0x10005845
        int32_t v3; // 0x10005894
        if (a2 != 0) {
            // 0x10005858
            if (a2 != 1) {
                // 0x10005861
                v1 = 1;
                // branch -> 0x10005867
            }
            // 0x10005867
            *(int16_t *)(a1 + 74) = 1;
            function_10001d01(a1);
            function_10001718(a1);
            v3 = function_10001b13(a1);
            // branch -> 0x10005894
        } else {
            // 0x1000584d
            *(int16_t *)(a1 + 74) = 0;
            v3 = a2;
            // branch -> 0x10005894
        }
        // 0x10005894
        result = (int32_t)v1 | v3 & -0x10000;
        // branch -> 0x10005898
    } else {
        // 0x10005837
        result = GetFuncStatusCode(a1);
        // branch -> 0x10005898
    }
    // 0x10005898
    return result;
}

int32_t function_10001d01(int32_t a1) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    g8 = a1;
    int32_t v2 = 0x10000 * TestFuncStatusAndPtr(a1); // 0x10001d2d
    int32_t result = v2 / 0x10000; // 0x10001e97
    if ((v2 || 0xffff) < 0x1ffff) {
        int16_t v3 = *(int16_t *)(a1 + 74); // 0x10001d3c
        g8 = v3;
        if (v3 != 0) {
            float64_t v4 = *(float64_t *)(a1 + 16); // 0x10001d4f
            float64_t v5 = *(float64_t *)(a1 + 8); // 0x10001d52
            float64_t v6 = (float80_t)v5 - (float80_t)v4; // 0x10001d55
            int16_t * v7 = (int16_t *)(a1 + 64); // 0x10001d5b
            float64_t v8;
            if (*v7 != 0) {
                // 0x10001d83
                if (*v7 == 1) {
                    int32_t v9 = *(int32_t *)(a1 + 168); // 0x10001d92
                    v8 = (float80_t)(v9 - 1) / (float80_t)v6;
                    // branch -> 0x10001dad
                } else {
                    v8 = 0.0;
                }
            } else {
                int32_t v10 = *(int32_t *)(a1 + 164) - 1; // 0x10001d72
                v8 = (float80_t)v10 / (float80_t)v6;
                // branch -> 0x10001dad
            }
            int32_t v11 = GetRBWwide(0); // 0x10001daf
            int32_t v12 = (0x100000000 * (int64_t)(v11 >> 31) | (int64_t)v11) / 3; // 0x10001dbd
            int16_t v13; // 0x10001e7f
            if ((v12 & 256) == 0) {
                // 0x10001dcf
                *(int16_t *)(a1 + 72) = 0;
                // branch -> 0x10001e6d
                // 0x10001e6d
                *(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
                *(int32_t *)(a1 + 28) = 0;
                v13 = *(int16_t *)(a1 + 78);
                g8 = v13;
                if (v13 != 1) {
                    // 0x10001e6d
                    result = 0;
                    // branch -> 0x10001e94
                } else {
                    // 0x10001e88
                    result = function_10001e98(a1);
                    // branch -> 0x10001e94
                }
                // 0x10001e94
                g4 = v1;
                return result;
            }
            int32_t v14 = GetRBWwide(1); // 0x10001ddf
            int32_t v15 = (0x100000000 * (int64_t)(v14 >> 31) | (int64_t)v14) / 3; // 0x10001ded
            if ((v15 & 256) == 0) {
                // 0x10001dff
                *(int16_t *)(a1 + 72) = 1;
                // branch -> 0x10001e6d
                // 0x10001e6d
                *(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
                *(int32_t *)(a1 + 28) = 0;
                v13 = *(int16_t *)(a1 + 78);
                g8 = v13;
                if (v13 != 1) {
                    // 0x10001e6d
                    result = 0;
                    // branch -> 0x10001e94
                } else {
                    // 0x10001e88
                    result = function_10001e98(a1);
                    // branch -> 0x10001e94
                }
                // 0x10001e94
                g4 = v1;
                return result;
            }
            int32_t v16 = GetRBWwide(2); // 0x10001e0c
            int32_t v17 = (0x100000000 * (int64_t)(v16 >> 31) | (int64_t)v16) / 3; // 0x10001e1a
            if ((v17 & 256) == 0) {
                // 0x10001e2c
                *(int16_t *)(a1 + 72) = 2;
                // branch -> 0x10001e6d
                // 0x10001e6d
                *(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
                *(int32_t *)(a1 + 28) = 0;
                v13 = *(int16_t *)(a1 + 78);
                g8 = v13;
                if (v13 != 1) {
                    // 0x10001e6d
                    result = 0;
                    // branch -> 0x10001e94
                } else {
                    // 0x10001e88
                    result = function_10001e98(a1);
                    // branch -> 0x10001e94
                }
                // 0x10001e94
                g4 = v1;
                return result;
            }
            int32_t v18 = GetRBWwide(3); // 0x10001e39
            int32_t v19 = (0x100000000 * (int64_t)(v18 >> 31) | (int64_t)v18) / 3; // 0x10001e47
            if ((v19 & 256) != 0) {
                // 0x10001e64
                *(int16_t *)(a1 + 72) = 4;
                // branch -> 0x10001e6d
            } else {
                // 0x10001e59
                *(int16_t *)(a1 + 72) = 3;
                // branch -> 0x10001e6d
            }
            // 0x10001e6d
            *(int32_t *)(a1 + 24) = (int32_t)(float32_t)v8;
            *(int32_t *)(a1 + 28) = 0;
            v13 = *(int16_t *)(a1 + 78);
            g8 = v13;
            if (v13 != 1) {
                // 0x10001e6d
                result = 0;
                // branch -> 0x10001e94
            } else {
                // 0x10001e88
                result = function_10001e98(a1);
                // branch -> 0x10001e94
            }
            // 0x10001e94
            g4 = v1;
            return result;
        }
        result = 0;
    }
    // 0x10001e94
    g4 = v1;
    return result;
}

int32_t function_10001e98(int32_t a1) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10001eb0
    int32_t result = v2; // 0x10001f52
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        // 0x10001ec4
        g8 = a1;
        int16_t v3 = *(int16_t *)(a1 + 78); // 0x10001ec7
        if (v3 != 0) {
            // 0x10001ed1
            RBWFreqFromCode((int16_t)RdRBW(a1));
            float64_t v4 = *(float64_t *)(a1 + 88); // 0x10001ee9
            g11++;
            int32_t v5 = VBWFreqFromCode(7); // 0x10001ef1
            g11++;
            int32_t v6 = v5; // 0x10001f5211
            int16_t v7 = 7;
            if ((v5 & 0x4100) == 0) {
                int32_t v8 = VBWFreqFromCode(1); // 0x10001f0d
                g11++;
                if ((v8 & 256) != 0) {
                    // 0x10001f27
                    g3 = 0;
                    int32_t v9 = VBWCodeFromFreq((float64_t)((float80_t)v4 * g159), 0); // 0x10001f2f
                    v6 = v9;
                    v7 = v9;
                    // branch -> 0x10001f3b
                } else {
                    v6 = v8;
                    v7 = 1;
                }
            }
            // 0x10001f3b
            g8 = v7;
            if (v7 != -1) {
                // 0x10001f44
                *(int16_t *)(a1 + 76) = v7;
                result = a1;
                // branch -> 0x10001f4f
            } else {
                result = v6;
            }
            // 0x10001f4f
            g4 = v1;
            return result;
        }
        result = v3;
    }
    // 0x10001f4f
    g4 = v1;
    return result;
}

int32_t SetRBW(SET9052 *a1, int16_t a2) {
    // entry
    g3 = a1;
    int32_t v1 = TestFuncStatusAndPtr(a1); // 0x1000576c
    g3 = v1;
    int32_t result; // 0x100057e6
    if ((0x10000 * v1 || 0xffff) < 0x1ffff) {
        // 0x10005789
        int32_t v2; // 0x100057df
        int32_t v3; // 0x100057df
        if (*(int16_t *)(a1 + 74) != 1) {
            int32_t v4 = a2; // 0x1000579d
            g8 = v4;
            int32_t v5 = a1; // 0x100057df4
            if (a2 >= 0) {
                // 0x100057a5
                if (a2 == 4 || a2 < 4 != (3 - v4 & v4) < 0) {
                    // 0x100057ae
                    g8 = v4 & -0x10000 | (int32_t)a2;
                    *(int16_t *)(a1 + 72) = a2;
                    function_10001718(a1);
                    v3 = function_10001b13(a1);
                    // branch -> 0x100057df
                    // 0x100057df
                    // branch -> 0x100057e3
                    // 0x100057e3
                    return v3 & -0x10000;
                }
                v5 = v4;
            }
            // 0x100057d9
            v3 = v5;
            v2 = -3;
            // branch -> 0x100057df
        } else {
            // 0x10005795
            v3 = a1;
            v2 = -4;
            // branch -> 0x100057df
        }
        // 0x100057df
        result = v3 & -0x10000 | v2;
        // branch -> 0x100057e3
    } else {
        // 0x1000577b
        g8 = a1;
        result = GetFuncStatusCode(a1);
        // branch -> 0x100057e3
    }
    // 0x100057e3
    return result;
}

int32_t SetVBWmode(SET9052 *a1, int16_t a2) {
    int16_t v1 = 0; // bp-8
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005993
    g3 = v2;
    int32_t v3 = 0x10000 * v2; // 0x1000599b
    g6 = v3 / 0x10000;
    int32_t result; // 0x100059ed
    if ((v3 || 0xffff) < 0x1ffff) {
        int32_t v4 = a2; // 0x100059b0
        int32_t v5 = v4; // eax
        if (a2 != 0) {
            // 0x100059c3
            g8 = v4;
            if (a2 != 1) {
                // 0x100059d7
                g6 = a1;
                *(int16_t *)(a1 + 78) = 1;
                v1 = 1;
                // branch -> 0x100059e6
            } else {
                // 0x100059cc
                v5 = a1;
                *(int16_t *)(a1 + 78) = 1;
                // branch -> 0x100059e6
            }
            // 0x100059e6
            // branch -> 0x100059ea
            // 0x100059ea
            return v5 & -0x10000 | (int32_t)v1;
        }
        // 0x100059b8
        g6 = a1;
        *(int16_t *)(a1 + 78) = 0;
        // branch -> 0x100059e6
        // 0x100059e6
        result = v5 & -0x10000 | (int32_t)v1;
        // branch -> 0x100059ea
    } else {
        // 0x100059a2
        g8 = a1;
        result = GetFuncStatusCode(a1);
        // branch -> 0x100059ea
    }
    // 0x100059ea
    return result;
}

int32_t ConfigStartFreq(SET9052 *a1, int32_t a2, int32_t a3) {
    // entry
    g8 = a1;
    int32_t v1 = 0x10000 * FreqInRange(a1, (float64_t)(int64_t)a2); // 0x1000b75b
    g3 = v1 / 0x10000;
    int32_t result; // 0x1000b7d6
    if ((v1 || 0xffff) < 0x1ffff) {
        // 0x1000b762
        result = SetFuncStatusCode(a1, -3);
        // branch -> 0x1000b7d5
        // 0x1000b7d5
        return result;
    }
    // 0x1000b772
    *(int32_t *)(a1 + 8) = a2;
    *(int32_t *)(a1 + 12) = a3;
    g8 = a1;
    g3 = a1;
    if ((a1 & 0x4100) == 0) {
        // 0x1000b794
        result = SetFuncStatusCode(a1, 3);
        // branch -> 0x1000b7d5
        // 0x1000b7d5
        return result;
    }
    // 0x1000b7a4
    g8 = a1;
    int32_t v2 = 0x10000 * function_10001718(a1); // 0x1000b7b0
    g3 = v2 / 0x10000;
    if ((v2 || 0xffff) < 0x1ffff) {
        // 0x1000b7c7
        g8 = a1;
        result = SetFuncStatusCode(a1, 0);
        // branch -> 0x1000b7d5
    } else {
        // 0x1000b7b7
        result = SetFuncStatusCode(a1, -6);
        // branch -> 0x1000b7d5
    }
    // 0x1000b7d5
    return result;
}
int32_t ConfigStopFreq(SET9052 *a1, int32_t a2, int32_t a3) {
    // entry
    g8 = a1;
    int32_t v1 = 0x10000 * FreqInRange(a1, (float64_t)(int64_t)a2); // 0x1000b89d
    g3 = v1 / 0x10000;
    int32_t result; // 0x1000b918
    if ((v1 || 0xffff) < 0x1ffff) {
        // 0x1000b8a4
        result = SetFuncStatusCode(a1, -3);
        // branch -> 0x1000b917
        // 0x1000b917
        return result;
    }
    // 0x1000b8b4
    *(int32_t *)(a1 + 16) = a2;
    *(int32_t *)(a1 + 20) = a3;
    g8 = a1;
    g3 = a1;
    if ((a1 & 0x4100) == 0) {
        // 0x1000b8d6
        result = SetFuncStatusCode(a1, 3);
        // branch -> 0x1000b917
        // 0x1000b917
        return result;
    }
    // 0x1000b8e6
    g8 = a1;
    int32_t v2 = 0x10000 * function_10001718(a1); // 0x1000b8f2
    g3 = v2 / 0x10000;
    if ((v2 || 0xffff) < 0x1ffff) {
        // 0x1000b909
        g8 = a1;
        result = SetFuncStatusCode(a1, 0);
        // branch -> 0x1000b917
    } else {
        // 0x1000b8f9
        result = SetFuncStatusCode(a1, -6);
        // branch -> 0x1000b917
    }
    // 0x1000b917
    return result;
}



#endif

/*------------------------------------------------------------------------------------*/
/* End of file */
/*------------------------------------------------------------------------------------*/



#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include "sa.h"
#include "visa.h"

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


// DD: because (a1 + 2) == engine_model, a1 must be (struct SAStruct *) = SET9052 !!! yippie 2
// Address range: 0x10004b94 - 0x10004ee4
int32_t InitInstrData(/*int32_t a1*/SET9052 *a1) {
	printf("InitInstrData\n");
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
		a1->err_status = 0;

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
	printf("SetZSamplRate\n");
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

int32_t TestFuncStatusAndPtr(SET9052 *a1) {
	//printf("TestFuncStatusAndPtr\n");
	if (a1 == NULL) {
		return g3 & -0x10000 | 0xfff6;
	}
	g3 = a1;
	int32_t v1 = RdEngOption(a1, ENG_OPT_2 /*2*/); // 0x10001437
	g3 = v1;
	int32_t v2 = 0x10000 * v1; // 0x1000143f
	g6 = v2 / 0x10000;
	if ((v2 || 0xffff) < 0x1ffff) {
		//printf("Xnok %x\n", v2);
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
	//printf("Xok %x\n", result);
	return result;
}

int32_t SetFuncStatusCode(SET9052 *a1, uint16_t code) {
	//printf("SetFuncStatusCode\n");
	int32_t v1 = g4; // 0x10001365
	int32_t v2 = v1; // bp-4
	g4 = &v2;
	int32_t result;
	int32_t v3; // 0x100013af
	if (a1 != 0) {
		g3 = a1;
		int16_t * v4 = &a1->func_status_code; // (int16_t *) (a1 + 204); // 0x10001377
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
	printf("SetEngineReplyCode(%x)\n", code);
    int32_t result;
    if (a1 != 0) {
        //*(int16_t *)(a1 + 206) = a2;
    	a1->engine_reply_code = code;
        result = (int32_t)a1 & -0x10000 | (int32_t)code;
    } else {
        result = g3 & -0x10000 | 255;
    }
    return result;
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

#define ENG_OPT_0 0
#define ENG_OPT_1 1
#define ENG_OPT_2 2
/* Inquire engine option 0x01, 0x02, 0x04 depending on option value. */
int32_t RdEngOption(SET9052 *a1, int32_t option) {
	//printf("RdEngOption(%d)\n", option);
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

void* GlobalAlloc(int32_t flags, int32_t size) {
	return (void *)malloc(size);
}
void* GlobalLock(void *p) {
	return p;
}


int32_t RdSessionString(SET9052 *a1, int32_t a2) {
	//printf("RdSessionString\n");
	g3 = a1;
	int32_t v1 = TestFuncStatusAndPtr(a1); // 0x10008d6f
	g3 = v1;
	int32_t result; // 0x10008dbc
	if ((0x10000 * v1 || 0xffff) >= 0x1ffff) {
		result = GetFuncStatusCode(a1);
		return result;
	}
	if (a2 != 0) {
		g8 = a2;
		result = function_1000d570(a2) & -0x10000;
	} else {
		g3 = a1;
		result = SetFuncStatusCode(a1, -3);
	}
	return result;
}

int32_t function_1000d570(char * /*int32_t*/ a1) {
	char * v1 = g7; // 0x1000d570
	g7 = a1;
	return function_1000d5e1(v1);
}

int32_t function_10001718(SET9052 *a1) {
    int32_t v1 = g4; // bp-4
    g4 = &v1;
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10001728
    g3 = v2;
    int32_t result; // 0x10001b12
    if ((0x10000 * v2 || 0xffff) >= 0x1ffff) {
        // 0x10001737
        g8 = a1;
        result = GetFuncStatusCode(a1);
        // branch -> 0x10001b0f
        // 0x10001b0f
        g4 = v1;
        return result;
    }
    //float64_t v3 = *(float64_t *)(a1 + 16); // 0x1000174e
    float64_t v3 = a1->stop;
    int32_t v4 = g11 - 1; // 0x1000174e
    //float64_t v5 = *(float64_t *)(a1 + 8); // 0x10001751
    float64_t v5 = a1->start;
    float64_t v6 = (float80_t)v5 - (float80_t)v3; // 0x10001754
    // DD: a1 is a pointer; what does 'a1&256' mean???
    if (((int32_t)a1 & 256) == 0) {
        //int32_t * v7 = (int32_t *)(a1 + 68);
    	int32_t *v7 = &a1->deflt_pt_cnt;
        //int32_t * v8 = (int32_t *)(a1 + 164);
        int32_t * v8 = &a1->num_swp_pts;
        *v8 = *v7;
        //int32_t * v9 = (int32_t *)(a1 + 168);
        int32_t * v9 = &a1->num_step_pts;
        *v9 = *v7;
        g8 = a1;
        //int16_t v10 = *(int16_t *)(a1 + 32); // 0x1000178e
        int16_t step_mode = a1->step_mode;
        if (step_mode != MR90XX_AUTO_ON /*1*/) {
            if (step_mode == MR90XX_STEPCNT /*2*/) {
                int32_t v11 = *v9; // 0x10001aaa
                g8 = a1;
                //*(float64_t *)(a1 + 24) = (float64_t)((float80_t)(v11 - 1) / (float80_t)v6);
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
        int16_t * cell_mode;
        if (a1->auto_cell /* *(int16_t *)(a1 + 66) */ != MR90XX_AUTO_ON) {
        	cell_mode = &a1->cell_mode; // (int16_t *)(a1 + 64);
        } else {
            int16_t * v14 = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x100017f5
            if (*v14 == IE_FALSE) {
                int32_t v15 = GetRBWwide(4);
                if (((0x100000000 * (int64_t)(v15 >> 31) | (int64_t)v15) / 3 & 256) != 0) {
                    SetCellMode(a1, 1);
                    cell_mode = v14;
                } else {
                	cell_mode = v14;
                }
            } else {
            	cell_mode = v14;
            }
        }

        if (*cell_mode != IE_TRUE) {
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

int32_t IsValidStep(SET9052 *a1) {
	printf("IsValidStep\n");
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
    // TODO here; the function seems to have decompiled with sematical errors.
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
        // 0x1000b57b
        g159_rbwFrequency= -3.0L;
        g11--;
        return result;
    }
    // 0x1000b55f
    g6 = result;
    float80_t v1;
    if (a1 <= 4) {
        // 0x1000b570
        g8 = result;
        float64_t v2 = *(float64_t *)(8 * result + (int32_t)&g40); // 0x1000b574
        v1 = v2;
        // branch -> 0x1000b57b
    } else {
        v1 = -3.0L;
    }
    // 0x1000b57b
    g159_rbwFrequency = v1;
    g11--;
    return result;
}

// Address range: 0x1000b57d - 0x1000b5a5
int32_t VBWFreqFromCode(int16_t a1) {
    int32_t result = a1; // 0x1000b580
    if (a1 < 0) {
        // 0x1000b5a4
        g11--;
        return result;
    }
    // 0x1000b588
    g6 = result;
    if (a1 <= 7) {
        // 0x1000b599
        // branch -> 0x1000b5a4
    }
    // 0x1000b5a4
    g11--;
    return result;
}

int32_t DefltSetTimeRBW(int16_t timeValue) {
    int32_t v1 = timeValue; // 0x1000c8a0
    g6 = v1;
#ifdef NOT
    __pseudo_branch(*(int32_t *)(4 * v1 + (int32_t)&g14_rbwTimeFactor));
#endif
    return -1;
}

// Address range: 0x1000c906 - 0x1000c978
int32_t DefltSetTimeVBW(int16_t timeValue) {
	// DD:  g15 is initialized with 0x1000c923... a
#ifdef NOT
    int32_t v1 = *(int32_t *)(4 * (int32_t)timeValue + (int32_t)&g15_vbwTimeFactor); // 0x1000c91c
    __pseudo_branch(v1);
#endif
    return -1;
}

int32_t __ftol(int32_t in) {
	printf("ftol() TBI\n");
	return 0;
}

int32_t SetCellMode(/*int32_t a1*/SET9052 *a1, int16_t mode) {
	printf("SetCellMode\n");
    int16_t v1 = 0; // bp-8
    g3 = a1;
    int32_t v2 = TestFuncStatusAndPtr(a1); // 0x10005fd7
    g3 = v2;
    int32_t result2; // 0x10006048
    if ((0x10000 * v2 || 0xffff) < 0x1ffff) {
        int16_t * v3 = &a1->cell_mode; // (int16_t *)(a1 + 64); // 0x10005ffb
        *v3 = mode;
        if (mode != 0) {
            // 0x10006012
            if (mode != 1) {
                // 0x10006026
                *v3 = 1;
                v1 = -1;
                // branch -> 0x10006035
            } else {
                // 0x1000601b
                *v3 = 1;
                // branch -> 0x10006035
            }
            int32_t result = (int32_t)v1 | function_10001718(a1) & -0x10000; // 0x10006041
            // branch -> 0x10006045
            // 0x10006045
            return result;
        }
        // 0x10006007
        *v3 = 0;
        // branch -> 0x10006035
        // 0x10006035
        result2 = (int32_t)v1 | function_10001718(a1) & -0x10000;
        // branch -> 0x10006045
    } else {
        // 0x10005fe6
        result2 = GetFuncStatusCode(a1);
        // branch -> 0x10006045
    }
    // 0x10006045
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


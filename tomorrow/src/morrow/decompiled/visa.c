
#include <math.h>
#include <stdlib.h>


#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include <visa.h>
#include "visa.h"

//#if defined(__hp9000s700)
#include <sicl.h>
//#endif

int32_t sendCommand(SET9052 *deviceId, int16_t command) ;
int32_t VISA_SendWord(SET9052 *deviceId, int16_t command);

static int32_t _doSendWord(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t *response) ;
static int32_t function_10001249(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t a4) ;
static int32_t function_100015d0(SET9052 *deviceId, int32_t a2, int16_t a3, int32_t *a4);
static int32_t function_10001654(SET9052 *deviceId, int16_t a2, int32_t *a3);
static int32_t sendWord(SET9052 *deviceId, int16_t command) ;

static int32_t g2 = 0; // eax
static int32_t g3 = 0; // ebp
//static int32_t g4 = 0; // ebx
static int32_t g5 = 0; // ecx
static int32_t g7 = 0; // edx
static int32_t g52_currentViSession = 0;
static SET9052* g53 = 0;

typedef struct CmdInfo {
	int id;
	char *name;
} CmdInfo_t;

CmdInfo_t cmds_p2[] = {
		{ 0xc8ff, "ABORT NORMAL OPERATION" },
		{ 0xfcff, "BEGIN NORMAL OPERATION" },
		{ 0xc9ff, "END NORMAL OPERATION" },
		{ 0xcdff, "READ PROTOCOL ERROR" },
		{ 0xdeff, "BYTE REQUEST" },
		{ 0xc7ff, "READ HANDLERS" },
		{ 0xcaff, "READ INTERRUPTERS" },
		{ 0xccff, "READ MODID" },
		{ 0xdfff, "READ PROTOCOL" },
		{ 0xcfff, "READ STB" },
		{ 0xceff, "READ SERVANT AREA" },
		{ 0xeeff, "SET LOCK" },
		{ 0xedff, "TRIGGER" },

		{ 0x0008, "VXI_SETUPFLASH" },
		{ 0x0009, "VXI_PROGFLASH" },
		{ 0x7b00, "VXI_RESETENG" },
		{ 0x7c00, "VXI_GETVERSION" },
		{ 0x7d00, "VXI_ENGINEDATA" },
		{ 0x7e00, "VXI_GETSTATUS" },
		{ 0x7f00, "VXI_ENGINECMD" },
};
int cmdsP2Size = 20;

char *getCmdNameP2(int id) {
	int i;
	for (i=0; i<cmdsP2Size; i++) {
		if (cmds_p2[i].id == id) {
			return cmds_p2[i].name;
		}
	}
	return "?";
}

CmdInfo_t cmds_p1[] = {
		{ 0x0, "P1_0?_MAY_BE_INIT" },
		{ 0x1, "P1_START_SWEEP" },
		{ 0x2, "P1_START_ZSPAN" },
		{ 0x3, "P1_START_FREQHOP" },
		{ 0x4, "P1_SET_TRIGGER_RELATED" },
		{ 0x5, "P1_5?_NOT_USED" },
		{ 0x6, "P1_COMM_INTERRUPT" },
		{ 0x7, "P1_BREAK_SWEEP" },
		{ 0x8, "P1_8?_NOT_USED" },
		{ 0x9, "P1_9?_NOT_USED" },
		{ 0xa, "P1_GET_CAL_POINT" },
		{ 0xb, "P1_PULSE_FUNCTION_RELATED" },
		{ 0xc, "P1_c?_NOT_USED" },
		{ 0xc, "P1_d?_NOT_USED" },
		{ 0xc, "P1_e?_NOT_USED" },
		{ 0xc, "P1_f?_NOT_USED" },
};
int cmdsP1Size = 16;

char *getCmdNameP1(int id) {
	int i;
	for (i=0; i<cmdsP1Size; i++) {
		if (cmds_p1[i].id == id) {
			return cmds_p1[i].name;
		}
	}
	return "?";
}


int32_t VISA_OpenSessionStep(SET9052 * deviceId) {
	printf("VISA_OpenSessionStep\n");
    if (deviceId == NULL) {
        return g2 & -0x10000 | 0xfff6;
    }
    int32_t *v1 = &deviceId->session_handle; // (int32_t *)(deviceId + 468); // 0x100021ea
    if (*v1 != 0) {
        return (int32_t)deviceId & -0x10000 | 0xffed;
    }
    if (g53 == 0) {
    	// DD: Assumed call:This seems to be: ViStatus viOpenDefaultRM(ViPSession sesn)
        int32_t v2 = dd_viOpenDefaultRM((int32_t)&g52_currentViSession); // 0x1000220a
        if (v2 != VI_SUCCESS) {
            return v2 | 0xffff;
        }
    }
    int32_t vi_session; // bp-8
    int32_t *vi_session_ptr = &vi_session; // 0x10002221
    // DD: Assumed call: ViStatus viOpen(ViSession sesn, ViRsrc rsrcName, ViAccessMode accessMode, ViUInt32 openTimeout, ViPSession vi)
    // Session result comes back in *v4
    if (dd_viOpen(g52_currentViSession, deviceId->sessionString/*deviceId + 210*/, 0, 0, vi_session_ptr) != VI_SUCCESS) {
        int32_t v5 = g52_currentViSession; // 0x10002247
        g52_currentViSession = 0;
        // DD: _imported_function_ord_132 seems to close the session
        int32_t result = dd_viClose(v5) | 0xffff; // 0x1000225d
        return result;
    }
    g53++;
    int16_t * v6 = &deviceId->openStep; // (int16_t *)(deviceId + 208); // 0x10002278
    *v6 = *v6 + 1;
    // DD: 0x2710 = 100000
    // DD: Assumed call: VISA Get Attribute
    int32_t v7 = dd_viSetAttribute(vi_session, VI_ATTR_TMO_VALUE /*0x3fff001a*/, 10000 /*0x2710*/ ); // 0x1000229b
    g2 = v7;
    if (v7 < 0) {
        int32_t result2 = VISA_CloseSession(deviceId) | 0xffff; // 0x100022b0
        return result2;
    }
    if (dd_viSetBuf(vi_session, 3, 4000) < 0) {
        g2 = deviceId;
        int32_t result3 = VISA_CloseSession(deviceId) | 0xffff; // 0x100022d9
        return result3;
    }
    int32_t v8 = dd_viSetAttribute(vi_session, VI_ATTR_WR_BUF_OPER_MODE /*0x3fff002d*/, 1); // 0x100022ed
    g2 = v8;
    if (v8 < 0) {
        int32_t result4 = VISA_CloseSession(deviceId) | 0xffff; // 0x10002302
        return result4;
    }
    int32_t v9 = dd_viSetAttribute(vi_session, VI_ATTR_RD_BUF_OPER_MODE /* 0x3fff002a */, 1); // 0x10002313
    g2 = v9;
    if (v9 < 0) {
        int32_t result5 = VISA_CloseSession(deviceId) | 0xffff; // 0x10002328
        return result5;
    }
    *v1 = vi_session;
    int32_t v10 = VISA_InitEngine(deviceId); // 0x1000233e
    int32_t result6; // 0x10002373
    if (0x10000 * v10 == 0x410000) {
        result6 = v10 & -0x10000;
    } else {
        g2 = deviceId;
        int32_t v11 = VISA_CloseSession(deviceId); // 0x10002352
        *v1 = 0;
        result6 = v11 | 0xffff;
    }
    return result6;
}

int32_t VISA_CloseSession(SET9052 *deviceId) {
    if (deviceId == 0) {
        return g2 & -0x10000 | 0xfff6;
    }
    int32_t * v1 = &deviceId->session_handle; //  (int32_t *)(deviceId + 468); // 0x10002386
    int32_t result; // 0x10002401
    if (*v1 != 0) {
        dd_viClose(*v1);
        int32_t v2 = g53 - 1; // 0x100023a9
        g53 = v2;
        if (v2 == 0) {
            dd_viClose(g52_currentViSession);
            g52_currentViSession = 0;
        }
        g52_currentViSession = 0;
        *v1 = 0;
        //*(int16_t *)(deviceId + 208) = 0;
        deviceId->openStep = 0;
        //*(char *)(deviceId + 210) = 0;
        deviceId->sessionString[0] = '\0';
        result = (int32_t)deviceId & -0x10000;
    } else {
        result = (int32_t)deviceId & -0x10000 | 0xffed;
    }
    return result;
}

// DD: dd_WriteCommand = write( device, command ) yippie!
int32_t VISA_InitEngine(SET9052 *deviceId) {
	printf("VISA_InitEngine\n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    SetTimeoutWait(deviceId, 100);
    g5 = deviceId;
    // DD: -0x3701 = 0xc8ff ANO
    int32_t v2 = sendCommand(deviceId, 0xc8ff /*-0x3701*/); // 0x10001fbe
    int32_t v3 = RdErrorStatus(deviceId); // 0x10001fce
    int32_t v4 = v3; // 0x10001fe3

// DD XXX
    v3=0;
// DD XXX
    if (v3 == 0) {
        int32_t v5 = 0x10000 * v2;
// DD XXX
        v5 = -0x20000;
// DD XXX

        if (v5 == -0x20000) {
            g5 = deviceId;
            // DD: -769 = -0x301 = 0xfcff BNO
            int32_t v6 = sendCommand(deviceId, 0xfcff /*-769*/); // 0x10001ff5
            int32_t v7 = RdErrorStatus(deviceId); // 0x10002005
// DD XXX
            v7 = 0;
            v6 = 0xf00;
// DD XXX
            if (v7 != 0) {
                return v7 | 0xffff;
            }
            // DD: 3840 = 0xf00
            if ((v6 & 0xf00 /*3840*/) != 0xf00 /*3840*/) {
                return 0xffff;
            }
            int32_t v8 = function_100016c8(deviceId); // 0x10002037
            if ((0x10000 * v8 || 0xffff) >= 0x1ffff) {
                return v8 | 0xffff;
            }
            // DD: 0x7c00 = VXI_GETVERSION
            sendCommand(deviceId, 0x7c00);
            int32_t v9 = RdErrorStatus(deviceId); // 0x10002064
// DD XXX
            v9=0;
// DD XXX
            if (v9 != 0) {
                return v9 | 0xffff;
            }
            int32_t v10 = 0x10000 * BreakSweep(deviceId, 0);
            if (v10 != 0x410000) {
                return v10 / 0x10000 | 0xffff;
            }
            int32_t v11 = 0x10000 * CommTrigDetect(deviceId, 65);
            if (v11 != 0x410000) {
                return v11 / 0x10000 | 0xffff;
            }
            int32_t v12 = 0x10000 * CommInterrupts(deviceId, 65);
            int32_t result; // 0x100020e2
            if (v12 == 0x410000) {
                result = 65;
            } else {
                result = v12 / 0x10000 | 0xffff;
            }
            return result;
        }
        v4 = v5 / 0x10000;
    }
    return v4 | 0xffff;
}

/**
 * Sends command to P1 CPU. Command codes allowed 0..16.
 * Command consists of a command code 'command and arguments. The function takes arguments as
 * a number of bytes (numBytes) in memory, starting at location 'wordPtr'. All bytes are sent
 * in chunks of a word (2 bytes) by using the function 'VISA_SendWord'.
 * The
 */
int32_t VISA_SendCommand(SET9052 *deviceId, int16_t command, int32_t numBytes, /*int32_t*/uint16_t *wordPtr) {
	printf("VISA_SendCommand(%x=%s, %d, %lx)\n", command, getCmdNameP1(command), numBytes, wordPtr);
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t v2 = 0; // bp-20
    function_100010e1(deviceId, 0);
    int32_t v3;
    int16_t v4;
    int16_t v5;
    if (command >= 0) {
        g7 = command;
        if (command <= 16) {
            v3 = 0x10000 * numBytes;
            v4 = 0;
            int16_t v6 = 3;
            //
            // This while-loop iterates from v4=0..10.
            // As far as I see it can only be left via return after line "VISA_SendCommand before return 1" when v5!=3 && v5!=4
            //
            // There is an inner loop "while (v8 + 1 < v3 / 0x10000)" which means "while (v8 + 1 < a3)".
            // It looks like data can be sent in the following way
            // a4: data start (e.g. pointer to int16_t values
            // a3: number of data items
            //
            while (true) {
                v5 = v6;
              lab_0x10001d34_3:
                while (true) {
                  lab_0x10001d34:
                    if (v5 != 3) {
                        if (v5 != 4) {
                        	printf("VISA_SendCommand before return 1\n");
                            return (int32_t)v2 | function_100016c8(deviceId) & -0x10000;
                        }
                    }
                    VISA_SendWord(deviceId, command);
                    int32_t v7; // 0x10001da2
                    if (v3 > 0) {
                        int32_t i = 0;
                        //printf("TODO: Writing commands from an array: a4+2*i where i=v8 and a4 seems to be g3. v8=0.\n");
                        printf("\t\t%d, a4=%lx, v8=%d\n", v4, wordPtr, i);
                        printf("\t\ta4[0]=0x%x/%d\n", wordPtr[i], wordPtr[i]);
                        VISA_SendWord(deviceId, /* DDD XXX offset in array TODO *(int16_t *)(2 * v8 + a4) */ wordPtr[2*i] /* *(a4+2*v8) */);
                        while (i + 1 < v3 / 0x10000) {
                        	// inner loop v8=0..<v3=a3
                            g5 = (int32_t)g5 & -0x10000 | i + 1 & 0xffff;
                            i+=2;
                            //printf("TODO: Writing commands from an array: a4+2*i where i=v8 and a4 seems to be g3. v8=%d.\n", v8);
                            printf("\t\ta4=%lx, v8=%d\n", wordPtr, i);
                            printf("\t\ta4[%d]=0x%x/%d\n", i, wordPtr[i/2], wordPtr[i/2]);
                            VISA_SendWord(deviceId, /* DDD XXX offset in array TODO *(int16_t *)(2 * v8 + a4) */ wordPtr[i/2] /**(a4+2*v8)*/ );
                        }
                        v7 = VISA_CheckSWStatus(deviceId);
                        v2 = v7;
                        if ((v7 & 0xffff) != 1) {
                        	printf("VISA_SendCommand break 1\n");
                           break;
                        }
                        v5 = 0;
                        continue;
                    }
                    v7 = VISA_CheckSWStatus(deviceId);
                    v2 = v7;
                    if ((v7 & 0xffff) != 1) {
                    	printf("VISA_SendCommand break 2\n");
                        break;
                    }
                    v5 = 0;
                }
#define LOOP_COUNT_1 10
                if (v4 >= LOOP_COUNT_1 /*10*/) {
                    v2 = 0;
                    v5 = 1;
                    goto lab_0x10001d34;
                }
                // next 3 lines mean: v4 = v4 + 1 where v4 is loop counter
                int16_t v9 = v4 + 1; // 0x10001dd3
                g7 = g7 & -0x10000 | (int32_t)v9;
                v4 = v9;
                v6 = 4;
            }
        }
    	printf("VISA_SendCommand after loop\n");
        v2 = 17;
        v3 = 0x10000 * numBytes;
        v4 = 0;
        while (true) {
            v5 = 1;
            goto lab_0x10001d34_3;
        }
    }
    v2 = 17;
    v3 = 0x10000 * numBytes;
    v4 = 0;
    while (true) {
        v5 = 1;
        goto lab_0x10001d34_3;
    }
}

/**
 * Function to send a command/word to the P1 CPU. This requires
 * sending the VXI_ENGINECOMMAND command first. The subsequent word
 * will then be forwarded to P1.
 */
int32_t VISA_SendWord(SET9052 *deviceId, int16_t command) {
	printf("VISA_SendWord: %x=%s\n", command, getCmdNameP1(command));
    int16_t v1 = -2; // bp-8
    g2 = deviceId;
    // DD: 0x7f00 = VXI_ENGINECOMMAND
    int32_t v2 = sendWord(deviceId, 0x7f00); // 0x100019db
    g2 = v2;
    printf("second word %d\n", v2);
// DD XXX
    v2=0;
// DD XXX
    if (v2 != 0) {
        return (int32_t)v1 | v2 & -0x10000;
    }
    int32_t v3 = sendWord(deviceId, command); // 0x100019f0
    if (v3 == 0) {
        v1 = 0;
    }
    return (int32_t)v1 | v3 & -0x10000;
}


/**
 * Function to send a command/word to P2 CPU. Simply the command is written.
 */
int32_t sendCommand(SET9052 *deviceId, int16_t command) {
	printf("sendCommand: %x=%s\n", command, getCmdNameP2((command&0xffff)));
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t response; // bp-12
    int32_t v3; // 0x1000133c
    if ((int16_t)_doSendWord(deviceId, command, 1, (int32_t)&response) > -1) {
        v3 = 0;
    } else {
        response = 0;
        v3 = 1;
    }
    g3 = v1;
    return (int32_t)response | SetErrorStatus(deviceId, v3) & -0x10000;
}

int32_t function_100016c8(SET9052 *deviceId) {
	printf("\tfunction_100016c8\n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = RdTimeoutWait(deviceId); // 0x100016d2
    int16_t v3; // bp-20
    if ((0x10000 * function_100011fc(deviceId, (int32_t)&v3) || 0xffff) >= 0x1ffff) {
        g5 = deviceId;
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe; // 0x10001707
        g3 = v1;
        return result;
    }
    int32_t v4 = v3; // 0x10001710
    int32_t v5 = v4 & -0xff01 | g7 & -0x10000 | v4 & 0xfd00 | 512; // 0x10001714
    v3 = v5;
    int32_t v6 = 0x10000 * v5 / 0x10000; // 0x1000171b
    g2 = v6;
    int32_t result2; // 0x100017e0
    if ((0x10000 * function_10001249(deviceId, (int16_t)v6, v6, 0) || 0xffff) < 0x1ffff) {
        InitTimeoutLoop(0);
        int32_t v7;
        while (true) {
            int32_t v8 = 0x10000 * function_100017e1(deviceId, &v3); // 0x10001764
            if ((v8 || 0xffff) < 0x1ffff) {
                v7 = v8 / 0x10000;
                g5 = v7;
                SetErrorStatus(deviceId, v7);
                g3 = v1;
                return -2;
            }
            if ((0x10000 * _TestTimeoutDone(v2) || 0xffff) >= 0x1ffff) {
                break;
            }
        }
        int32_t v9 = 0x10000 * function_100017e1(deviceId, &v3); // 0x100017ac
        v7 = v9 / 0x10000;
        g5 = v7;
        SetErrorStatus(deviceId, v7);
        result2 = -2;
    } else {
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe;
    }
    g3 = v1;
    return result2;
}

/**
 * Calls dd_viWrite(), dd_viFlush() and checks for errors
 * (protocol erros, using dd_viWrite() again)
 */
int32_t _doSendWord(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t* response) {
	printf("_doSendWord %x=%s\n", command, getCmdNameP2((command&0xffff)));
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t session_handle = deviceId->session_handle; // *(int32_t *)(deviceId + 468); // 0x1000136a
    int16_t v3; // bp-24
    int32_t *v4 = &v3; // 0x10001373
    g5 = deviceId;
    int32_t v5 = function_100015d0(deviceId, 100, 512, v4); // 0x10001384
    int32_t v6 = 0x10000 * v5 / 0x10000; // 0x10001390
    if ((int16_t)v6 <= -1) {
        g3 = v1;
        return v6 & -0x10000 | v5 & 0xffff;
    }
    g5 = session_handle;
    int32_t v7 = dd_viWrite(session_handle, 1, 14, v6 & -0x10000 | (int32_t)command); // 0x100013b4
    if (v7 != 0) {
        g3 = v1;
        return v7 & -0x10000 | 0x8000;
    }
    g5 = deviceId;
    int32_t v8 = function_100015d0(deviceId, 100, 512, v4); // 0x100013dc
    int32_t v9 = 0x10000 * v8 / 0x10000; // 0x100013e8
    if ((int16_t)v9 <= -1) {
        g3 = v1;
        return v9 & -0x10000 | v8 & 0xffff;
    }
    int32_t v10 = (int32_t)v3 & 2048; // 0x10001407
    int32_t v11;
    if (v10 != 0) {
        v11 = 1;
        if ((a3 & 0xffff) != 0) {
        	// do only if a3&0xffff != 0, i.e. a3 in range 0x0001..0xffff
            g5 = session_handle;
            // call gets a response in v4 which is *v3; if v12=ret==0, response:=v13 which is v3
            // 14 = 0xe = 1110
            // 10 = 0xa = 1010 (also used as arg3)
            int32_t v12 = dd_viFlush(session_handle, 1, 14, v4); // 0x1000158a
            if (v12 == 0) {
                int16_t v13 = v3; // 0x100015a1
                *(int16_t *)response = v13;
                v10 = (int32_t)v13 | v12 & -0x10000;
                v11 = 1;
            } else {
                v10 = v12;
                v11 = 0x8020;
            }
        }
        g3 = v1;
        return v10 & -0x10000 | v11;
    }
    g5 = session_handle;
    // DD: 0xcdff Read Protocol Error
    int32_t v14 = dd_viWrite(session_handle, 1, 14, 0xcdff); // 0x10001421
    if (v14 != 0) {
        g3 = v1;
        return v14 & -0x10000 | 0x8400;
    }
    g5 = deviceId;
    int32_t v15 = function_100015d0(deviceId, 100, 512, v4); // 0x10001449
    int32_t v16 = 0x10000 * v15 / 0x10000; // 0x10001455
    if ((int16_t)v16 <= -1) {
        g3 = v1;
        return v16 & -0x10000 | v15 & 0xffff;
    }

// DD XXX
    v3=512;
// DD XXX
    if (((int32_t)v3 & 512) == 0) {
        g3 = v1;
        return 0x8000;
    }
    g5 = v4;
    int32_t v17 = function_100015d0(deviceId, 100, 1024, v4); // 0x10001497
    int32_t v18 = 0x10000 * v17 / 0x10000; // 0x100014a3
    int32_t v19 = v18 & 0x8000; // 0x100014a7
    g5 = v19;
    if (v19 != 0) {
        g3 = v1;
        return v18 & -0x10000 | v17 & 0xffff;
    }

// DD XXX
    v3=1024;
// DD XXX
    if ((v3 & 1024) == 0) {
        g3 = v1;
        return v18 & -0x10000 | 0x8000;
    }
    g5 = session_handle;
    int32_t v20 = dd_viFlush(session_handle, 1, 14, v4); // 0x100014e8
    if (v20 != 0) {
        g3 = v1;
        return v20 & -0x10000 | 0x8000;
    }
    int32_t v21 = (int32_t)v3 - 0xfff8; // 0x10001505
    g5 = v21;
    v10 = v21;
    v11 = 0x8000;
    switch (v3) {
        case -8: {
            g5 = 0xc000;
            v10 = 0;
            v11 = 0xc000;
            break;
        }
        case -7: {
            v10 = 0xa000;
            v11 = 0xa000;
            break;
        }
        case -6: {
            v10 = 2;
            v11 = 0x9000;
            break;
        }
        case -5: {
            g5 = 0x8800;
            v10 = 3;
            v11 = 0x8800;
            break;
        }
        case -4: {
            v10 = 0x8200;
            v11 = 0x8200;
            break;
        }
        case -3: {
            v10 = 5;
            v11 = 0x8040;
            break;
        }
    }
    g3 = v1;
    return v10 & -0x10000 | v11;
}

int32_t function_100011fc(SET9052 *deviceId, int32_t* a2) {
    int32_t v1 = deviceId->session_handle; //*(int32_t *)(deviceId + 468); // 0x1000120d
    g7 = v1;
    int32_t v2 = dd_viFlush(v1, 1, 4, a2) != 0;
    return SetErrorStatus(deviceId, v2) & -0x10000 | v2;
}

int32_t function_10001249(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t a4) {
#ifdef ORIG
	// What is this call doing ???
	printf("\tfunction_10001249, command %x=%s, what is this call intending?\n", command, getCmdNameP2(command));
	int32_t v1 = deviceId->session_handle;
    int32_t v2 = dd_viWrite(v1, 1, 4, g2 & -0x10000 | command) != 0;
#else
	printf("\tfunction_10001249 command %x=%s LEFT OUT!\n", command, getCmdNameP2(command));
    int32_t v2 = VI_SUCCESS;
#endif
    g5 = deviceId;
    return SetErrorStatus(deviceId, v2) & -0x10000 | v2;
}

int32_t function_100017e1(SET9052 *deviceId, int16_t * a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2; // 0x10001834
    if ((0x10000 * function_100011fc(deviceId, (int32_t*)a2) || 0xffff) >= 0x1ffff) {
        v2 = SetErrorStatus(deviceId, 1);
        g3 = v1;
        return (int32_t)1 | v2 & -0x10000;
    }
    int16_t v3; // bp-12
    int32_t v4; // 0x1000182b
    if ((*a2 & 256) != 0) {
        v3 = 0;
        v4 = 0;
    } else {
        v3 = 3;
        v4 = 3;
    }
    v2 = SetErrorStatus(deviceId, v4);
    g3 = v1;
    return (int32_t)v3 | v2 & -0x10000;
}

int32_t function_100015d0(SET9052 * deviceId, int32_t a2, int16_t a3, int32_t* a4) {
    int32_t v1 = g3; // 0x100015d0
    InitTimeoutLoop(v1);
    g3 = v1;
    return 0x10000 * function_10001654(deviceId, a3, a4) / 0x10000;
}

int32_t function_10001654(SET9052 *deviceId, int16_t a2, int32_t* a3) {
    g5 = deviceId;
    if (dd_viFlush(deviceId->session_handle, 1, 10, a3) != 0) {
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0x8020; // 0x10001686
        return result;
    }
    g5 = a3;
    int32_t result2; // 0x100016c7
#ifdef ORIG
    // totally unclear whats going on here
    if (((int32_t)*(int16_t *)a3 & (int32_t)a2) != 0) {
#else
    	if (1) {
#endif
        result2 = SetErrorStatus(deviceId, 0) & -0x10000 | 1;
    } else {
        g5 = deviceId;
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0x8004;
    }
    return result2;
}

int32_t VISA_CheckSWStatus(SET9052 *deviceId) {
	printf("VISA_CheckSWStatus\n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = dd_readEngineStatus(deviceId); // 0x10001bd6
    int16_t v3 = v2; // bp-20
    int32_t v4 = v2 & 0xffff; // 0x10001be27
    g5 = v4;
    if (v4 != 1) {
        v3 = dd_readEngineStatus(deviceId);
    }
    int32_t v5 = RdTimeoutWait(deviceId); // 0x10001c04
    int32_t v6 = IeTimer(v5); // 0x10001c0f
    int32_t v7 = v6; // 0x10001c496
    int32_t v8; // 0x10001c38
    while (true) {
        int16_t v9 = v3; // 0x10001c17
        g5 = v9;
        if (v9 != 0) {
            g3 = v1;
            return (int32_t)v9 | v7 & -0x10000;
        }
        int32_t v10 = dd_readEngineStatus(deviceId); // 0x10001c28
        v3 = v10;
        v8 = IeTimerFrom(v6, 0x10000 * v10 / 0x10000);
// DD XXX
        v8=110;
// DD XXX
        if (v8 > v5) {
            break;
        }
        v7 = v8;
    }
    g3 = v1;
    return (int32_t)v3 | v8 & -0x10000;
}

int32_t dd_readEngineStatus(SET9052 *deviceId) {
	printf("function_1000108e\n") ;
    function_100010e1(deviceId, 0x10000 * (int32_t)g5 / 0x10000);
    g5 = deviceId;
    // DD: 0x7e00 = VXI_GETSTATUS
    int32_t v1 = sendCommand(deviceId, 0x7e00); // 0x100010a7
    function_100016c8(deviceId);
    g7 = deviceId;
    return SetEngineReplyCode(deviceId, (uint32_t)g5 & -0x10000 | v1 & 255);
}

int32_t function_100010e1(SET9052 *deviceId, int32_t a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = RdTimeoutWait(deviceId); // 0x100010eb
    int16_t v3; // bp-20
    if ((0x10000 * function_100011fc(deviceId, (int32_t)&v3) || 0xffff) >= 0x1ffff) {
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe; // 0x10001120
        g3 = v1;
        return result;
    }
    int16_t v4 = v3 & -513; // 0x1000112d
    v3 = v4;
    int32_t v5 = v4; // 0x10001136
    g2 = v5;
    int32_t v6 = 0x10000 * function_10001249(deviceId, v4, v5, 0); // 0x10001147
    g7 = v6 / 0x10000;
    int32_t result2; // 0x100011fb
    if ((v6 || 0xffff) < 0x1ffff) {
        InitTimeoutLoop(0);
        while (true) {
            int32_t v7 = 0x10000 * function_10001297(deviceId, &v3); // 0x1000117f
            if ((v7 || 0xffff) < 0x1ffff) {
                g7 = deviceId;
                SetErrorStatus(deviceId, v7 / 0x10000);
                g3 = v1;
                return -2;
            }
            if ((0x10000 * TestTimeoutDone(v2) || 0xffff) >= 0x1ffff) {
                break;
            }
        }
        int32_t v8 = 0x10000 * function_10001297(deviceId, &v3); // 0x100011c7
        g7 = deviceId;
        SetErrorStatus(deviceId, v8 / 0x10000);
        result2 = -2;
    } else {
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe;
    }
    g3 = v1;
    return result2;
}

/**
 * Wraps _doSendWord() and adds SetErrorStatus()
 */
int32_t sendWord(SET9052 *deviceId, int16_t command) {
	printf("sendWord(function_10001a0a): %x\n", command);
    int32_t result;
    if ((int16_t)_doSendWord(deviceId, command, 0, 0) > -1) {
        g5 = deviceId;
        SetErrorStatus(deviceId, 0);
        result = 0;
    } else {
        SetErrorStatus(deviceId, 1);
        result = -1;
    }
    return result;
}

int32_t function_10001297(SET9052 *deviceId, int16_t * a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2; // 0x100012ea
    if ((0x10000 * function_100011fc(deviceId, (int32_t)a2) || 0xffff) >= 0x1ffff) {
        v2 = SetErrorStatus(deviceId, 1);
        g3 = v1;
        return (int32_t)1 | v2 & -0x10000;
    }
    int16_t v3; // bp-12
    int32_t v4; // 0x100012e1
    if ((*a2 & 256) == 0) {
        v3 = 0;
        v4 = 0;
    } else {
        v3 = 3;
        v4 = 3;
    }
    v2 = SetErrorStatus(deviceId, v4);
    g3 = v1;
    return (int32_t)v3 | v2 & -0x10000;
}

int32_t VISA_ResetEngine(int32_t deviceId) {
    // DD: 0x3701 = 0xcaff = Read Interrupters
    int16_t v1 = sendCommand(deviceId, 0xcaff /*-0x3701*/); // bp-8
    g5 = deviceId;
    int32_t v2; // 0x10002169
    int16_t v3; // 0x1000215a
    int32_t v4; // 0x10002175
    int32_t v5; // 0x10002175
    if (RdErrorStatus(deviceId) == 0) {
        if (v1 == -2) {
            // DD: -769 = -0x301 = 0xfcff BNO
            v1 = sendCommand(deviceId, 0xfcff /*-769*/);
            if (RdErrorStatus(deviceId) != 0) {
                v3 = 64;
            } else {
                // DD: 3840 = 0xf00
                if ((v1 & 3840) != 3840) {
                    v3 = 64;
                } else {
                    v3 = v1;
                }
            }
            if (v3 != 64) {
                v2 = BreakSweep(deviceId, 0);
                v5 = v2;
                v4 = 0x10000 * v2 / 0x10000;
            } else {
                v5 = v3;
                v4 = 64;
            }
            return v5 & -0x10000 | v4;
        }
    }
    v3 = 64;
    if (v3 != 64) {
        v2 = BreakSweep(deviceId, 0);
        v5 = v2;
        v4 = 0x10000 * v2 / 0x10000;
    } else {
        v5 = v3;
        v4 = 64;
    }
    return v5 & -0x10000 | v4;
}


int32_t _imported_function_ord_129(int32_t a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5, int32_t a6) {
	printf("\t_imported_function_ord_129(%d, %d, %d, %d, %d, %d)\n", a1, a2, a3, a4, a5, a6);
	return 0;
}

int32_t _imported_function_ord_130(int32_t a1, int32_t a2) {
	return 0;
	printf("\t_imported_function_ord_130(%d, %d)\n", a1, a2);
}

int32_t dd_viOpen(int32_t a1, char *session_string, int32_t a3, int32_t a4, int32_t *session_id) {
	printf("\tviOpen(%s)\n", session_string);
#if defined(__hp9000s700)
	INST id = iopen(session_string);
	printf("\tiopen() -> %x\n", id);

	if (id != 0) {
		*session_id = id;
		itimeout (id, 10000);
		return VI_SUCCESS;
	} else {
		return 1;
	}
#else
	*session_id = 11;
	return VI_SUCCESS;
#endif
}
int32_t dd_viClose(int32_t session_handle) {
	printf("viClose(%d)\n", session_handle);
	return 0;
}

int32_t _imported_function_ord_133(int32_t a1, int32_t a2, int32_t a3) {
	printf("\t_imported_function_ord_133(%d, %d, %d)\n", a1, a2, a3);
	return 0;
}

int32_t dd_viSetAttribute(int32_t a1, int32_t a2, int32_t a3) {
	printf("viSetAttribute(%d, %d, %d)\n", a1, a2, a3);
	return VI_SUCCESS;
}
int32_t dd_viOpenDefaultRM(int32_t a1) {
	printf("viOpenDefaultRM()\n");
	return VI_SUCCESS;
}

int32_t dd_viFlush(int32_t session_handle, int32_t a2, int32_t mask, int32_t* response) {
	// a2: is always 1 (true?)
    // a3: 14 = 0xe = 1110 includes VI_READ_BUF_DISCARD
    // a3: 10 = 0xa = 1010 (also used as arg3)
	// printf("\tviFlush(%x,%d,%d)\n", session_handle, a2, mask);
	int siclMask=0x0;
	if (mask & VI_READ_BUF) {
		siclMask |= I_BUF_READ;
	}
	if (mask & VI_WRITE_BUF) {
		siclMask |= I_BUF_WRITE;
	}
	if (mask & VI_READ_BUF_DISCARD) {
		siclMask |= I_BUF_DISCARD_READ;
	}
	if (mask & VI_WRITE_BUF_DISCARD) {
		siclMask |= I_BUF_DISCARD_WRITE;
	}
	int ret;
#if defined(__hp9000s700)
	ret = iflush(session_handle, siclMask);
	printf("iflush returned %d\n", ret);
#else
#endif
	ret = VI_SUCCESS;
	return ret;
}

int32_t dd_viWrite(int32_t session_handle, int32_t a2, int32_t a3, int32_t command) {
	printf("\tviWrite(%d, %d, %d, 0x%x=%s)\n", session_handle, a2, a3, command, getCmdNameP2(command));
	uint16_t ret = 0;
#if defined(__hp9000s700)
	uint16_t cmd = command;
	uint16_t response;
	uint16_t rpe;

	// ret==0 => OK
	ret = ivxiws(session_handle, cmd, &response, &rpe);
	printf("\tivxiws() -> ret=0x%x, response=0x%x, rpe=0x%x\n", ret, response, rpe);
	ret = response;
#endif
	return ret;
}

int32_t dd_viSetBuf(int32_t session_handle, int32_t mask, int32_t size) {
	printf("viSetBuf(%d,%d,%d)\n", session_handle, mask, size);
#if defined(__hp9000s700)
	int ret = isetbuf(session_handle, mask, size);
	return ret;
#else
	return VI_SUCCESS;
#endif
}


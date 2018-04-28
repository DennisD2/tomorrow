
#include <math.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

#include <visa.h>
#include "dvisa.h"

#include <sicl.h>

#include "helper.h"

int32_t _sendCommand(SET9052 *deviceId, int16_t command) ;
int32_t VISA_SendWord(SET9052 *deviceId, int16_t command);

static int32_t _doSendWord(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t *response) ;
static int32_t write2StatusReg(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t a4) ;
static int32_t readResponseRegT(SET9052 *deviceId, int32_t a2, int16_t a3, int32_t *a4);
static int32_t readResponseReg(SET9052 *deviceId, int16_t a2, int32_t *a3);
static int32_t sendWord(SET9052 *deviceId, int16_t command) ;

int32_t dd_viOut16(int32_t session_handle, int32_t space, int32_t offset, int16_t val16) ;

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
	return "P2?";
}

CmdInfo_t cmds_p1[] = {
		{ 0x0, "ENG_INIT" },
		{ 0x1, "ENG_START_SWP" },
		{ 0x2, "ENG_START_ZSPAN" },
		{ 0x3, "ENG_START_FHOP" },
		{ 0x4, "ENG_SET_TRIGDET" },
		{ 0x5, "ENG_LOAD_HOPFRQ" },
		{ 0x6, "ENG_SET_INTMODE" },
		{ 0x7, "ENG_TERMINATE" },
		{ 0x8, "ENG_8?_NOT_USED" },
		{ 0x9, "ENG_9?_NOT_USED" },
		{ 0xa, "ENG_CALIBRATE" },
		{ 0xb, "ENG_PULSE_FUNCTION_RELATED" },
		{ 0xc, "ENG_c?_NOT_USED" },
		{ 0xd, "ENG_d?_NOT_USED" },
		{ 0xe, "ENG_e?_NOT_USED" },
		{ 0xf, "ENG_f?_NOT_USED" },
};
int cmdsP1Size = 16;

char *getCmdNameP1(int id) {
	int i;
	for (i=0; i<cmdsP1Size; i++) {
		if (cmds_p1[i].id == id) {
			return cmds_p1[i].name;
		}
	}
	return "P1?";
}


int32_t VISA_OpenSessionStep(SET9052 * deviceId) {
	dlog( LOG_DEBUG, "VISA_OpenSessionStep\n");
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
        // DD: _imported_function_ord_132 equals viClose()
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
// DD XXX
    v10 = 0x41;
// DD XXX

    if (0x10000 * v10 == 0x410000) {
        result6 = v10 & -0x10000;
    } else {
    	dlog( LOG_DEBUG, "VISA_OpenSessionStep '0x10000 * v10'  failed 0x%x\n", (0x10000 * v10));
        g2 = deviceId;
        int32_t v11 = VISA_CloseSession(deviceId); // 0x10002352
        *v1 = 0;
        result6 = v11 | 0xffff;
    }
	dlog( LOG_DEBUG, "VISA_OpenSessionStep --> 0x%x\n", result6);

    return result6;
}

int32_t VISA_CloseSession(SET9052 *deviceId) {
	dlog( LOG_DEBUG, "VISA_CloseSession\n");
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

int32_t VISA_InitEngine(SET9052 *deviceId) {
	dlog( LOG_DEBUG, "VISA_InitEngine\n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    SetTimeoutWait(deviceId, 100);
    g5 = deviceId;
    // DD: -0x3701 = 0xc8ff ANO
    int32_t v2 = _sendCommand(deviceId, WS_CMD_ANO /*0xc8ff*/ /*-0x3701*/); // 0x10001fbe
    int32_t v3 = RdErrorStatus(deviceId); // 0x10001fce
    int32_t v4 = v3; // 0x10001fe3

#ifndef __hp9000s700
    v3=0;
#endif
    // dlog( LOG_DEBUG, "\tVISA_InitEngine v3 %x\n", v3);
    if (v3 == 0) {
        int32_t v5 = 0x10000 * v2;
// XXX DD
        v5 = -0x20000;
// XXX DD
        // dlog( LOG_DEBUG, "\tVISA_InitEngine v5 %x\n", v5);

        if (v5 == -0x20000) {
            g5 = deviceId;
            // DD: -769 = -0x301 = 0xfcff BNO
            int32_t v6 = _sendCommand(deviceId, WS_CMD_BNO /*0xfcff*/ /*-769*/); // 0x10001ff5
            int32_t v7 = RdErrorStatus(deviceId); // 0x10002005
#ifndef __hp9000s700
            v7 = 0;
#endif
// XXX DD
            v6 = 0xf00;
// XXX DD

            // dlog( LOG_DEBUG, "\tVISA_InitEngine v6 v7 %x %x\n", v6, v7);
            if (v7 != 0) {
                return v7 | 0xffff;
            }
            // DD: 3840 = 0xf00
            if ((v6 & 0xf00 /*3840*/) != 0xf00 /*3840*/) {
                return 0xffff;
            }
            int32_t v8 = DLFMModeOn(deviceId); // 0x10002037
            if ((0x10000 * v8 || 0xffff) >= 0x1ffff) {
                return v8 | 0xffff;
            }
            // DD: 0x7c00 = VXI_GETVERSION
            _sendCommand(deviceId, VXI_GETVERSION /*0x7c00*/);
            int32_t v9 = RdErrorStatus(deviceId); // 0x10002064
#ifndef __hp9000s700
            v9=0;
#endif
            if (v9 != 0) {
                return v9 | 0xffff;
            }
            int32_t v10 = 0x10000 * BreakSweep(deviceId, 0);
            if (v10 != 0x410000) {
                return v10 / 0x10000 | 0xffff;
            }
            int32_t v11 = 0x10000 * CommTrigDetect(deviceId, 65);
// DD XXX
     v11 = 0x410000;
// DD XXX

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
        	dlog( LOG_DEBUG, "VISA_InitEngine result --> 0x%x\n", result);
            return result;
        }
        v4 = v5 / 0x10000;
    }
	dlog( LOG_DEBUG, "VISA_InitEngine --> 0x%x\n", (v4 | 0xffff));
    return v4 | 0xffff;
}

/**
 * Sends command to P1 CPU. Command codes allowed 0..16.
 *
 * Guess:
 * Command consists of a command code 'command and arguments. The function takes arguments as
 * a number of bytes (numBytes) in memory, starting at location 'wordPtr'. All bytes are sent
 * in chunks of a word (2 bytes) by using the function 'VISA_SendWord'.
 */
int32_t VISA_SendCommand(SET9052 *deviceId, int16_t command, int32_t numBytes, uint16_t *wordPtr) {
	dlog( LOG_DEBUG, "VISA_SendCommand(%x=%s, %d, %lx)\n", command, getCmdNameP1(command), numBytes, wordPtr);
    int i;
    for (i=0; i<numBytes; i++) {
    	dlog( LOG_DEBUG, "wordPtr[%d]=0x%x\n", i, wordPtr[i] );
    }
#ifdef ORIG
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t v2 = 0; // bp-20
    DLFMModeOff(deviceId, 0);
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
                        	dlog( LOG_DEBUG, "VISA_SendCommand before return 1\n");
                            return (int32_t)v2 | DLFMModeOn(deviceId) & -0x10000;
                        }
                    }

                    VISA_SendWord(deviceId, command);
                    int32_t v7; // 0x10001da2
                    if (v3 > 0) {
                        int32_t i = 0;
                        //dlog( LOG_DEBUG, "TODO: Writing commands from an array: a4+2*i where i=v8 and a4 seems to be g3. v8=0.\n");
                        dlog( LOG_DEBUG, "\t\t%d, a4=%lx, v8=%d\n", v4, wordPtr, i);
                        dlog( LOG_DEBUG, "\t\ta4[0]=0x%x/%d\n", wordPtr[i], wordPtr[i]);
                        VISA_SendWord(deviceId, /* DDD XXX offset in array TODO *(int16_t *)(2 * v8 + a4) */ wordPtr[2*i] /* *(a4+2*v8) */);
                        while (i + 1 < v3 / 0x10000) {
                        	// inner loop v8=0..<v3=a3
                            g5 = (int32_t)g5 & -0x10000 | i + 1 & 0xffff;
                            i+=2;
                            //dlog( LOG_DEBUG, "TODO: Writing commands from an array: a4+2*i where i=v8 and a4 seems to be g3. v8=%d.\n", v8);
                            dlog( LOG_DEBUG, "\t\ta4=%lx, v8=%d\n", wordPtr, i);
                            dlog( LOG_DEBUG, "\t\ta4[%d]=0x%x/%d\n", i, wordPtr[i/2], wordPtr[i/2]);
                            VISA_SendWord(deviceId, /* DDD XXX offset in array TODO *(int16_t *)(2 * v8 + a4) */ wordPtr[i/2] /**(a4+2*v8)*/ );
                        }
                        v7 = VISA_CheckSWStatus(deviceId);
                        v2 = v7;
                        if ((v7 & 0xffff) != 1) {
                        	dlog( LOG_DEBUG, "VISA_SendCommand break 1\n");
                           break;
                        }
                        v5 = 0;
                        continue;
                    }
                    v7 = VISA_CheckSWStatus(deviceId);
                    v2 = v7;
                    if ((v7 & 0xffff) != 1) {
                    	dlog( LOG_DEBUG, "VISA_SendCommand break 2\n");
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
    	dlog( LOG_DEBUG, "VISA_SendCommand after loop\n");
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
#else
    DLFMModeOff(deviceId, 0);
    if (command < 0 || command >16) {
    	return -1;
    }

#ifdef TRY_1
	uint16_t response, rpe;
	// Check status before sending command
	dd_wsCommand(deviceId, VXI_GETSTATUS, &response, &rpe);
    // Send command
    VISA_SendWord(deviceId, command);
    // Send parameter words
    if (numBytes>0) {
    	int i;
        for (i=0; i<numBytes; i++) {
        	VISA_SendWord(deviceId, wordPtr[i]);
    		// check for protocol errors
    	    //int32_t v1 = _sendCommand(deviceId, 0xcdff);
    		//uint16_t response, rpe;
    		dd_wsCommand(deviceId, VXI_GETSTATUS, &response, &rpe);
    		checkResponse(response);
        }
		int32_t status = VISA_CheckSWStatus(deviceId);
        if ((status & 0xffff) != 1) {
        	dlog( LOG_DEBUG, "VISA_SendCommand failed, status=%d.\n", status);
        }
    }
#else
    dd_SendCommand(deviceId, command, numBytes, wordPtr);
	int32_t status = VISA_CheckSWStatus(deviceId);
    if ((status & 0xffff) != 1) {
    	dlog( LOG_DEBUG, "VISA_SendCommand may have failed(?), status=%d.\n", status);
    }
#endif
    return 0;
#endif
}

/**
 * Function to send a command/word to the P1 CPU. This requires
 * sending the VXI_ENGINECOMMAND command first. The subsequent word
 * will then be forwarded to P1.
 */
int32_t VISA_SendWord(SET9052 *deviceId, int16_t command) {
	dlog( LOG_INFO, "VISA_SendWord: %x\n", command);
    int16_t v1 = -2; // bp-8
    g2 = deviceId;
#ifdef ORIG
    int32_t v2 = sendWord(deviceId, VXI_ENGINECMD /*0x7f00*/); // 0x100019db
    g2 = v2;
    if (v2 != 0) {
        dlog( LOG_ERROR, "VISA_SendWord: failed (1)\n");
        return (int32_t)v1 | v2 & -0x10000;
    }
    int32_t v3 = sendWord(deviceId, command); // 0x100019f0
    if (v3 == 0) {
        v1 = 0;
    } else {
        dlog( LOG_ERROR, "VISA_SendWord: failed (2)\n");
    }
#else
    int readAnswer = 0;
    dd_p1Command(deviceId->session_handle, command, readAnswer);
    int32_t v3 = 1;
#endif
    return (int32_t)v1 | v3 & -0x10000;
}

/**
 * Function to send a command/word to P2 CPU. Simply the command is written.
 */
int32_t _sendCommand(SET9052 *deviceId, int16_t command) {
	dlog( LOG_DEBUG, "_sendCommand: %x=%s\n", command, getCmdNameP2((command&0xffff)));
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t response; // bp-12
    int32_t v3; // 0x1000133c
    if ((int16_t)_doSendWord(deviceId, command, 1, &response) > -1) {
        v3 = 0;
    } else {
        response = 0;
        v3 = 1;
    }
    g3 = v1;
    //dlog( LOG_DEBUG, "\t_sendCommand %x\n", v3);
    return (int32_t)response | SetErrorStatus(deviceId, v3) & -0x10000;
}

// Switch on DLFM (DataLow Fill) Mode.
// Sets bit 9 and waits until bit 8 is set or timeout.
// function_100016c8
int32_t DLFMModeOn(SET9052 *deviceId) {
	dlog( LOG_DEBUG, "\tDLFMModeOn\n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t timeout = RdTimeoutWait(deviceId); // 0x100016d2
    int32_t v3; // bp-20
    if ((0x10000 * readStatusReg(deviceId, &v3) || 0xffff) >= 0x1ffff) {
        g5 = deviceId;
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe; // 0x10001707
        g3 = v1;
    	dlog( LOG_DEBUG, "\tDLFMModeOn leave 1 --> 0x%x\n", result);
        return result;
    }
    int32_t v4 = v3; // 0x10001710
    // DD : next line set bit position 9 (counted from zero)
    // This sets DLFM mode,
   int32_t v5 = v4 & -0xff01 | g7 & -0x10000 | v4 & 0xfd00 | 512; // 0x10001714
    v3 = v5;
    int32_t v6 = 0x10000 * v5 / 0x10000; // 0x1000171b
    g2 = v6;
    int32_t result2; // 0x100017e0
    if ((0x10000 * write2StatusReg(deviceId, (int16_t)v6, v6, 0) || 0xffff) < 0x1ffff) {
        InitTimeoutLoop(0);
        int32_t v7;
        while (true) {
            int32_t v8 = 0x10000 * checkDLFMBitSet(deviceId, &v3); // 0x10001764
            if ((v8 || 0xffff) < 0x1ffff) {
                v7 = v8 / 0x10000;
                g5 = v7;
                SetErrorStatus(deviceId, v7);
                g3 = v1;
            	dlog( LOG_DEBUG, "\tDLFMModeOn leave 1 --> 0x%x\n", -2);
                return -2;
            }
            if ((0x10000 * TestTimeoutDone(timeout) || 0xffff) >= 0x1ffff) {
                break;
            }
        }
        int32_t v9 = 0x10000 * checkDLFMBitSet(deviceId, &v3); // 0x100017ac
        v7 = v9 / 0x10000;
        g5 = v7;
        SetErrorStatus(deviceId, v7);
        result2 = -2;
    } else {
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe;
    }
    g3 = v1;
	dlog( LOG_DEBUG, "\tDLFMModeOn leave 2 --> 0x%x\n", result2);
    return result2;
}

/**
 * Calls dd_viWrite(), dd_viIn16() and checks for errors
 * (protocol erros, using dd_viWrite() again)
 */
int32_t _doSendWord(SET9052 *deviceId, uint16_t command, int32_t a3, int32_t* response) {
	dlog( LOG_DEBUG, "_doSendWord %x=%s\n", command, getCmdNameP2((command&0xffff)));
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t session_handle = deviceId->session_handle; // *(int32_t *)(deviceId + 468); // 0x1000136a
    int32_t v3; // bp-24
    int32_t *v4 = &v3; // 0x10001373
    g5 = deviceId;
    int32_t v5 = readResponseRegT(deviceId, 100, 512, v4); // 0x10001384
    int32_t v6 = 0x10000 * v5 / 0x10000; // 0x10001390
    //dlog( LOG_DEBUG, "_doSendWord: v6 %x\n", v6 );
    if ((int16_t)v6 <= -1) {
        g3 = v1;
        return v6 & -0x10000 | v5 & 0xffff;
    }
    g5 = session_handle;
    // Register 14 = 0xe = data Low
    int32_t v7 = dd_viWsCmdAlike(session_handle, 1, 14, v6 & -0x10000 | (int32_t)command); // 0x100013b4
    //dlog( LOG_DEBUG, "_doSendWord: v7 %x\n", v7 );
    if (v7 != 0) {
        g3 = v1;
        return v7 & -0x10000 | 0x8000;
    }
    g5 = deviceId;
    int32_t v8 = readResponseRegT(deviceId, 100, 512, v4); // 0x100013dc
    int32_t v9 = 0x10000 * v8 / 0x10000; // 0x100013e8
    //dlog( LOG_DEBUG, "_doSendWord: v9 %x\n", v9 );
    if ((int16_t)v9 <= -1) {
        g3 = v1;
        return v9 & -0x10000 | v8 & 0xffff;
    }
    int32_t v10 = (int32_t)v3 & 2048; // 0x10001407
    int32_t v11;
    //dlog( LOG_DEBUG, "_doSendWord: v10 %x\n", v10 );
    if (v10 != 0) {
        v11 = 1;
        if ((a3 & 0xffff) != 0) {
        	// do only if a3&0xffff != 0, i.e. a3 in range 0x0001..0xffff
            g5 = session_handle;
            // call gets a response in v4 which is *v3; if v12=ret==0, response:=v13 which is v3
            // 14 = 0xe = 1110
            // 10 = 0xa = 1010 (also used as arg3)
            int32_t v12 = dd_viIn16(session_handle, 1, 14, v4); // 0x1000158a
            if (v12 == 0) {
                int16_t v13 = v3; // 0x100015a1
                *response = v13;
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
    // Register 14 = 0xe = DataLow
    int32_t v14 = dd_viWsCmdAlike(session_handle, 1, 14, WS_CMD_RPE /*0xcdff*/); // 0x10001421
    //dlog( LOG_DEBUG, "_doSendWord: v14 %x\n", v14 );
    if (v14 != 0) {
        g3 = v1;
        return v14 & -0x10000 | 0x8400;
    }
    g5 = deviceId;
    int32_t v15 = readResponseRegT(deviceId, 100, 512, v4); // 0x10001449
	//dlog( LOG_DEBUG, "\t_doSendWord *v4 %x\n", *v4);
	//dlog( LOG_DEBUG, "\t_doSendWord v3 %x\n", v3);

    int32_t v16 = 0x10000 * v15 / 0x10000; // 0x10001455
    //dlog( LOG_DEBUG, "_doSendWord: v3 v16 %x %x\n", v3, v16 );
    if ((int16_t)v16 <= -1) {
        g3 = v1;
        return v16 & -0x10000 | v15 & 0xffff;
    }

#ifndef __hp9000s700
    v3=512;
#endif
    if (((int32_t)v3 & 512) == 0) {
        dlog( LOG_DEBUG, "_doSendWord: FAIL return1 %x\n", v3);
        g3 = v1;
        return 0x8000;
    }
    g5 = v4;
    int32_t v17 = readResponseRegT(deviceId, 100, 1024, v4); // 0x10001497
    int32_t v18 = 0x10000 * v17 / 0x10000; // 0x100014a3
    int32_t v19 = v18 & 0x8000; // 0x100014a7
    g5 = v19;
    //dlog( LOG_DEBUG, "_doSendWord: v19 %x\n", v19 );
    if (v19 != 0) {
        g3 = v1;
        return v18 & -0x10000 | v17 & 0xffff;
    }

#ifndef __hp9000s700
    v3=1024;
#endif
    if ((v3 & 1024) == 0) {
        dlog( LOG_DEBUG, "_doSendWord: FAIL return2 %x\n", v3);
        g3 = v1;
        return v18 & -0x10000 | 0x8000;
    }
    g5 = session_handle;
    int32_t v20 = dd_viIn16(session_handle, 1, 14, v4); // 0x100014e8
    //dlog( LOG_DEBUG, "_doSendWord: v20 %x\n", v20 );
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
    //dlog( LOG_DEBUG, "_doSendWord --> v10 v11 ret %x %x %x\n",  v10, v11, (v10 & -0x10000 | v11) );
// XXX DD we must return >-1
#ifdef ORIG
    return v10 & -0x10000 | v11;
#else
    return 0;
#endif
// XXX DD
}

// function_100011fc
int32_t readStatusReg(SET9052 *deviceId, int16_t *val16) {
    int32_t session_handle = deviceId->session_handle; //*(int32_t *)(deviceId + 468);
    g7 = session_handle;
    int32_t v2 = dd_viIn16(session_handle, 1, 4, val16);
	dlog( LOG_DEBUG, "\treadStatusReg() -> v2: 0x%x, response: 0x%x\n", v2, *val16);

    int32_t ret = SetErrorStatus(deviceId, v2) & -0x10000 | v2;
	//dlog( LOG_DEBUG, "readStatusReg --> 0x%x\n", ret);
    return ret;
}

// function_10001249
int32_t write2StatusReg(SET9052 *deviceId, uint16_t word, int32_t unused, int32_t unused1) {
	// What is this call doing ???
	dlog( LOG_DEBUG, "\twrite2StatusReg(word %x=%s,0x%x, 0x%x)\n", word, getCmdNameP2(word), unused, unused1);
	int32_t v1 = deviceId->session_handle;
#ifdef ORIG
    int32_t v2 = dd_viWsCmdAlike(v1, 1, 4, g2 & -0x10000 | command) != 0;
#else
    int32_t v2;
	//dlog( LOG_DEBUG, "Command %x left out.\n", command);
	v2 = dd_viOut16(v1, 1, 4, word);
#endif
    g5 = deviceId;
    return SetErrorStatus(deviceId, v2) & -0x10000 | v2;
}

// Check DLFM bit 8 in status register for being set.
// returns 0 if set, 3 if cleared.
// function_100017e1
int32_t checkDLFMBitSet(SET9052 *deviceId, int16_t * a2) {
	//dlog( LOG_DEBUG, "\tcheckDLFMBitSet\n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2;
    int32_t a2tmp;
    if ((0x10000 * readStatusReg(deviceId, &a2tmp) || 0xffff) >= 0x1ffff) {
    	*a2 = a2tmp;
        v2 = SetErrorStatus(deviceId, 1);
        g3 = v1;
        int ret = (int32_t)1 | v2 & -0x10000;
    	dlog( LOG_DEBUG, "\tcheckDLFMBitSet 1 --> 0x%x\n", ret);
        return ret;
    }
	*a2 = a2tmp;
    int16_t v3; // bp-12
    int32_t v4; // 0x1000182b
    // Check if Bit 8 is set
    if ((*a2 & (1<<8) /*256*/) != 0) {
        v3 = IE_SUCCESS /*0*/;
        v4 = 0;
    } else {
        v3 = 3;
        v4 = 3;
    }
    v2 = SetErrorStatus(deviceId, v4);
    g3 = v1;
    int ret = (int32_t)v3 | v2 & -0x10000;
	dlog( LOG_DEBUG, "\tcheckDLFMBitSet 2 --> %d\n", ret);
    return ret;
}

// function_100015d0
int32_t readResponseRegT(SET9052 * deviceId, int32_t timeout, int16_t mask, int32_t* val) {
    int32_t v1 = g3; // 0x100015d0
    InitTimeoutLoop(v1);
    g3 = v1;
    return 0x10000 * readResponseReg(deviceId, mask, val) / 0x10000;
}

// function_10001654
int32_t readResponseReg(SET9052 *deviceId, int16_t mask, int32_t* val) {
    g5 = deviceId;
    if (dd_viIn16(deviceId->session_handle, 1, 10, val) != 0) {
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0x8020; // 0x10001686
        return result;
    }
    g5 = val;
    int32_t result2; // 0x100016c7
    if (((int32_t)*(int16_t *)val & (int32_t)mask) != 0) {
        result2 = SetErrorStatus(deviceId, IE_SUCCESS /*0*/) & -0x10000 | 1;
    } else {
        g5 = deviceId;
        result2 = SetErrorStatus(deviceId, IE_WARN_VALS /*1*/) & -0x10000 | 0x8004;
    }
	dlog( LOG_DEBUG, "\treadResponseReg(a2=0x%x) --> %d\n", mask, result2);
    return result2;
}

int32_t VISA_CheckSWStatus(SET9052 *deviceId) {
	dlog( LOG_DEBUG, "VISA_CheckSWStatus: \n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = dd_readEngineStatus(deviceId);
    int16_t v3 = v2; // bp-20
    int32_t v4 = v2 & 0xffff;
    g5 = v4;
    if (v4 != 1) {
        v3 = dd_readEngineStatus(deviceId);
    }

    // Below is some kind of timeout loop.
    // Timeout value is loaded into 'timeout'.
    // A running time value 'now' is checked if greater than 'timeout'. If yes, the loop breaks.
    // Inside loop, dd_readEngineStatus() is used to check engine status. Status value is in v3,v9,v10.
    int32_t timeout = RdTimeoutWait(deviceId); // 0x10001c04
    int32_t v6 = IeTimer(timeout); // 0x10001c0f
    int32_t v7 = v6; // 0x10001c496
    int32_t now; // 0x10001c38
    while (true) {
        int16_t v9 = v3; // 0x10001c17
        g5 = v9;
        if (v9 != 0) {
            g3 = v1;
        	dlog( LOG_DEBUG, "VISA_CheckSWStatus -> %x\n", ((int32_t)v9 | v7 & -0x10000));
            return (int32_t)v9 | v7 & -0x10000;
        }
        int32_t v10 = dd_readEngineStatus(deviceId); // 0x10001c28
        v3 = v10;
        now = IeTimerFrom(v6, 0x10000 * v10 / 0x10000);
#ifndef __hp9000s700
        now=110;
#endif
        if (now > timeout) {
            break;
        }
        v7 = now;
    }
    g3 = v1;
	dlog( LOG_DEBUG, "VISA_CheckSWStatus -> %x\n", ((int32_t)v3 | now & -0x10000));
    return (int32_t)v3 /* | now & -0x10000 */;
}

int32_t dd_readEngineStatus(SET9052 *deviceId) {
	dlog( LOG_DEBUG, "dd_readEngineStatus\n") ;
    DLFMModeOff(deviceId, 0x10000 * (int32_t)g5 / 0x10000);
    g5 = deviceId;
    // DD: 0x7e00 = VXI_GETSTATUS
    int32_t v1 = _sendCommand(deviceId, 0x7e00); // 0x100010a7
    DLFMModeOn(deviceId);
    g7 = deviceId;
	dlog( LOG_DEBUG, "dd_readEngineStatus result=%x\n", ((uint32_t)g5 & -0x10000 | v1 & 255)) ;
    return SetEngineReplyCode(deviceId, (uint32_t)g5 & -0x10000 | v1 & 255);
}

// Switch off DLFM (DataLow Fill) Mode.
// Clears bit 9 and waits until bit 8 is clear or timeout.
// function_100010e1
int32_t DLFMModeOff(SET9052 *deviceId, int32_t unused) {
	dlog( LOG_DEBUG, "DLFMModeOff(unused=0x%x)\n", unused) ;
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t timeout = RdTimeoutWait(deviceId); // 0x100010eb
    int32_t v3; // bp-20
    if ((0x10000 * readStatusReg(deviceId, &v3) || 0xffff) >= 0x1ffff) {
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe; // 0x10001120
        g3 = v1;
    	dlog( LOG_DEBUG, "DLFMModeOff(unused=0x%x) 1 --> %d\n", unused, result) ;
        return result;
    }
    // DD : next line clears bit position 9 (counted from zero)
    // This clears DLFM mode,
    int16_t v4 = v3 & 0xfdff /*-513*/; // 0x1000112d
    v3 = v4;
    int32_t v5 = v4; // 0x10001136
    g2 = v5;
    int32_t v6 = 0x10000 * write2StatusReg(deviceId, v4, v5, 0); // 0x10001147
    g7 = v6 / 0x10000;
    int32_t result2; // 0x100011fb
    if ((v6 || 0xffff) < 0x1ffff) {
        InitTimeoutLoop(0);
        while (true) {
            int32_t v7 = 0x10000 * checkDLFMBitClear(deviceId, &v3); // 0x1000117f
            if ((v7 || 0xffff) < 0x1ffff) {
                g7 = deviceId;
                SetErrorStatus(deviceId, v7 / 0x10000);
                g3 = v1;
            	dlog( LOG_DEBUG, "DLFMModeOff(unused=0x%x) 1 --> -2\n", unused) ;
                return -2;
            }
            if ((0x10000 * TestTimeoutDone(timeout) || 0xffff) >= 0x1ffff) {
                break;
            }
        }
        int32_t v8 = 0x10000 * checkDLFMBitClear(deviceId, &v3); // 0x100011c7
        g7 = deviceId;
        SetErrorStatus(deviceId, v8 / 0x10000);
        result2 = -2;
    } else {
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe;
    }
    g3 = v1;
	dlog( LOG_DEBUG, "DLFMModeOff(unused=0x%x) 1 --> %d\n", unused, result2) ;
    return result2;
}

/**
 * Wraps _doSendWord() and adds SetErrorStatus()
 */
int32_t sendWord(SET9052 *deviceId, int16_t command) {
	dlog( LOG_DEBUG, "sendWord(function_10001a0a): %x\n", command);
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

// Check DLFM bit 8 in status register for being cleared.
// returns 0 if cleared, 3 if set.
// function_10001297
int32_t checkDLFMBitClear(SET9052 *deviceId, int16_t *a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2; // 0x100012ea
    if ((0x10000 * readStatusReg(deviceId, a2) || 0xffff) >= 0x1ffff) {
        v2 = SetErrorStatus(deviceId, 1);
        g3 = v1;
    	dlog( LOG_DEBUG, "\tcheckDLFMBitClear() 1 --> %d\n", v2);
        return (int32_t)1 | v2 & -0x10000;
    }
    int16_t v3; // bp-12
    int32_t v4; // 0x100012e1
    // Check bit 8
    if ((*a2 & (1<<8) /*256*/) == 0) {
        v3 = IE_SUCCESS /*0*/;
        v4 = 0;
    } else {
        v3 = 3;
        v4 = 3;
    }
    v2 = SetErrorStatus(deviceId, v4);
    g3 = v1;
	dlog( LOG_DEBUG, "\tcheckDLFMBitClear() --> %d\n", v3);
    return (int32_t)v3 | v2 & -0x10000;
}

int32_t VISA_ResetEngine(int32_t deviceId) {
	dlog( LOG_DEBUG, "VISA_ResetEngine\n");
    // DD: 0x3701 = 0xcaff = Read Interrupters
    int16_t v1 = _sendCommand(deviceId, WS_CMD_RI /*0xcaff*/ /*-0x3701*/); // bp-8
    g5 = deviceId;
    int32_t v2; // 0x10002169
    int16_t v3; // 0x1000215a
    int32_t v4; // 0x10002175
    int32_t v5; // 0x10002175
    if (RdErrorStatus(deviceId) == 0) {
        if (v1 == -2) {
            // DD: -769 = -0x301 = 0xfcff BNO
            v1 = _sendCommand(deviceId, WS_CMD_BNO /*0xfcff*/ /*-769*/);
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
	dlog( LOG_DEBUG, "\t_imported_function_ord_129(%d, %d, %d, %d, %d, %d)\n", a1, a2, a3, a4, a5, a6);
	return 0;
}

int32_t _imported_function_ord_130(int32_t a1, int32_t a2) {
	return 0;
	dlog( LOG_DEBUG, "\t_imported_function_ord_130(%d, %d)\n", a1, a2);
}


void _initEngine(INST id, int argc) {
	unsigned int ret;
	uint16_t response, rpe;

	dlog(LOG_DEBUG, "_initEngine\n");
	dd_wsCommand(id, WS_CMD_ANO, &response, &rpe);
	dd_wsCommand(id, WS_CMD_BNO, &response, &rpe);

	dd_wsCommandNoAnswer(id, VXI_RESETENG, &response, &rpe);

	// Send ENG_INIT with 3 word parameters, all value 0
	// This was tested and works.
	// (Code is different and sends 4 words !?!).
	dd_p1Command(id, ENG_INIT, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);
	dd_p1Command(id, 0, 0);
	dd_wsCommand(id, WS_CMD_RPE, &response, &rpe);
	dd_wsCommand(id, VXI_GETSTATUS, &response, &rpe);

	if (checkResponse(response) != 0) {
		dlog(LOG_DEBUG, "_initEngine failed. Exiting.\n");
		exit(0);
	}
}


int _getStatus(INST id, int *fifo, int *status) {
	unsigned short cmd = VXI_GETSTATUS;
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

#if defined(__hp9000s700)
	ret = ivxiws(id, cmd, &response, &rpe);
	dlog( LOG_DEBUG, "ret: %u, response=%x, rpe=%x\n", ret, response, rpe);
	if (ret != 0) {
		dlog( LOG_ERROR, "Error: %d\n", ret);
		return -1;
	}

	// fifo are bits 11..8 in response
	*fifo = (response >> 8) & 0xf;
	*status = response & 0xff;
	dlog( LOG_DEBUG, "fifo: 0x%x, status: 0x%x\n", *fifo, *status);

	// fifo checks
	/*if (*fifo == (STAT_EMPTY>>8)&0xff) {
	 dlog( LOG_DEBUG, "Engine has no data\n");
	 }*/
	if (response & (1 << 8)) {
		// bit8=0 => no data
		dlog( LOG_DEBUG, "Engine has data\n");
	} else {
		dlog( LOG_DEBUG, "Engine has no data\n");
	}

	// status checks
	if (*status == ENG_REPLY_BAD_CMD) {
		dlog( LOG_DEBUG, "ENG_REPLY_BAD_CMD\n");
	}
	if (*status == ENG_REPLY_INMAIN) {
		dlog( LOG_DEBUG, "ENG_REPLY_INMAIN\n");
	}
#endif

	return ret;
}
int32_t dd_viOpen(int32_t a1, char *session_string, int32_t a3, int32_t a4, int32_t *session_id) {
	dlog( LOG_DEBUG, "\tviOpen(%s)\n", session_string);
#if defined(__hp9000s700)
#ifdef HP_SICL
	INST id = iopen(session_string);
#else
	INST id = dd_iOpen(session_string);
#endif
	dlog( LOG_DEBUG, "\tviopen() -> %x\n", id);

	if (id == 0) {
		return -1;
	}
	*session_id = id;
	itimeout (id, 10000);

	_initEngine(id, 2);
	sleep(1);

#else
	*session_id = 11;
#endif
	return VI_SUCCESS;
}

// Was _imported_function_ord_132()
int32_t dd_viClose(int32_t session_handle) {
	dlog( LOG_DEBUG, "viClose(%d)\n", session_handle);
	return 0;
}

int32_t _imported_function_ord_133(int32_t a1, int32_t a2, int32_t a3) {
	dlog( LOG_DEBUG, "\t_imported_function_ord_133(%d, %d, %d)\n", a1, a2, a3);
	return 0;
}

int32_t dd_viSetAttribute(int32_t a1, int32_t a2, int32_t a3) {
	dlog( LOG_DEBUG, "viSetAttribute(%d, %d, %d)\n", a1, a2, a3);
	return VI_SUCCESS;
}
int32_t dd_viOpenDefaultRM(int32_t a1) {
	dlog( LOG_DEBUG, "viOpenDefaultRM()\n");
	return VI_SUCCESS;
}

// Was _imported_function_ord_261()
int32_t dd_viIn16(int32_t session_handle, int32_t space, int32_t offset, int16_t *val16) {
	// space: is always 1 (true?)
 	//dlog( LOG_TRACE, "\dd_viIn16(%d, 0x%x, 0x%x)\n", session_handle, space, offset);
 	int32_t ret = dd_iwPeek(session_handle, space, offset, val16);

 	dlog( LOG_TRACE, "\tdd_viIn16(%d, 0x%x, 0x%x) --> 0x%x\n", session_handle, space, offset, (*val16 & 0xffff));

	// bits 9,10 are required and checked in _doSendWord().
	// bit 8 required by checkDLFMBitSet().
	// DD XXX analyze what they might mean
	//*response = (1<<9)|(1<<10)/*|(1<<8)*/;
	//dlog( LOG_DEBUG, "iflush response 0x%x\n", *response);

	return ret;
}

int32_t dd_viOut16(int32_t session_handle, int32_t space, int32_t offset, int16_t val16) {
 	dlog( LOG_TRACE, "\tdd_viOut16(%d, 0x%x, 0x%x, 0x%x)\n", session_handle, space, offset, val16);
	int32_t ret = dd_iwPoke(session_handle, space, offset, val16);
	return ret;
}

/**
 * Return value is 0 on success. This can be seen e.g. in _doSendWord() where processing stops
 * if we return sth. different from 0.
 */
// Was _imported_function_ord_262 which equals ViOut16
int32_t dd_viWsCmdAlike(int32_t session_handle, int32_t a2, int32_t a3, int32_t command) {
	dlog( LOG_DEBUG, "\tWScmdAlike(%d, %d, %d, 0x%x=%s)\n", session_handle, a2, a3, command, getCmdNameP2(command));
	uint16_t ret;
	uint16_t cmd = command;
	uint16_t response;
	uint16_t rpe;

#ifdef ORIG
	ret = ivxiws(session_handle, cmd, &response, &rpe);
#else
	ret = dd_wsCommand(session_handle, cmd, &response, &rpe);
#endif
	dlog( LOG_DEBUG, "\tWScmdAlike() -> ret=0x%x, response=0x%x, rpe=0x%x. Returning 0x%x\n", ret, response, rpe, ret);
	return ret;
}

int32_t dd_viSetBuf(int32_t session_handle, int32_t mask, int32_t size) {
	dlog( LOG_DEBUG, "viSetBuf(%d,%d,%d)\n", session_handle, mask, size);
#if defined(__hp9000s700)
#ifdef ORIG
	int ret = isetbuf(session_handle, mask, size);
#else
	int ret = 0;
#endif
	return ret;
#else
	return VI_SUCCESS;
#endif

}

/*------------------------------------------------------------------------------------*/
/* MeasureAmplWithFreq related code */
/*------------------------------------------------------------------------------------*/

// Seems to read in until FIFO is empty
int32_t VISA_ClearDataFIFO(SET9052 *deviceId) {
	dlog(LOG_DEBUG, "VISA_ClearDataFIFO\n");
	int16_t v1 = 0; // bp-8
    int32_t result2; // 0x10001e41
    while (true) {
        function_10001b08(deviceId);
        int32_t v2 = RdErrorStatus(deviceId); // 0x10001e65
        int32_t result = v2; // 0x10001e78
        if (v2 == 0) {
            int16_t v3 = v1; // 0x10001e3d
            int16_t v4 = v3 + 1; // 0x10001e41
            result2 = (int32_t)v3 & -0x10000 | (int32_t)v4;
            v1 = v4;
            int32_t v5 = v4; // 0x10001e49
            if (v4 != 512 && v4 < 512 == (511 - v5 & v5) < 0) {
                break;
            }
            continue;
        }
    	dlog(LOG_DEBUG, "VISA_ClearDataFIFO - finished 1\n");
        return result;
    }
	dlog(LOG_DEBUG, "VISA_ClearDataFIFO - finished 2\n");
    return result2;
}

// Checks bit 10 in response register. If clear, return an error. If set,
// read in register 14 = 0xe = DataLow and return the value.
// This seems to be the basic read function when fetching data from the engine !?!
// called by VISA_FetchDataWord and VISA_ClearDataFIFO.
// function_10001b08
int32_t function_10001b08(SET9052 *deviceId) {
	dlog(LOG_DEBUG, "function_10001b08() basic read function when fetching data from the engine  \n");
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = RdTimeoutWait(deviceId); // 0x10001b1f
    int32_t v3; // bp-24
    int32_t *v4 = &v3; // 0x10001b2a
    g5 = v4;
    // 1024 = (1<<10), bit position 10 in response register.
    int32_t v5 = readResponseRegT(deviceId, v2, 1024, v4); // 0x10001b3b
    int16_t v6 = v5; // 0x10001b3b
    int32_t v7; // 0x10001bbc
    if ((int16_t)v5 <= -1) {
        v7 = SetErrorStatus(deviceId, 1);
        g3 = v1;
    	dlog(LOG_DEBUG, "function_10001b08() readResponseRegT gave error --> 0x%x\n", v7);
        return v7 & -0x10000 | (int32_t)v6;
    }
    // If bit 10 is clear, this is an error and we return. ?!?
    if ((v3 & 1024) == 0) {
        v7 = SetErrorStatus(deviceId, 2);
        g3 = v1;
    	dlog(LOG_DEBUG, "function_10001b08() 2, bit 10 not set --> 0x%x\n", v7);
        return v7 & -0x10000 | (int32_t)v6;
    }
    // If bit 10 is set, we read DataLow register
    // If that read gives no error (dd_viIn16 returns 0) we set error status 0.
    // if we get an error,  (dd_viIn16 returns !=0) we set error status 1.
    int32_t v8 = deviceId->session_handle; // *(int32_t *)(deviceId + 468); // 0x10001b78
    int16_t v9; // bp-8
    int32_t v10; // 0x10001bb4
    if (dd_viIn16(v8, 1, 14, &v9) == 0) {
        v10 = 0;
    } else {
        v10 = 1;
        v9 = 0;
    }
    v7 = SetErrorStatus(deviceId, v10);
    g3 = v1;
	dlog(LOG_DEBUG, "function_10001b08() 3, ok --> 0x%x\n", v7 & -0x10000 | (int32_t)v9);
    return v7 & -0x10000 | (int32_t)v9;
}

int32_t VISA_FetchDataWord(SET9052 *deviceId, int16_t *dword) {
	dlog(LOG_DEBUG, "VISA_FetchDataWord()\n");
    int16_t v1 = function_10001b08(deviceId); // bp-8
    int32_t v2 = RdErrorStatus(deviceId); // 0x10001ae0
    int32_t v3; // 0x10001b00
    if (v2 == 0) {
        // entry.dec_label_pc_10001b00_crit_edge
        v3 = v1;
        // branch -> 0x10001b00
    } else {
        // 0x10001aec
        if (dword != NULL) {
            // 0x10001af2
            *dword = 1;
            // branch -> 0x10001afa
        }
        // 0x10001afa
        v3 = 0;
        // branch -> 0x10001b00
    }
    // 0x10001b00
	dlog(LOG_DEBUG, "VISA_FetchDataWord() - check if decompiled ok, see dword arg --> \n", v3);
    return v3 | v2 & -0x10000;
}

int32_t VISA_VerDataBlock(SET9052 *a1, int32_t a2) {
    int32_t result; // 0x10001ac7
    if ((0x10000 * TestFuncStatusAndPtr(a1) || 0xffff) < 0x1ffff) {
        // 0x10001aba
        result = (a2 & 0xffff) != 0;
        // branch -> 0x10001ac6
    } else {
        // 0x10001aac
        result = GetFuncStatusCode(a1);
        // branch -> 0x10001ac6
    }
    // 0x10001ac6
	dlog( LOG_DEBUG, "VISA_VerDataBlock(%0x%x) -> %d\n", a2, result);
    return result;
}

// a4,a5 is float???
int32_t VISA_GetDataBlock(SET9052 *deviceId, int64_t reversePointIdx, int32_t a3, int32_t *a4, /*int32_t*/int16_t *a5) {
	dlog(LOG_DEBUG, "VISA_GetDataBlock(reversePointIdx=%d,a3=%d)\n", reversePointIdx, a3);
    int64_t v1 = a3;
    int32_t v2 = g3; // bp-4
    g3 = &v2;
    int32_t result; // 0x1000253c
    if ((0x10000 * TestFuncStatusAndPtr(deviceId) || 0xffff) < 0x1ffff) {
        if (a4 != 0) {
            if (a5 != 0) {
                int32_t v3 = v1 * 0x100000000 * reversePointIdx / 0x100000000; // 0x1000245c
                uint32_t v4 = VISA_CheckHWStatus(deviceId) & 0xf00 /*3840*/; // 0x10002472
                int64_t v5;
                if (v4 >= 0xd01 /*3329*/) {
                    if (v4 != 0xf00 /*3840*/) {
                        v5 = 0;
                    } else {
                        v5 = 384; // = 0x180
                    }
                } else {
                    if (v4 != 0xd00 /*3328*/) {
                        if (v4 != 0x900 /*2304*/) {
                            if (v4 != 0xb00 /*2816*/) {
                                v5 = 0;
                            } else {
                                v5 = 1;
                            }
                        } else {
                            v5 = 128; // * 0x80
                        }
                    } else {
                        v5 = 256; // 0x100
                    }
                }
                int32_t v6 = v5; // 0x100024da
                int32_t v7 = v3;
                if (v3 > v6) {
                    v7 = v6 - (int32_t)(v5 % v1);
                }
                int64_t v8 = v7;
                int64_t v9 = v8;
                if (v7 == 0) {
                    // 0x100024f4
                    if (v6 == 1) {
                        // 0x100024fa
                        if (a3 < 128) {
                            // 0x10002503
                            v9 = v1;
                            // branch -> 0x10002509
                        } else {
                            v9 = v8;
                        }
                    } else {
                        v9 = v8;
                    }
                }
                // 0x10002509
                *(int16_t *)a5 = 0;
                *(int32_t *)a4 = (int32_t)((0x100000000 * (int64_t)((int32_t)v9 >> 31) | v9 & 0xffffffff) / v1);
                SetErrorStatus(deviceId, 0);
                result = SetFuncStatusCode(deviceId, IE_SUCCESS /*0*/);
                // branch -> 0x10002539
                // 0x10002539
                return result;
            }
        }
        // 0x10002438
        SetErrorStatus(deviceId, 4);
        result = SetFuncStatusCode(deviceId,  IE_ERR_VALS /*-3*/);
        // branch -> 0x10002539
    } else {
        // 0x1000241b
        result = GetFuncStatusCode(deviceId);
        // branch -> 0x10002539
    }
    // 0x10002539
    return result;
}

int32_t VISA_CheckHWStatus(SET9052 *a1) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t v2; // bp-8
    int32_t v3 = readStatusReg(a1, &v2); // 0x10001a62
    int32_t v4 = 0xffffff00 /*-256*/;
    int32_t v5 = v3; // 0x10001a8e
    if ((0x10000 * v3 || 0xffff) < 0x1ffff) {
        int32_t v6 = 16 * ((int32_t)v2 & 0xf0 /*240*/); // 0x10001a87
        v4 = v6;
        v5 = v6;
        // branch -> 0x10001a8e
    }
    // 0x10001a8e
    g3 = v1;
    int32_t result = v5 & 0xffff0000 /*-0x10000*/ | v4;
	dlog(LOG_DEBUG, "VISA_CheckHWStatus() --> 0x%x\n", result);
    return v5 & -0x10000 | v4;
}

/*------------------------------------------------------------------------------------*/
/* End of file */
/*------------------------------------------------------------------------------------*/



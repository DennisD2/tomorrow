/*
 * visa.h
 *
 *  Created on: 02.04.2018
 *      Author: dennis
 */

#ifndef DVISA_H_
#define VISA_H_

#include "compatibility.h"

/* visa.c exposed functions */
int32_t VISA_InitEngine(SET9052 *deviceId);
int32_t VISA_ResetEngine(SET9052 *deviceId);

int32_t VISA_OpenSessionStep(SET9052 * deviceId);
int32_t VISA_SendWord(SET9052 *deviceId, int16_t command);
int32_t VISA_SendCommand(SET9052 *deviceId, int16_t command, int16_t numBytes, uint16_t *wordPtr);

int32_t VISA_ClearDataFIFO(SET9052 *deviceId);
// We have a problem in 5 or 6 params for the next function: commented out till cleared!
int32_t VISA_GetDataBlock(SET9052 *deviceId, int64_t reversePointIdx, int32_t a3, int32_t *a4, int16_t *a5) ;
int32_t VISA_FetchDataWord(SET9052 *deviceId, int16_t *dword);
int32_t VISA_VerDataBlock(SET9052 *a1, int32_t a2);
int32_t VISA_CloseSession(SET9052 *deviceId);


/* Word Serial Commands */
#define  WS_CMD_ANO     0xc8ff
#define     WS_MASK_ANO    0xffff
#define  WS_CMD_AHL     0xa900
#define     WS_MASK_AHL    0xff00
#define  WS_CMD_AIL     0xaa00
#define     WS_MASK_AIL    0xff00
#define  WS_CMD_AMC     0xa800
#define     WS_MASK_AMC    0xff00
#define  WS_CMD_BNO     0xfcff
#define     WS_MASK_BNO    0xfeff
#define  WS_CMD_BA      0xbc00
#define  WS_CMD_BA_END     0xbd00
#define     WS_MASK_BA     0xfe00
#define  WS_CMD_BR      0xdeff
#define     WS_MASK_BR     0xffff
#define  WS_CMD_CLR     0xffff
#define     WS_MASK_CLR    0xffff
#define  WS_CMD_CL      0xefff
#define     WS_MASK_CL     0xffff
#define  WS_CMD_CE      0xaf00
#define     WS_MASK_CE     0xff00
#define  WS_CMD_ENO     0xc9ff
#define     WS_MASK_ENO    0xffff
#define  WS_CMD_RPE     0xcdff
#define     WS_MASK_RPE    0xffff
#define  WS_CMD_GD      0xbf00
#define     WS_MASK_GD     0xff00
#define  WS_CMD_IC      0xbe00
#define     WS_MASK_IC     0xff00
#define  WS_CMD_RHL     0x8c00
#define     WS_MASK_RHL    0xff00
#define  WS_CMD_RH      0xc7ff
#define     WS_MASK_RH     0xffff
#define  WS_CMD_RIL     0x8d00
#define     WS_MASK_RIL    0xff00
#define  WS_CMD_RI      0xcaff
#define     WS_MASK_RI     0xffff
#define  WS_CMD_RMOD    0xccff
#define     WS_MASK_RMOD      0xffff
#define  WS_CMD_RP      0xdfff
#define     WS_MASK_RP     0xffff
#define  WS_CMD_RSTB    0xcfff
#define     WS_MASK_RSTB      0xffff
#define  WS_CMD_RSA     0xceff
#define     WS_MASK_RSA    0xffff
#define  WS_CMD_RD      0x8e00
#define     WS_MASK_RD     0xff00
#define  WS_CMD_CR      0x8f00
#define     WS_MASK_CR     0xff00
#define  WS_CMD_SL      0xeeff
#define     WS_MASK_SL     0xffff
#define  WS_CMD_SLMOD      0xae00
#define     WS_MASK_SLMOD     0xff00
#define  WS_CMD_SUMOD      0xad00
#define     WS_MASK_SUMOD     0xff00
#define  WS_CMD_TRIG    0xedff
#define     WS_MASK_TRIG      0xffff
#define  WS_CMD_USER    0x0000
#define     WS_MASK_USER      0x8000



#endif /* DVISA_H_ */

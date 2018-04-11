/*
 * ws.h
 *
 *  Created on: 10.04.2018
 *      Author: dennis
 */

#ifndef WS_H_
#define WS_H_

#include <sicl.h>

#define UINT16 unsigned short
#define INT16 short
#define UINT32 unsigned int


// register numbers (not: byte offsets as in official doc)
#define REG_ID 0
#define REG_DEVTYPE 1
#define REG_STATUSCRTL 2

#define REG_RESPONSE 5
#define REG_DATALOW 7

// RESPONSE register bit values
#define REG_RESPONSE_WR_BITV (UINT16)(1<<9)
#define REG_RESPONSE_RD_BITV (UINT16)(1<<10)
#define REG_RESPONSE_DIR_BITV (UINT16)(1<<12)
#define REG_RESPONSE_DOR_BITV (UINT16)(1<<13)
#define REG_RESPONSE_ERR_BITV (UINT16)(1<<11)

// RESPONSE register special values
// Device has put sth. in Datalow
#define READREADY 0x400
// Device is ok to read  from Datalow
#define WRITEREADY 0x200


// RESPONSE register bit masks
#define WRITEREADYDIR (UINT16)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DIR_BITV)
#define WRITEREADYDOR (UINT16)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DOR_BITV)

UINT32 dd_p1Command(INST id, UINT16 command, int readAnswer);
UINT32 dd_wsCommand(INST id, UINT16 command, UINT16 *response, UINT16 *rpe);

#endif /* WS_H_ */

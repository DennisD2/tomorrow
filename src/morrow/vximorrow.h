/*
 * ws.h
 *
 *  Created on: 10.04.2018
 *      Author: dennis
 */

#ifndef WS_H_
#define WS_H_

#include <sicl.h>

#include "compatibility.h"


// register numbers (not: byte offsets as in official doc)
#define REG_ID 0
#define REG_DEVTYPE 1
#define REG_STATUSCRTL 2

#define REG_RESPONSE 5
#define REG_DATALOW 7

// RESPONSE register bit values
#define REG_RESPONSE_WR_BITV (uint16_t)(1<<9)
#define REG_RESPONSE_RD_BITV (uint16_t)(1<<10)
#define REG_RESPONSE_DIR_BITV (uint16_t)(1<<12)
#define REG_RESPONSE_DOR_BITV (uint16_t)(1<<13)
#define REG_RESPONSE_ERR_BITV (uint16_t)(1<<11)

// RESPONSE register special values
// Device has put sth. in Datalow
#define READREADY 0x400
// Device is ok to read  from Datalow
#define WRITEREADY 0x200


// RESPONSE register bit masks
#define WRITEREADYDIR (uint16_t)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DIR_BITV)
#define WRITEREADYDOR (uint16_t)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DOR_BITV)

// Generic
uint32_t dd_p1Command(INST id, uint16_t command, int readAnswer);
uint32_t dd_wsCommand(INST id, uint16_t command, uint16_t *response, uint16_t *rpe);
uint32_t dd_wsCommandNoAnswer(INST id, uint16_t command, uint16_t *response, uint16_t *rpe);
uint16_t dd_iwPeek(int32_t session_handle, int32_t space, int32_t offset, int16_t* val16);
uint16_t dd_iwPoke(int32_t session_handle, int32_t space, int32_t offset, int16_t val16);

// Morrow
uint32_t dd_SendCommand(INST id, uint16_t command, uint16_t numWords, uint16_t *words);
int checkResponse(uint32_t response);

#endif /* WS_H_ */

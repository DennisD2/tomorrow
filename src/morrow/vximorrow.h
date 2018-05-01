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

// VXI device register byte offset (as in official doc)
#define REG_ID_BO 			0
#define REG_DEVTYPE_BO		2
#define REG_STATUSCRTL_BO	4
#define REG_RESPONSE_BO		10
#define REG_DATALOW_BO 		0xe

// VXI register numbers (= byte offset/2)
#define REG_ID 				(REG_ID_BO/2)
#define REG_DEVTYPE 		(REG_DEVTYPE_BO/2)
#define REG_STATUSCRTL 		(REG_STATUSCRTL_BO/2)

#define REG_RESPONSE		(REG_RESPONSE_BO/2)
#define REG_DATALOW			(REG_DATALOW_BO/2)

// RESPONSE register bit values
//#define REG_RESPONSE_WR_BITV (uint16_t)(1<<9)
//#define REG_RESPONSE_RD_BITV (uint16_t)(1<<10)
//#define REG_RESPONSE_DIR_BITV (uint16_t)(1<<12)
//#define REG_RESPONSE_DOR_BITV (uint16_t)(1<<13)
//#define REG_RESPONSE_ERR_BITV (uint16_t)(1<<11)

// RESPONSE register special values
// Device is ok to read from Datalow. Bit 9, dec512
#define WRITEREADY 0x200
// Device has put sth. in Datalow. Bit 10. dec1024
#define READREADY 0x400
// Error bit. Bit 11, dec2048
#define ERRORBIT 0x800

// RESPONSE register bit masks
#define WRITEREADYDIR (uint16_t)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DIR_BITV)
#define WRITEREADYDOR (uint16_t)(REG_RESPONSE_WR_BITV|REG_RESPONSE_DOR_BITV)

// Generic
uint16_t dd_viOut16(int32_t session_handle, int32_t space, int32_t offset, uint16_t val16);
uint16_t dd_viIn16(int32_t session_handle, int32_t space, int32_t offset, uint16_t *val16);
// With timeout in ms
uint32_t dd_viOut16TO(INST id, int32_t timeout, uint16_t word);
uint32_t dd_viIn16TO(INST id, int32_t timeout , uint16_t *theResponse, uint16_t *rpe);

uint32_t dd_p1Command(INST id, uint16_t command, int readAnswer);
uint32_t dd_wsCommand(INST id, uint16_t command, uint16_t *response, uint16_t *rpe);
uint32_t dd_wsCommandNoAnswer(INST id, uint16_t command, uint16_t *response, uint16_t *rpe);


// Morrow
uint32_t dd_SendCommand(INST id, uint16_t command, uint16_t numWords, uint16_t *words);
int checkResponse(uint32_t response);

#endif /* WS_H_ */

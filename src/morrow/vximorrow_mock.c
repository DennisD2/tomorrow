/**
 * VXI Mock layer for access Morrow V9054.
 * This file replaces the file 'vximorrow.c' on machines that have no SICL libs and have no devices attached.
 *
 * This code mocks a implementation of standard Word Serial protocol and
 * functions that communicate with CPU P1
 *
 */
#include "vximorrow.h"

#include "helper.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sapform.h>
#include <sa_defin.h>

// SICL Mock code

// Registers for mocked imap() call
uint16_t registers[] = {
/* 0 */0xbece,
/* 1 */0x0100,
/* 2 */0x7fac,
/* 3 */0x0000,
/* 4 */0xffff,
/* 5 */0x4f80,
/* 6 */0xffff,
/* 7 */0xaa00,
/* 8 */0x0db0,
/* 9 */0x5570,
/* 10*/0x5e7d,
/* 11*/0xfa06 };

INST iopen(char _far *addr) {
	return 1;
}

int igeterrno(void) {
	return 0;
}

int itimeout(INST id, long tval) {
	return 0;
}

// Morrow Mock code

int handle_p1_command = false;
int commandBytesLeft, commandBytesToRead;

static uint32_t dd_wsCommandWithAnswer(INST id, uint16_t command,
		uint16_t *theResponse, uint16_t *rpe, int readAnswer);

/**
 * Mocks map() call. Returns some static register like memory.
 */
char *imap(INST id, int mapspace, unsigned int pagestart, unsigned int pagecnt,
		char _far *suggested) {
	return (char*) registers;
}

uint32_t dd_wsCommand(INST id, uint16_t command, uint16_t *theResponse,
		uint16_t *rpe) {
	return dd_wsCommandWithAnswer(id, command, theResponse, rpe, true);
}

uint32_t dd_wsCommandNoAnswer(INST id, uint16_t command, uint16_t *theResponse,
		uint16_t *rpe) {
	return dd_wsCommandWithAnswer(id, command, theResponse, rpe, false);
}

/**
 * Mocks standard implementation of the word serial protocol.
 */
static uint32_t dd_wsCommandWithAnswer(INST id, uint16_t command,
		uint16_t *theResponse, uint16_t *rpe, int readAnswer) {
	dlog(LOG_DEBUG, "\nMock_dd_wsCommand(command=0x%x,readAnswer=%d)\n",
			command, readAnswer);
	uint32_t ret = 0;
	*rpe = 0x4321; // joke
	switch (command) {

	case VXI_GETSTATUS:
		*theResponse = 0xaa55;
		break;
	case VXI_GETVERSION:
		*theResponse = 0x14;
		break;

	case WS_CMD_ANO:
		*theResponse = 0xfffe;
		break;
	case WS_CMD_BNO:
		*theResponse = 0xffff;
		break;
	case WS_CMD_RPE:
		*theResponse = 0xffff;
		break;
	case WS_CMD_RI:
		*theResponse = 0xffff; // check this value
		break;
	default:
		*theResponse = 0xffff;
	}
	return ret;
}

/**
 * Mocks Morrow word serial protocol extensions.
 *
 */

uint32_t dd_p1Command(INST id, uint16_t command, int readAnswer) {
	dlog(LOG_DEBUG, "\nMock_dd_p1Command(0x%x) TBI\n", command);
}

uint32_t dd_SendCommand(INST id, uint16_t command, uint16_t numWords,
		uint16_t *words) {
	dlog( LOG_DEBUG, "\nMock_dd_SendCommand(%x=%s, %d, %lx) TBI \n", command,
			getCmdNameP1(command), numWords, words);
}

int checkResponse(uint32_t response) {
	uint32_t r = response & 0xff;
	char *p = "?";
	switch (r) {
	case ENG_REPLY_ACK:
		p = "ACK";
		break;
	case ENG_REPLY_BUSY:
		p = "BUSY";
		break;
	case ENG_REPLY_BAD_CMD:
		p = "Bad Command";
		break;
	case ENG_REPLY_INMAIN:
		p = "Initial state after reset";
		break;
	}
	dlog(LOG_INFO, "%s\n", p);
	if (r != ENG_REPLY_ACK) {
		return -1;
	}
	return 0;
}

/*
 * helper.c
 *
 *  Created on: 05.04.2018
 *      Author: dennis
 */

#include <stdio.h>
#include <stdarg.h>

#include "helper.h"

/**
 * Dumps sizes of datatypes
 */
void sysInfo() {
	int i = sizeof(short);
	dlog(LOG_DEBUG, "short: \t%d\n", i);
	i = sizeof(int);
	dlog(LOG_DEBUG, "int\t%d\n", i);
	i = sizeof(void *);
	dlog(LOG_DEBUG, "void*\t%d\n", i);
	i = sizeof(int *);
	dlog(LOG_DEBUG, "int*\t%d\n", i);
	i = sizeof(float);
	dlog(LOG_DEBUG, "float\t%d\n", i);
	i = sizeof(double);
	dlog(LOG_DEBUG, "double\t%d\n", i);
}

static int logLevel = LOG_ERROR;

/**
 * Set log level.
 */
void setLogLevel(int level) {
	if (level < LOG_NONE)
		level = LOG_NONE;
	if (level > LOG_ALL)
		level = LOG_ALL;
	logLevel = level;
}

/**
 * Log a message.
 */
void dlog(int level, const char *format, ...) {
	if (level > logLevel) {
		return;
	}
	va_list (args);
	va_start(args, format);
	vprintf(format, args);
	va_end(args);
}

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



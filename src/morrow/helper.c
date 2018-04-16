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

short _dd_sendCommand(INST id, short command) {
	unsigned short response;
	unsigned short rpe;
	unsigned int ret;

#if defined(__hp9000s700)
	ret = ivxiws(id, command, &response, &rpe);
	dlog( LOG_DEBUG, "ivxiws -> ret: %u, response=0x%x, rpe=0x%x\n", ret, response, rpe);
	if (ret != 0) {
		dlog( LOG_ERROR, "Error: %x\n", ret);
		return -1;
	}
#endif
	return response;
}


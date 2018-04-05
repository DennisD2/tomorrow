/*
 * helper.c
 *
 *  Created on: 05.04.2018
 *      Author: dennis
 */

#include <stdio.h>
#include <stdarg.h>

#include "helper.h"

static int logLevel = LOG_ERROR;

void setLogLevel(int level) {
	if (level < LOG_NONE)
		level = LOG_NONE;
	if (level > LOG_ALL)
		level = LOG_ALL;
	logLevel = level;
}

void dlog(int level, const char *format, ...) {
	if (level > logLevel) {
		return;
	}
	va_list (args);
	va_start(args, format);
	vprintf(format, args);
	va_end(args);
}


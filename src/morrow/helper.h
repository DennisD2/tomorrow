/*
 * helper.h
 *
 *  Created on: 05.04.2018
 *      Author: dennis
 */

#ifndef HELPER_H_
#define HELPER_H_

#define VXI_RESETENG   0x7b00
#define VXI_GETVERSION 0x7c00
#define VXI_ENGINEDATA 0x7d00
#define VXI_GETSTATUS  0x7e00
#define VXI_ENGINECMD  0x7f00

#include <stdarg.h>

#define LOG_NONE 0
#define LOG_ERROR 1
#define LOG_WARN 2
#define LOG_INFO 3
#define LOG_DEBUG 4
#define LOG_TRACE 5
#define LOG_SILLY 6
#define LOG_ALL 7
#define LOG_EXCLUDED 999

void sysInfo();

void dlog( int level, const char *format, ... );
void setLogLevel(int level);

// Morrow and VXI command names
char *getCmdNameP2(int id);
char *getCmdNameP1(int id);
#endif /* HELPER_H_ */

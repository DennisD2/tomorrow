/*
 * command.c
 *
 *  Created on: 01.04.2018
 *      Author: dennis
 */

#include "command.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define CMD_DELIMITERS ","
#define CMD_DELIMITER ','

/**
 * Reads command from datagram.
 */
int read_command(TDatagram_t *dg, void *commandBuffer) {
	if (dg->type == DG_ASCII) {
		int cmdLen = strcspn(dg->data, CMD_DELIMITERS);
		strncpy( commandBuffer, (char*)dg->data, cmdLen);
		((char*)commandBuffer)[cmdLen+1] = '\0';
		return 0;
	}
	if (dg->type == DG_BINARY) {
		// commands are always two bytes.
		memcpy( commandBuffer, (unsigned char*)dg->data, 2);
		return 0;
	}
}

int read_intParamString(TDatagram_t *dg, int pos, int *result) {
	// overread command
	int i = strcspn(dg->data, CMD_DELIMITERS);
	int p = 0;
	int n = strlen(dg->data);
	while (i<n ) {
		if (((char*)dg->data)[i] == ',') {
			p++;
			if (p == pos) {
				break;
			}
		}
		i++;
	}
	if (i == n) {
		printf("Param not found\n");
		return -1;
	}
	i++;
	//printf("param: %s\n", (dg->data +i));
	*result = atoi((dg->data + i));
	return 0;
}

int read_intParamBinary(TDatagram_t *dg, int param, int *result) {
	return 0;
}

/**
 * Reads integer parameter number from datagram.
 */
int read_intParam(TDatagram_t *dg, int param, int *result) {
	if (dg->type == DG_ASCII) {
		return read_intParamString(dg, param, result);
	}
	if (dg->type == DG_BINARY) {
		return read_intParamBinary(dg, param, result);
	}
}

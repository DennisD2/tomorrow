/*
 * command-test.c
 *
 *  Created on: 01.04.2018
 *      Author: dennis
 */


#include "command.h"
#include <stdio.h>

int main(int argc, char **argv) {
	TDatagram_t dg;

	char cmd[100];

	// 1 param
	dg_packString("open,126", &dg);
	printf("\n%s\n", (char*)dg.data);
	//printf("%d\n", dg.len);
	//printf("%c\n", dg.type);

	read_command(&dg, cmd);
	printf("command: %s\n", cmd);

	int intParam;
	read_intParam(&dg, 1, &intParam);
	printf("param 1: %d\n", intParam);

	// 2 params
	dg_packString("open,126,456", &dg);
	printf("\n%s\n", (char*)dg.data);
	//printf("%d\n", dg.len);
	//printf("%c\n", dg.type);

	read_command(&dg, cmd);
	printf("command: %s\n", cmd);

	read_intParam(&dg, 1, &intParam);
	printf("param 1: %d\n", intParam);
	read_intParam(&dg, 2, &intParam);
	printf("param 2: %d\n", intParam);


	return 0;
}

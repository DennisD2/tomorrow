/*
 * datagram_test.c
 *
 *  Created on: 31.03.2018
 *      Author: dennis
 */

#include "datagram.h"
#include <stdio.h>

int main(int argc, char **argv) {
	TDatagram_t dg;

	char abuffer[100];
	unsigned char bbuffer[1024];

	dg_packString("hello", &dg);
	printf("%s\n", dg.adata);
	printf("%d\n", dg.len);
	printf("%c\n", dg.type);

	dg_write(&dg, abuffer);
	printf("%s\n", abuffer);

	unsigned char bin[8];
	bin[0] = 'x';
	bin[1] = 'y';
	bin[2] = 'z';
	bin[3] = 'w';
	bin[4] = '1';
	bin[5] = '2';
	bin[6] = '3';
	bin[7] = '4';

	dg_packBinary(bin, 8, &dg);
	printf("%s\n", dg.bdata);
	printf("%d\n", dg.len);
	printf("%c\n", dg.type);

	dg_write(&dg, bbuffer);
	bbuffer[8+3] = '\0';
	printf("%s\n", bbuffer);
	printf("%s\n", &(bbuffer[3]));

}

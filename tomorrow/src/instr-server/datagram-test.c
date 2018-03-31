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

	// write out
	dg_write(&dg, abuffer);
	printf("%s\n", abuffer);

	TDatagram_t back;
	char aresponse[100];

	// read back
	back.adata = aresponse;
	dg_read(abuffer, &back);
	printf("%s\n", back.bdata);
	printf("%d\n", back.len);
	printf("%c\n", back.type);

	// binary

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

	// write out
	dg_write(&dg, bbuffer);
	bbuffer[8+3] = '\0';
	printf("%s\n", bbuffer);
	printf("%s\n", &(bbuffer[3]));

	unsigned char bresponse[100];

	// read back
	back.bdata = bresponse;
	dg_read(bbuffer, &back);
	printf("%s\n", back.bdata);
	printf("%d\n", back.len);
	printf("%c\n", back.type);

	return 0;
}

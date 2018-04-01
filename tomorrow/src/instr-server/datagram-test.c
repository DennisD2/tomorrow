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
	printf("%s\n", (char*)dg.data);
	printf("%d\n", dg.len);
	printf("%c\n", dg.type);

	// write out
	dg_write(&dg, abuffer);
	printf("%s\n", abuffer);

	TDatagram_t back;
	char aresponse[100];

	// read back
	back.data = aresponse;
	dg_read(abuffer, &back);
	printf("%s\n", (char*)back.data);
	printf("%d\n", back.len);
	printf("%c\n\n", back.type);

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
	printf("%s\n", dg.data);
	printf("%d\n", dg.len);
	printf("%c\n\n", dg.type);

	// write out
	dg_write(&dg, bbuffer);
	bbuffer[8+3] = '\0';
	printf("%s\n", bbuffer); // binary, may not come our nice in print
	printf("%s\n\n", &(bbuffer[3]));

	unsigned char bresponse[100];

	// read back
	back.data = bresponse;
	dg_read(bbuffer, &back);
	bresponse[8] = '\0'; // only to make printf nice
	printf("%s\n", back.data);
	printf("%d\n", back.len);
	printf("%c\n\n", back.type);

	return 0;
}

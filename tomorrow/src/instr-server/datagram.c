/*
 * datagram.c
 *
 *  Created on: 31.03.2018
 *      Author: dennis
 */
#include "datagram.h"
#include <stdlib.h>

/*static void fill_alen(int len, TDatagram_t *dg) {
	dg->alen[1] = '0' + (len % 10);
	len = len/10;
	dg->alen[2] = '0' + (len % 10);
	len = len/10;
	dg->alen[3] = '0' + (len % 10);
	len = len/10;
	dg->alen[4] = '0' + (len % 10);
}*/

int dg_packString(char *s, TDatagram_t *dg) {
	dg->type = DG_ASCII;
	int len = strlen(s);
	if (len > 9999) {
		// error
	}
	dg->len = len;
	dg->adata = s;

	return 0;
}

int dg_packBinary(unsigned char *data, int len, TDatagram_t *dg) {
	dg->type = DG_BINARY;
	dg->len = len;
	dg->bdata = data;

	return 0;
}

int dg_writeString(TDatagram_t *dg, char *buffer) {
	buffer[0] = dg->type;

	int len = dg->len;
	buffer[4] = '0' + (len % 10); // lo
	len = len/10;
	buffer[3] = '0' + (len % 10);
	len = len/10;
	buffer[2] = '0' + (len % 10);
	len = len/10;
	buffer[1] = '0' + (len % 10); // hi

	strcpy( &(buffer[5]), dg->adata);
	return 0;
}

int dg_writeBinary(TDatagram_t *dg, unsigned char *buffer ) {
	buffer[0] = dg->type;

	buffer[1] = (dg->len >> 8) & 0xff; // hi
	buffer[2] = dg->len & 0xff; // lo

	memcpy( &(buffer[3]), dg->bdata, dg->len);
	return 0;
}

int dg_write(TDatagram_t *dg, void *buffer) {
	if (dg->type == DG_ASCII)
		return dg_writeString(dg, (char*)buffer);
	else
		return dg_writeBinary(dg, (unsigned char *)buffer);
}

static int read_len(char *buffer) {
	int n = (buffer[1] - '0');
	n = 10*n;
	n += (buffer[2] - '0');
	n = 10*n;
	n += (buffer[3] - '0');
	n = 10*n;
	n += (buffer[4] - '0');
	return n;
}
int dg_readString(char *buffer, TDatagram_t *dg) {
	dg->type = DG_ASCII;
	dg->len = read_len(buffer);
	strcpy(dg->adata, &(buffer[5]));
	return 0;
}

int dg_readBinary(unsigned char *buffer, TDatagram_t *dg) {

	return 0;
}

int dg_read( void *buffer, TDatagram_t *dg) {
	if (dg->type == DG_ASCII)
		return dg_readString((char*)buffer, dg);
	else
		return dg_readBinary((unsigned char *)buffer, dg);
}

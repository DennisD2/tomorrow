/*
 * datagram.h
 *
 *  Created on: 31.03.2018
 *      Author: dennis
 */

#ifndef DATAGRAM_H_
#define DATAGRAM_H_

#include <stdint.h>
#include <string.h>

#define DG_ASCII 'a'
#define DG_BINARY 'b'

typedef struct TDatagram {
	char type;
	int16_t len;
	union {
		char *adata;
		unsigned char *bdata;
	};
} TDatagram_t;

extern int dg_packString(char *s, TDatagram_t *dg);
extern int dg_packBinary(unsigned char *data, int len, TDatagram_t *dg);
extern int dg_write(TDatagram_t *dg, void *buffer);
extern int dg_read( void *buffer, TDatagram_t *dg);

#endif /* DATAGRAM_H_ */

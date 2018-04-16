#include <sicl.h>
#include <stdio.h>
#include "helper.h"

INST iopen(char _far *addr) {
	return 1;
}

int igeterrno(void) {
	return 0;
}

int itimeout(INST id, long tval) {
	return 0;
}

char *imap(INST id, int mapspace, unsigned int pagestart,
		unsigned int pagecnt, char _far *suggested) {
}


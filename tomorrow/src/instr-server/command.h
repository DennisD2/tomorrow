/*
 * command.h
 *
 *  Created on: 01.04.2018
 *      Author: dennis
 */

#ifndef COMMAND_H_
#define COMMAND_H_

#include "datagram.h"

int read_command(TDatagram_t *dg, void *commandBuffer);
int read_intParam(TDatagram_t *dg, int param, int *result);

#endif /* COMMAND_H_ */

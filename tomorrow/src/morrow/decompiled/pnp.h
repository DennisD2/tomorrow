/*
 * pnp.h
 *
 *  Created on: 02.04.2018
 *      Author: dennis
 */

#ifndef PNP_H_
#define PNP_H_

#include "compatibility.h"

/* pnp.c exposed functions */
int32_t mr90xx_init(char* session_string, int32_t query_flag, int32_t reset_flag, void** session_id);
int32_t mr90xx_SetEngineModel(int32_t a1, int16_t a2, int32_t a3);


#endif /* PNP_H_ */

/*
 * sa.h
 *
 *  Created on: 02.04.2018
 *      Author: dennis
 */

#ifndef SA_H_
#define SA_H_

#include "compatibility.h"

// option values for RdEngOption()
#define ENG_OPT_0 0
#define ENG_OPT_1 1
#define ENG_OPT_2 2

/* sa.c exposed functions */
int32_t SetFuncStatusCode(SET9052 *a1, uint16_t code);
int32_t SetInterfaceType(SET9052 *a1, /*int16_t*/InterfaceEnum type, int32_t a3);
int32_t SetCellMode(SET9052 *a1, int16_t mode);
int32_t SetPortNum(SET9052 *a1, uint16_t a2) ;
int32_t GetRBWwide(int16_t value);
float64_t /*int32_t*/ VBWFreqFromCode(int16_t a1);
float64_t /*int32_t*/ RBWFreqFromCode(int16_t a1);
int32_t DefltSetTimeRBW(int16_t timeValue);
int32_t DefltSetTimeVBW(int16_t timeValue);
int32_t SendCommand(SET9052 *a1, int32_t command, int32_t numWords, /*int32_t*/uint16_t *words) ;
int32_t FuncStatusFromEngineReply(int16_t a1) ;
int32_t SetEngineModel(SET9052 *a1, int16_t engine_model);

int32_t __amsg_exit(int32_t a1);


int32_t __ftol(/*int32_t*/float32_t in);

#endif /* SA_H_ */

/*
 * compatibility.h
 *
 *  Created on: 02.04.2018
 *      Author: dennis
 */

#ifndef COMPATIBILITY_H_
#define COMPATIBILITY_H_

/* DD: added next lines */
typedef float float32_t;
typedef double float64_t;
typedef double float80_t;

#if defined(__hp9000s700)

#define true 1
#define false 0

#else

#include <stdbool.h>
#include <stdint.h>

#endif


#endif /* COMPATIBILITY_H_ */

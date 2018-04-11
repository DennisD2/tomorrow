/*
 * timetest.c
 *
 * tests
 *   - usleep()
 *   - clock_gettime()
 *
 *  Created on: 09.04.2018
 *      Author: dennis
 */

#include <stdio.h>
#include <time.h>

int main(int argc, char **argv) {
	if (argc != 2) {
		printf("Please call with 1 argument.\n");
		return -1;
	}
	struct timespec start, stop;
	double accum;

	if (clock_gettime( CLOCK_REALTIME, &start) == -1) {
		perror("clock gettime");
		exit(-1);
	}

	//system(argv[1]);
	int i = 0;
	for (i = 0; i < 20; i++) {
		usleep(100000L);
	}

	if (clock_gettime( CLOCK_REALTIME, &stop) == -1) {
		perror("clock gettime");
		exit(-1);
	}

	accum = (stop.tv_sec - start.tv_sec)
			+ (stop.tv_nsec - start.tv_nsec) / (1000L * 1000L * 1000L);
	printf("%lf\n", accum);
	return (-1);
}

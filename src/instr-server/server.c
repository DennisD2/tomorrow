#include<stdio.h>
#include<string.h>    //strlen
#include<sys/socket.h>
#include<arpa/inet.h> //inet_addr
#include<unistd.h>    //write

#include <math.h>
#include <stdlib.h> // rand()
#include <time.h> // time()

#include "command.h"

//------
#include <sicl.h>

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>
#include <mrapp.h>
//#include <mr90xx.h>

#include "helper.h"

// PI
#define PI 3.14159265

#define NUM_POINTS 512

typedef struct _DeviceControl_t {
	ViInt16 num_points;
	ViReal64 start;
	ViReal64 stop;
	ViInt16 ref_level;
	ViSession sessionId;
} DeviceControl_t;

DeviceControl_t deviceControl;

double amplitudes[] = { -58.05, -57.36, -58.87, -58.15, -59.13, -59.31, -60.41,
		-59.25, -60.37, -58.38, -56.74, -54.05, -51.81, -50.77, -48.34, -34.76,
		-47.90, -51.17, -51.58, -55.66, -55.73, -58.32, -59.84, -62.11, -62.80,
		-65.15, -64.59, -65.74, -66.73, -66.82, -68.91, -67.42, -68.31, -70.87,
		-69.09, -71.15, -71.23, -71.23, -71.72, -70.95 };

int doMeasurement(ViInt16 number_points, ViReal64 amp_array[],
		ViReal64 freq_array[]);

// returns number of bytes used for data
int getCurrentData(int number_points, unsigned char *bytes) {
	int i;
	ViReal64 amp_array[number_points], freq_array[number_points];
#ifdef REAL_DEVICE
	doMeasurement(number_points, amp_array, freq_array);
#else
	// Read in fale data
	for (i = 0; i < number_points; i++) {
		amp_array[i] = amplitudes[i % 40];
	}
#endif
	//for (i = 0; i < number_points; i++) {
	//	printf("Amplitude = %10.2f dBm, Frequency = %10.0f Hz\n", amp_array[i],
	//			freq_array[i]);
	//}
	for (i = 0; i < number_points; i += 2) {
		int amplitude = (int) amp_array[i] + 100;
		bytes[i] = amplitude >> 8; // HI
		bytes[i + 1] = amplitude & 0xff; // LO
	}
	return number_points * 2;
}

int initDevice(int number_points) {
	setLogLevel(LOG_DEBUG);
	dlog(LOG_INFO, "----------------------------------------\n");

#ifdef SPAN_149_to_150_MHZ
	// 149..150 Mhz
	ViReal64 start_freq = 149000000;
	ViReal64 stop_freq = 150000000;
#else
	// 1..2 Mhz
	ViReal64 start_freq = 1000000;
	ViReal64 stop_freq = 2000000;
#endif
	ViInt16 ref_level = 2;
	ViSession sessionId;

	// Initialize device control struct
	deviceControl.num_points = number_points;
	deviceControl.start = start_freq;
	deviceControl.stop = stop_freq;
	deviceControl.ref_level = ref_level;

	char sessionString[50];

	sprintf(sessionString, "vxi,126");

	ViStatus mr90xxStatus = mr90xx_init(sessionString, VI_TRUE, VI_TRUE,
			&sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init\n");
		exit(-1);
	} else {
		printf("mr90xx_init OK\n\n");
	}
	deviceControl.sessionId = sessionId;

	mr90xxStatus = mr90xx_SetEngineModel(sessionId, SA9054);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_SetEngineModel\n");
		exit(-1);
	} else {
		dlog(LOG_INFO, "mr90xx_SetEngineModel OK\n\n");
	}

	mr90xxStatus = mr90xx_InitGuiSweep(sessionId, MR90XX_RBW_AUTO,
	MR90XX_VBW_AUTO, deviceControl.start, deviceControl.stop,
			deviceControl.ref_level, deviceControl.num_points);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_InitGuiSweep\n");
		exit(-1);
	} else {
		dlog(LOG_INFO, "mr90xx_InitGuiSweep OK\n\n");
	}
	return mr90xxStatus;
}

int doMeasurement(ViInt16 number_points, ViReal64 amp_array[],
		ViReal64 freq_array[]) {
	setLogLevel(LOG_INFO);

	ViStatus mr90xxStatus = mr90xx_MeasureAmplWithFreq(deviceControl.sessionId,
			MR90XX_RBW_AUTO,
			MR90XX_VBW_AUTO, deviceControl.start, deviceControl.stop,
			deviceControl.ref_level, deviceControl.num_points,
			MR90XX_SWP_MIN,
			MR90XX_DBM_FORMAT, amp_array, freq_array);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_MeasureAmplWithFreq\n");
	} else {
		dlog(LOG_INFO, "mr90xx_MeasureAmplWithFreq OK\n");
	}
	return mr90xxStatus;
}

int main(int argc, char *argv[]) {
	ViInt16 number_points = NUM_POINTS;

	int socket_desc, client_sock, read_size;
	socklen_t c;
	struct sockaddr_in server, client;
	char client_request[512];

	unsigned char bytes[2 * number_points + 1024];
	unsigned char response_message[2 * number_points + 1024];

	initDevice(number_points);

	// Intializes random number generator
	time_t t;
	srand((unsigned) time(&t));

	// Create socket
	socket_desc = socket(AF_INET, SOCK_STREAM, 0);
	if (socket_desc == -1) {
		printf("Could not create socket");
	}
	puts("Socket created");

	if (setsockopt(socket_desc, SOL_SOCKET, SO_REUSEADDR, &(int ) { 1 },
			sizeof(int)) < 0) {
		perror("setsockopt(SO_REUSEADDR) failed");
	}

	// Prepare the sockaddr_in structure
	int port = 8888;
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;
	server.sin_port = htons(port);

	// Bind
	if (bind(socket_desc, (struct sockaddr *) &server, sizeof(server)) < 0) {
		//print the error message
		perror("bind failed. Error");
		return 1;
	}
	printf("bind done on port %d\n", port);

	// Listen
	listen(socket_desc, 3);

	// Accept and incoming connection
	puts("Waiting for incoming connections...");
	c = sizeof(struct sockaddr_in);

	int waitForConnection = 1;

	while (waitForConnection == 1) {
		// Accept connection from an incoming client
		client_sock = accept(socket_desc, (struct sockaddr *) &client, &c);
		if (client_sock < 0) {
			perror("accept failed");
			return 1;
		}
		puts("Connection accepted");

		// Receive a message from client
		while ((read_size = recv(client_sock, client_request, 2000, 0)) > 0) {
			//printf("%s\n", client_message);
			TDatagram_t request;
			char commandBuffer[1024];
			request.data = commandBuffer; // in binary case this is wrong
			dg_read(client_request, &request);
			//printf("dg.type: %c\n", dg.type);
			//printf("dg.data: %s\n", dg.data);

			//puts(client_message);
			int handled = 0;
			char cmd[128];
			read_command(&request, cmd);

			if (strncmp(cmd, "GETDATA", strlen("GETDATA")) == 0) {
				puts("GETDATA command");
				int n = getCurrentData(number_points, bytes);
				TDatagram_t response;
				dg_packBinary(bytes, n, &response);
				dg_write(&response, response_message);
				write(client_sock, response_message, n + 3);
				handled = 1;
			}

			if (strncmp(cmd, "GETIMAGE", strlen("GETIMAGE")) == 0) {
				puts("GETIMAGE command");
				int n = getCurrentData(number_points, bytes);
				TDatagram_t response;
				dg_packBinary(bytes, n, &response);
				dg_write(&response, response_message);
				//int ii;
				//for (ii=0; ii<NUM_POINTS; ii+=2) {
				//	printf("%x,%x\n", response_message[ii], response_message[ii+1]);
				//}
				write(client_sock, response_message, n + 3);
				handled = 1;
			}

			// 'open,126'
			if (strncmp(cmd, "open", strlen("open")) == 0) {
				int device;
				read_intParam(&request, 1, &device);
				printf("open,%d\n", device);
				write(client_sock, "ok", strlen("ok"));
				//shutdown(client_sock, 2);
				//shutdown(socket_desc, 2);
				handled = 1;
				return 0;
			}

			// unknown command
			if (handled == 0) {
				write(client_sock, "What?", strlen("What?"));
			}

		}

		if (read_size == 0) {
			puts("Client disconnected");
			fflush(stdout);
		} else if (read_size == -1) {
			perror("recv failed");
		}
	}
	return 0;
}

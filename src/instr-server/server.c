#include <stdio.h>
#include <string.h>    //strlen, strtok
#include <sys/socket.h>
#include <arpa/inet.h> //inet_addr
#include <unistd.h>    //write

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

#define NUM_POINTS 200

typedef struct _DeviceControl_t {
	ViInt16 rbw;
	ViInt16 vbw;
	ViReal64 start;
	ViReal64 stop;
	uint16_t num_points;
	ViInt16 ref_level;
	uint16_t minmax;
	uint16_t format;
	ViSession sessionId;
} DeviceControl_t;

DeviceControl_t deviceControl;

double amplitudes[] = { -58.05, -57.36, -58.87, -58.15, -59.13, -59.31, -60.41,
		-59.25, -60.37, -58.38, -56.74, -54.05, -51.81, -50.77, -48.34, -34.76,
		-47.90, -51.17, -51.58, -55.66, -55.73, -58.32, -59.84, -62.11, -62.80,
		-65.15, -64.59, -65.74, -66.73, -66.82, -68.91, -67.42, -68.31, -70.87,
		-69.09, -71.15, -71.23, -71.23, -71.72, -70.95 };

int doMeasurement(uint16_t number_points, ViReal64 amp_array[],
		ViReal64 freq_array[]);

int inMeasurement = 0;
// returns number of bytes used for data
int getCurrentData(uint16_t number_points, unsigned char *bytes) {
	int i;
	ViReal64 amp_array[number_points], freq_array[number_points];
//#define REAL_DEVICE
#ifdef REAL_DEVICE
	if (inMeasurement) {
		for (i=0; i<number_points; i++) {
			amp_array[i] = 0.0;
		}
		return number_points * 2;
	}
	inMeasurement = 1;
	doMeasurement(number_points, amp_array, freq_array);
	inMeasurement = 0;
#else
	// Read in fake data
	for (i = 0; i < number_points; i++) {
		amp_array[i] = amplitudes[i % 40];
	}
#endif
	//for (i = 0; i < number_points; i++) {
	//	printf("Amplitude = %10.2f dBm, Frequency = %10.0f Hz\n", amp_array[i],
	//			freq_array[i]);
	//}

	// Prologue: number of points UINT16_t
	i = 0;
	bytes[i++] = (number_points >> 8) & 0xff;
	bytes[i++] = number_points & 0xff;

	i = 0;
	int j = 2;
	for ( /* no init */; i < number_points; i++, j += 2) {
		int amplitude = (int) (amp_array[i] * 100);
		bytes[j] = amplitude >> 8; // HI
		bytes[j + 1] = amplitude & 0xff; // LO
		//printf("amplitude[%d]=%d=0x%x, bytes[%d,%d] = 0x%02x%02x\n", i, amplitude, amplitude, j, j+1, bytes[j], bytes[j+1]);
	}
	return j /*number_points * 2*/;
}

int initDevice(uint16_t number_points) {
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
	ViInt16 ref_level = 20;
	ViSession sessionId;

	// Initialize device control struct
	deviceControl.rbw = RBW_AUTO;
	deviceControl.vbw = VBW_AUTO;
	deviceControl.start = start_freq;
	deviceControl.stop = stop_freq;
	deviceControl.num_points = number_points;
	deviceControl.ref_level = ref_level;
	deviceControl.minmax = MR90XX_SWP_MIN;
	deviceControl.format = MR90XX_DBM_FORMAT;

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

int doMeasurement(uint16_t number_points, ViReal64 amp_array[],
		ViReal64 freq_array[]) {
	setLogLevel(LOG_INFO);

	ViStatus mr90xxStatus = mr90xx_MeasureAmplWithFreq(deviceControl.sessionId,
			deviceControl.rbw, deviceControl.vbw, deviceControl.start,
			deviceControl.stop, deviceControl.ref_level,
			deviceControl.num_points, deviceControl.minmax,
			deviceControl.format, amp_array, freq_array);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_MeasureAmplWithFreq\n");
	} else {
		dlog(LOG_INFO, "mr90xx_MeasureAmplWithFreq OK\n");
	}
	return mr90xxStatus;
}

int startsWith(const char *str, const char *pre) {
	return strncmp(pre, str, strlen(pre)) == 0;
}

#define MAXKEYLEN 32
#define MAXVALUELEN 64

int parseKV(char* kv, char* k, char* v) {
	char *p = strchr(kv, '=');
	if (p == NULL) {
		dlog(LOG_ERROR, "No '=' in conf string: %s", kv);
		return 0;
	}
	*p = '\0';
	strcpy(k, kv);
	strcpy(v, (p + 1));
	return 1;
}

void setValue(char *k, char *v) {
	dlog(LOG_INFO, "%s = %s\n", k, v);
	int ival;
	ViReal64 rval;
	if (strcmp(k, "rbw") == 0) {
		int c;
		ival = atoi(v);
		switch (ival) {
		case 0:
			c = MR90XX_RBW_AUTO;
			break;
		case 300:
			c = MR90XX_RBW_300HZ;
			break;
		case 3000:
			c = MR90XX_RBW_3KHZ;
			break;
		case 30000:
			c = MR90XX_RBW_30KHZ;
			break;
		case 300000:
			c = MR90XX_RBW_300KHZ;
			break;
		case 3000000:
			c = MR90XX_RBW_3MHZ;
			break;
		}
		dlog(LOG_INFO, "RBW = %d\n", c );
		deviceControl.rbw = c;
	}
	if (strcmp(k, "vbw") == 0) {
		int c;
		ival = atoi(v);
		switch (ival) {
		case 0:
			c = MR90XX_VBW_AUTO;
			break;
		case 3:
			c = MR90XX_VBW_3HZ;
			break;
		case 30:
			c = MR90XX_VBW_30HZ;
			break;
		case 300:
			c = MR90XX_VBW_300HZ;
			break;
		case 3000:
			c = MR90XX_VBW_3KHZ;
			break;
		case 30000:
			c = MR90XX_VBW_30KHZ;
			break;
		case 300000:
			c = MR90XX_VBW_300KHZ;
			break;
		case 3000000:
			c = MR90XX_VBW_3MHZ;
			break;
		}
		dlog(LOG_INFO, "VBW = %d\n", c );
		deviceControl.rbw = c;

	}
	if (strcmp(k, "start") == 0) {
		rval = atof(v);
		dlog(LOG_INFO, "start = %f\n", rval );
		deviceControl.start = rval;
	}
	if (strcmp(k, "stop") == 0) {
		rval = atof(v);
		dlog(LOG_INFO, "stop = %f\n", rval );
		deviceControl.stop = rval;
	}
	if (strcmp(k, "points") == 0) {
		ival = atoi(v);
		dlog(LOG_INFO, "points = %d\n", ival );
		deviceControl.num_points = ival;
	}
	if (strcmp(k, "reflevel") == 0) {
		ival = atoi(v);
		dlog(LOG_INFO, "reflevel = %d\n", ival );
		deviceControl.ref_level = ival;
	}
	if (strcmp(k, "minmax") == 0) {
		if (strcmp(v, "min") == 0) {
			ival = MR90XX_SWP_MIN;
		} else {
			ival = MR90XX_SWP_MAX;
		}
		dlog(LOG_INFO, "minmax= %d\n", ival );
		deviceControl.format = ival;
	}
	if (strcmp(k, "format") == 0) {
		if (strcmp(v, "nv") == 0) {
			ival = MR90XX_NV_FORMAT;
		} else {
			ival = MR90XX_DBM_FORMAT;
		}
		dlog(LOG_INFO, "format= %d\n", ival );
		deviceControl.format = ival;
	}
}

int setConfig(char *cmd) {
	char *delim = "; ";
	char *p = strtok(cmd, delim);
	char key[MAXKEYLEN];
	char value[MAXVALUELEN];
	while (p != 0) {
		if (startsWith(p, "setconf")) {
			p = strtok(NULL, delim);
			continue;
		}
		if (parseKV(p, key, value)) {
			setValue(key, value);
		}
		p = strtok(NULL, delim);
	}
	return 0;
}

int main(int argc, char *argv[]) {
	int socket_desc, client_sock, read_size;
	unsigned int c;
	struct sockaddr_in server, client;
	char client_request[512];

	unsigned char bytes[2 * NUM_POINTS + 1024];
	unsigned char response_message[2 * NUM_POINTS + 1024];

	initDevice(NUM_POINTS);

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

			if (startsWith(cmd, "setconf")) {
				puts("setconf command");
				int n = setConfig(cmd);
				TDatagram_t response;
				response.len = 3;
				char *status = "OK";
				response.data = status;
				response.type = DG_ASCII;
				dg_packString(bytes, &response);
				dg_write(&response, response_message);
				write(client_sock, response_message, n + 3);
				handled = 1;
			}

			if (startsWith(cmd, "getsample")) {
				puts("getsample command");
				int n = getCurrentData(deviceControl.num_points, bytes);
				TDatagram_t response;
				dg_packBinary(bytes, n, &response);
				dg_write(&response, response_message);
				//int ii;
				//for (ii=0; ii<deviceControl.num_points ; ii+=2) {
				//	printf("%x,%x\n", response_message[ii], response_message[ii+1]);
				//}
				write(client_sock, response_message, n + 3);
				handled = 1;
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

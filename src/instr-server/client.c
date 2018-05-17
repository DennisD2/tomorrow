#include <stdio.h> //printf
#include <string.h>    //strlen
#include <sys/socket.h>    //socket
#include <arpa/inet.h> //inet_addr

#include <malloc.h>
#include<time.h>   
#include <sys/time.h>
#include <compatibility.h>
#include <stdlib.h>
#include "datagram.h"
#include <unistd.h>

#define NUMPOINTS 1024

uint64_t get_posix_clock_time() {
	struct timespec ts;

	if (clock_gettime(CLOCK_REALTIME, &ts) == 0)
		return (uint64_t) (ts.tv_sec * 1000000 + ts.tv_nsec / 1000);
	else
		return 0;
}

int main(int argc, char *argv[]) {
	int sock;
	struct sockaddr_in server;
	char request_buffer[1000], server_reply[2*NUMPOINTS+1024];
	unsigned char reply_buffer[2*NUMPOINTS+1024];
	int loopCount = 10;

	char *targetHost = "127.0.0.1";
	if (argc == 3) {
		targetHost = argv[1];
		loopCount = atoi(argv[2]);
	}
	printf("Using host: %s, loopCount: %d\n", targetHost, loopCount);

	//Create socket
	sock = socket(AF_INET, SOCK_STREAM, 0);
	if (sock == -1) {
		printf("Could not create socket");
	}
	puts("Socket created");

	server.sin_addr.s_addr = inet_addr(targetHost);
	server.sin_family = AF_INET;
	server.sin_port = htons(8888);

	//Connect to remote server
	if (connect(sock, (struct sockaddr *) &server, sizeof(server)) < 0) {
		perror("connect failed. Error");
		return 1;
	}

	puts("Connected\n");

	TDatagram_t request;
	dg_packString("GETIMAGE", &request);
	dg_write(&request, request_buffer);
	//strcpy(message, "GETIMAGE");

	//keep communicating with server
	uint64_t prev_time_value = get_posix_clock_time();

	int i = 0;
	while (i < loopCount) {
		i++;

		//Send some data
		printf("%s\n", request_buffer);
		if (send(sock, request_buffer, request.len + 5, 0) < 0) {
			puts("Send failed");
			return 1;
		}

		//Receive a reply from the server
		int recvLen = recv(sock, server_reply, 2048+3, 0);
		if (recvLen < 0) {
			puts("recv failed");
			break;
		}

    	TDatagram_t reply;
    	reply.data = reply_buffer; // space for memcpy
    	dg_read( server_reply, &reply);
    	printf("reply.type: %c\n", reply.type);
    	printf("reply.len: %d\n", reply.len);
    	printf("reply.data: %c %x,%x %x,%x\n", ((char*)reply.data)[0], ((char*)reply.data)[1], ((char*)reply.data)[2], ((char*)reply.data)[3], ((char*)reply.data)[4]);

#define STEPS 100
		if (i % STEPS == 0) {
			uint64_t time_value = get_posix_clock_time();

			/* Time difference */
			uint64_t time_diff = time_value - prev_time_value;
			float diff = time_diff / 1000;
			float kbsec = STEPS * 1024 / diff / 1024 * 1000;
			printf("[%0.f ms] %d iterations, %.3f KBytes/sec\n", diff, i,
					kbsec);
			prev_time_value = time_value;
		}
	}
	close(sock);
	return 0;
}

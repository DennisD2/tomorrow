#include <stdio.h> //printf
#include <string.h>    //strlen
#include <sys/socket.h>    //socket
#include <arpa/inet.h> //inet_addr

#include <malloc.h>
#include<time.h>   
#include <sys/time.h>
#include <stdint.h>
#include <stdlib.h>
#include "datagram.h"
#include <unistd.h>

 uint64_t get_posix_clock_time () {
    struct timespec ts;

    if (clock_gettime (CLOCK_MONOTONIC, &ts) == 0)
        return (uint64_t) (ts.tv_sec * 1000000 + ts.tv_nsec / 1000);
    else
        return 0;
}

int main(int argc , char *argv[]) {
    int sock;
    struct sockaddr_in server;
    char message[1000], server_reply[2000];
    int loopCount=10;
     
    char *targetHost = "127.0.0.1"; 
    if (argc == 3) {
        targetHost = argv[1];
		loopCount = atoi(argv[2]);
    }
	printf("Using host: %s, loopCount: %d\n", targetHost, loopCount);

	//Create socket
    sock = socket(AF_INET, SOCK_STREAM , 0);
    if (sock == -1) {
        printf("Could not create socket");
    }
    puts("Socket created");
     
    server.sin_addr.s_addr = inet_addr(targetHost);
    server.sin_family = AF_INET;
    server.sin_port = htons(8888);
 
    //Connect to remote server
    if (connect(sock, (struct sockaddr *)&server, sizeof(server)) < 0) {
        perror("connect failed. Error");
        return 1;
    }
     
    puts("Connected\n");
    
    TDatagram_t dg;
    dg_packString("GETIMAGE", &dg);
    dg_write(&dg, message);
    //strcpy(message, "GETIMAGE");

    //keep communicating with server
    uint64_t prev_time_value = get_posix_clock_time ();

    int i=0;
    while(i<loopCount) {
        i++;
        //printf("Enter message : ");
        //scanf("%s", message);
         
        //Send some data
        printf("%s\n", message);
        if(send(sock, message, dg.len+5, 0) < 0) {
            puts("Send failed");
            return 1;
        }
         
        //Receive a reply from the server
        int recvLen = recv(sock, server_reply, 2000, 0) ;
        if(recvLen < 0) {
            puts("recv failed");
            break;
        }
        //
        //char *result = (char *)malloc(recvLen+1);
        //strcpy(result, server_reply);
         
        // putchar('.');
        //puts(result);

        /*if (strcmp(result, "Bye") == 0) {
            puts("Exiting because server said us bye.");
            return 0;
        }

        free(result);*/
#define STEPS 100
        if (i % STEPS == 0) {
	    uint64_t time_value = get_posix_clock_time ();

	    /* Time difference */
	    uint64_t time_diff = time_value - prev_time_value;
	    float diff = time_diff / 1000; 
	    float kbsec = STEPS*1024/diff/1024*1000;
	    printf("[%0.f ms] %d iterations, %.3f KBytes/sec\n", diff, i, kbsec );
	prev_time_value = time_value;
	}
    }
    close(sock);
    return 0;
}

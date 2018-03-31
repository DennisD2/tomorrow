#include<stdio.h>
#include<string.h>    //strlen
#include<sys/socket.h>
#include<arpa/inet.h> //inet_addr
#include<unistd.h>    //write

#include <math.h>
#include <stdlib.h> // rand()
#include <time.h> // time()

#include "datagram.h"

#define PI 3.14159265

static int startOffset=0;
#define NUMPOINTS 1024

unsigned char calcSinus(int x) {
	x += (startOffset % NUMPOINTS);
	float xval = 2*PI*x/NUMPOINTS;
	float yval = sin(xval) + 1; // +1 to make it positive always
	//unsigned char o = rand() % 255 ; // + 'A';
	unsigned char o =  (unsigned char)(yval*127.0);
	//unsigned char o = x % 255;
	//printf("%d - %u\n", x, o);
	return o;
}

unsigned char calcNoise(int x) {
	unsigned char o = rand() % 255;
	return o;
}

int getCurrentImage(unsigned char *bytes) {
	startOffset++;
	int i;
	for (i=0; i<NUMPOINTS; i++) {
		// bytes[i]='A'+ (i % 5);
		unsigned char a = calcSinus(i); //calcNoise(i);
		bytes[i] = a;
	}
	return NUMPOINTS;
}

int main(int argc , char *argv[]) {
    int socket_desc , client_sock, read_size;
    socklen_t c;
    struct sockaddr_in server , client;
    char client_message[2000];

    unsigned char bytes[NUMPOINTS];

	/* Intializes random number generator */
	time_t t;
   	srand((unsigned) time(&t));

    //Create socket
    socket_desc = socket(AF_INET , SOCK_STREAM , 0);
    if (socket_desc == -1) {
        printf("Could not create socket");
    }
    puts("Socket created");

    if (setsockopt(socket_desc, SOL_SOCKET, SO_REUSEADDR, &(int){ 1 }, sizeof(int)) < 0) {
        perror("setsockopt(SO_REUSEADDR) failed");
    }
     
    //Prepare the sockaddr_in structure
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons( 8888 );
     
    //Bind
    if( bind(socket_desc,(struct sockaddr *)&server , sizeof(server)) < 0) {
        //print the error message
        perror("bind failed. Error");
        return 1;
    }
    puts("bind done");
     
    //Listen
    listen(socket_desc , 3);
     
    //Accept and incoming connection
    puts("Waiting for incoming connections...");
    c = sizeof(struct sockaddr_in);
 

  int waitForConnection=1;
     
  while (waitForConnection==1) {
    //accept connection from an incoming client
    client_sock = accept(socket_desc, (struct sockaddr *)&client, &c);
    if (client_sock < 0) {
        perror("accept failed");
        return 1;
    }
    puts("Connection accepted");
     
    //Receive a message from client
    while( (read_size = recv(client_sock , client_message , 2000 , 0)) > 0 ) {
        //puts(client_message);
        int handled = 0;
        if (strncmp(client_message, "GETIMAGE", strlen("GETIMAGE")) == 0) {
            //puts("GETIMAGE command");
        	int n = getCurrentImage(bytes);
            write(client_sock, bytes, n);
            handled = 1;
        }

        // 'open 126'
        if (strncmp(client_message, "open", strlen("open")) == 0) {
            puts("open");
            write(client_sock , "ok" , strlen("ok"));
            //shutdown(client_sock, 2);
            //shutdown(socket_desc, 2);
            handled = 1;
            return 0;
        }

        // unknown command
        if (handled == 0) {
            write(client_sock , "What?" , strlen("What?")); 
        }
        
    }
     
    if(read_size == 0) {
        puts("Client disconnected");
        fflush(stdout);
    }
    else if(read_size == -1) {
        perror("recv failed");
    }
  }   
    return 0;
}

#include<stdio.h>
#include<string.h>    //strlen
#include<sys/socket.h>
#include<arpa/inet.h> //inet_addr
#include<unistd.h>    //write

#include <math.h>
#define PI 3.14159265

int startOffset=0;

unsigned char calcSinus(int x) {
	x += (startOffset % 1024);
	float xval = 2*PI*x/1024;
	float yval = sin(xval) + 1; // +1 to make it positive always
	//unsigned char o = rand() % 255 ; // + 'A';
	unsigned char o =  (unsigned char)(yval*127.0);
	//unsigned char o = x % 255;
	//printf("%d - %u\n", x, o);
	return o;
}

 
int main(int argc , char *argv[]) {
    int socket_desc , client_sock , c , read_size;
    struct sockaddr_in server , client;
    char client_message[2000];

    unsigned char bytes[1024];

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
    client_sock = accept(socket_desc, (struct sockaddr *)&client, (size_t*)&c);
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
            //puts("GETIMAGE command");+
            //write(client_sock , client_message , read_size);

startOffset++;
    int i;
    for (i=0; i<1024; i++) {
        // bytes[i]='A'+ (i % 5);
	unsigned char a = calcSinus(i);
	bytes[i] = a;
    }
     
            write(client_sock, bytes, 1024);
            handled = 1;
        }
        if (strncmp(client_message, ".", strlen(".")) == 0) {
            puts("CLOSE command");+
            write(client_sock , "Bye" , strlen("Bye"));
            //shutdown(client_sock, 2);
            //shutdown(socket_desc, 2);
            handled = 1;
            return 0;
        }
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

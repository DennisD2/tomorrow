/*
 * lws-minimal-ws-server
 *
 * Copyright (C) 2018 Andy Green <andy@warmcat.com>
 *
 * This file is made available under the Creative Commons CC0 1.0
 * Universal Public Domain Dedication.
 *
 * This demonstrates the most minimal http server you can make with lws,
 * with an added websocket chat server.
 *
 * To keep it simple, it serves stuff in the subdirectory "./mount-origin" of
 * the directory it was started in.
 * You can change that by changing mount.origin.
 */

#include <libwebsockets.h>
#include <string.h>
#include <signal.h>

#define LWS_PLUGIN_STATIC
#include "protocol_vxi.c"

#include <stdio.h> //printf
#include <string.h>    //strlen
#include <sys/socket.h>    //socket
#include <arpa/inet.h> //inet_addr
#include <malloc.h>
#include<time.h>   
#include <sys/time.h>
#include <stdint.h>


static struct lws_protocols protocols[] = {
	{ "http", lws_callback_http_dummy, 0, 0 },
	LWS_PLUGIN_PROTOCOL_MINIMAL,
	{ NULL, NULL, 0, 0 } /* terminator */
};

static int interrupted;

static const struct lws_http_mount mount = {
	/* .mount_next */			NULL,		/* linked-list "next" */
	/* .mountpoint */			"/",		/* mountpoint URL */
	/* .origin */				"./mount-origin",  /* serve from dir */
	/* .def */					"index.html",	/* default filename */
	/* .protocol */				NULL,
	/* .cgienv */				NULL,
	/* .extra_mimetypes */		NULL,
	/* .interpret */			NULL,
	/* .cgi_timeout */			0,
	/* .cache_max_age */		0,
	/* .auth_mask */			0,
	/* .cache_reusable */		0,
	/* .cache_revalidate */		0,
	/* .cache_intermediaries */	0,
	/* .origin_protocol */		LWSMPRO_FILE,	/* files in a dir */
	/* .mountpoint_len */		1,		/* char count */
	/* .basic_auth_login_file */NULL,
};

typedef struct ServerInfo {
	char *targetHost;
	int targetPort;
	int targetSocket;
} ServerInfo_t;

static ServerInfo_t serverInfo;

void sigint_handler(int sig)
{
	interrupted = 1;
}

uint64_t get_posix_clock_time () {
    struct timespec ts;

    if (clock_gettime (CLOCK_MONOTONIC, &ts) == 0)
        return (uint64_t) (ts.tv_sec * 1000000 + ts.tv_nsec / 1000);
    else
        return 0;
}

void initSocket() {
    struct sockaddr_in server;

    serverInfo.targetSocket = 0;
    // Create socket
    int sock = socket(AF_INET, SOCK_STREAM , 0);
    if (sock == -1) {
        lwsl_err("Could not create socket\n");
    }
	lwsl_debug("Socket created\n");
     
    server.sin_addr.s_addr = inet_addr(serverInfo.targetHost);
    server.sin_family = AF_INET;
    server.sin_port = htons(serverInfo.targetPort);
 
    // Connect to remote server
    if (connect(sock, (struct sockaddr *)&server, sizeof(server)) < 0) {
        lwsl_err("Connect failed.\n");

        return;
    }
    serverInfo.targetSocket = sock;
    lwsl_debug("Connected.\n");
}

int readSocket(char* command, unsigned char* server_reply) {
	if (serverInfo.targetSocket == 0) {
		return 0;
	}
   	char message[32];
 	strcpy(message, command);
	// Send command
	if(send(serverInfo.targetSocket, message, strlen(message), 0) < 0) {
		lwsl_err("Send failed\n");
		return 0;
	}
	
	// Receive a reply from the server
	int recvLen = recv(serverInfo.targetSocket, server_reply, 4000, 0) ;
	if(recvLen < 0) {
		lwsl_err("Recv failed\n");
		return 0;
	}
	return recvLen;
}

int main(int argc, char **argv)
{
    char *targetHost = "127.0.0.1";
	int targetPort = 8888;
    if (argc == 3) {
        targetHost = argv[1];
		targetPort = atoi(argv[2]);
    } else {
		lwsl_user("You may use host and port as command line args.\n");
		printf("You may use host and port as command line args.\n");
	}
    serverInfo.targetHost = targetHost;
    serverInfo.targetPort = targetPort;
    lwsl_user("Using host: %s:%d\n", targetHost, targetPort);
    printf("Using host: %s:%d\n", targetHost, targetPort);

	struct lws_context_creation_info info;
	struct lws_context *context;
	int n = 0;

	signal(SIGINT, sigint_handler);

	/* Intializes random number generator */
	time_t t;
   	srand((unsigned) time(&t));

	memset(&info, 0, sizeof info); /* otherwise uninitialized garbage */
	info.port = 7681;
	info.mounts = &mount;
	info.protocols = protocols;

	lws_set_log_level(LLL_ERR | LLL_WARN | LLL_NOTICE | LLL_USER
			| LLL_INFO | LLL_DEBUG, NULL);

	lwsl_user("LWS minimal ws server | visit http://localhost:7681\n");

	initSocket();

	context = lws_create_context(&info);
	if (!context) {
		lwsl_err("lws init failed\n");
		return 1;
	}

	while (n >= 0 && !interrupted)
		n = lws_service(context, 1000);

	lws_context_destroy(context);

	return 0;
}

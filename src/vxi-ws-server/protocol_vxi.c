/*
 * ws protocol handler plugin for "lws-minimal"
 *
 * Copyright (C) 2010-2018 Andy Green <andy@warmcat.com>
 *
 * This file is made available under the Creative Commons CC0 1.0
 * Universal Public Domain Dedication.
 *
 * This version holds a single message at a time, which may be lost if a new
 * message comes.  See the minimal-ws-server-ring sample for the same thing
 * but using an lws_ring ringbuffer to hold up to 8 messages at a time.
 */

#if !defined (LWS_PLUGIN_STATIC)
#define LWS_DLL
#define LWS_INTERNAL
#include <libwebsockets.h>
#endif

#include <string.h>

#include "../instr-server/datagram.h"

#define MAX_COMMAND_LEN 256

extern int readSocket(char* command, unsigned char* server_reply);
extern void initSocket() ;

/* https://stackoverflow.com/questions/342409/how-do-i-base64-encode-decode-in-c */
static char encoding_table[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                                'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
                                'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                                'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
                                'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                                'w', 'x', 'y', 'z', '0', '1', '2', '3',
                                '4', '5', '6', '7', '8', '9', '+', '/'};
static unsigned int mod_table[] = {0, 2, 1};

void base64_encode(const unsigned char *data,
                    size_t input_length,
					unsigned char *encoded_data,
                    size_t *output_length) {

    *output_length = 4 * ((input_length + 2) / 3);

    if (encoded_data == NULL) return;

	size_t i;
	size_t j;
    for (i = 0, j = 0; i < input_length;) {

        uint32_t octet_a = i < input_length ? (unsigned char)data[i++] : 0;
        uint32_t octet_b = i < input_length ? (unsigned char)data[i++] : 0;
        uint32_t octet_c = i < input_length ? (unsigned char)data[i++] : 0;

        uint32_t triple = (octet_a << 0x10) + (octet_b << 0x08) + octet_c;

        encoded_data[j++] = encoding_table[(triple >> 3 * 6) & 0x3F];
        encoded_data[j++] = encoding_table[(triple >> 2 * 6) & 0x3F];
        encoded_data[j++] = encoding_table[(triple >> 1 * 6) & 0x3F];
        encoded_data[j++] = encoding_table[(triple >> 0 * 6) & 0x3F];
    }

    for (i = 0; i < mod_table[input_length % 3]; i++)
        encoded_data[*output_length - 1 - i] = '=';
}

int startsWith(const char *str, const char *pre) {
    return strncmp(pre, str, strlen(pre)) == 0;
}

/* one of these created for each message */
struct msg {
	void *payload; /* is malloc'd */
	size_t len;
};

/* one of these is created for each client connecting to us */
struct per_session_data__minimal {
	struct per_session_data__minimal *pss_list;
	struct lws *wsi;
	int last; /* the last message number we sent */
};

/* one of these is created for each vhost our protocol is used with */
struct per_vhost_data__minimal {
	struct lws_context *context;
	struct lws_vhost *vhost;
	const struct lws_protocols *protocol;

	struct per_session_data__minimal *pss_list; /* linked-list of live pss*/

	struct msg amsg; /* the one pending message... */
	int current; /* the current message number we are caching */
};

/* destroys the message when everyone has had a copy of it */
static void
__minimal_destroy_message(void *_msg)
{
	struct msg *msg = _msg;

	free(msg->payload);
	msg->payload = NULL;
	msg->len = 0;
}

static int callback_minimal(struct lws *wsi, enum lws_callback_reasons reason,
			void *user, void *in, size_t len)
{
	struct per_session_data__minimal *pss =
			(struct per_session_data__minimal *)user;
	struct per_vhost_data__minimal *vhd =
			(struct per_vhost_data__minimal *)
			lws_protocol_vh_priv_get(lws_get_vhost(wsi),
					lws_get_protocol(wsi));
	int n, m;

	switch (reason) {
	case LWS_CALLBACK_PROTOCOL_INIT:
		lwsl_debug("LWS_CALLBACK_PROTOCOL_INIT\n");
		vhd = lws_protocol_vh_priv_zalloc(lws_get_vhost(wsi),
				lws_get_protocol(wsi),
				sizeof(struct per_vhost_data__minimal));
		vhd->context = lws_get_context(wsi);
		vhd->protocol = lws_get_protocol(wsi);
		vhd->vhost = lws_get_vhost(wsi);
		break;

	case LWS_CALLBACK_ESTABLISHED:
		/* add ourselves to the list of live pss held in the vhd */
		lwsl_debug("LWS_CALLBACK_ESTABLISHED\n");
		pss->pss_list = vhd->pss_list;
		vhd->pss_list = pss;
		pss->wsi = wsi;
		pss->last = vhd->current;
		break;

	case LWS_CALLBACK_CLOSED:
		/* remove our closing pss from the list of live pss */
		lwsl_debug("LWS_CALLBACK_CLOSED\n");
		lws_start_foreach_llp(struct per_session_data__minimal **,
				      ppss, vhd->pss_list) {
			if (*ppss == pss) {
				*ppss = pss->pss_list;
				break;
			}
		} lws_end_foreach_llp(ppss, pss_list);
		break;

	case LWS_CALLBACK_SERVER_WRITEABLE:
		//lwsl_debug("LWS_CALLBACK_SERVER_WRITEABLE\n");
		if (!vhd->amsg.payload)
			break;

		if (pss->last == vhd->current)
			break;

		/* notice we allowed for LWS_PRE in the payload already */
		m = lws_write(wsi, vhd->amsg.payload + LWS_PRE, vhd->amsg.len,
			      /*LWS_WRITE_BINARY*/LWS_WRITE_TEXT);
		if (m < (int)vhd->amsg.len) {
			lwsl_err("ERROR %d writing to ws\n", n);
			return -1;
		}

		pss->last = vhd->current;
		break;

	case LWS_CALLBACK_RECEIVE:
		// lwsl_debug("LWS_CALLBACK_RECEIVE\n");
		if (vhd->amsg.payload)
			__minimal_destroy_message(&vhd->amsg);

		lwsl_debug("in: %s\n", (char *)in);

		char command[MAX_COMMAND_LEN];
		if (startsWith(in, "getsample")) {
			// TODO: 1. extract this if content to a function
			// TODO: 3. Make 1024 etc. dynamically or at least #defines.
			lwsl_debug("getsample");
			unsigned char image[2*1024+1024];
			unsigned char encodedImage[3*1024+1*1024];

			TDatagram_t dg;
			dg_packString("getsample", &dg);
			dg_write(&dg, command);

			int rlen = readSocket(command, image);
			//lwsl_user("rlen: %d\n", rlen);
			if (rlen == 0) {
				lwsl_err("ERROR reading from backend service. Retrying...\n");
				//return -1;
				int tries = 0;
				while (rlen <= 0) {
					lwsl_user("Retry: %d ...\n", tries++);
					initSocket();
					rlen = readSocket(command, image);
					sleep(1);
				}
				lwsl_user("Retry successful.\n");
			}
			size_t outLen;
			base64_encode(image, rlen, encodedImage, &outLen);
			in = encodedImage;
			len = outLen;
		}
		if (startsWith(in, "setconf")) {
			lwsl_debug("setconf\n");
			TDatagram_t dg;
			dg_packString(in, &dg);
			dg_write(&dg, command);

			// TODO: harmonize code duplication!
			// Send configuration to instr_server
			unsigned char server_reply[1024];
			int rlen = readSocket(command, server_reply);
			//lwsl_user("rlen: %d\n", rlen);
			if (rlen == 0) {
				lwsl_err("ERROR reading from backend service. Retrying...\n");
				//return -1;
				int tries = 0;
				while (rlen <= 0) {
					lwsl_user("Retry: %d ...\n", tries++);
					initSocket();
					rlen = readSocket(command, server_reply);
					sleep(1);
				}
				lwsl_user("Retry successful.\n");
			}
			in = server_reply;
			len = rlen;
		}

		vhd->amsg.len = len;
		/* notice we over-allocate by LWS_PRE */
		vhd->amsg.payload = malloc(LWS_PRE + len);
		if (!vhd->amsg.payload) {
			lwsl_user("OOM: dropping\n");
			break;
		}

		memcpy((char *)vhd->amsg.payload + LWS_PRE, in, len);
		vhd->current++;
		
		/*
		 * let everybody know we want to write something on them
		 * as soon as they are ready
		 */
		lws_start_foreach_llp(struct per_session_data__minimal **,
				      ppss, vhd->pss_list) {
			lws_callback_on_writable((*ppss)->wsi);
		} lws_end_foreach_llp(ppss, pss_list);
		break;

	default:
		lwsl_debug("DEFAULT\n");
		break;
	}

	return 0;
}

#define LWS_PLUGIN_PROTOCOL_MINIMAL \
	{ \
		"lws-minimal", \
		callback_minimal, \
		sizeof(struct per_session_data__minimal), \
		128, \
		0, NULL, 0 \
	}

#if !defined (LWS_PLUGIN_STATIC)

/* boilerplate needed if we are built as a dynamic plugin */
static const struct lws_protocols protocols[] = {
	LWS_PLUGIN_PROTOCOL_MINIMAL
};

LWS_EXTERN LWS_VISIBLE int
init_protocol_minimal(struct lws_context *context,
		      struct lws_plugin_capability *c)
{
	if (c->api_magic != LWS_PLUGIN_API_MAGIC) {
		lwsl_err("Plugin API %d, library API %d", LWS_PLUGIN_API_MAGIC,
			 c->api_magic);
		return 1;
	}

	c->protocols = protocols;
	c->count_protocols = ARRAY_SIZE(protocols);
	c->extensions = NULL;
	c->count_extensions = 0;

	return 0;
}

LWS_EXTERN LWS_VISIBLE int
destroy_protocol_minimal(struct lws_context *context)
{
	return 0;
}
#endif

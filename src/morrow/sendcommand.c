/*
 * sendcommand.c
 *
 *  Created on: 15.04.2018
 *      Author: dennis
 */

uint32_t g3;
uint32_t g5;
uint32_t g7;
#define true 1

int32_t VISA_SendCommand(int32_t deviceId, int16_t command, int32_t bufLen, int32_t bufPtr) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t ret = 0; // bp-20
    function_100010e1(deviceId, 0);
    int32_t bufLenMult;
    int16_t commandSendRepeatCount;
    int16_t innerEndCrit;

    // innerEndCrit:
    //
    // 0 buffer has been sent
    // 1 send again?
    // 3 starts with #define IEC_START 3
    // 4
#define IEC_COMMAND_SENT 0
#define IEC_SEND_FAILED 1
#define IEC_START 3

    if (command >= 0 && command <=16) {
        g7 = command;
		bufLenMult = 0x10000 * bufLen; // buflLen shifted << 16
		commandSendRepeatCount = 0;
		int16_t v6 = IEC_START;
		while (true) {
			innerEndCrit = v6;

		  outer_label: /* outer loop entry point*/

			while (true) {

			  repeat_send:  /* inner loop entry point*/

				if (innerEndCrit != 3 && innerEndCrit != 4) {
					// end if v5 is not (3 or 4)
					return (int32_t)ret | function_100016c8(deviceId) & -0x10000;
				}
				// Send command
				VISA_SendWord(deviceId, command);

				int32_t v7; // 0x10001da2
				if (bufLenMult > 0) {
					// We have sth. to send
					int32_t v8 = 0;
					VISA_SendWord(deviceId, *(int16_t *)(2 * v8 + bufPtr));
					// Send loop
					// Starts with v8 = 0;
					// Ends if v9+1 == bufLenMult
					// Increments by 1
					// Sends *(bufPtr + 2*v8) ; VISA_SendWord receives value as 16bit int.

					// Example bufLen = 4
					// v8=0 -> bufPtr+2*1=2
					//    1 -> bufPtr+2*2=4
					//    2 -> bufPtr+2*3=6
					//    3 -> ends
					while (v8 + 1 < bufLenMult / 0x10000) {
						g5 = g5 & -0x10000 | v8 + 1 & 0xffff;
						v8++;
						VISA_SendWord(deviceId, *(int16_t *)(2 * v8 + bufPtr));
					}
					// Need to get 0x01
					v7 = VISA_CheckSWStatus(deviceId);
					ret = v7;
					if ((v7 & 0xffff) != 1) {
						break;
					}
					innerEndCrit = IEC_COMMAND_SENT;
					continue;
				}
				// command sent check
				v7 = VISA_CheckSWStatus(deviceId);
				ret = v7;
				if ((v7 & 0xffff) != 1) {
					break;
				}
				innerEndCrit = IEC_COMMAND_SENT;
			} /* end inner while */

#define MAX_REPEAT_COUNT 10
			// if status was not ok and repeat count >= max repeat
			if (commandSendRepeatCount >= MAX_REPEAT_COUNT) {
				ret = 0;
				innerEndCrit = IEC_SEND_FAILED;
				goto repeat_send;
			}
			int16_t v9 = commandSendRepeatCount + 1; // 0x10001dd3
			g7 = g7 & -0x10000 | (int32_t)v9;
			commandSendRepeatCount = v9;
			v6 = 4;
        }
        ret = 17;
        bufLenMult = 0x10000 * bufLen;
        commandSendRepeatCount = 0;
        while (true) {
            innerEndCrit = IEC_SEND_FAILED;
            goto outer_label; // repeat loop
        }
    }
    ret = 17;
    bufLenMult = 0x10000 * bufLen;
    commandSendRepeatCount = 0;
    while (true) {
        innerEndCrit = IEC_SEND_FAILED;
        goto outer_label; // repeat loop
    }
}

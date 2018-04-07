/* Low Level Word Serial Implementation Example in C

 Below is an example that uses NI-VXI to implement Word Serial Protocol
 for one Word Serial Write and one Word Serial Read.  It will prompt the
 user for the LA of the message based device to communicate with and a
 string to send to the device.  It will then read the response from the
 device and print it to the screen.  In some systems you may need to adjust
 the timing of the register reads and writes by adding �waits� to the program
 as some instruments may not respond fast enough.  In the interest of space,
 most error checking has been left out of this example.	  */

//#include <nivxi.h>
//#include <ansi_c.h>
#include <stdint.h>

#define TRUE  1
#define FALSE 0
#define MAXINSTR 256
#define RESPONSE 0x0a
#define DATALOW 0xe
#define WRITEREADYDIR 0x900
#define WRITEREADYDOR 0x2200
#define READREADY 0x400
#define TIMEOUT 100
#define NORMALCHAR 0xBC00
#define FINALCHAR 0xBD00
#define CHARMASK 0xFF
#define ENDMASK 0xFF00
#define NOMOREDATA 0xFF00

#define UINT16 uint16_t
#define INT16 int16_t

int main(int argc, char *argv[]) {
	UINT16 offset;
	UINT16 regdata;
	INT16 myinstrLA;
	INT16 status;
	UINT16 responseReg;
	UINT16 sendchar;

	char sendstring[100] = "";
	char receivestring[100] = "";
	int validLA = FALSE;
	int timeoutCnt = 0;
	int lengthCnt = 0;
	int sendstrLen = 0;
	char currentChar;
	int readagain = TRUE;
	int receivecnt = 0;

	//	Initialize the VXI driver
	//status = InitVXIlibrary();

	//	Prompt the user for the logical address of the instrument
	//	make sure we are talking with a valid logical address.
	//	User can enter the string to send to the intrument
	while (!validLA) {
		printf("Enter the LA of the Message Based Device\n");
		scanf("%hd", &myinstrLA);
		if (myinstrLA < MAXINSTR) {
			validLA = TRUE;
		}

		printf("Enter the string to send (ex. *IDN? )\n");
		scanf("%s", sendstring);
		sendstrLen = strlen(sendstring);
	}

	// 	While we have characters to send send each character via a word //	serial write
	while (lengthCnt < sendstrLen) {

		regdata = 0;
		timeoutCnt = 0;

		//	Read RESPONSE register 0xA of instrument and wait till
		//	instrument is ready for write or until timeout occurs
		while ((regdata != WRITEREADYDIR) && (timeoutCnt < TIMEOUT)) {
			status = VXIinReg(myinstrLA, RESPONSE, &regdata);
//  	Mask for the WRITEREADY and DIR bits this will be
//	checked by the while loop and if the instrument is
//	ready we will exit the loop and continue
			regdata = (WRITEREADYDIR & regdata);

			//	Increment timeout timer so we keep track
			timeoutCnt++;
		}

		//	If we exited the loop because of a timeout quit the program
//	 with and error
		if (timeoutCnt >= TIMEOUT) {
			printf(
					"Timeout occured while checking write ready, hit Enter to quit\n");
			getchar();
			getchar();
			return -1;
		}

		// 	Get the character to send this iteration
		currentChar = sendstring[lengthCnt];

		//	Check to see if we are sending the last character, if we are
		//  	then we will concatonate the ascii code with the flag for the
//	final Character.  If not we will concatonate the ascii code with
//	the flag for a normal character
		if (lengthCnt == (sendstrLen - 1)) {
			sendchar = FINALCHAR + currentChar;
		} else {
			sendchar = NORMALCHAR + currentChar;
		}

//	Write the current character to send to the DATALOW
//	register 0xe
		status = VXIoutReg(myinstrLA, DATALOW, sendchar);

		//  Move on to the next character
		lengthCnt++;

	}

	printf("Hit Enter when instrument is ready to read from...\n");
	getchar();
	getchar();

	timeoutCnt = 0;
	receivecnt = 0;

	//  Read characters from the instrument until there are no more to send
	while (readagain) {

		//	Wait for WRITEREADY and DOR bit to be set in the
//	response registor or timeout if it takes to long
		while ((regdata != WRITEREADYDOR) && (timeoutCnt < TIMEOUT)) {
			status = VXIinReg(myinstrLA, RESPONSE, &regdata);

			//	Masking for WRITEREADY and DOR
			regdata = (WRITEREADYDOR & regdata);

			//	Keep track of timeout time
			timeoutCnt++;
			if (timeoutCnt > TIMEOUT) {
				printf("Timeout occurred during read...hit Enter to quit\n");
				getchar();
				getchar();
				return -1;
			}
		}

		timeoutCnt = 0;

		//	Send 0xDEFF to DATALOW register of the intrument to
//	request a byte to be transferred from the device
		sendchar = 0xDEFF;

		status = VXIoutReg(myinstrLA, DATALOW, sendchar);

//  	Wait until the READREADY bit is set in the RESPONSE
//	register or timeout if it takes too long
		while ((regdata != READREADY) && (timeoutCnt < TIMEOUT)) {
			status = VXIinReg(myinstrLA, RESPONSE, &regdata);

			//  Mask for READREADY bit
			regdata = (READREADY & regdata);

			//	Keep track of timeout time
			timeoutCnt++;
			if (timeoutCnt > TIMEOUT) {
				printf("Timeout occurred during read...hit Enter to 
						quit\n");
						getchar();
						getchar();
						return -1;
					}
				}

				// 	Now read a character from the instrument and determine if it //	is the final character to be sent.
				status = VXIinReg(myinstrLA, DATALOW, &regdata);

				//	Mask to get the data
				receivestring[receivecnt] = (regdata & CHARMASK);

				//	Mask for the bits that tell us if it is the last character
				regdata = (ENDMASK & regdata);

				//	Check to see if it the last character and set the flag to quit
//	the loop if it is
				if (regdata == NOMOREDATA) {
					readagain = FALSE;
				}
				receivecnt++;
			}

			printf("Received String: %s\n", receivestring);

			//	Close the VXI driver
			status = CloseVXIlibrary();
			return 0;
		}

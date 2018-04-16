# tomorrow

Code to access a Morrow V9054 Spectrum Analyzer. This is Work In Progress.

src/morrow contains all Morrow specific code. 

src/morrow/include contains various required header files.

src/morrow/orig contains decompilation results for the original Windows 95 libraries. These files were created with RetDec decompiler and are a starting point for own code.

src/morrow/rpc* contains my try to use ONS/RPC together with the Morrow Spectrum Analyzer. This try failed because it seems the Word Serial Protocol (binary data stream) does not work via ONS/RPC.

## State of code:

With some tweaks, the first basic function runs without errors, see main.c:

```c
 mr90xxStatus = mr90xx_init(sessionString, VI_TRUE, VI_TRUE, &sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init\n");
		exit(-1);
	} else {
		printf("mr90xx_init OK\n");
	}
```
	
See Makefile for build targets.

Build with
	make

Run with
	./morrow
	
	
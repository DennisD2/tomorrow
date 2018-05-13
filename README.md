# tomorrow

Code to access a Morrow V9054 Spectrum Analyzer. This is Work In Progress.

src/morrow contains all Morrow specific code. 

src/morrow/include contains various required header files.

src/morrow/orig contains decompilation results for the original Windows 95 libraries. These files were created with RetDec decompiler and are a starting point for own code.

src/morrow/rpc* contains my try to use ONS/RPC together with the Morrow Spectrum Analyzer. This try failed because it seems the Word Serial Protocol (binary data stream) does not work via ONS/RPC.

For deeper discussion of `tomorrow` code, see [src/morrow/sa9054-info.md](src/morrow/sa9054-info.md).

## State of code:

With some tweaks, the basic function runs without errors, see [main.c](src/morrow/main.c). 
This file is an example program found in the Morrow documentation:

```c
#include <sicl.h>

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>
#include <mrapp.h>

#include "helper.h"

int main(int argc, char **argv) {

	setLogLevel(LOG_INFO);

	char sessionString[50];
	ViChar message[128];
	ViStatus mr90xxStatus;
	ViSession sessionId;

	sprintf(sessionString, "vxi,126");

	mr90xxStatus = mr90xx_init(sessionString, VI_TRUE, VI_TRUE, &sessionId);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		printf("Error mr90xx_init\n");
		exit(-1);
	} else {
		printf("mr90xx_init OK\n\n");
	}

	mr90xxStatus = mr90xx_SetEngineModel(sessionId, SA9054);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_SetEngineModel\n");
		exit(-1);
	} else {
		dlog(LOG_INFO, "mr90xx_SetEngineModel OK\n\n");
	}

	ViInt16 number_points = 40;
	ViReal64 start_freq = 149000000;
	ViReal64 stop_freq = 150000000;
	ViInt16 ref_level = 2;
	mr90xxStatus = mr90xx_InitGuiSweep(sessionId, MR90XX_RBW_AUTO,
			MR90XX_VBW_AUTO, start_freq, stop_freq, ref_level, number_points);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_InitGuiSweep\n");
		exit(-1);
	} else {
		dlog(LOG_INFO, "mr90xx_InitGuiSweep OK\n\n");
	}

	setLogLevel(LOG_DEBUG);

	ViReal64 amp_array[40], freq_array[40];
	mr90xxStatus = mr90xx_MeasureAmplWithFreq(sessionId, MR90XX_RBW_AUTO,
		MR90XX_VBW_AUTO, start_freq, stop_freq, ref_level, number_points,
		MR90XX_SWP_MIN,
		MR90XX_DBM_FORMAT, amp_array, freq_array);
	if (mr90xxStatus != MR90XX_IE_SUCCESS) {
		dlog(LOG_ERROR, "Error mr90xx_MeasureAmplWithFreq\n");
	} else {
		dlog(LOG_INFO, "mr90xx_MeasureAmplWithFreq OK\n");
	}

	int i;
	for (i = 0; i < number_points; i++) {
		printf("Amplitude = %10.2f, Frequency = %10.0f\n", amp_array[i],
				freq_array[i]);
	}
}

```

main.c output:

```
[0,    1000000] Amplitude =      51.00, Frequency =    1000000
[1,    1025000] Amplitude =      57.00, Frequency =    1025641
[2,    1050000] Amplitude =      61.00, Frequency =    1051282
[3,    1075000] Amplitude =      55.00, Frequency =    1076923
[4,    1100000] Amplitude =      55.00, Frequency =    1102564
[5,    1125000] Amplitude =      55.00, Frequency =    1128205
[6,    1150000] Amplitude =      51.00, Frequency =    1153846
[7,    1175000] Amplitude =      47.00, Frequency =    1179487
[8,    1200000] Amplitude =      57.00, Frequency =    1205128
[9,    1225000] Amplitude =      59.00, Frequency =    1230769
[10,    1250000] Amplitude =      49.00, Frequency =    1256410
[11,    1275000] Amplitude =      57.00, Frequency =    1282051
[12,    1300000] Amplitude =      59.00, Frequency =    1307692
[13,    1325000] Amplitude =      62.00, Frequency =    1333333
[14,    1350000] Amplitude =      68.00, Frequency =    1358974
[15,    1375000] Amplitude =     102.00, Frequency =    1384615
[16,    1400000] Amplitude =      82.00, Frequency =    1410256
[17,    1425000] Amplitude =      68.00, Frequency =    1435897
[18,    1450000] Amplitude =      59.00, Frequency =    1461538
[19,    1475000] Amplitude =      64.00, Frequency =    1487179
[20,    1500000] Amplitude =      53.00, Frequency =    1512820
[21,    1525000] Amplitude =      51.00, Frequency =    1538461
[22,    1550000] Amplitude =      45.00, Frequency =    1564102
[23,    1575000] Amplitude =      53.00, Frequency =    1589743
[24,    1600000] Amplitude =      49.00, Frequency =    1615384
[25,    1625000] Amplitude =      43.00, Frequency =    1641025
[26,    1650000] Amplitude =      43.00, Frequency =    1666666
[27,    1675000] Amplitude =      43.00, Frequency =    1692307
[28,    1700000] Amplitude =      43.00, Frequency =    1717948
[29,    1725000] Amplitude =      43.00, Frequency =    1743589
[30,    1750000] Amplitude =      45.00, Frequency =    1769230
[31,    1775000] Amplitude =      43.00, Frequency =    1794871
[32,    1800000] Amplitude =      43.00, Frequency =    1820512
[33,    1825000] Amplitude =      43.00, Frequency =    1846153
[34,    1850000] Amplitude =      47.00, Frequency =    1871794
[35,    1875000] Amplitude =      49.00, Frequency =    1897435
[36,    1900000] Amplitude =      47.00, Frequency =    1923076
[37,    1925000] Amplitude =      45.00, Frequency =    1948717
[38,    1950000] Amplitude =      43.00, Frequency =    1974358
[39,    1975000] Amplitude =      49.00, Frequency =    1999999
```
	
See Makefile for build targets.

Build with
	`make`

Run with
	`./morrow`
	
	
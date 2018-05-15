# Morrow Spectrum Analyzers info collection.

The information below is a collection of facts, assumptions, open issues and more topics.

The information was gathered from a Morrow V9054. It may apply to other Morrow models like V9052, V9034 and V9085 as well.
Other devices from Morrow may use the same code base.

## General
The Morrow V9054 has two CPUs. 
CPU named P2 is the CPU which handles the VXI Bus communication. It can be accessed by standard VXI Word Serial Protocol. P2 
understands the common Word Serial Commands like `Abort Normal Operation`.
CPU named P1 is the aquisition CPU which controls filters, attenuators etc. of the aquisition engine of the spectrum analyzer.
P1 can be accessed by special commands (Engine Commands) that are routed through P2. 

## Starting point
With the Morrow Spectrum Analyzer, I got a floppy disk containing Windows 95 driver library binaries, Header files and and a CD containing a GUI to access the device. The setup requires an ISA or maybe PCI-based VXI controller card inside the PC. I also have 
some manuals from Morrow, but have not the programming guide. All data from late 1990ies.

My setting in 2018 is: Linux PC, no Windows anywhere. The Morrow analyzer is contained in a HP VXI Mainframe E8401A. The 
Mainframe contains a single slot UNIX workstation HP E1498A running HP/UX 10.2 as VXI Controller. The mainframe and the Linux PC are connected via 10 MBit LAN connection.

## Tools used
To analyze the 20 year old code, I tried the `RetDec` decompiler which gives good results as long as the functions are not too complicated.
The result gives good clues what the code is doing. Using `IDA Free`, which cannot decompile, but disassemble in a very nice way, it can always be found out whats going on.

The issue for reverse engineering here is the enormous mass of code. Decompilation of the three DLLs gives ~133.000 lines of source
code...

```
dennis@dennis-pc:~/git/tomorrow/src/morrow/orig> wc -l *.c
  33988 mtcpnp32.dll.c
  45342 mtcsa32.dll.c
  24858 mtcvsa32.dll.c
 133228 insgesamt
```

## Approach
I started with three empty `clean room` files for the three libs (pnp.c, sa.c and visa.c). From an [example C source code](main.c) I found in the documentation, some important function can be seen:

```
mr90xx_init() to initialize the VISA communication, the hardware and the libs.
mr90xx_setEngine() to tell the libs what model is used.
mr90xx_initGuiSweep() to define all parameters required for a sweep run.
mr90xx_MeasureAmplWithFreq() to execute a measurement and to provide output data.
```

I copied the decompiled code from the DLL library file to the clean file pnp.c
I wrote down main.c that calls mr90xx_init(). The compile+linking step then throwed out all undefined symbols.
These were functions and global variables. 

In the next step, I copied all undefined symbols from the decompilation files to the clean room files and restart compile+linking step.
This gave another list of undefined symbols.

The last step was repeated until there are no missing symbols anymore. 

The code result is then compiled on the target platform and the working code is examined and corrected until it is assumed that the code
is doing the correct thing.

The sometimes funny looking decompiled C source can often be replaced with a much shorter 'human' implementation then.

After all these steps, the next function is added to pnp.c and all steps are repeated with the newly added function.

To allow compile+linking step on my Linux PC (which is much faster than the VXI controller board) I created a mock implementation
of the Word Serial Protocol with fake device registers of the Spectrum Analyzer. This allowed me to use gdb for debugging. On the target platform, gdb failed to work (which is very sad in such a case). So it was very important to have at least a complete debugging enviroment even be it on another platform. This allowed me to trace many bugs in the source even before it run on the target platform.


## Engine Command Table
Engine Commands are Commands for CPU P1 (acquisition CPU).
The code allows Engine command values in range 0..16.

Most codes are listed in file include/sa_defin.h:

```c
/* ------------------------------------------------------------------------ */
/*  Constant definitions of command numbers to the engine.                  */
/* ------------------------------------------------------------------------ */
#define ENG_INIT        0			4 WORDS:  unknown(4), Wert = 0. 
                                  Testing shows that 3 (!?!) values are required.
#define ENG_START_SWP   1			12 WORDS
#define ENG_START_ZSPAN 2			10 WORDS
#define ENG_START_FHOP  3			5 WORDS
#define ENG_SET_TRIGDET 4			8 WORDS: 
#define ENG_LOAD_HOPFRQ 5
#define ENG_SET_INTMODE 6			1 WORD: intr_code
#define ENG_TERMINATE   7			1 WORD: breakMode, value seen: 0
#define ENG_CALIBRATE   10			(6 WORDS???)
#define ENG_UNKNOWN1    11        8 WORDS, 6 WORDS, 2 WORDS
```
Own findings:

ENG_TERMINATE: takes 1 word. This seems to can have values as defines in sa_defin.h:

```c
/* ------------------------------------------------------------------------ */
/*  Defines for argument codes to Interrupt Sweep command to the engine.    */
/* ------------------------------------------------------------------------ */
#define STOP_NOW        0   /* Terminate sweep immediately.                 */
#define STOP_AFTER      1   /* Terminate sweep when current sweep completes */
#define PAUSE_SWP       2   /* Pause the current sweep.                     */
#define RESUME_SWP      3   /* Resume the current sweep.                    */
```

ENG_INIT: takes 4 words. In code found, all values are 0. But see my comment in table above (three instead of 4 values).

ENG_SET_INTMODE: takes 1 word.
```c
	word[0] = a1->intr_code
```

ENG_SET_TRIGDET: takes 8 words.
```	c
words[0] = a1->detect_code;
	words[1] = trig_code; // calculated in StartSweep: (trig_norm_flag!=0)? trig_code|0x80 : trig_code;
	words[2] = a1->trig_delay & 0xffff; // tdelay_lo
	words[3] = a1->trig_delay >> 16; // tdelay_hi
	words[4] = a1->trig_thresh & 0xffff; // tthresh_lo
	words[5] = a1->trig_thresh >> 16; // tthresh_hi, always 0 because it is a 16 bit value.
	words[6] = trig_freq_l & 0xffff; // trig_freq_lo
	words[7] = trig_freq_l >> 16; // trig_freq_hi
```
trig_freq_l is 32 bit long value of the floating value a1->trig_freq.

ENG_START_SWP: takes 12 words.
```c
	words[0] = fstart_l & 0xffff; // fstart_lo
	words[1] = fstart_l >> 16; // fstart_hi
	words[2] = fstop_l & 0xffff; // fstop_lo
	words[3] = fstop_l >> 16; // fstop_hi
	words[4] = (a1->vbw_code << 8)|a1->rbw_code
	words[5] = fstep_l & 0xffff; // fstep_lo
	words[6] = fstep_l >> 16; // fstep_hi
	words[7] = a1->settle_time & 0xffff; // settlet_lo
	words[8] = a1->settle_time >> 16; // settlet_hi
	words[9] = a1->PreampEnabled? (a1->attenuation & 0ff)|0x8000 : (a1->attenuation & 0ff);
	words[10] = a1->cell_mode!=1? 0 : a1->num_cells; 
	words[11] = (RdEngOption(a1, ENG_OPT_1 /*1*/) & 0x10) | a1->sweep_code; // See IDA
```
fstart_l, fstop_l and fstep_l are 32 bit long values of the floating value a1->start, a1->stop and a1->step.


## Shared Lib Function Table

Function Pointers from mtcsa.c to mtcvsa.c
 /* from mtcsa32.c */
 
 ```c
   int32_t (*func)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"OpenSessionStep")); // 0x10003377
    *(int32_t *)(a1 + 720) = (int32_t)func;
    g8 = v1;
    int32_t (*func2)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"ClearDataFIFO")); // 0x1000339c
    *(int32_t *)(a1 + 664) = (int32_t)func2;
    g8 = v1;
    int32_t (*func3)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"CheckSWStatus")); // 0x100033c1
    *(int32_t *)(a1 + 668) = (int32_t)func3;
    g8 = v1;
    int32_t (*func4)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"CheckHWStatus")); // 0x100033e6
    *(int32_t *)(a1 + 672) = (int32_t)func4;
    g8 = v1;
    int32_t (*func5)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"FetchDataWord")); // 0x1000340b
    *(int32_t *)(a1 + 680) = (int32_t)func5;
    g8 = v1;
    int32_t (*func6)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"WaitRecvWord")); // 0x10003430
    *(int32_t *)(a1 + 684) = (int32_t)func6;
    g8 = v1;
    int32_t (*func7)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"SendDataItem")); // 0x10003455
    *(int32_t *)(a1 + 688) = (int32_t)func7;
    g8 = v1;
    int32_t (*func8)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"SendCommand")); // 0x1000347a
    *(int32_t *)(a1 + 692) = (int32_t)func8;
    g8 = v1;
    int32_t (*func9)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"VerDataBlock")); // 0x1000349f
    *(int32_t *)(a1 + 696) = (int32_t)func9;
    g8 = v1;
    int32_t (*func10)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"GetDataBlock")); // 0x100034c4
    *(int32_t *)(a1 + 676) = (int32_t)func10;
    g8 = v1;
    int32_t (*func11)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"SendWord")); // 0x100034e9
    *(int32_t *)(a1 + 700) = (int32_t)func11;
    g8 = v1;
    int32_t (*func12)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"CheckSWStatNoTO")); // 0x1000350e
    *(int32_t *)(a1 + 704) = (int32_t)func12;
    g8 = v1;
    int32_t (*func13)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"ShutdownEngine")); // 0x10003533
    *(int32_t *)(a1 + 708) = (int32_t)func13;
    g8 = v1;
    int32_t (*func14)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"InitEngine")); // 0x10003558
    *(int32_t *)(a1 + 712) = (int32_t)func14;
    g8 = v1;
    int32_t (*func15)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"ResetEngine")); // 0x1000357d
    *(int32_t *)(a1 + 716) = (int32_t)func15;
    g8 = v1;
    int32_t (*func16)() = GetProcAddress((int32_t *)hModule, (char *)function_10003280(v1, (int32_t)"CloseSession")); // 0x100035a2
    *(int32_t *)(a1 + 724) = (int32_t)func16;
    g8 = v1;
    int32_t lpProcName = function_10003280(v1, (int32_t)"IdQuery"); // 0x100035ba
    int32_t func17 = (int32_t)GetProcAddress((int32_t *)hModule, (char *)lpProcName); // 0x100035c7
    *(int32_t *)(a1 + 728) = func17;
```

## Lines Of Code 

###Step 1: All code required for mr90xx_init() :
```
   56    131    922 helper.c
   451   1524  12774 main1.c
    74    173   1875 main.c
  1608   5382  38765 pnp.c                      guisweep 1185..1604 = 419
  5430  20485 182352 sa.c                       guisweep 3987..5420 = 1433
   119    423   2980 sendcommand.c
    43    108    738 timetest.c
  1188   4810  37292 visa.c
   492   2080  15070 vximorrow.c
   148    417   3130 vximorrow_mock.c
    30     51    405 compatibility.h
    79    213   2210 dvisa.h
    34     78    582 helper.h
    19     42    352 pnp.h
    37    104    968 sa.h
    51    147   1343 vximorrow.h
  9859  36168 301758 total
  ```
--> 9859 Lines total.

###Step 2: Addition of mr90xx_setEngine() :
```
mr90XX_init + setengine
pnp.c +=	1184
sa.c +=		3986
visa.c += 	1188
```

###Step 3: Addition of mr90xx_initGuiSweep() :
```
pnp += 		419
sa += 		1433
visa += 	0
```

###Step 4: Addition of mr90xx_MeasureAmplWithFreq()
```
dennis@dennis-pc:~/git/tomorrow/src/morrow> wc -l pnp.c sa.c visa.c
  1231 pnp.c
  7741 sa.c
  1344 visa.c
 10316 total
```

## Done
- Reconstruct arrays (VBWFreFromCode:done, RBWFreFromCode:done, GetRBWWide, DefltSetTimeRBW, DefltSetTimeVBW)
- Check all return values of SetFuncStatusCode() - ok till InitGuiSweep
- replace all (a1 & 256) and such with a1->opcode & 256. 
   After checking, this cannot be done. There is no setting of opcode value anywhere.
- Has VISA_GetDataBlock(() 5 or 6 args ? solve this! int32_t VISA_GetDataBlock(SET9052 *deviceId, int64_t reversePointIdx, int32_t a3, int32_t *a4, /*int32_t*/int16_t *a5); Analysis result: it has 5 args.
- Make VISA_SendWord() original again
- Check if we can get rid of _initEngine() - it's away.
- Check if VISA_SendCommand() is really ok reimplemented or if it must be converted back to ORIG version; it should only
  use vi* functions. Ok, it seems to run ok.
- rearrange MeasureAmplWithFreq with if vbwmode/rbwmode 

## Todos
- GetRBWwide() is reimplemented correctly, but the code then fails. Correct this.
- A 40 point sweep needs ~30 seconds. This is way too long. The manual says that settling times etc. are in millisecond range. So why
  are the aquisitions run that long? Analyze timing and find out where all the time is lost.
- Make dd_readEngineStatus() original again(find out original name and make code use vi* only)
- Fix Error mapping ENG->SW domain
- Check all "DD XXX" and "TODO" notes and solve the issues
- SetVBWmode uses AUTO_ON/OFF and not VI_TRUE/FALSE. Replace this everywhere.
- SetErrorStatus() in visa.c replace 1,2,3,... with #defines (but with what ones?)

## Status

- mr90xx_init() OK with tweaks
- mr90xx_setEngine() OK 
- mr90xx_initGuiSweep() OK with tweaks
- mr90xx_MeasureAmplWithFreq(): Runs ok and sets analyzer to run sweeping and fetches amplitude and frequency data.

At this time I did 2 things:
- Copied main.c to main2.c and changed the frequency range there to 1..2Mhz.
- Hooked the Spectrum Analyzer input to my frequency generator, with 0db attenuation.

Replaced the call to mr90xx_MeasureAmplWithFreq() with my own code, with DLFM (Data Low Fast Mode) switched off:

```c
	setLogLevel(LOG_DEBUG);
	SET9052 *a1 = sessionForId(sessionId);
	// Set Sweep code to the same values as mr90xx_MeasureAmplWithFreq() would do.
	SetSweepCode(a1, MR90XX_SWP_MIN|MR90XX_SWP_CONT|MR90XX_SWP_FRQPTS);

	wordPtr[0]=0x4240; // 1..2Mhz // start LO
	wordPtr[1]=0xf; // start HI
	wordPtr[2]=0x8480; // stop LO
	wordPtr[3]=0x1e; // stop HI
	wordPtr[4]=0x100; // filter_code
	wordPtr[5]=0x6429; // step LO
	wordPtr[6]=0x0; // step HI
	wordPtr[7]=0x0; // settle time LO
	wordPtr[8]=0x0; // settle time HI
	wordPtr[9]=0x2a; // attenuation
	wordPtr[10] = RdCellMode(a1)!=1? 0 : a1->num_cells; 
	// Next line; reading option is ok, but nobody in lib code sets any options, so RgEngOption(*) always returns 0 :-(
	int32_t opt1 = RdEngOption(a1, ENG_OPT_1 /*1*/);
	uint16_t sweep_code = (opt1 & 0x10) | a1->sweep_code; // See IDA
	wordPtr[11] = sweep_code;

	setLogLevel(LOG_INFO);

	uint32_t unused;
	DLFMModeOff(a1, unused);
	// Clear FIFO
	VISA_ClearDataFIFO(a1);
	// Start (continuous) sweep
	SendCommand(a1, ENG_START_SWP, 12, wordPtr);
	// Endure that DLFM mode is off for 'normal' data reading
	DLFMModeOff(a1, unused);

	int i;

	for (i = 0; i < number_points; i++) {
		while (VISA_CheckHWStatus(a1) == STAT_EMPTY) {
		}
		uint32_t v4 = VISA_CheckHWStatus(a1) & 0xf00;
		fifoPrint(v4);

		if (v4 != STAT_EMPTY) {
			uint16_t data = 0;
#ifdef DLFM
			// Read from Data Low
			data = readDataWord(a1);
			amp_array[i] = (float64_t) data;
#else
			sendWord(a1, VXI_ENGINEDATA);
			//data = readDataWord(a1);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "amp[%d] = 0x%x, %d\n", i, data, data); // <-- line is required; timing issue!
			amp_array[i] = (float64_t) data;

			sendWord(a1, VXI_ENGINEDATA);
			//data = readDataWord(a1);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "freq lo [%d] = 0x%x, %d\n", i, data, data); // <-- line is required; timing issue!
			uint16_t flo = data;

			sendWord(a1, VXI_ENGINEDATA);
			//data = readDataWord(a1);
			dd_viIn16(a1->session_handle, 1, REG_DATALOW_BO, &data);
			dlog(LOG_INFO, "freq hi [%d] = 0x%x, %d\n", i, data, data); // <-- line is required; timing issue!
			uint16_t fhi = data;

			uint32_t freq = ((uint32_t)fhi << 16) | (flo & 0xffff);
			freq_array[i] = (float64_t) freq;
#endif
		}
	}

	for (i = 0; i < number_points; i++) {
		float f = start_freq + i*(stop_freq-start_freq)/ number_points;
		printf("[%d, %10.0f] Amplitude = %10.2f, Frequency = %10.0f\n", i, f, amp_array[i], freq_array[i]);
	}


```

And hey, after some fiddling around I got:

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
[15,    1375000] Amplitude =     102.00, Frequency =    1384615 <-- Frequency generator is at 1,393Mhz
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

So  amplitude and frequency seems to be retrieved correctly!

## Ongoing work



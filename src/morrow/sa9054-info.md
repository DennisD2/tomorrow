# Morrow Spectrum Analyzers info collection.

The information below is a collection of facts, assumptions, open issues and more topics.

The information was gathered from a Morrow SA9054. It may apply to other Morrow models like SA9052, SA9034 and SA9085 as well.
Other devices from Morrow may use the same code base.

## General
The Morrow 9054 has two CPUs. 
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
I started with three empty `clean room` files for the three libs (pnp.c, sa.c and visa.c). From an example C source code I found in the documentation, some most important function can be seen:

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

```
/* ------------------------------------------------------------------------ */
/*  Constant definitions of command numbers to the engine.                  */
/* ------------------------------------------------------------------------ */
#define ENG_INIT        0			4 WORDS:  unknown(4), Wert = 0. 
									Testing shows that 3 (!?!) values are required.
#define ENG_START_SWP   1			12 WORDS
#define ENG_START_ZSPAN 2			10 WORDS
#define ENG_START_FHOP  3			5 WORDS
#define ENG_SET_TRIGDET 4			8 WORDS: detect_code(2), sweep_code(2), num_cells(4)
#define ENG_LOAD_HOPFRQ 5
#define ENG_SET_INTMODE 6			2 WORDS: intr_code(2)
#define ENG_TERMINATE   7			1 WORD: breakMode, value seen: 0
#define ENG_CALIBRATE   10			(6 WORDS???)
#define ENG_UNKNOWN1    11          8 WORDS, 6 WORDS, 2 WORDS
```
Own findings:

```
Command 	Function				Comment
-------------------------------------------------------------------------
0 			unknown					Not exposed by libs and not called by lib code.
1			Start Sweep
2			Start zSpan
3			Start FreqHop
4			Set Trigger related		Params (8, g8)
5									(not used by libs)
6			Comm Interrupt			Params (1, a1->interrupt_code)
7			Break Sweep				Params (1, 0)
8									(not used by libs)			
9									(not used by libs)
10			GetCalPoint
11			Pulse function related
12									(not used by libs)
13									(not used by libs)
14									(not used by libs)
15									(not used by libs)
16									(not used by libs)
```

## Shared Lib Function Table

Function Pointers from mtcsa.c to mtcvsa.c
 /* from mtcsa32.c */
 
 ```
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
  9859  36168 301758 insgesamt
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

## Todos
- Reconstruct arrays (VBWFreFromCode:done, RBWFreFromCode:done, GetRBWWide, DefltSetTimeRBW, DefltSetTimeVBW)
- Fix Error mapping ENG->SW domain
- Check all return values of SetFuncStatusCode() - ok till InitGuiSweep
- Check all "DD XXX" and "TODO" notes and solve the issues
- SetVBWmode uses AUTO_ON/OFF and not VI_TRUE/FALSE. Replace this everywhere.
- replace all (a1 & 256) and such with a1->opcode & 256. 
- SetErrorStatus() in visa.c replace 1,2,3,... with #defines

## Status

- mr90xx_init() OK with tweaks
- mr90xx_setEngine() OK 
- mr90xx_initGuiSweep() OK with tweaks
- mr90xx_MeasureAmplWithFreq: Currently analyzed

As soon as mr90xx_MeasureAmplWithFreq(), aquisition data can be retrieved from the Spectrum Analyzer.


bash-4.3$ ./morrow 
----------------------------------------
main start
ACK
mr90xx_OpenSession, session added to position 1.
mr90xx_init OK

mr90xx_SetEngineModel OK

mr90xx_InitGuiSweep OK

MeasureAmplWithFreq
RdMinFreqLimit 3 --> 0x40000000
FreqInRange(149000000.000000) -> 1
RdMinFreqLimit 3 --> 0x40000000
FreqInRange(150000000.000000) -> 1
SetSweepCode(318030931004290090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000.000000)
RBWFreqFromCode(0); frequencyLimit_rbwFrequency was set to: 300.000000 
VBWFreqFromCode(7); frequencyLimit was set to: 3000000.000000 
VBWFreqFromCode(1); frequencyLimit was set to: 3.000000 
ftol(0.000000) -> 0
IsValidStep() -> 1
DefltSetTimeRBW(0) -> 6000
DefltSetTimeVBW(1) -> 250000
DefltSetTimeRBW(0) -> 6000
DefltSetTimeVBW(1) -> 250000
SetRBWmode(mode=0x0)
SetRBW(0x5)
RBWFreqFromCode(5); frequencyLimit_rbwFrequency was set to: 3000000.000000 
VBWFreqFromCode(7); frequencyLimit was set to: 3000000.000000 
VBWFreqFromCode(1); frequencyLimit was set to: 3.000000 
ftol(0.000000) -> 0
IsValidStep() -> 1
DefltSetTimeRBW(5) -> -1
DefltSetTimeVBW(1) -> 250000
DefltSetTimeRBW(5) -> -1
DefltSetTimeVBW(1) -> 250000
SetVBWmode(0x1)
ConfigStartFreq(149000000.000000)
RdMinFreqLimit 3 --> 0x40000000
FreqInRange(149000000.000000) -> 1
SetFuncStatusCode(fffd)
ConfigStartFreq(150000000.000000)
RdMinFreqLimit 3 --> 0x40000000
FreqInRange(150000000.000000) -> 1
RBWFreqFromCode(5); frequencyLimit_rbwFrequency was set to: 3000000.000000 
VBWFreqFromCode(7); frequencyLimit was set to: 3000000.000000 
VBWFreqFromCode(1); frequencyLimit was set to: 3.000000 
ftol(0.000000) -> 0
IsValidStep() -> 1
DefltSetTimeRBW(5) -> -1
DefltSetTimeVBW(1) -> 250000
SetRefLevel(2)
SetNumCells(40)
RBWFreqFromCode(5); frequencyLimit_rbwFrequency was set to: 3000000.000000 
VBWFreqFromCode(7); frequencyLimit was set to: 3000000.000000 
VBWFreqFromCode(1); frequencyLimit was set to: 3.000000 
ftol(0.000000) -> 0
IsValidStep() -> 1
DefltSetTimeRBW(5) -> -1
DefltSetTimeVBW(1) -> 250000
RdNumSwpPts --> 40


sa.c:BreakSweep, mode=0

sa.c:SendCommand 7
VISA_SendCommand(7=ENG_TERMINATE, 1, 7b03a990)
wordPtr[0]=0x0
function_100010e1(a2=0x0)
function_100011fc
        function_10001249(command d10f=P2?,0xffffd10f, 0x0) - what is this call intending TODO CHECK?
function_10001297
function_100011fc

dd_SendCommand(7=ENG_TERMINATE, 1, 7b03a990)
words[0]=0x0

dd_wsCommand(command=0xcdff,readAnswer=1)
Bus error (core dumped)


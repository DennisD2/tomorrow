/*
 * sa9.h
 *
 *  Created on: 04.05.2018
 *      Author: dennis
 */

#ifndef SA9_H_
#define SA9_H_

 struct SAStruct1
{
    short    op_mode;       /* 0 Current mode: Sweep, Zspan, freq hop,etc */
    short    engine_model;  /* 2 Enumerated engine model type:  SA9052,   */
                            /*   SA9016, SA9085, or SA9034.             */
    short    swp_in_prog;   /* 4 Flag indicating if data is currently     */
                            /* being gathered(TRUE),or if sweep is being*/
                            /* paused or held(FALSE).                   */

    /* DD: TODO: 'start' starts with 8 , not 6, due to alignment */
    double start;         /* 8 Start frequency in Hz                    */
    double stop ;         /* 16 -0x11 Stop frequency in Hz                     */
    double step ;         /* 24-0xxx Step size in Hz                          */
    short    step_mode;     /* 32-0xxx Is stepsize AUTO,by pointcnt,or specified*/
    short    time_mode;     /* 34-0xxx Swp time in AUTO, by step time or swptime*/
    int    dwell_time;    /* 36-0xxx Time to dwell at each freq step in uS    */
    int    settle_time;   /* 40-0xxx Override norm filter settle time in uS   */
                            /*   Will normally be 0. Causes decalibrat  */
    double  sweep_time;     /* 48 0xxx Time in uS to complete entire sweep.     */
    short   swp_time_unit;  /* 56-0xxx Unit of time for sweep_time.  Needed     */
                            /*   because int can't hold large enough   */
                            /*   value in uS.  Can switch to mS, or     */
                            /*   seconds.                               */
    int   synth_time;     /* 60 Synthesizer settling time. Constant.     */
    short   cell_mode;      /* 64 Divide frequency span in num_cells groups*/
                            /* and return min and/or max point of each  */
                            /* cell when set to TRUE.  FALSE means      */
                            /* return points for each step of the synth.*/
    short   auto_cell;      /* 66 AUTO_ON means 9052 can set cell_mode to  */
                            /*   TRUE automatically.  AUTO_OFF means    */
                            /*   value of cell_mode can only be changed */
                            /*   by the calling application.            */
    int   deflt_pt_cnt;   /* 68 Default number of sweep points.  This is */
                            /*   the number of points the engine will   */
                            /*   return when step_mode is AUTO.         */
    short   rbw_code;       /* 72 Resolution bandwidth code.               */
    short   auto_rbw;       /* 74 Auto mode on or off for RBW? (1 or 0)    */
    short   vbw_code;       /* 76 Video bandwidth code.                    */
    short   auto_vbw;       /* 78 Auto mode on or off for VBW? (1 or 0)    */
    short   filter_code;    /* 80 Combined filter codes for RBW & VBW.     */
                            /* Upper byte is VBW. Lower byte is RBW.    */
    double  filter_ratio;   /* 88=82+6 Ratio of VBW to RBW. Defaults to 0.10    */
    /* ---------------------------------------------------------------- */
    /*  Since the calling application can switch between linear and log
        detectors at will, multiple structure members are provided to
        store the various values.  attenuation and ref_level are the
        true current settings.  They are set based upon the current
        detector mode.  API functions handle conversions needed by the
        calling aps based upon the detector in use.                     */
    /* ---------------------------------------------------------------- */
    short   attenuation;    /* 96 Input attenuation val.  0 - 60 dB.       */
    short   ref_level;      /* 98 Top of amplitude scale. Adjusts atten.   */
    /* ---------------------------------------------------------------- */

    short   PreampAvailable;/* 100 the engine has a preamp installed        */
    short   PreampEnabled;  /* 102 the preamp is enabled (only valid if
                                PreampAvailable == TRUE)                */
    short   PreampGain;     /* 104 gain of the preamp (in dBm)              */

    short   EngineRefLevel; /* 106 reference level of ENGINE, can be
                                    different than ref_level so that
                                    calling apps can zoom the amplitude
                                    scale.                              */

    /* ---------------------------------------------------------------- */
    short   trig_code;           /* 108 Code to determine triggering mode.       */
    short   trig_norm_flag;      /* 110 Determines if continuous sweep triggers  */
                                 /*   occur one time & then free run, or more*/
                                 /*   normally- sweep for each trigger hit.  */
                                 /*   1 is TRUE or normal.  0 triggers hit   */
                                 /*   time only.                             */
    int   trig_delay;          /* 112 Delay time for all trigger modes, in uS  */
    short   trig_thresh;         /* 116 Ampltd. threshold for video trig.  Should*/
                                 /*   be zero for all other trigger modes.   */
    double trig_freq;          /* 120 Frequency for thresh for video trig. Should*/
                                 /*   be zero for all other trigger modes.   */
    short    detect_code;        /* 128 Code for sa detector mode(log,lin,AM,etc)*/
    short    sweep_code;         /* 130 Bit field for sweep modes.               */
    int    num_cells;          /* 132 Number of cells to divide the span into  */
                                 /*   when cell_mode == TRUE                 */
    short    intr_code;          /* 136 Code for point at which engine should    */
                                 /*   interrupt the PC.                      */
    							 /* DD: due to aligment 138 -> 144 */
    double zspan_freq;         /* 144 Frequency at which to set zero span mode */
    int    num_samples;        /* 152 For Zspan mode: number of samples to be  */
                                 /*   returned to the PC. 0 means continue   */
                                 /*   until a terminate command is sent.     */
    unsigned short   zsampl_dvdr;        /* 156 12-bit value at which to take readings.  */
                                 /*   The sampling rate is equal to          */
                                 /*   10,000,000 / zsampl_dvdr [samples/sec].*/
    int    sweepIndex;         /* 160 The index of the current frequency point */
    int    num_swp_pts;        /* 164 Number of points current sweep params    */
                                 /*   will generate.                         */
    int    num_step_pts;       /* 168 Number of synthesizer steps to generate  */
                                 /*   the data points. ie 500 steps with     */
                                 /*   min & max will return 1000 data points.*/
    int    num_hop_pts;        /* 172 Number of points in the freq hop table.  */
    short    impedance;          /* 176 Input impedance.  Normally 50 ohms.      */

    int    ie_duration;        /* 180 delay time in milliseconds               */
    short    extern_ref;         /* 184 REALITY:184 Flag for extern ref.  0 is default and   */
                                 /*   indicates extern ref is off.  1        */
                                 /*   activates the external reference.      */

    /* DD: added next line */
    unsigned int   z_cell_size;        /* 188: by code analysis, we have that value here !?! */

    unsigned int   err_status;         /* 192 last error that occured at low level     */
    						/* DD: in decompile, interfaceType is uint32_t ! */
    unsigned short   interfaceType;      /* 196 the hardware platform this analyzer uses */
    unsigned int   eng_options  ;      /* 200 coded options flags, internal usage      */
    short    func_status_code  ; /* 204 status code of last function return      */
    unsigned short   engine_reply_code ; /* 206 engine reply code of last engine return  */

    short    openStep          ; /* 208 Current step in the open session         */
                                 /*   sequence.  Steps begins at 0 and       */
                                 /*   increment.                             */
    char     sessionString[256]; /* 210 Session string to be used for opening a  */
                                 /*   the spectrum analyzer session.         */
    unsigned int   session_handle;     /* 468 defines a specific type of session       */

    /* ISA specific members */
    unsigned short   data_port;          /* 472 Address port for this engine.  status    */
                                 /*   will be data_port + 2.                 */
    unsigned short   irq_num;            /* 474 Which interrupt line is this engine on.  */

    /* VXI specific members */
    short   logical_addr;       /* 476 VXI logical address of the instrument if */
                                /*  it is a VXI device                      */

    /* Serial specific members */
    void    *commHandle;        /* 480 this is the pointer to the GreenLeaf
                                    PORT structure used for the serial port.
                                    Changed type to void * from
                                    struct _tag_port*                       */
    int   serialErrs[6][2]; /* 484 */
    short   commNumber;         /* 484+48=532 Value that specifies a particular COMx
                                    for the GreenLeaf port open functions   */
    short   comm_addr;          /* 534 address for the current uart             */
    short   comm_irq;           /* 536 irq for the current uart                 */
    short   commRateCode;       /* 538 the index in the rate array of the bps
                                    of the comm link                        */
                                /* the first index should be 1 less than
                                    the rates array's length(hokey)         */
    short   commDialMeth;       /* 540 tone(0) or pulse(1)                      */
    short   commSpeakMode;      /* 542 speaker on(1) or off(0)                  */
    char    commPhoneNum[50] ;  /* 544 phone number to dial                    */
    char    commInitString[50]; /* 594 initialization string for modems     */
    short   modemConnectTimeout ; /* 644 time after which modem connection is */
                                  /* considered to have failed          */
    /* HP SICL members */
    char    *baseAddr;      /* 648 the base address for the register map    */

    int      vxiID; /* 652 */

    /*  HANDLE is defined for the NT device driver development in the
        files <windows.h> <winioctl.h>.  The device handle is set in the
        ntisafce.c source file in InitEngine().  The handle is needed
        to access the low level driver which must be installed in the
        system and entered into the registry.                           */
#if defined(MR90XX_OS_WIN32) && !defined (MR90XX_COMPILER_LW40)
    HANDLE nt_port_handle;
#endif

    long funcLink ; /* 656 */
} SET9052;

#endif /* SA9_H_ */

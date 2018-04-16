/* -------------------------------------------------------------------- */
/*  Morrow Technologies Corporation (c)1993,1994,1995,1996,1997         */
/*                    All rights reserved worldwide.                    */
/* -------------------------------------------------------------------- */
/* FILE    : str_9052.h                                                 
   VERSION : 1.52                                                       
   PURPOSE : Definition of the SET9052 structure.  This structure is 
                used throughout the library for tracking engine sweep
                parameters.  Every application intended to control a 
                905x spectrum analyzer must inlude this header and 
                instantiate a variable of type SET9052.                 
   DATE    : 10/4/1996                                                  
   AUTHOR  : Joe Overton - modified from orig by TWF in SET9052.H       */
/* -------------------------------------------------------------------- */
/* LAST MOD: 2/5/1997 - Cleanup exported header files.  Removed dead
                structure elements and made minor cosmetic changes.     */
/* -------------------------------------------------------------------- */
/* Tabs = 4 for correct spacing                                         */

#ifndef ___STR_9052_H___
#define ___STR_9052_H___

#ifndef ___SAPFORM_H___
    #error SAPFORM.H must be included before any non-system headers.
#endif

#ifndef ___SATYPES_H___
    #include "satypes.h"
#endif

#ifndef ___SA_DEFIN_H___
    #include "sa_defin.h"
#endif

#if defined(MR90XX_OS_WIN16) || defined(MR90XX_OS_WIN32) && !defined(MR90XX_COMPILER_LW40)
   #include <windows.h>
#endif

/* -------------------------------------------------------------------- */
/*  SICL is predefine indicated by Hewlett Packard's HP Standard
    Instrument Control Library.  To support this platform the structure
    requires an HP specific type INST defined in sicl.h.  Other
    platforms need not concern themselves with this structure element.
    Warning: Even though ifdef'd out, microsoft compilers may still 
    build sicl.h into your dependencies.  Comment out the #include
    below if you encounter this problem.                                */
/* -------------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif

//typedef struct SAStruct SET9052 ;

typedef struct SALibStruct
{
#if defined(MR90XX_OS_WIN16)
    HINSTANCE m_DllHandle ;    
#elif defined(MR90XX_OS_WIN32) && !defined(MR90XX_COMPILER_LW40)
    HMODULE m_DllHandle ;    
#else
    int     m_DllHandle ;
    #define WINAPI IE_FUNC IE_FUNCEXP   
#endif
#ifdef Some_Windows
    void    (WINAPI *m_ClearDataFIFO  )(SET9052 *p_instr );
    int16   (WINAPI *m_CheckSWStatus  )(SET9052 *p_instr );
    int16   (WINAPI *m_CheckHWStatus  )(SET9052 *p_instr );
    int16   (WINAPI *m_GetDataBlock   )(SET9052 *p_instr, int32 maxWords,int32 clusterSize,int32 *returnCount,uint16 *crc );
    int16   (WINAPI *m_FetchDataWord  )(SET9052 *p_instr,uint16 *CRCVal );
    uint16  (WINAPI *m_WaitRecvWord   )(SET9052 *p_instr);
    int16   (WINAPI *m_SendDataItem   )(SET9052 *p_instr, uint16 dataitem );
    int16   (WINAPI *m_SendCommand    )(SET9052 *p_instr,int16 command_num, int16 arg_cnt, uint16 *arg_list );
    int16   (WINAPI *m_VerDataBlock   )(SET9052 *p_instr,uint16 CRCval);
    int16   (WINAPI *m_SendWord       )(SET9052 *p_instr,uint16 value) ;
    int16   (WINAPI *m_CheckSWStatNoTO)(SET9052 *p_instr, int16 timeout_flag) ;
    int16   (WINAPI *m_ShutdownEngine )(SET9052 *p_instr ) ;
    int16   (WINAPI *m_InitEngine     )(SET9052 *p_instr ) ;
    int16   (WINAPI *m_ResetEngine    )(SET9052 *p_instr ) ;
    int16   (WINAPI *m_OpenSessionStep)(SET9052 *p_instr ) ;
    int16   (WINAPI *m_CloseSession   )(SET9052 *p_instr ) ;
    int16   (WINAPI *m_IdQuery   )(SET9052 *p_instr, int16 *query_flag ) ;
#endif
} SET9052LIB ;


/* -------------------------------------------------------------------- */
/*  9052 Spectrum analyzer parameter stucture.  This structure holds
    all of the critical values and codes for controlling SA operation.
    Programs that want to talk to the spectrum analyzer must maintain
    at least one copy of this structure in their program.  Most of the
    functions in the library are desinged to accept a pointer to this
    struct, and thru that pointer set or read its current values.
      The functions which actually send data to the card also use a
    pointer to this struct.  However, based upon the current data values
    and codes, may calculate default values for parameters the calling
    program does not wish to override.  Please see the 9052 Programmers
    Reference Manual for details about the SET9052 data structure, and
    its related functions.  Pay close attention to the section concerning
    coupled and decoupled operation and the effect on the calibration
    of the data.                                                        */
/* -------------------------------------------------------------------- */
typedef struct SAStruct
{
    int16    op_mode;       /* 0 Current mode: Sweep, Zspan, freq hop,etc */
    int16    engine_model;  /* 2 Enumerated engine model type:  SA9052,   */
                            /*   SA9016, SA9085, or SA9034.             */
    int16    swp_in_prog;   /* 4 Flag indicating if data is currently     */
                            /* being gathered(TRUE),or if sweep is being*/
                            /* paused or held(FALSE).                   */

    /* DD: TODO: 'start' starts with 8 , not 6, due to alignment */
    FREQ8500 start;         /* 8 Start frequency in Hz                    */
    FREQ8500 stop ;         /* 16 -0x11 Stop frequency in Hz                     */
    FREQ8500 step ;         /* 24-0xxx Step size in Hz                          */
    int16    step_mode;     /* 32-0xxx Is stepsize AUTO,by pointcnt,or specified*/
    int16    time_mode;     /* 34-0xxx Swp time in AUTO, by step time or swptime*/
    USECS    dwell_time;    /* 36-0xxx Time to dwell at each freq step in uS    */
    USECS    settle_time;   /* 40-0xxx Override norm filter settle time in uS   */
                            /*   Will normally be 0. Causes decalibrat  */
    double  sweep_time;     /* 48 0xxx Time in uS to complete entire sweep.     */
    int16   swp_time_unit;  /* 56-0xxx Unit of time for sweep_time.  Needed     */
                            /*   because int32 can't hold large enough   */
                            /*   value in uS.  Can switch to mS, or     */
                            /*   seconds.                               */
    USECS   synth_time;     /* 60 Synthesizer settling time. Constant.     */
    int16   cell_mode;      /* 64 Divide frequency span in num_cells groups*/
                            /* and return min and/or max point of each  */
                            /* cell when set to TRUE.  FALSE means      */
                            /* return points for each step of the synth.*/
    int16   auto_cell;      /* 66 AUTO_ON means 9052 can set cell_mode to  */
                            /*   TRUE automatically.  AUTO_OFF means    */
                            /*   value of cell_mode can only be changed */
                            /*   by the calling application.            */
    int32   deflt_pt_cnt;   /* 68 Default number of sweep points.  This is */
                            /*   the number of points the engine will   */
                            /*   return when step_mode is AUTO.         */
    int16   rbw_code;       /* 72 Resolution bandwidth code.               */
    int16   auto_rbw;       /* 74 Auto mode on or off for RBW? (1 or 0)    */
    int16   vbw_code;       /* 76 Video bandwidth code.                    */
    int16   auto_vbw;       /* 78 Auto mode on or off for VBW? (1 or 0)    */
    int16   filter_code;    /* 80 Combined filter codes for RBW & VBW.     */
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
    int16   attenuation;    /* 96 Input attenuation val.  0 - 60 dB.       */
    int16   ref_level;      /* 98 Top of amplitude scale. Adjusts atten.   */
    /* ---------------------------------------------------------------- */

    int16   PreampAvailable;/* 100 the engine has a preamp installed        */
    int16   PreampEnabled;  /* 102 the preamp is enabled (only valid if
                                PreampAvailable == TRUE)                */
    int16   PreampGain;     /* 104 gain of the preamp (in dBm)              */

    int16   EngineRefLevel; /* 106 reference level of ENGINE, can be
                                    different than ref_level so that
                                    calling apps can zoom the amplitude
                                    scale.                              */
                               
    /* ---------------------------------------------------------------- */
    int16   trig_code;           /* 108 Code to determine triggering mode.       */
    int16   trig_norm_flag;      /* 110 Determines if continuous sweep triggers  */
                                 /*   occur one time & then free run, or more*/  
                                 /*   normally- sweep for each trigger hit.  */
                                 /*   1 is TRUE or normal.  0 triggers hit   */
                                 /*   time only.                             */
    USECS   trig_delay;          /* 112 Delay time for all trigger modes, in uS  */
    int16   trig_thresh;         /* 116 Ampltd. threshold for video trig.  Should*/
                                 /*   be zero for all other trigger modes.   */
    FREQ8500 trig_freq;          /* 120 Frequency for thresh for video trig. Should*/
                                 /*   be zero for all other trigger modes.   */
    int16    detect_code;        /* 128 Code for sa detector mode(log,lin,AM,etc)*/
    int16    sweep_code;         /* 130 Bit field for sweep modes.               */
    int32    num_cells;          /* 132 Number of cells to divide the span into  */
                                 /*   when cell_mode == TRUE                 */
    int16    intr_code;          /* 136 Code for point at which engine should    */
                                 /*   interrupt the PC.                      */
    							 /* DD: due to aligment 138 -> 144 */
    FREQ8500 zspan_freq;         /* 144 Frequency at which to set zero span mode */
    int32    num_samples;        /* 152 For Zspan mode: number of samples to be  */
                                 /*   returned to the PC. 0 means continue   */
                                 /*   until a terminate command is sent.     */
    uint16   zsampl_dvdr;        /* 156 12-bit value at which to take readings.  */
                                 /*   The sampling rate is equal to          */
                                 /*   10,000,000 / zsampl_dvdr [samples/sec].*/
    int32    sweepIndex;         /* 160 The index of the current frequency point */
    int32    num_swp_pts;        /* 164 Number of points current sweep params    */
                                 /*   will generate.                         */
    int32    num_step_pts;       /* 168 Number of synthesizer steps to generate  */
                                 /*   the data points. ie 500 steps with     */
                                 /*   min & max will return 1000 data points.*/
    int32    num_hop_pts;        /* 172 Number of points in the freq hop table.  */
    int16    impedance;          /* 176 Input impedance.  Normally 50 ohms.      */

    int32    ie_duration;        /* 180 delay time in milliseconds               */
    int16    extern_ref;         /* 184 REALITY:184 Flag for extern ref.  0 is default and   */
                                 /*   indicates extern ref is off.  1        */
                                 /*   activates the external reference.      */

    /* DD: added next line */
    uint32   z_cell_size;        /* 188: by code analysis, we have that value here !?! */

    uint32   err_status;         /* 192 last error that occured at low level     */
    						/* DD: in decompile, interfaceType is uint32_t ! */
    uint16   interfaceType;      /* 196 the hardware platform this analyzer uses */
    uint32   eng_options  ;      /* 200 coded options flags, internal usage      */
    int16    func_status_code  ; /* 204 status code of last function return      */
    uint16   engine_reply_code ; /* 206 engine reply code of last engine return  */

    int16    openStep          ; /* 208 Current step in the open session         */
                                 /*   sequence.  Steps begins at 0 and       */
                                 /*   increment.                             */
    char     sessionString[256]; /* 210 Session string to be used for opening a  */
                                 /*   the spectrum analyzer session.         */
    uint32   session_handle;     /* 468 defines a specific type of session       */
                                
    /* ISA specific members */
    uint16   data_port;          /* 472 Address port for this engine.  status    */
                                 /*   will be data_port + 2.                 */
    uint16   irq_num;            /* 474 Which interrupt line is this engine on.  */
    
    /* VXI specific members */
    int16   logical_addr;       /* 476 VXI logical address of the instrument if */
                                /*  it is a VXI device                      */
                            
    /* Serial specific members */
    void    *commHandle;        /* 480 this is the pointer to the GreenLeaf
                                    PORT structure used for the serial port.
                                    Changed type to void * from 
                                    struct _tag_port*                       */
    int32   serialErrs[6][2]; /* 484 */
    int16   commNumber;         /* 484+48=532 Value that specifies a particular COMx
                                    for the GreenLeaf port open functions   */
    int16   comm_addr;          /* 534 address for the current uart             */
    int16   comm_irq;           /* 536 irq for the current uart                 */
    int16   commRateCode;       /* 538 the index in the rate array of the bps
                                    of the comm link                        */
                                /* the first index should be 1 less than
                                    the rates array's length(hokey)         */
    int16   commDialMeth;       /* 540 tone(0) or pulse(1)                      */
    int16   commSpeakMode;      /* 542 speaker on(1) or off(0)                  */
    char    commPhoneNum[50] ;  /* 544 phone number to dial                    */
    char    commInitString[50]; /* 594 initialization string for modems     */
    int16   modemConnectTimeout ; /* 644 time after which modem connection is */
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

    SET9052LIB funcLink ; /* 656 */
} SET9052;

#ifdef __cplusplus
}                 
#endif

#endif
  

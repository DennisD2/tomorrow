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

typedef struct SAStruct SET9052 ;

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
    FREQ8500 start;         /* 6 Start frequency in Hz                    */
    FREQ8500 stop ;         /* 14-0xd Stop frequency in Hz                     */
    FREQ8500 step ;         /* 22-0x16 Step size in Hz                          */
    int16    step_mode;     /* 30-0x1e Is stepsize AUTO,by pointcnt,or specified*/
    int16    time_mode;     /* 32-0x20 Swp time in AUTO, by step time or swptime*/
    USECS    dwell_time;    /* 34-0x22 Time to dwell at each freq step in uS    */
    USECS    settle_time;   /* 38-0x26 Override norm filter settle time in uS   */
                            /*   Will normally be 0. Causes decalibrat  */
    double  sweep_time;     /* 42-0x2a Time in uS to complete entire sweep.     */
    int16   swp_time_unit;  /* 50-0x32 Unit of time for sweep_time.  Needed     */
                            /*   because int32 can't hold large enough   */
                            /*   value in uS.  Can switch to mS, or     */
                            /*   seconds.                               */
    USECS   synth_time;     /* 52 Synthesizer settling time. Constant.     */
    int16   cell_mode;      /* 56 Divide frequency span in num_cells groups*/
                            /* and return min and/or max point of each  */
                            /* cell when set to TRUE.  FALSE means      */
                            /* return points for each step of the synth.*/
    int16   auto_cell;      /* 58 AUTO_ON means 9052 can set cell_mode to  */
                            /*   TRUE automatically.  AUTO_OFF means    */
                            /*   value of cell_mode can only be changed */
                            /*   by the calling application.            */
    int32   deflt_pt_cnt;   /* 60 Default number of sweep points.  This is */
                            /*   the number of points the engine will   */
                            /*   return when step_mode is AUTO.         */
    int16   rbw_code;       /* 64 Resolution bandwidth code.               */
    int16   auto_rbw;       /* 66 Auto mode on or off for RBW? (1 or 0)    */
    int16   vbw_code;       /* 68 Video bandwidth code.                    */
    int16   auto_vbw;       /* 70 Auto mode on or off for VBW? (1 or 0)    */
    int16   filter_code;    /* 72 Combined filter codes for RBW & VBW.     */
                            /* Upper byte is VBW. Lower byte is RBW.    */
    double  filter_ratio;   /* 74 Ratio of VBW to RBW. Defaults to 0.10    */
    /* ---------------------------------------------------------------- */
    /*  Since the calling application can switch between linear and log
        detectors at will, multiple structure members are provided to
        store the various values.  attenuation and ref_level are the
        true current settings.  They are set based upon the current
        detector mode.  API functions handle conversions needed by the
        calling aps based upon the detector in use.                     */
    /* ---------------------------------------------------------------- */
    int16   attenuation;    /* 82 Input attenuation val.  0 - 60 dB.       */
    int16   ref_level;      /* 84 Top of amplitude scale. Adjusts atten.   */
    /* ---------------------------------------------------------------- */

    int16   PreampAvailable;/* 86 the engine has a preamp installed        */
    int16   PreampEnabled;  /* 88 the preamp is enabled (only valid if 
                                PreampAvailable == TRUE)                */
    int16   PreampGain;     /* 90 gain of the preamp (in dBm)              */

    int16   EngineRefLevel; /* 92 reference level of ENGINE, can be 
                                    different than ref_level so that
                                    calling apps can zoom the amplitude
                                    scale.                              */
                               
    /* ---------------------------------------------------------------- */
    int16   trig_code;           /* 94 Code to determine triggering mode.       */
    int16   trig_norm_flag;      /* 96 Determines if continuous sweep triggers  */
                                 /*   occur one time & then free run, or more*/  
                                 /*   normally- sweep for each trigger hit.  */
                                 /*   1 is TRUE or normal.  0 triggers hit   */
                                 /*   time only.                             */
    USECS   trig_delay;          /* 98 Delay time for all trigger modes, in uS  */
    int16   trig_thresh;         /* 102 Ampltd. threshold for video trig.  Should*/
                                 /*   be zero for all other trigger modes.   */
    FREQ8500 trig_freq;          /* 104 Frequncy for thresh for video trig. Should*/
                                 /*   be zero for all other trigger modes.   */
    int16    detect_code;        /* 106 Code for sa detector mode(log,lin,AM,etc)*/
    int16    sweep_code;         /* 108 Bit field for sweep modes.               */
    int32    num_cells;          /* 110 Number of cells to divide the span into  */
                                 /*   when cell_mode == TRUE                 */
    int16    intr_code;          /* 114 Code for point at which engine should    */
                                 /*   interrupt the PC.                      */
    FREQ8500 zspan_freq;         /* 116 Frequency at which to set zero span mode */
    int32    num_samples;        /* 124 For Zspan mode: number of samples to be  */
                                 /*   returned to the PC. 0 means continue   */
                                 /*   until a terminate command is sent.     */
    uint16   zsampl_dvdr;        /* 128 12-bit value at which to take readings.  */
                                 /*   The sampling rate is equal to          */
                                 /*   10,000,000 / zsampl_dvdr [samples/sec].*/
    int32    sweepIndex;         /* 130 The index of the current frequency point */
    int32    num_swp_pts;        /* 134 Number of points current sweep params    */
                                 /*   will generate.                         */
    int32    num_step_pts;       /* 138 Number of synthesizer steps to generate  */
                                 /*   the data points. ie 500 steps with     */
                                 /*   min & max will return 1000 data points.*/
    int32    num_hop_pts;        /* 142 Number of points in the freq hop table.  */
    int16    impedance;          /* 146 Input impedance.  Normally 50 ohms.      */
    int32    ie_duration;        /* 148 delay time in milliseconds               */
    int16    extern_ref;         /* 152 Flag for extern ref.  0 is default and   */
                                 /*   indicates extern ref is off.  1        */
                                 /*   activates the external reference.      */
    uint32   err_status;         /* 154 last error that occured at low level     */
    uint16   interfaceType;      /* 158 the hardware platform this analyzer uses */
    uint32   eng_options  ;      /* 160 coded options flags, internal usage      */
    int16    func_status_code  ; /* 164 status code of last function return      */
    uint16   engine_reply_code ; /* 166 engine reply code of last engine return  */

    int16    openStep          ; /* 168 Current step in the open session         */
                                 /*   sequence.  Steps begins at 0 and       */
                                 /*   increment.                             */
    char     sessionString[256]; /* (170) Session string to be used for opening a  */
                                 /*   the spectrum analyzer session.         */
    uint32   session_handle;     /* 172 defines a specific type of session       */
                                
    /* ISA specific members */
    uint16   data_port;          /* 176 Address port for this engine.  status    */
                                 /*   will be data_port + 2.                 */
    uint16   irq_num;            /* 178 Which interrupt line is this engine on.  */
    
    /* VXI specific members */
    int16   logical_addr;       /* 180 VXI logical address of the instrument if */
                                /*  it is a VXI device                      */
                            
    /* Serial specific members */
    void    *commHandle;        /* 182 this is the pointer to the GreenLeaf
                                    PORT structure used for the serial port.
                                    Changed type to void * from 
                                    struct _tag_port*                       */
    int32   serialErrs[6][2]; /* 186 */
    int16   commNumber;         /* 198 Value that specifies a particular COMx 
                                    for the GreenLeaf port open functions   */
    int16   comm_addr;          /* 200 address for the current uart             */
    int16   comm_irq;           /* 202 irq for the current uart                 */
    int16   commRateCode;       /* 204 the index in the rate array of the bps 
                                    of the comm link                        */
                                /* the first index should be 1 less than 
                                    the rates array's length(hokey)         */
    int16   commDialMeth;       /* 206 tone(0) or pulse(1)                      */
    int16   commSpeakMode;      /* 208 speaker on(1) or off(0)                  */
    char    commPhoneNum[50] ;  /* 210 phone number to dial                    */
    char    commInitString[50]; /* 260 initialization string for modems     */           
    int16   modemConnectTimeout ; /* 310 time after which modem connection is */
                                  /* considered to have failed          */
    /* HP SICL members */
    char    *baseAddr;      /* 312 the base address for the register map    */
    
    int      vxiID; /* 316 */

    /*  HANDLE is defined for the NT device driver development in the
        files <windows.h> <winioctl.h>.  The device handle is set in the
        ntisafce.c source file in InitEngine().  The handle is needed 
        to access the low level driver which must be installed in the 
        system and entered into the registry.                           */
#if defined(MR90XX_OS_WIN32) && !defined (MR90XX_COMPILER_LW40)
    HANDLE nt_port_handle; 
#endif

    SET9052LIB funcLink ; /* 320 */
} SET9052;

#ifdef __cplusplus
}                 
#endif

#endif
  

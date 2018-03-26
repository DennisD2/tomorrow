/* -------------------------------------------------------------------- */
/*             Morrow Technologies Corporation (c)1993,1994             */
/*                    All rights reserved worldwide.                    */
/* -------------------------------------------------------------------- */
/* FILE    : mr_defin.h                                                 */
/* VERSION : 1.00                                                       */
/* DATE    : 08/5/96                                                    */
/* PURPOSE : Global definitions for the spectrum analyzer project.      */
/*           Adapted for VISA use from MTC C Library file SA_DEFIN.H    */
/* AUTHOR  : J. Overton                                                 */
/* -------------------------------------------------------------------- */
/* Tabs = 4 for correct spacing                                         */

#ifndef ___MR_DEFIN_H___
#define ___MR_DEFIN_H___
                        
/* SAPFORM.H must be included before any non-system headers */  
#ifndef ___SAPFORM_H___
    #include "sapform.h"
#endif

/* VPPTYPE.H must be included by every header (VPP-3.4, Rule 3.26) */
#ifndef __VPPTYPE_HEADER__
    #include "vpptype.h"
#endif

#if defined(__cplusplus) || defined(__cplusplus__)
extern "C" {
#endif

/* -------------------------------------------------------------------- */
/*  Defined constants for 9052 library and calling applications.
    "IE" for Instrument Engines is prepended to many constants which are
    commonly defined by other libraries (as in IE_TRUE) to help
    prevent conflicts.                                                  */
/* -------------------------------------------------------------------- */

#if defined(MR90XX_OS_WIN32)
    #if defined(MR90XX_LINK_STATIC)
        #define MR90XX_DLLEXPORT
    #else
        #if defined(MR90XX_COMPILER_MSC)
            #define MR90XX_DLLEXPORT __declspec(dllexport)
        #elif defined(MR90XX_COMPILER_BC4) || defined(MR90XX_COMPILER_BC) || defined(MR90XX_COMPILER_BC40)
            #define MR90XX_DLLEXPORT
        #else
            #error "Specifier for function export in 32-bit dlls not supported yet for this compiler type."
        #endif
    #endif
#else
    #define MR90XX_DLLEXPORT
#endif

/* -------------------------------------------------------------------- */
/* Macro that when OR's with an 8-bit status code will yield an status
   value that resides within the VISA error range */
/* -------------------------------------------------------------------- */
#define MR90XX_STATUS_MASK   0x3FFC0800L
#define MR90XX_ERR_MASK     ((ViStatus)MR90XX_STATUS_MASK+_VI_ERROR)
#define MR90XX_WARN_MASK    ((ViStatus)MR90XX_STATUS_MASK)
/* -------------------------------------------------------------------- */
/* Create error codes in the VISA range.  The VXI PNP 
   specification (VPP-3.4 section 3.8.4.3) grants us the range of
   0xBFFC0800 to 0xBFFC0FFF for error codes specific to out instrument. */
/* -------------------------------------------------------------------- */
/* Warning and success codes */
#define MR90XX_IE_SUCCESS          VI_SUCCESS 
#define MR90XX_IE_WARN_VALS       (MR90XX_WARN_MASK+0x01) /* Value is out of range but still acceptable.     */
#define MR90XX_IE_WARN_OBSOL      (MR90XX_WARN_MASK+0x02) /* The function is now obsolete. */
#define MR90XX_IE_WARN_SPAN		  (MR90XX_WARN_MASK+0x03) /* Start and stop vals exchanged, but function is successful */
#define MR90XX_IE_ENG_BUSY        (MR90XX_WARN_MASK+0x10) /* Engine is busy processing command        */
#define MR90XX_IE_ENG_ACK         (MR90XX_WARN_MASK+0x11) /* Acknowledgement of command byte          */
#define MR90XX_IE_ENG_NOMAIN      (MR90XX_WARN_MASK+0x12) /* No main code programmed into flash       */
#define MR90XX_IE_ENG_NODSP       (MR90XX_WARN_MASK+0x13) /* No DSP code programmed into flash        */
#define MR90XX_IE_ENG_NOCAL       (MR90XX_WARN_MASK+0x14) /* No Calibration tables programmed into flash*/
#define MR90XX_IE_ENG_ERASE       (MR90XX_WARN_MASK+0x15) /* Error while trying to erase FLASH        */
#define MR90XX_IE_ENG_FLASH       (MR90XX_WARN_MASK+0x16) /* Error while trying to program FLASH      */
#define MR90XX_IE_ENG_NYBYTES     (MR90XX_WARN_MASK+0x17) /* Invld # bytes recv'd in program data buf */
#define MR90XX_IE_ENG_CKSUM       (MR90XX_WARN_MASK+0x18) /* Invld checksum recv'd with prog data buf */
#define MR90XX_IE_ENG_COLON       (MR90XX_WARN_MASK+0x19) /* First char in data buffer not a colon    */
#define MR90XX_IE_ENG_BAD_CMD     (MR90XX_WARN_MASK+0x1A) /* Engine does not recognize command #      */
#define MR90XX_IE_ENG_ERROR_GEN   (MR90XX_WARN_MASK+0x1B) /* General error.  No hex table on Cmd 4    */
#define MR90XX_IE_ENG_BAD_PARM1   (MR90XX_WARN_MASK+0x1C) /* Engine does recognize 1st param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM2   (MR90XX_WARN_MASK+0x1D) /* Engine does recognize 2nd param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM3   (MR90XX_WARN_MASK+0x1E) /* Engine does recognize 3rd param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM4   (MR90XX_WARN_MASK+0x1F) /* Engine does recognize 4th param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM5   (MR90XX_WARN_MASK+0x20) /* Engine does recognize 5th param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM6   (MR90XX_WARN_MASK+0x21) /* Engine does recognize 6th param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM7   (MR90XX_WARN_MASK+0x22) /* Engine does recognize 7th param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM8   (MR90XX_WARN_MASK+0x23) /* Engine does recognize 8th param of cmd   */
#define MR90XX_IE_ENG_BAD_PARM9   (MR90XX_WARN_MASK+0x24) /* Engine does recognize 9th param of cmd   */
#define MR90XX_IE_ENG_INMAIN      (MR90XX_WARN_MASK+0x25) /* Executing from main code block after reset */
#define MR90XX_IE_ENG_INBOOT      (MR90XX_WARN_MASK+0x26) /* Executing from boot code block after reset */
#define MR90XX_IE_ENG_INWEEDS     (MR90XX_WARN_MASK+0x27) /* Execution of boot block began, but did not */
                                                          /* successfully transfer control anywhere     */
                                                          /* This implies that engine is in the weeds   */
                                                          /* Reading a 0x53 in the status after reset is*/
                                                          /* EXTREMELY bad!                             */
#define MR90XX_IE_ENG_ERR_DTEC    (MR90XX_WARN_MASK+0x28) /* CommTrigDetect called inside sweep cmds.   */
#define MR90XX_IE_ENG_ERR_TRIG    (MR90XX_WARN_MASK+0x29) /*  These code provide way of informing app   */
/* Error codes */
#define MR90XX_IE_FAILURE         (MR90XX_ERR_MASK +0x01)
#define MR90XX_IE_ERROR           (MR90XX_ERR_MASK +0x02)
#define MR90XX_IE_ERR_VALS        (MR90XX_ERR_MASK +0x03) /* Argument out of range, or null pointer arg.      */
#define MR90XX_IE_ERR_AUTO        (MR90XX_ERR_MASK +0x04) /* Value can't be manually set because of auto mode */
#define MR90XX_IE_ERR_SPAN        (MR90XX_ERR_MASK +0x05) /* Start and stop vals exchanged. Yields neg. span  */
                                                          /* stop freq must exceed start freq.                */
#define MR90XX_IE_ERR_STEP        (MR90XX_ERR_MASK +0x06) /* Specified span is too narrow for number of points*/
                                                          /*  This cause step size to be < 1 .                */
#define MR90XX_IE_ERR_DWELL       (MR90XX_ERR_MASK +0x07) /* Tried to set to non-auto mode when dwell is defin*/
#define MR90XX_IE_ERR_DIFDTEC     (MR90XX_ERR_MASK +0x08) /* Error code indicating a different detector is    */
                                                          /*  needed for the attempted operation. for example*/
                                                          /*  the instrument was in log mode when the user    */
                                                          /*  attempted an op needing linear mode or visa */
                                                          /*  versa.                                          */
#define MR90XX_IE_ERR_NULLPTR     (MR90XX_ERR_MASK +0x09) /* The pointer argument being passed was NULL */
#define MR90XX_IE_ERR_ENGMOD      (MR90XX_ERR_MASK +0x0A) /* Engine model is unknown or bad */
#define MR90XX_IE_UNKNOWN         (MR90XX_ERR_MASK +0X0B) /* Undefined status code */
#define MR90XX_ERROR_SESSIONINUSE (MR90XX_ERR_MASK +0x0C) /* Attempted to open a session that is already been opened.     */
#define MR90XX_ERROR_NOSESSION    (MR90XX_ERR_MASK +0x0D) /* The mr90xx_init() function failed to open the session with   */
                                                          /* the given inialization string.                               */
#define MR90XX_ERROR_BADHANDLE    (MR90XX_ERR_MASK +0x0E) /* The the handle that was being passed was not recognized as   */
                                                          /*    belonging to any known session.                           */
#define MR90XX_ERROR_NULLHANDLE   (MR90XX_ERR_MASK +0x0F) /* The handle argument being passed was 0.                      */
#define MR90XX_IE_ERR_BADIFACE    (MR90XX_ERR_MASK +0x1F)                                                
#define MR90XX_IE_ERR_NODRIVER    (MR90XX_ERR_MASK +0x2F) /* Could not load DLL associated with specified     */
                                                          /*   interface, or DLL is not loaded. */
#define MR90XX_IE_TRUE      1
#define MR90XX_IE_FALSE     0
#define MR90XX_IE_ON        1
#define MR90XX_IE_OFF       0
#define MR90XX_IE_SPACE     ' '
#define MR90XX_IE_CONTINUE  0
#define MR90XX_IE_EXITPROG  -1

#define MR90XX_LOWER_PK     0
#define MR90XX_HIGHER_PK    1
#define MR90XX_HIGHEST_PK   2

/*  ----------------------------------------------------------------------  */
#define MR90XX_MIN_STEP     1
#define MR90XX_MAX_STEP     MAX_FREQ
#define MR90XX_MIN_PTS      1
#define MR90XX_MAX_PTS      1000000000L
#define MR90XX_MIN_SAMP     0           /* 0 means sample continuously          */
#define MR90XX_MAX_SAMP     100000000L  /* Max number of samples in zero-span   */
#define MR90XX_MIN_TIME     0           
#define MR90XX_MAX_TIME     0x77359400L /* 2^32 or 4,294,967,296 micro-seconds. */
#define MR90XX_MIN_NUM_CELLS    1
#define MR90XX_MAX_NUM_CELLS    65535L
#define MR90XX_MIN_LIN_VAL  0
#define MR90XX_MAX_LIN_VAL  2236067977L /* max linear value is 2.236067977 volts*/
#define MR90XX_MIN_THRSH    -120
#define MR90XX_MAX_THRSH    20          /* Max threshold setting in dB.         */
#define MR90XX_MIN_RATEVAL  10          /* Minimum value for sample_rate. This  */
                                        /* yields the fastest sample freq of    */
                                        /* 1 MHz. See Prog. Reference Manual    */
#define MR90XX_MAX_RATEVAL 0x7FFF       /* Maximum value for sample_rate. This  */
                                        /* yields the slowest sample freq of    */
                                        /* 305 Hz.                              */
#define MR90XX_MIN_HOPS 0               /* Minimum number of pts in a hop table */
#define MR90XX_MAX_HOPS 1024            /* Maximum number of pts in a hop table */

#define MR90XX_DB_CONVERT_CONST 128     /* Raw A/D values returned from engine  */
                                        /* must be divided by 128 and then added*/
                                        /* to the attenuation setting to arrive */
                                        /* at the amplitude in dBm.             */
/* ------------------------------------------------------------------------ */
/*  The default settling times for the RBW filters are stored in the engine.
    Thus to use the default times, a zero is passed to the engine, and it
    knows to use its stored default times. Settle times to override are passed
    to the engine as negative values, but are stored as positive vals in
    the settle_time member of SET9052.  This settle_time val is normally
    zero.  Whenever dwell_time is > 0 then settle_time must = 0 even if the
    calling application explicitly set it to some value > 0.                */
/* ------------------------------------------------------------------------ */
#define MR90XX_DEFLT_SET_TIME 0

/* ------------------------------------------------------------------------ */
/*  Possible settings for various mode flags in the SET9052 struct.
    AUTO_ON and AUTO_OFF are used by several flags.  STEPCNT and STEPSIZ
    are only for step_mode member.  TIMESWP and TIMESET are only for the
    time_mode flag.                                                         */
/* ------------------------------------------------------------------------ */
#define MR90XX_AUTO_OFF 0           /* Automatic calculation of val deactivated.    */
#define MR90XX_AUTO_ON      1       /* Automatic calculation of val activated.      */

#define MR90XX_STEPCNT      2       /* Use number of pts to calculate step size     */
#define MR90XX_STEPSIZ      3       /* Use step size to calculate number of points  */

#define MR90XX_TIMESWP      2       /* Use sweep time to calculate settle time.     */
#define MR90XX_TIMESET      3       /* Use settle times to calculate sweep time.    */


#define MR90XX_uSECNDS      0       /* Default unit of time. microseconds.  All time*/
                                    /*   except sweep time are always measured in   */
                                    /*   uSECS.                                     */
#define MR90XX_mSECNDS      1       /* milliseconds.  Next most likely unit of time */
                                    /*   for measuring sweep time.  Only needed for */
                                    /*   extremely long sweep time that can result  */
                                    /*   with small RBW's and wide spans.           */
#define MR90XX_SECNDS       2       /* seconds.  Largest time unit.  Only needed    */
                                    /*   for very extreme wide span scans with very */
                                    /*   narrow RBWs and VBWs.                      */

/* ------------------------------------------------------------------------ */
/*  Defines for possible settings for the RBW                               */
/* ------------------------------------------------------------------------ */
#define MR90XX_RBW_300HZ    0       /*  Defines for possible settings for the RBW   */
#define MR90XX_RBW_3KHZ     1
#define MR90XX_RBW_30KHZ    2
#define MR90XX_RBW_300KHZ   3
#define MR90XX_RBW_3MHZ     4
#define MR90XX_RBW_AUTO     5
/* ------------------------------------------------------------------------ */
/*  Defines for possible settings for the VBW                               */
/* ------------------------------------------------------------------------ */
#define MR90XX_VBW_NONE     0
#define MR90XX_VBW_3HZ      1       /*  Defines for possible settings for the VBW   */
#define MR90XX_VBW_30HZ     2
#define MR90XX_VBW_300HZ    3
#define MR90XX_VBW_3KHZ     4
#define MR90XX_VBW_30KHZ    5
#define MR90XX_VBW_300KHZ   6
#define MR90XX_VBW_3MHZ     7
#define MR90XX_VBW_AUTO     8
/* ------------------------------------------------------------------------ */
/*  Defines for trigger method settings                                     */
/* ------------------------------------------------------------------------ */
#define MR90XX_TRIG_FREE        0   /* Free sweep mode.  Sweep continously.         */
#define MR90XX_TRIG_EXT_HI_GO   1   /* External. Start sweep when trigger goes high */
#define MR90XX_TRIG_EXT_LO_GO   2   /* External. Start sweep when trigger goes low  */
#define MR90XX_TRIG_EXT_HI_LVL  3   /* External. Start sweep when trigger is high   */
#define MR90XX_TRIG_EXT_LO_LVL  4   /* External. Start sweep when trigger is low    */
#define MR90XX_TRIG_MANUAL      5   /* Start sweep when resume sweep command receivd*/
#define MR90XX_TRIG_VIDEO       6   /* Start when (amp > thresh) at a specific freq */

#define MR90XX_TRIG_CONTIN      0x8000  /* bit 15 of code sent to engine is a flag  */
                                        /*  indicating if trigger should start each */
                                        /*  sweep or start free run.  see notes &   */
                                        /*  flags below for CONT_TRIG_ONCE etc.     */

/* ------------------------------------------------------------------------ */
/*  Triggers in continuous mode can operate in 2 ways.  The normal
    method is to start a sweep each time the trigger hits.  Optionally
    the trigger can start continous sweeps and the analyzer then
    free runs and ignores further triggers.  The flags below are used for
    the SetTriggerMode() function call, but is ignored in single sweep mode.*/
/* ------------------------------------------------------------------------ */
#define MR90XX_CONT_TRIG_ONCE   0   /* start on first trigger hit then free run.    */
#define MR90XX_CONT_TRIG_NORM   1   /* start sweep each time trigger hits.          */

/* ------------------------------------------------------------------------ */
/*  Defines for sweep parameter bit field.                                  */
/* ------------------------------------------------------------------------ */
#define MR90XX_SWP_SINGLE   0x0000  /* Single sweep mode.                           */
#define MR90XX_SWP_CONT     0x0001  /* If set then continuous sweep. else single swp*/
#define MR90XX_SWP_MIN      0x0002  /* If set then pass back min point for each step*/
#define MR90XX_SWP_MAX      0x0004  /* If set then pass back max point for each step*/
#define MR90XX_SWP_FRQPTS   0x0008  /* If set then return frequency data with each  */
                                    /*      min or max point.  Ignored if neither   */
                                    /*      min or max bit is set.                  */


/* ------------------------------------------------------------------------ */
/*  Detector control bit field defines. The detector control code determines
    which of several possible signals is switched into the A/D input.
    The bit field has many mutually exlcusive fields.  With the exception
    of the ENABLE bit( bit 2 ), the POLARITY bit (bit5), and the ATTENUATOR
    bit( bit 6 ), no 2 bits can be set at the same time.  ie the linear and
    log detector bits cannot be set at the same time.  However it is possible
    to have the linear detector, the enable, and the attenuation bits all
    set at the same time.
    Notice most of these bits switch a specific detector signal into the
    data path.  However, in order to enable or activate the switched in
    detector, the DTECR_ENABL bit ( bit 2 ) must be set!                    */
/* ------------------------------------------------------------------------ */
#define MR90XX_DTEC_POLAR   0x0001  /* If unset unipolor. If set bipolor inputs     */
#define MR90XX_DTEC_LOG     0x0002  /* Switch Log detector into A/D.                */
#define MR90XX_DTEC_ENABL   0x0004  /* Enable the switched in detector.             */
#define MR90XX_DTEC_3IF     0x0008  /* Switch on the 3rd IF                         */
#define MR90XX_DTEC_PRIVT   0x0010  /* Internal flag.  Always set to 0.             */
#define MR90XX_DTEC_LIN     0x0020  /* Switch Linear detector into A/D.             */
#define MR90XX_DTEC_ATTOFF  0x0040  /* If unset, 30dB of attenuation to lin detect. */
#define MR90XX_DTEC_OPT1    0x0080  /* Optional detector                            */
#define MR90XX_DTEC_OPT2    0x0100  /* Optional detector                            */
#define MR90XX_DTEC_OPT3    0x0200  /* Optional detector                            */
#define MR90XX_DTEC_OPT4    0x0400  /* Optional detector                            */
#define MR90XX_DTEC_OPT5    0x0800  /* Optional detector                            */

/* ------------------------------------------------------------------------ */
/*  Defines for argument codes to Interrupt Sweep command to the engine.    */
/* ------------------------------------------------------------------------ */
#define MR90XX_STOP_NOW         0   /* Terminate sweep immediately.                 */
#define MR90XX_STOP_AFTER       1   /* Terminate sweep when current sweep completes */
#define MR90XX_PAUSE_SWP        2   /* Pause the current sweep.                     */
#define MR90XX_RESUME_SWP       3   /* Resume the current sweep.                    */

/* ------------------------------------------------------------------------ */
/*  Defines for parameter codes to Set Interrupt Mode command to the eng.   */
/* ------------------------------------------------------------------------ */
#define MR90XX_INTRUPT_NONE     0   /*  No interrupt                                */
#define MR90XX_INTRUPT_NWORD    1   /*  Interrupt every n words (n in uppr byte)    */
#define MR90XX_INTRUPT_1QRTR    2   /*  Interrupt when FIFO is 1/4 full             */
#define MR90XX_INTRUPT_HALF     3   /*  Interrupt when FIFO is 1/2 full             */
#define MR90XX_INTRUPT_3QRTR    4   /*  Interrupt when FIFO is 3/4 full             */
#define MR90XX_INTRUPT_FULL     5   /*  Interrupt when FIFO is full                 */
#define MR90XX_INTRUPT_ENDSWP   0x8000  /* Can be used in combination with the other*/
                                        /*    interrupt flags.  Indicates that the 9052 */
                                        /*  should interrupt at the end of the current  */
                                        /*  sweep as well as any other interrupt        */
                                        /*  that is hitting.  This allows the calling   */
                                        /*  program to clear amounts of data which fail */
                                        /*  to fire the designated interrupt.           */
/* ------------------------------------------------------------------------ */
/*  Defines for parameter codes to Set Interrupt Mode command to the eng.   */
/*  Offset into arrary interrupt structures that stores the IRQ#, the
    bit mask for the Interrupt Mask Register.                               */
/* ------------------------------------------------------------------------ */
#define MR90XX_IRQ_5    5           /*  Interrupt line 5.   Mask is 0x0D            */
#define MR90XX_IRQ_10   10          /*  Interrupt line 10.  Mask is 0x0?            */
#define MR90XX_IRQ_11   11          /*  Interrupt line 11.  Mask is 0x0?            */
#define MR90XX_IRQ_12   12          /*  Interrupt line 12.  Mask is 0x0?            */


#if defined(__cplusplus) || defined(__cplusplus__)
}
#endif

#endif



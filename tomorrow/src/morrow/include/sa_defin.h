/* -------------------------------------------------------------------- */
/*             Morrow Technologies Corporation (c)1993,1994             */
/*                    All rights reserved worldwide.                    */
/* -------------------------------------------------------------------- */
/* FILE    : sa_defin.h                                                 */
/* VERSION : 1.41                                                       */
/* DATE    : 07/27/93                                                   */
/* PURPOSE : Global definitions for the spectrum analyzer project.      */
/* AUTHOR  : Thomas Fredrick                                            */
/* -------------------------------------------------------------------- */
/* LAST MOD:    07/15/94
                04/17/96 - TGS - Added ERROR constants starting with
                                NO_ERR to file.  These new constants
                                are meant to replace the GLOBwhatever
                                constants which are now commented out.
                01/09/97 - TWF - Changing error codes carried in the
                                SET9052 stuct to be prefixed so that 
                                they will not conflict with any other
                                header files from the various compilers
                                we build with.                          */

/* -------------------------------------------------------------------- */
/* Tabs = 4 for correct spacing                                         */

#ifndef ___SA_DEFIN_H___
#define ___SA_DEFIN_H___

#ifndef ___SAPFORM_H___
    #error SAPFORM.H needs to be included before SA_DEFIN.H
#endif

#ifndef ___SATYPES_H___
    #include "satypes.h"
#endif    

/* -------------------------------------------------------------------- */
/*  Platform enum created to specify the platform on which the 
    application is currently running.  Designed to aid in system 
    identification and eliminate mismatched libraries and executables.  */
/* -------------------------------------------------------------------- */
typedef enum {  UNKNOWNp=0,
                ISAp,
                VISAp,
                SERIALp,
                NIVXIp,
                SICLp,
                MODEMp,
                SIMp,
                POLYp,
                TCPIPp,
                ISANTp
            } InterfaceEnum ;

#define MR90XX_MANF_ID      0x0ECE    /*  Instrument manufacturer ID */

/* -------------------------------------------------------------------- */
/*  Defined constants for 9052 library and calling applications.
    "IE" for Instrument Engines is prepended to many constants which are
    commonly defined by other libraries (as in IE_TRUE) to help
    prevent conflicts.                                                  */
/* -------------------------------------------------------------------- */
#define IE_TRUE     1
#define IE_FALSE    0
#define IE_ON       1
#define IE_OFF      0
#define IE_SPACE    ' '
#define IE_CONTINUE 0
#define IE_EXITPROG -1

/* Software status codes, 0 is success, warnings are positive, errors and failures
   are negative. */
#define IE_SUCCESS        0    /* Operational success                              */
#define IE_WARN_VALS      1    /* value out of range BUT ACCEPTED!                 */
#define IE_WARN_OBSOL     2    /* Function is now obsolete                         */
#define IE_WARN_SPAN      3    /* Start and stop vals exchanged. Yields neg. span  */
                               /*  stop freq must exceed start freq.  Function call*/
                               /*  succeeded.                                      */
#define IE_WARN_SWPDONE   4    /* Cannot gather any more data from engine.  Sweep  */
                               /*   index has reached its upper limit.  Need to    */
                               /*   reset it to zero to continue gathering data.   */                               
#define IE_WARN_NOTDONE   5    /* Operation was successful, but further steps are  */
                               /*   required.  This warning applies to the         */
                               /*   OpenSessionStep() function.                    */
#define IE_FAILURE       -1    /* General engine or calculation error              */
#define IE_ERROR         -2    /* General user mistake.                            */
#define IE_ERR_VALS      -3    /* Argument out of range, or null (not 'instr')     */
                               /*   pointer arg.                                   */
#define IE_ERR_AUTO      -4    /* Value can't be manually set because of auto mode */
#define IE_ERR_SPAN      -5    /* Start and stop vals exchanged. Yields neg. span  */
                               /*  stop freq must exceed start freq.  Function call*/
                               /*  failed.                                         */
#define IE_ERR_STEP      -6    /* Specified span is too narrow for number of points*/
                               /*   This cause step size to be < 1 .               */
#define IE_ERR_DWELL     -7    /* Tried to set to non-auto mode when dwell is defin*/
#define IE_ERR_DIFDTEC   -8    /* Error code indicating a different detector is    */
                               /*   needed for the attempted operation. for example*/
                               /*   the instrument was in log mode when the user   */
                               /*   attempted an op needing linear mode or visa    */ 
                               /*   versa.                                         */
#define IE_NO_CARRIER    -9    /* Carrier has been lost.  Applies to serial and    */
                               /*  modem platforms                                 */
#define IE_ERR_NULLPTR  -10    /* SET9052 pointer arguement is NULL                */ 
#define IE_ERR_LINK     -11    /* Some failure occured when trying to input from   */
                               /*   output to the communications link.             */
#define IE_ERR_TIMEOUT  -12    /* A timeout occured                                */                               
#define IE_ERR_ENGMOD   -13    /* Invalid engine model                             */
#define IE_ERR_NOSWP    -14    /* Cannot gather data from engine, no sweep is in   */
                               /*   progress.                                      */
#define IE_ERR_REFLEV   -15    /* Reference Level cannot be set correctly for given*/
                               /*   sweep parameters.                              */
#define IE_ERR_SWP_INIT -16    /* Unable to prep the C Driver for a new sweep.     */
#define IE_ERR_BADIFACE -17    /* Unknown or illegal value for interface type      */
#define IE_ERR_NOLINK   -18    /* No interface link exists.  This error occurs     */
                               /*   when a function is call that requires a        */
                               /*   physical link to the engine, but no such link  */
                               /*   exists (ie. no such link has been created).    */
#define IE_ERR_LINKOPEN -19    /* Interface link is already open, cannot open it   */
                               /*   again until the link is first closed.          */                               
#define IE_ERR_BADOS    -20    /* Interface is not supported under the current     */
                               /*   Operating System.                              */
#define IE_ERR_NODRIVER -21    /* Could not load DLL associated with specified     */
                               /*   interface, or DLL is not loaded.               */
                               
/* Engine reply codes remapped to software error domain, REPLY code + 0x40 */
#define IE_ENG_BUSY      0x40  /* Engine is busy processing command        */
#define IE_ENG_ACK       0x41  /* Acknowledgement of command byte          */
#define IE_ENG_NOMAIN    0x42  /* No main code programmed into flash       */
#define IE_ENG_NODSP     0x43  /* No DSP code programmed into flash        */
#define IE_ENG_NOCAL     0x44  /* No Calibration tables programmed into flash*/
#define IE_ENG_ERASE     0x45  /* Error while trying to erase FLASH        */
#define IE_ENG_FLASH     0x46  /* Error while trying to program FLASH      */
#define IE_ENG_NYBYTES   0x47  /* Invld # bytes recv'd in program data buf */
#define IE_ENG_CKSUM     0x48  /* Invld checksum recv'd with prog data buf */
#define IE_ENG_COLON     0x49  /* First char in data buffer not a colon    */
#define IE_ENG_BAD_CMD   0x51  /* Engine does not recognize command #      */
#define IE_ENG_ERROR_GEN 0x52  /* General error.  No hex table on Cmd 4    */
#define IE_ENG_BAD_PARM1 0x53  /* Engine does recognize 1st param of cmd   */
#define IE_ENG_BAD_PARM2 0x54  /* Engine does recognize 2nd param of cmd   */
#define IE_ENG_BAD_PARM3 0x55  /* Engine does recognize 3rd param of cmd   */
#define IE_ENG_BAD_PARM4 0x56  /* Engine does recognize 4th param of cmd   */
#define IE_ENG_BAD_PARM5 0x57  /* Engine does recognize 5th param of cmd   */
#define IE_ENG_BAD_PARM6 0x58  /* Engine does recognize 6th param of cmd   */
#define IE_ENG_BAD_PARM7 0x59  /* Engine does recognize 7th param of cmd   */
#define IE_ENG_BAD_PARM8 0x5A  /* Engine does recognize 8th param of cmd   */
#define IE_ENG_BAD_PARM9 0x5B  /* Engine does recognize 9th param of cmd   */
#define IE_ENG_ERR_DTEC  0x90  /* CommTrigDetect called inside sweep cmds. */
#define IE_ENG_ERR_TRIG  0x91  /*  These code provide way of informing app */
                               /*  which that error was with the trigger or*/
                               /*  detector parameter rather than the swp  */
                               /*  command parameters.                     */

#define IE_ENG_INMAIN    0x95   /* Executing from main code block after reset */
#define IE_ENG_INBOOT    0x94   /* Executing from boot code block after reset */
                                /* This implies that the engine does not have */
                                /* a main code block programmed               */
#define IE_ENG_INWEEDS   0x93   /* Execution of boot block began, but did not */
                                /* successfully transfer control anywhere     */
                                /* This implies that engine is in the weeds   */
                                /* Reading a 0x53 in the status after reset is*/
                                /* EXTREMELY bad!                             */
#define IE_ENG_UNKNOWN   0xfe   /* Not actually returned by engine, used when */
                                /* non-REPLY engine reply code is converted   */
                                /* to a function status code.                 */

#define LOWER_PK    0
#define HIGHER_PK   1
#define HIGHEST_PK  2

/* ------------------------------------------------------------------------ */
/*  Constant definitions of error codes from the engine.  Many of these
    values are for internal use only.  The values most commonly used are
    REPLY_ACK, and REPLY_BUSY.  The various BAD_PARM flags can help narrow
    down which parameter to the engine created the failure,but should not
    be seen if you use the library functions for assigning values to members
    of the SET9052 struct.                                                  */
/* ------------------------------------------------------------------------ */
#define REPLY_BUSY      0x40    /* Engine is busy processing command        */
#define REPLY_ACK       0x41    /* Acknowledgement of command byte          */
#define REPLY_NOMAIN    0x42    /* No main code programmed into flash       */
#define REPLY_NODSP     0x43    /* No DSP code programmed into flash        */
#define REPLY_NOCAL     0x44    /* No Calibration tables programmed into flash*/
#define REPLY_ERASE     0x45    /* Error while trying to erase FLASH        */
#define REPLY_FLASH     0x46    /* Error while trying to program FLASH      */
#define REPLY_NYBYTES   0x47    /* Invld # bytes recv'd in program data buf */
#define REPLY_CKSUM     0x48    /* Invld checksum recv'd with prog data buf */
#define REPLY_COLON     0x49    /* First char in data buffer not a colon    */
#define REPLY_BAD_CMD   0x51    /* Engine does not recognize command #      */
#define REPLY_ERROR_GEN 0x52    /* General error.  No hex table on Cmd 4    */
#define REPLY_BAD_PARM1 0x53    /* Engine does recognize 1st param of cmd   */
#define REPLY_BAD_PARM2 0x54    /* Engine does recognize 2nd param of cmd   */
#define REPLY_BAD_PARM3 0x55    /* Engine does recognize 3rd param of cmd   */
#define REPLY_BAD_PARM4 0x56    /* Engine does recognize 4th param of cmd   */
#define REPLY_BAD_PARM5 0x57    /* Engine does recognize 5th param of cmd   */
#define REPLY_BAD_PARM6 0x58    /* Engine does recognize 6th param of cmd   */
#define REPLY_BAD_PARM7 0x59    /* Engine does recognize 7th param of cmd   */
#define REPLY_BAD_PARM8 0x5A    /* Engine does recognize 8th param of cmd   */
#define REPLY_BAD_PARM9 0x5B    /* Engine does recognize 9th param of cmd   */

#define REPLY_ERR_DTEC  0x80    /* CommTrigDetect called inside sweep cmds. */
#define REPLY_ERR_TRIG  0x81    /*  These code provide way of informing app */
                                /*  which that error was with the trigger or*/
                                /*  detector parameter rather than the swp  */
                                /*  command parameters.                     */

#define REPLY_INMAIN    0x95    /* Executing from main code block after reset */
#define REPLY_INBOOT    0x94    /* Executing from boot code block after reset */
                                /* This implies that the engine does not have */
                                /* a main code block programmed               */
#define REPLY_INWEEDS   0x93    /* Execution of boot block began, but did not */
                                /* successfully transfer control anywhere     */
                                /* This implies that engine is in the weeds   */
                                /* Reading a 0x53 in the status after reset is*/
                                /* EXTREMELY bad!                             */
#define REPLY_UNKNOWN   0xff    /* Not actually returned by engine, used when */
                                /* non-IE_ENG software status code is         */
                                /* converted to an engine reply code          */

/* ------------------------------------------------------------------------ */
/*  Constant definitions of error codes from the engine.  Many of these
    values are for internal use only.  The values most commonly used are
    REPLY_ACK, and REPLY_BUSY.  The various BAD_PARM flags can help narrow
    down which parameter to the engine created the failure,but should not
    be seen if you use the library functions for assigning values to members
    of the SET9052 struct.                                                  */
/* ------------------------------------------------------------------------ */
#define ENG_REPLY_BUSY      0x00    /* Engine is busy processing command        */
#define ENG_REPLY_ACK       0x01    /* Acknowledgement of command byte          */
#define ENG_REPLY_NOMAIN    0x02    /* No main code programmed into flash       */
#define ENG_REPLY_NODSP     0x03    /* No DSP code programmed into flash        */
#define ENG_REPLY_NOCAL     0x04    /* No Calibration tables programmed into flash*/
#define ENG_REPLY_ERASE     0x05    /* Error while trying to erase FLASH        */
#define ENG_REPLY_FLASH     0x06    /* Error while trying to program FLASH      */
#define ENG_REPLY_NYBYTES   0x07    /* Invld # bytes recv'd in program data buf */
#define ENG_REPLY_CKSUM     0x08    /* Invld checksum recv'd with prog data buf */
#define ENG_REPLY_COLON     0x09    /* First char in data buffer not a colon    */
#define ENG_REPLY_BAD_CMD   0x11    /* Engine does not recognize command #      */
#define ENG_REPLY_ERROR_GEN 0x12    /* General error.  No hex table on Cmd 4    */
#define ENG_REPLY_BAD_PARM1 0x13    /* Engine does recognize 1st param of cmd   */
#define ENG_REPLY_BAD_PARM2 0x14    /* Engine does recognize 2nd param of cmd   */
#define ENG_REPLY_BAD_PARM3 0x15    /* Engine does recognize 3rd param of cmd   */
#define ENG_REPLY_BAD_PARM4 0x16    /* Engine does recognize 4th param of cmd   */
#define ENG_REPLY_BAD_PARM5 0x17    /* Engine does recognize 5th param of cmd   */
#define ENG_REPLY_BAD_PARM6 0x18    /* Engine does recognize 6th param of cmd   */
#define ENG_REPLY_BAD_PARM7 0x19    /* Engine does recognize 7th param of cmd   */
#define ENG_REPLY_BAD_PARM8 0x1A    /* Engine does recognize 8th param of cmd   */
#define ENG_REPLY_BAD_PARM9 0x1B    /* Engine does recognize 9th param of cmd   */

#define ENG_REPLY_ERR_DTEC  0x40    /* CommTrigDetect called inside sweep cmds. */
#define ENG_REPLY_ERR_TRIG  0x41    /*  These code provide way of informing app */
                                    /*  which that error was with the trigger or*/
                                    /*  detector parameter rather than the swp  */
                                    /*  command parameters.                     */
    
#define ENG_REPLY_INMAIN    0x55    /* Executing from main code block after reset */
#define ENG_REPLY_INBOOT    0x54    /* Executing from boot code block after reset */
                                    /* This implies that the engine does not have */
                                    /* a main code block programmed               */
#define ENG_REPLY_INWEEDS   0x53    /* Execution of boot block began, but did not */
                                    /* successfully transfer control anywhere     */
                                    /* This implies that engine is in the weeds   */
                                    /* Reading a 0x53 in the status after reset is*/
                                    /* EXTREMELY bad!                             */
#define ENG_REPLY_UNKNOWN   0xff    /* Not actually returned by engine, used when */
                                    /* non-IE_ENG software status code is         */
                                    /* converted to an engine reply code          */


/*  ----------------------------------------------------------------------  */
/*  Definitions for values held by GlobErrFlag which is used by the library
    to indicate various errors which do not occur frequently and errors
    need only to be trapped if unusual engine behavior is observed.         */
/*  ----------------------------------------------------------------------  */
/*
#define GLOBNOERROR     0
#define GLOBPCERR       1   //These 4 constants just indicate
#define GLOBBUSERR      1   //  that some sort of
#define GLOBVXIERR      1   //  communications error 
#define GLOBSERIALERR   1   //  has occured
#define GLOBNODATA      2
#define GLOBFILLSTUCK   3
*/
/*----------------------------------------------------------------------------
    These equates added to reflect the change in the reporting of low level
    errors.  Previously a global variable was being used, but now the error
    is placed in the SET9052 struct.  Thus the GLOBwhatever errors above
    are equivalent to the errors below, but all new errors such as the 
    POINTER_ERR will be added here.                       TGS 04/17/596

    These error codes are used internal to the library to track the status
    of previous I/O calls.  Because every platform the 905x runs on top of
    can have different error codes for various communications problems.  To
    avoid confusion, this set of codes will remain constant, and error 
    conditions of the different bus types can be mapped to this set of generic
    errors.  Prefix added on 01/09/97 to avoid conflicts with other defines
    from other systems. 
  ----------------------------------------------------------------------------*/
#define MR90xx_NO_ERR           0
#define MR90xx_COMM_ERR         1
#define MR90xx_NO_DATA          2
#define MR90xx_FILL_STUCK       3
#define MR90xx_POINTER_ERR      4
/*  ----------------------------------------------------------------------  */

/* these 2 defines are now obsolete, use RdMinFreqLimit() and RdMaxFreqLimit() instead */
#define MIN_FREQ    0L
#define MAX_FREQ    1600000000L
/* these 2 defines are now obsolete, use RdMinAttLimit() and RdMaxAttLimit() instead */
#define MIN_ATTN    0
#define MAX_ATTN    60              /* Max input attenuation in dB          */

#define MIN_STEP    1
#define MAX_STEP    MAX_FREQ

#define MIN_PTS     1
#define MAX_PTS     1000000000L

#define MIN_SAMP    0               /* 0 means sample continuously          */
#define MAX_SAMP    100000000L      /* Max number of samples in zero-span   */

#define MIN_TIME    0
#define MAX_TIME    0x77359400L     /* approx 2.15 billion micro-seconds.   */

#define MIN_NUM_CELLS   1
#define MAX_NUM_CELLS   65535L

#define MIN_REFL    -40
#define MAX_REFL    20              /* Max reference level in dB.           */

#define MIN_LIN_VAL 0
#define MAX_LIN_VAL 2236067977L     /* max linear value is 2.236067977 volts*/

#define MIN_THRSH   -120
#define MAX_THRSH   20              /* Max threshold setting in dB.         */

#define MIN_LOGADDR 1
#define MAX_LOGADDR 254

/* ------------------------------------------------------------------------ */
/*  The sampling rate limits for zero-span mode.  The A/D will sample as
    fast as 1 MHz and down to ??? Hz.  The argument to the engine is 
    actually a divide factor.  The formula is sample rate = 10000000/code
    value.  We allow the user to specify the value as a rate in Hz, so the
    library must convert it.  The equation above solved for code value is 
    code value =  10000000 / sample rate.  The min and max values defined 
    here are the min and max values in Hz specified by user.  The code val 
    passed down to the engine cannot be larger than a 12 bit value.  
    Therefore 0xFFF is the max code and 2442 Hz is the resultant minimum
    sampling rate.  1 MHz sampling rate is the max of the A/D so that is
    the max for the calling application.  This equates to a code value of
    10, and any smaller value will be ignored as the resultant faster
    sampling rate is not possible.  Thus to sum up this ramble this is a
    min and max code and a min and max effective sampling rate.  The
    library limits the caller with the min and max effective sampling rate
    while the engine is going to limit the c library to a min and max code. */
/* ------------------------------------------------------------------------ */
#define MAX_RATEDIV 0x7fff          /* Maximum value for the Rate Divider   */
#define MIN_RATEDIV 10              /* Minimum value for the Rate Divider   */
#define MAX_RATEVAL 1000000L        /* Maximum value for sample_rate.       */ 
                                    /*   (Equals 1e7 / MIN_RATEDIV)         */
#define MIN_RATEVAL 306             /* Minimum val for sample_rate. 306 Hz  */
                                    /*  is the slowest sample rate          */
                                    /*   (Equals 1e7 / MAX_RATEDIV)         */

#define MIN_HOPS    0
#define MAX_HOPS    1024            /* Maximum number of pts in a hop table */

#define DB_CONVERT_CONST 128        /* Raw A/D values returned from engine  */
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
#define DEFLT_SET_TIME 0

/* ------------------------------------------------------------------------ */
/*  Possible settings for various mode flags in the SET9052 struct.
    AUTO_ON and AUTO_OFF are used by several flags.  STEPCNT and STEPSIZ
    are only for step_mode member.  TIMESWP and TIMESET are only for the
    time_mode flag.                                                         */
/* ------------------------------------------------------------------------ */
#define AUTO_OFF    0       /* Automatic calculation of val deactivated.    */
#define AUTO_ON     1       /* Automatic calculation of val activated.      */

#define STEPCNT     2       /* Use number of pts to calculate step size     */
#define STEPSIZ     3       /* Use step size to calculate number of points  */

#define TIMESWP     2       /* Use sweep time to calculate settle time.     */
#define TIMESET     3       /* Use settle times to calculate sweep time.    */


#define uSECNDS     0       /* Default unit of time. microseconds.  All time*/
                            /*   except sweep time are always measured in   */
                            /*   uSECS.                                     */
#define mSECNDS     1       /* milliseconds.  Next most likely unit of time */
                            /*   for measuring sweep time.  Only needed for */
                            /*   extremely long sweep time that can result  */
                            /*   with small RBW's and wide spans.           */
#define SECNDS      2       /* seconds.  Largest time unit.  Only needed    */
                            /*   for very extreme wide span scans with very */
                            /*   narrow RBWs and VBWs.                      */

/* ------------------------------------------------------------------------ */
/*  Defines for possible settings for the RBW                               */
/* ------------------------------------------------------------------------ */
#define RBW_300HZ   0       /*  Defines for possible settings for the RBW   */
#define RBW_3KHZ    1
#define RBW_30KHZ   2
#define RBW_300KHZ  3
#define RBW_3MHZ    4
#define RBW_AUTO    5

/* ------------------------------------------------------------------------ */
/*  Defines for possible settings for the VBW                               */
/* ------------------------------------------------------------------------ */
#define VBW_NONE    0
#define VBW_3HZ     1       /*  Defines for possible settings for the VBW   */
#define VBW_30HZ    2
#define VBW_300HZ   3
#define VBW_3KHZ    4
#define VBW_30KHZ   5
#define VBW_300KHZ  6
#define VBW_3MHZ    7
#define VBW_AUTO    8

/* ------------------------------------------------------------------------ */
/*  Defines for trigger method settings                                     */
/* ------------------------------------------------------------------------ */
#define TRIG_FREE       0   /* Free sweep mode.  Sweep continously.         */
#define TRIG_EXT_HI_GO  1   /* External. Start sweep when trigger goes high */
#define TRIG_EXT_LO_GO  2   /* External. Start sweep when trigger goes low  */
#define TRIG_EXT_HI_LVL 3   /* External. Start sweep when trigger is high   */
#define TRIG_EXT_LO_LVL 4   /* External. Start sweep when trigger is low    */
#define TRIG_MANUAL     5   /* Start sweep when resume sweep command receivd*/
#define TRIG_VIDEO      6   /* Start when (amp > thresh) at a specific freq */

#define TRIG_CONTIN     0x8000  /* bit 15 of code sent to engine is a flag  */
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
#define CONT_TRIG_ONCE  0   /* start on first trigger hit then free run.    */
#define CONT_TRIG_NORM  1   /* start sweep each time trigger hits.          */

/* ------------------------------------------------------------------------ */
/*  Defines for sweep parameter bit field.                                  */
/* ------------------------------------------------------------------------ */
#define SWP_SINGLE  0x0000  /* Single sweep mode.                           */
#define SWP_CONT    0x0001  /* If set then continuous sweep. else single swp*/
#define SWP_MIN     0x0002  /* If set then pass back min point for each step*/
#define SWP_MAX     0x0004  /* If set then pass back max point for each step*/
#define SWP_FRQPTS  0x0008  /* If set then return frequency data with each  */
                            /*      min or max point.  Ignored if neither   */
                            /*      min or max bit is set.                  */
#define SWP_EXTNREF 0x0020  /* If set then activate the external reference  */
                            /*      otherwise if unset use internal ref.    */                            


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
#define DTEC_POLAR  0x0001  /* If unset unipolor. If set bipolor inputs     */
#define DTEC_LOG    0x0002  /* Switch Log detector into A/D.                */
#define DTEC_ENABL  0x0004  /* Enable the switched in detector.             */
#define DTEC_3IF    0x0008  /* Switch on the 3rd IF                         */
#define DTEC_PRIVT  0x0010  /* Internal flag.  Always set to 0.             */
#define DTEC_LIN    0x0020  /* Switch Linear detector into A/D.             */
#define DTEC_ATTOFF 0x0040  /* If unset, 30dB of attenuation to lin detect. */
#define DTEC_OPT1   0x0080  /* Optional detector                            */
#define DTEC_OPT2   0x0100  /* Optional detector                            */
#define DTEC_OPT3   0x0200  /* Optional detector                            */
#define DTEC_OPT4   0x0400  /* Optional detector                            */
#define DTEC_OPT5   0x0800  /* Optional detector                            */

/* ------------------------------------------------------------------------ */
/*  Defines for argument codes to Interrupt Sweep command to the engine.    */
/* ------------------------------------------------------------------------ */
#define STOP_NOW        0   /* Terminate sweep immediately.                 */
#define STOP_AFTER      1   /* Terminate sweep when current sweep completes */
#define PAUSE_SWP       2   /* Pause the current sweep.                     */
#define RESUME_SWP      3   /* Resume the current sweep.                    */

/* ------------------------------------------------------------------------ */
/*  Defines for parameter codes to Set Interrupt Mode command to the eng.   */
/* ------------------------------------------------------------------------ */
#define INTRUPT_NONE    0   /*  No interrupt                                */
#define INTRUPT_NWORD   1   /*  Interrupt every n words (n in uppr byte)    */
#define INTRUPT_1QRTR   2   /*  Interrupt when FIFO is 1/4 full             */
#define INTRUPT_HALF    3   /*  Interrupt when FIFO is 1/2 full             */
#define INTRUPT_3QRTR   4   /*  Interrupt when FIFO is 3/4 full             */
#define INTRUPT_FULL    5   /*  Interrupt when FIFO is full                 */
#define INTRUPT_ENDSWP  0x8000  /* Can be used in combination with the other*/
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
#define IRQ_5   5           /*  Interrupt line 5.   Mask is 0x0D            */
#define IRQ_10  10          /*  Interrupt line 10.  Mask is 0x0?            */
#define IRQ_11  11          /*  Interrupt line 11.  Mask is 0x0?            */
#define IRQ_12  12          /*  Interrupt line 12.  Mask is 0x0?            */

/* ------------------------------------------------------------------------ */
/* Defines for the current operational modes                                */
/* ------------------------------------------------------------------------ */
#define IE_OPMODE_NONE       0x00
#define IE_OPMODE_FREQSPAN   0x01
#define IE_OPMODE_ZEROSPAN   0x02
#define IE_OPMODE_FREQHOP    0x03
#define IE_OPMODE_RUNNING    0x80 /* may be OR'd with non-zero OpMode macros above */
              
/* ------------------------------------------------------------------------ */
/* Defines for differentiating the SA Engine Models.  These values are
   used in the 'engine_model' of the 'SET9052' struct by the RdEngineModel()
   and SetEngineModel() functions in "SA9052.C". */
/* ------------------------------------------------------------------------ */
#define SAUNKNOWN   0x0000
#define SA9052      0x0100
#define SA9054      0x0200
#define SA9085      0x0300
#define SA9034      0x0400

#define IE_TIMER_MAX 86517177L

/* ------------------------------------------------------------------------ */
/* The 3 defines below are delay times for resetting the spectrum analyzer.
    HOLD_TIME := time to hold the reset line high
    INIT_TIME := time allocated to processor to run through its init code
    RESET_TIME := total time that ResetEngine takes - TGS - 04/25/96        */
/* ------------------------------------------------------------------------ */
#define HOLD_TIME 1.5
#define INIT_TIME 2.0
#define RESET_TIME HOLD_TIME+INIT_TIME

/* ------------------------------------------------------------------------ */
#define IMR_PORT        0x21    /* Interrupt mask register port for 8259A   */
#define ICR_PORT        0x20    /* Interrupt control port for 8259A PIC     */
#define EOI             0x20    /* End of interrupt command for PIC         */

#define MASK_IRQ5       0xDF    /* Bit mask to enable IRQ5 on the 8259A PIC */
#define MASK_IRQ10      0xFB    /* Bit mask for IRQ10 on 8259A PIC ???      */

#define HI_WORD     0XFFFF0000  /* Mask for obtaining upper 16 bits(1word)of*/
                                /* a long integer(32bit) value.             */
#define LO_WORD     0x0000FFFF  /* Mask for obtaining lower 16 bits(1word)of*/
                                /* a long integer(32bit) value.             */

#define HI_BYTE         0xFF00
#define LO_BYTE         0x00FF

#define FIFO_DEPTH      512     /* Number of words in data FIFO from engine */
/*#define MAX_NUM_RETRY 3       /* Trying a higher retry count on 9/1/95 
                                    to fix lockup problem with VXI engine.  */
#define MAX_NUM_RETRY   10

#define MAX_NUM_PARAM   20      /* Normally 8, but LoadHopTable() can have  */
                                /* up to 1024 two word entries.             */
#define TICKS_PER_SEC   18.2    /* Number of times dos timer hits per second*/     
/* ------------------------------------------------------------------------ */
/*  Constant definitions of command numbers to the engine.                  */
/* ------------------------------------------------------------------------ */
#define ENG_INIT        0
#define ENG_START_SWP   1
#define ENG_START_ZSPAN 2
#define ENG_START_FHOP  3
#define ENG_SET_TRIGDET 4
#define ENG_LOAD_HOPFRQ 5
#define ENG_SET_INTMODE 6
#define ENG_TERMINATE   7
#define ENG_CALIBRATE   10

/* ------------------------------------------------------------------------ */
/*  Constant definitions of library actions and reactions.  ie actual error
    codes are listed below, but engine responses such as retry or abort
    are listed here.                                                        */
/* ------------------------------------------------------------------------ */
#define CMD_SUCCESS     0
#define CMD_FAIL        1
#define CMD_SEND        3
#define CMD_RETRY       4
#define CMD_RESET       5

#define ETX             0x03        /* End of transmission.  Sent at end of hop */
                                    /* table frequency list.                    */
#define STAT_ALLHWBITS  0xF00       /* All of the hardware status bits.  Used   */
                                    /*  for test active bitfields.              */
#define STAT_DATAWAIT       0x100   /* 0001  Data waiting in FIFO from engine         */
#define STAT_DATA2575       0x200   /* 0010  Almost empty or almost full 25% or 75%   */
#define STAT_DATAHALF       0x400   /* 0100  FIFO from engine at least half full      */
#define STAT_SENDFULL       0x800   /* 1000  FIFO to engine is full. Don't send yet.  */
#define STAT_ALMOST_FULL    0xF00   /* 1111  Engine > 3/4 full.             */
#define STAT_OVER_HALF      0xD00   /* 1101  Engine > 1/2 full.             */
#define STAT_ALMOST_HALF    0x900   /* 1001  Engine > 1/4 but < 1/2 full    */
#define STAT_ALMOST_EMPT    0xB00   /* 1011  Engine < 1/4 full.             */
#define STAT_EMPTY          0xA00   /* 1010  Engine has no data             */

#endif  

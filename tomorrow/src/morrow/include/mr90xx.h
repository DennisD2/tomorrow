
/*= <Morrow Technologies V90xx Spectrrm Analyzer> Include File ====================================*/

#ifndef ___MR90XX_H___
#define ___MR90XX_H___

/* SAPFORM.H must be included before any non-system headers */ 
#ifndef ___SAPFORM_H___
    #include "sapform.h"
#endif

/* VPPTYPE.H must be included by every header (VPP-3.4, Rule 3.26) */
#ifndef __VPPTYPE_HEADER__
    #include "vpptype.h"
#endif

#ifndef ___MR_DEFIN_H___
    #include "mr_defin.h"
#endif

#if defined(__cplusplus) || defined(__cplusplus__)
extern "C" {
#endif

#define MR90XX_REVISION     "Rev 2.0,June 1998, CVI 4.1"  /*  Instrument driver revision */
//#define MR90XX_MANF_ID      0x0ECE                        /*  Instrument manufacturer ID */
#define MR90XX_MODEL_CODE   0x0100                        /*  Instrument model code      */
#define BUFFER_SIZE         512L             )            /*  File I/O buffer size       */

//#define MR90XX_DBM_CODE 0
//#define MR90XX_UV_CODE  1
//#define MR90XX_NV_CODE  2

//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_init(ViRsrc rName, ViBoolean query_flag, ViBoolean reset_flag, ViSession *p_session_id);
//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_reset(ViSession session_id);
//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_self_test(ViSession session_id, ViInt16 *TestResult, ViChar TestMessage[]);
//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_error_query(ViSession session_id, ViPInt32 errorCode, ViChar errorMessage[]);
//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_error_message(ViSession session_id, ViStatus errorCode, ViChar errorMessage[]);
//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_revision_query(ViSession session_id, ViChar driverRevision[],ViChar firmwareRevision[]);
//MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_close(ViSession session_id);

#if defined(__cplusplus) || defined(__cplusplus__)
}
#endif

/*****************************************************************************/
/*=== END INCLUDE FILE ======================================================*/
/*****************************************************************************/

#endif

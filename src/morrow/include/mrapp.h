
/* ------------------------------------------------------------------------------------- */
/*             Morrow Technologies Corporation (c)1993,1994                              */
/*                    All rights reserved worldwide.                                     */
/* ------------------------------------------------------------------------------------- */
/* FILE       : mraap.h
   DATE       : 06/19/97
   Programmer : Rita Trivedi
   PURPOSE    : Header file for wrapper functions defined in mrapp.c
--------------------------------------------------------------------------------------- */

#ifndef ___MRAPP_H___
    #define ___MRAPP_H___

#ifndef ___SAPFORM_H___
    #include "sapform.h"
#endif

#ifndef __VISATYPE_HEADER__
    #include "visatype.h"
#endif

#ifndef ___MR_DEFIN_H___
    #include "mr_defin.h"     
#endif

    

// ----------------------------------------------------------------------------------------
// Defination of macros used by measure functions
// ----------------------------------------------------------------------------------------
#define MR90XX_DBM_FORMAT 0
#define MR90XX_UV_FORMAT  1
#define MR90XX_NV_FORMAT  2

#ifdef __cplusplus
    extern "C" {
#endif

// ----------------------------------------------------------------------------------------
// Function Prototypes                                                                     
// ----------------------------------------------------------------------------------------
MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_InitDataCapSweep( ViSession session_id,ViInt16 rbw,ViInt16 vbw,FREQ8500 start,FREQ8500 stop,ViInt32 deflt_num_points );      

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_InitDataCapZspan( ViSession session_id,ViInt16 rbw,ViInt16 vbw,FREQ8500 center,ViInt32 smpl_cnt  );

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_InitFreqHop( ViSession session_id,ViInt16 rbw,ViInt16 vbw,ViInt16 ref_level,ViInt32 hop_tb_cnt);

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_InitGuiSweep( ViSession session_id,ViInt16 rbw,ViInt16 vbw,FREQ8500 start,FREQ8500 stop,ViInt16 ref_level,ViInt32 cell_num );

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_InitGuiZspan( ViSession session_id,ViInt16 rbw,ViInt16 vbw,FREQ8500 center,ViInt16 ref_level,ViInt32 cell_num );

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_MeasureAmplData ( ViSession session_id,ViInt16 rbw,
                                                                      ViInt16 vbw,ViReal64 start,ViReal64 stop,
                                                                      ViInt16 ref_level,ViInt32 num_points,
                                                                      ViInt16 min_or_max,ViInt16 data_format,
                                                                      ViReal64 ra_data[]);

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_MeasureAmplWithFreq ( ViSession session_id,
                                                                          ViInt16 rbw,ViInt16 vbw,ViReal64 start,ViReal64 stop,
                                                                          ViInt16 ref_level,ViInt32 num_points,
                                                                          ViInt16 min_or_max, ViInt16 data_format,
                                                                          ViReal64 ra_data[],ViReal64 ra_freq[]);

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_MeasureMinMaxAmpl ( ViSession session_id,ViInt16 rbw,
                                                                        ViInt16 vbw,ViReal64 start,ViReal64 stop,
                                                                        ViInt16 ref_level,ViInt32 num_points,
                                                                        ViInt16 data_format,
                                                                        ViReal64 ra_min_data[],ViReal64 ra_max_data[]);

MR90XX_DLLEXPORT ViStatus IE_FUNC IE_FUNCEXP mr90xx_MeasureMinMaxAmplWithFreq ( ViSession session_id,ViInt16 rbw,
                                                                                ViInt16 vbw,ViReal64 start,ViReal64 stop,
                                                                                ViInt16 ref_level,ViInt32 num_points,
                                                                                ViInt16 data_format,
                                                                                ViReal64 ra_min_data[],ViReal64 ra_max_data[],
                                                                                ViReal64 ra_min_freq[],ViReal64 ra_max_freq[]);
                                                   
#ifdef __cplusplus
}
#endif

#endif

/* ------------------------------------------------------------------------------------- */
/*             Morrow Technologies Corporation (c)1993,1994                              */
/*                    All rights reserved worldwide.                                     */
/* ------------------------------------------------------------------------------------- */
/* FILE    : VISAGLUE.H
   VERSION : 1.O
   PURPOSE : Header file for Visual C++ 1.5 DLL "glue_dll.dll".  As of 09-18-96 this DLL
                contains:
                1. the core C library modules;
                2. the VISA interface module "mr_visa.c";
                3. and the glue code modules - visaglue.c, wrapper1.c,
                   and wrapper2.c.
                In the future this file will only contain the glue code components
                listed in 3 above and 2 additional DLLs will be made of 1 and 2 above.

                This header file is also used in the LabWindows\CVI project for
                the DLL header file, renamed to "glue_dll.h".  Note that the
                required differences in the header file between the Visual C++ and
                CVI applications are conditionally included by using the define
                _LABWINDLL.

   DATE    : 07-30-96
   AUTHOR  : J. Overton
--------------------------------------------------------------------------------------- */
/* Tabs = 4 for correct spacing                                           */

#ifndef ___VISAGLUE_H___
#define ___VISAGLUE_H___

/* SAPFORM.H must be included before any non-system headers */  
#ifndef ___SAPFORM_H___
    #include "sapform.h"
#endif

/* VPPTYPE.H must be included by every header (VPP-3.4, Rule 3.26) */
#ifndef __VPPTYPE_HEADER__
    #include "vpptype.h"
#endif

#ifndef ___STR_9052_H___
    #include "str_9052.h"
#endif

#ifndef ___MR_DEFIN_H___
    #include "mr_defin.h"      /* MR90xx Instrument Driver defines file. */
#endif

#if defined(__cplusplus) || defined(__cplusplus__)
extern "C" {
#endif

/* ------------------------------------------------------------------------------------------ */
/*  Functions that perform the mechanics of the glue code that meshes the
    old MTC C library based on the SET9052 structure to the VXI VISA
    compatible functions that "wrap" the older code and establish a standard instrument
    handle of type ViSession for function interface to a specific instrument and session.*/
/* ------------------------------------------------------------------------------------------ */
ViStatus DecodeSession  ( ViSession session_id, ViPUInt32 rp_magic );

SET9052 *GetStructPtr( ViUInt32 magic );
ViInt32  funcErrorProcess( ViInt16 status );

/* ------------------------------------------------------------------------------------------ */
/* These are non-exported functions from AUX9052.C that are used in the standalone program. */
/* ------------------------------------------------------------------------------------------ */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetTimeoutWait   ( ViSession session_id, ViInt32 delay_time );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdLinearAttn     ( ViSession session_id, ViPInt16 rp_lin_attn );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetLinearAttn    ( ViSession session_id, ViInt16 on_or_off );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetCalPoint      ( ViSession session_id, ViInt16 if_attn, ViInt32 frequency,ViInt16 steering_voltage, ViInt16 *amp_return );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetCalPointExt   ( ViSession session_id, ViInt16 if_attn, ViReal64 frequency,ViInt16 steering_voltage, ViInt16 *amp_return );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_LocateEngine     ( ViInt16 start_address,ViUInt32 *p_number_located,ViInt16 *p_address_located);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ListFoundEngine  ( ViInt16 start_address,ViUInt32 *p_number_located,ViInt16 a_logical_address[],ViUInt16 a_mainframe[],ViUInt16 a_slot[]);

#if defined(__cplusplus) || defined(__cplusplus__)
}
#endif

#endif

/* ******************************************************************************************************************** */
/* *************************************** END File VISAGLUE.H ******************************************************** */
/* ******************************************************************************************************************** */

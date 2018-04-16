#ifndef ___WRAPPER_H___
#define ___WRAPPER_H___

#if defined(__cplusplus) || defined(__cplusplus__)
extern "C" {
#endif

/* SAPFORM.H must be included before any non-system headers */  
#ifndef ___SAPFORM_H___
    #include "sapform.h"
#endif

/* VPPTYPE.H must be included by every header (VPP-3.4, Rule 3.26) */
#ifndef __VPPTYPE_HEADER__
    #include "vpptype.h"
#endif

#ifndef ___MR_DEFIN_H___
    #include "mr_defin.h"      /* MR90xx Instrument Driver defines file. */
#endif

// private functions
ViStatus mr90xx_IdQuery( ViSession session_id, ViInt16 *p_result);
/* ---------------------------------------------------------------- */
/* The functions below are wrapper functions for MTC C Library functions in SA9052.C.    */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_OpenSession    ( ViPChar initstring, ViPSession rp_session_id);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_CloseSession   ( ViSession session_id );

/* ---------------------------------------------------------------- */
/*  Routines which actually communicate instructions to the 9052
    engine.  Parameters for the engine are drawn from the 
    internal data structures.                                       */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_InitEngine              (ViSession session_id);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ShutdownEngine          (ViSession session_id);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_StartSweep              (ViSession session_id);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_StartZspan              (ViSession session_id);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_StartFreqHop            (ViSession session_id);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_LoadHopTable            (ViSession session_id,ViInt16 num_points,ViInt32  a_freq[]);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_LoadHopTableExt         (ViSession session_id,ViInt32 num_points,ViReal64 a_freq[]);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_BreakSweep              (ViSession session_id,ViInt16  break_code );
/* ---------------------------------------------------------------- */
/*  Functions to retrieve data from the engine.                     */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetAmplData             (ViSession session_id,ViInt16 a_ampl[] );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetMinMaxAmpl           (ViSession session_id,ViInt16 a_minampl[],ViInt16 a_maxampl[]);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetAmplWithFreq         (ViSession session_id,ViInt16 a_ampl[], ViInt32 a_freq[] );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetAmplWithFreqExt      (ViSession session_id,ViInt16 a_ampl[],ViReal64 a_freq[]);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetMinMaxAmplWithFreq   (ViSession session_id,ViInt16 a_minampl[],ViInt16 a_maxampl[],ViInt32 a_minfreq[],ViInt32 a_maxfreq[]);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetMinMaxAmplWithFreqExt(ViSession session_id,ViInt16 a_minampl[],ViInt16 a_maxampl[],ViReal64 a_minfreq[],ViReal64 a_maxfreq[]);

/* ---------------------------------------------------------------- */
/*  Functions to initialize or reautomate the engine's operating parameters.  */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_InitInstrData( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_Recouple     ( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ResetEngine  ( ViSession session_id );

/* ---------------------------------------------------------------- */
/*  Functions for reading the engine's operating parameters.
    Use these rather than directly accessing the structure members. 
    (current versions) */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadStartFreq ( ViSession session_id, ViPReal64 rp_start_freq );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadStepSize  ( ViSession session_id, ViPReal64 rp_step_size );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadTrigFreq  ( ViSession session_id, ViPReal64 rp_trig_freq );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadZspanFreq ( ViSession session_id, ViPReal64 rp_zspan_freq );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadStopFreq  ( ViSession session_id, ViPReal64 rp_stop_freq );

/* ---------------------------------------------------------------- */
/*  Functions for reading the engine's operating parameters.
    Use these rather than directly accessing the structure members.
    (obsolete versions) */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdStartFreq ( ViSession session_id, ViPInt32 rp_start_freq );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdStepSize  ( ViSession session_id, ViPInt32 rp_step_size );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdTrigFreq  ( ViSession session_id, ViPInt32 rp_trig_freq );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdZspanFreq ( ViSession session_id, ViPInt32 rp_zspan_freq);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdStopFreq  ( ViSession session_id, ViPInt32 rp_stop_freq );

/* ---------------------------------------------------------------- */
/*  Functions for reading the engine's operating parameters.
    Use these rather than directly accessing the structure members. */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_enablePreamp   ( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_disablePreamp  ( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdPreamp       ( ViSession session_id, ViPInt16   rp_state );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdSwpIdx       ( ViSession session_id, ViPInt32   rp_index );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdAttenuatr    ( ViSession session_id, ViPInt16   rp_attenuation );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdAutoCell     ( ViSession session_id, ViPInt16   rp_autoCellStat );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdCellMode     ( ViSession session_id, ViPInt16   rp_cellMode );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdDefltPts     ( ViSession session_id, ViPInt32   rp_defaultPoints );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdDetect       ( ViSession session_id, ViPInt16   rp_detector );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdDetectCode   ( ViSession session_id, ViPInt16   rp_detect_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdDwellTime    ( ViSession session_id, ViPInt32   rp_dwellTime );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdEngineModel  ( ViSession session_id, ViPInt16   rp_model );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdEngOption    ( ViSession session_id, ViUInt16   flagno,ViPInt16 rp_value);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdErrorStatus  ( ViSession session_id, ViPUInt32  rp_errorStatus );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdFiltRatio    ( ViSession session_id, ViPReal64  rp_ratio );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdHopTabCnt    ( ViSession session_id, ViPInt32   rp_hop_tab_cnt );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdIntrCode     ( ViSession session_id, ViPInt16   rp_intrpt_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdInterfaceType( ViSession session_id, ViPInt16   rp_iface_type );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdIrqNum       ( ViSession session_id, ViPInt16   rp_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdLinRefLevel  ( ViSession session_id, ViPReal64  rp_lin_ref_level);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdLogAddr      ( ViSession session_id, ViPInt16   rp_log_addr );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdNumCells     ( ViSession session_id, ViPInt32   rp_num_cells );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdNumSwpPts    ( ViSession session_id, ViPInt32   rp_num_swp_pts);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdNumDataPts   ( ViSession session_id, ViPInt32   rp_num_data_pts);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdPortNum      ( ViSession session_id, ViPUInt16  rp_portNumber );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdRefLevel     ( ViSession session_id, ViPInt16   rp_ref_level );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdRBW          ( ViSession session_id, ViPInt16   rp_rbw_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdRBWmode      ( ViSession session_id, ViPBoolean rp_auto_on );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdSettleTime   ( ViSession session_id, ViPInt32   rp_settle_time );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdSweepCode    ( ViSession session_id, ViPInt16   rp_sweep_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdSwpTime      ( ViSession session_id, ViPReal64  rp_dbl_ptr );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdTrigMode     ( ViSession session_id, ViPInt16   rp_trig_mode );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdTrigThrsh    ( ViSession session_id, ViPInt16   rp_trig_thresh );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdVBW          ( ViSession session_id, ViPInt16   rp_vbw_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdVBWmode      ( ViSession session_id, ViPBoolean rp_auto_on );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdZSamplCnt    ( ViSession session_id, ViPInt32   rp_zspan_smpl_cnt );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdZSamplDvdr   ( ViSession session_id, ViPUInt16  rp_zspan_smpl_dvdr );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdZSamplRate   ( ViSession session_id, ViPUInt32  rp_zspan_smpl_rate );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdMinFreqLimit (ViSession session_id,ViPReal64 rp_freq_limit);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RdMaxFreqLimit (ViSession session_id,ViPReal64 rp_freq_limit);
/* ----------------------------------------------------------------------------- */
/*  Functions for setting the engine's operating parameters. (current versions) */
/* ----------------------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ConfigStartFreq   ( ViSession session_id, ViReal64 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ConfigStepSize    ( ViSession session_id, ViReal64 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ConfigStopFreq    ( ViSession session_id, ViReal64 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ConfigZspanFreq   ( ViSession session_id, ViReal64 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ConfigTrigFreq    ( ViSession session_id, ViReal64 freq_value );

/* ----------------------------------------------------------------------------- */
/*  Functions for setting the engine's operating parameters. (obsolete versions) */
/* ----------------------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetStartFreq   ( ViSession session_id, ViInt32 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetStepSize    ( ViSession session_id, ViInt32 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetStopFreq    ( ViSession session_id, ViInt32 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetZspanFreq   ( ViSession session_id, ViInt32 freq_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetTrigFreq    ( ViSession session_id, ViInt32 freq_value );

/* ---------------------------------------------------------------- */
/*  Functions for setting the engine's operating parameters.        */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetPreamp         ( ViSession session_id, ViInt32   on_or_off );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetSwpIdx         ( ViSession session_id, ViInt32   index );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_OverRideSetTime   ( ViSession session_id, ViInt32   time_val );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetAttenuatr      ( ViSession session_id, ViInt16   atten_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetAutoCell       ( ViSession session_id, ViInt16   code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetCellMode       ( ViSession session_id, ViInt16   code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetDefltPts       ( ViSession session_id, ViInt32   numpts );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetDetectCode     ( ViSession session_id, ViInt16   code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetDetectLin      ( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetDetectLog      ( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetDetect3IF      ( ViSession session_id );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetDwellTime      ( ViSession session_id, ViInt32   time_val );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetEngineModel    ( ViSession session_id, ViInt16   model );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetEngOption      ( ViSession session_id, ViUInt16  flagno,ViInt16 value);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetErrorStatus    ( ViSession session_id, ViUInt32  status );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetFiltRatio      ( ViSession session_id, ViReal64  ratio );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetHopTabCnt      ( ViSession session_id, ViInt32   num_points );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetIntrCode       ( ViSession session_id, ViInt16   new_int_code,ViInt16 nwords );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetIrqNum         ( ViSession session_id, ViInt16   irqnum );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetLinRefLevel    ( ViSession session_id, ViReal64  linref_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetLogAddr        ( ViSession session_id, ViInt16   logaddr );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetNumCells       ( ViSession session_id, ViInt32   new_cell_cnt );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetNumSwpPts      ( ViSession session_id, ViInt32   number_pts );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetPortNum        ( ViSession session_id, ViUInt16  portnum );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetRefLevel       ( ViSession session_id, ViInt16   RequestedLevel );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetRBW            ( ViSession session_id, ViInt16   rbw_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetRBWmode        ( ViSession session_id, ViBoolean mode );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetSweepCode      ( ViSession session_id, ViInt16   bit_flag );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetSwpTime        ( ViSession session_id, ViReal64  sweep_time );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetTrigMode       ( ViSession session_id, ViInt16   trig_flag,ViInt16 norm_flag );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetTrigThrsh      ( ViSession session_id, ViInt16   ampl_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetVBW            ( ViSession session_id, ViInt16   vbw_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetVBWmode        ( ViSession session_id, ViInt16   mode_flag );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetZSamplCnt      ( ViSession session_id, ViInt32   num_samples );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetZSamplDvdr     ( ViSession session_id, ViUInt16  rate_divider );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SetZSamplRate     ( ViSession session_id, ViUInt32  rate_value );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_StepSizeMode      ( ViSession session_id, ViInt16   mode_flag );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_SwpTimeMode       ( ViSession session_id, ViInt16   mode_flag );

/* ---------------------------------------------------------------- */
/*  Misc functions for obtaining status and info                    */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_IsSweeping      ( ViSession session_id, ViPInt16 rp_swp_stat );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_CheckForFreqpts ( ViSession session_id, ViPInt16 rp_freq_pt_stat );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_CheckForMinMax  ( ViSession session_id, ViPInt16 rp_minMaxStatus );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_FreqInRange     ( ViSession session_id, ViPInt16 rp_inrange_stat,ViReal64 freq);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_IsCalibrated    ( ViSession session_id, ViPInt16 rp_cal_stat );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_IsValidStep     ( ViSession session_id, ViPInt16 rp_stat );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_IsValidInit     ( ViUInt16  init_return_val );

/* ---------------------------------------------------------------- */
/*  The following functions are provided to process data returned
    from a sweep.                                                   */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_FindIdxForSwpFreq(ViSession session_id,ViInt16 a_ampl[],
                                ViReal64 freq,ViPInt32 rp_pt_idx);

MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_FindHighPeak ( ViInt16 a_ampl[], ViInt32 numpts, ViPInt32 rp_peak_idx );

MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_FindNextPeak ( ViInt16 a_ampl[], ViInt32 numpts, ViInt32 cur_peak_idx,
                                ViInt16 up_or_down, ViInt16 min_peak_val, ViPInt32 rp_next_idx );

MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_FindPtAtSwpFreq( ViSession session_id, ViInt16 a_ampl[],
                                ViInt32 freq, ViPInt32 rp_pt_idx );

MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadSwpPtFreq( ViSession session_id, ViInt32 offset, ViPReal64 rp_freq);

MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ReadCellPtFreq( ViSession session_id, ViInt32 offset,
                                ViInt16 minmax_code, ViReal64 a_minfreq[],
                                ViReal64 a_maxfreq[], ViPReal64 rp_freq );

/* -------------------------------------------------------------------------------- */
/* These are the functions with a session handle in this group from SAUTIL.H.  */
/* -------------------------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_FindEquivDbmRef (ViSession session_id,ViUInt32 voltage  ,ViPInt16   rp_dbm_ref );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetAmplForDbm   (ViSession session_id,ViReal64 dbmval   ,ViPInt16   rp_ampl );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetAmplFornV    (ViSession session_id,ViReal64 NanoVolts,ViPInt16   rp_ampl );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetDbmForAmpl   (ViSession session_id,ViInt16  amp      ,ViPReal64  rp_dbm );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetDbmForVoltage(ViSession session_id,ViUInt32 voltage  ,ViPReal64  rp_dbm );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetnVForAmpl    (ViSession session_id,ViInt16  amp      ,ViPReal64  rp_nvolt);
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetnVForDbm     (ViSession session_id,ViReal64 dbmval   ,ViPReal64  rp_nvolt);

/* -------------------------------------------------------------------------------- */
/* These functions do not use a session handle. */
/* -------------------------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_DefltSetTimeRBW ( ViInt16 filt_code, ViPInt32 rp_rbw_sett_time );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_DefltSetTimeVBW ( ViInt16 filt_code, ViPInt32 rp_vbw_sett_time );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_DelayOps        ( ViReal64 this_long );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetRatioForCode ( ViInt16 code, ViPReal64 rp_ratio );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetCodeForRatio ( ViReal64 ratio, ViPInt16 rp_code );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetRBWString    ( ViInt16 code, ViPChar rp_retstring );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetVBWString    ( ViInt16 code, ViPChar rp_retstring );
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RBWCodeFromFreq(ViPInt16 rp_code,ViReal64 freq) ;
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_VBWCodeFromFreq(ViPInt16 rp_code,ViReal64 freq) ;
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_RBWFreqFromCode(ViPReal64 rp_freq,ViInt16 code) ;
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_VBWFreqFromCode(ViPReal64 rp_freq,ViInt16 code) ;

/* ---------------------------------------------------------------- */
/* Functions that gather and reset error information from previous function calls */
/* ---------------------------------------------------------------- */
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetFuncStatusCode(ViSession session_id) ;
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_GetEngineReplyCode(ViSession session_id,ViPInt16 rp_eng_reply) ;
MR90XX_DLLEXPORT ViStatus _VI_FUNCC mr90xx_ClearFuncStatusCode(ViSession session_id) ; 

#if defined(__cplusplus) || defined(__cplusplus__)
}
#endif

#endif


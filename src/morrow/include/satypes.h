/* -------------------------------------------------------------------- */
/*             Morrow Technologies Corporation (c)1993,1994             */
/*                    All rights reserved worldwide.                    */
/* -------------------------------------------------------------------- */
/* FILE    : satypes.h                                                  */
/* VERSION : 1.41                                                       */
/* DATE    : 11/17/93                                                   */
/* AUTHOR  : Thomas Fredrick                                            */
/* PURPOSE : Declare and define compiler specific constants and macros. */
/*           Also define Instrument Engines data types for use with     */
/*           9052 programs.                                             */
/* LAST MOD: 07/21/94                                                   */
/* -------------------------------------------------------------------- */

#ifndef ___SATYPES_H___
#define ___SATYPES_H___

    #ifndef ___SAPFORM_H___
        #include "sapform.h"
    #endif

    /* Undefine all macro versions of the integer types */
    #ifdef int8
        #undef int8
    #endif
    #ifdef int16
        #undef int16
    #endif
    #ifdef int32
        #undef int32
    #endif
    #ifdef uint8
        #undef uint8
    #endif
    #ifdef uint16
        #undef uint16
    #endif
    #ifdef uint32
        #undef uint32
    #endif

    /* Define the int data types as typedefs */
    #if defined(MR90XX_OS_WIN32)
        typedef unsigned char   uint8;
        typedef short           int16;
        typedef unsigned short  uint16;
        typedef long            int32;
        typedef unsigned long   uint32;
    #elif defined(MR90XX_OS_WIN16) || defined(MR90XX_OS_DOS16)
        typedef unsigned char   uint8;
        typedef int             int16;
        typedef unsigned int    uint16;
        typedef long            int32;
        typedef unsigned long   uint32;
    #elif defined(__GNUC__) 
        // DD additions 
        typedef unsigned char   uint8;
        typedef short           int16;
        typedef unsigned short  uint16;
        typedef int             int32;
        typedef unsigned int    uint32;
    #else
        #error OS Platform undefined, choose one of MR90XX_OS_DOS16, MR90XX_OS_WIN16, or MR90XX_OS_WIN32
    #endif

    #ifdef _LABWINDOWS
        #define _Cdecl
    #endif

    /* -------------------------------------------------------------------- */
    /* Turbo C++                                                            */
    /* -------------------------------------------------------------------- */
    #if defined(__TURBOC__) && !defined(__BORLANDC__)
        #undef  inpw
        #undef  outpw
        #define IE_COMPILER_NAME "Turbo C++"
        #define IE_CDECL        far cdecl
        #define IE_FAR          far
        #define IE_FUNC         far
        #define IE_FUNCEXP      pascal
        #define IE_HFREQ        FREQUENCY huge
        #define IE_HLFREQ       FREQ8500 huge
        #define IE_HAMPL        AMPL huge

    /* -------------------------------------------------------------------- */
    /* Borland C++                                                          */
    /* -------------------------------------------------------------------- */
    #elif defined(MR90XX_COMPILER_BC40) || defined(MR90XX_COMPILER_BC50)
        #undef  inpw
        #undef  outpw
        #define IE_COMPILER_NAME "Borland C++"
        #if defined(MR90XX_OS_DOS16) || defined(MR90XX_OS_WIN16)
            #define IE_CDECL        _far _cdecl
            #define IE_FAR          far
            #define IE_FUNC         far
            #if defined(MR90XX_LINK_DYNAMIC)
                #define IE_FUNCEXP _export
            #else
                #define IE_FUNCEXP
            #endif
            #define IE_HFREQ        FREQUENCY __huge
            #define IE_HLFREQ       FREQ8500 __huge
            #define IE_HAMPL        AMPL __huge
            #define IE_HUGE         __huge
        #elif defined(MR90XX_OS_WIN32)
            #define IE_CDECL
            #define IE_FAR
            #define IE_FUNC _stdcall

            #if defined(MR90XX_LINK_DYNAMIC)
                #define IE_FUNCEXP _export
            #else
                #define IE_FUNCEXP
            #endif
            #define IE_HFREQ        FREQUENCY
            #define IE_HLFREQ       FREQ8500
            #define IE_HAMPL        AMPL
            #define IE_HUGE
        #else
            #error Unknown OS type
        #endif

    /* -------------------------------------------------------------------- */
    /* Metaware High C/C++                                                  */
    /* -------------------------------------------------------------------- */
    #elif defined(__HIGHC__)
        #define IE_COMPILER_NAME "High C"
        #define IE_CDECL IE_BLANK
        #define IE_FAR
        #define IE_FUNC
        #define IE_HFREQ        FREQUENCY
        #define IE_HLFREQ       FREQ8500
        #define IE_HAMPL        AMPL

    /* -------------------------------------------------------------------- */
    /* Microsoft C7 & Visual C++                                            */
    /* -------------------------------------------------------------------- */
    #elif defined(MR90XX_COMPILER_MSC) && !defined(MR90XX_OS_WIN32) && defined(MR90XX_LINK_STATIC)
        #define IE_COMPILER_NAME "Microsoft C"
        #define IE_CDECL        __cdecl
        #define IE_FAR          __far
        #define IE_FUNC         __far
        #define IE_FUNCEXP      _pascal
        #define IE_HUGE         __huge
        #define IE_HFREQ        FREQUENCY IE_HUGE
        #define IE_HLFREQ       FREQ8500 IE_HUGE
        #define IE_HAMPL        AMPL IE_HUGE
    /* -------------------------------------------------------------------- */
    /* Microsoft C8 & Visual C++ 5.0 - 32 bit build.                        */
    /* -------------------------------------------------------------------- */
    #elif defined(MR90XX_COMPILER_MSC) && defined(MR90XX_OS_WIN32)
        #define IE_COMPILER_NAME "Microsoft Visual C++ 5.x"
        #define IE_CDECL        __cdecl
        #define IE_FAR
        #define IE_FUNC
        #define IE_HFREQ        FREQUENCY
        #define IE_HLFREQ       FREQ8500
        #define IE_HAMPL        AMPL
        #define IE_FUNCEXP
        #define IE_HUGE

    /* -------------------------------------------------------------------- */
    /*  Defines used in-house when building library to a DLL                */
    /* -------------------------------------------------------------------- */
    #elif defined(_WINDOWS) && defined(_DLL) && defined(_WINDLL)
        #define IE_COMPILER_NAME "Microsoft"
        #define IE_CDECL        __cdecl
        #define IE_FAR          __far
        #define IE_FUNC         __export
        #define IE_FUNCEXP      _pascal
        #define IE_HUGE         __huge
        #define IE_HFREQ        FREQUENCY IE_HUGE
        #define IE_HLFREQ       FREQ8500 IE_HUGE
        #define IE_HAMPL        AMPL IE_HUGE

    /* -------------------------------------------------------------------- */
    /*  Defines when compiling for LabWindows/CVI driver.                   */
    /* -------------------------------------------------------------------- */
    #elif defined(MR90XX_COMPILER_LW40)
        #define IE_COMPILER_NAME "Labwindows CVI"
        #define IE_CDECL        __cdecl
        #define IE_FAR          _far
        #define IE_FUNC         _far
        #define IE_HFREQ        FREQUENCY
        #define IE_HLFREQ       FREQ8500
        #define IE_HAMPL        AMPL
        #define IE_FUNCEXP
        #define IE_HUGE
        // DD Additions
    #elif defined(__GNUC__)
        #define IE_COMPILER_NAME "GNU C on 64 Bit"
        #define IE_CDECL        __cdecl
        #define IE_FAR          
        #define IE_FUNC         
        #define IE_HFREQ        FREQUENCY
        #define IE_HLFREQ       FREQ8500
        #define IE_HAMPL        AMPL
        #define IE_FUNCEXP
        #define IE_HUGE
    #else
        #error Unknown Complier platform
    #endif

    typedef int32     FREQUENCY;    /* Frequency data item.             */
    typedef double    FREQ8500;     /* frequency type for 9085          */
    typedef int32     USECS;        /* Microseconds.  Time val data item*/
    typedef int16     AMPL;         /* Amplitude data item.             */
    typedef double    NANOVOLT;     /* Linear amp data in nanovolts.    */

    /* -------------------------------------------------------------------- */
    /*  Compiler not in set pre-tested by Morrow Technologies or makefile
        predefines are incorrect.  Investigation is warranted.  Contact
        Morrow Technologies or use the best fit from the options above.     */
    /* -------------------------------------------------------------------- */
    #ifndef IE_COMPILER_NAME
        #error This is an unknown compiler!
    #endif

#endif


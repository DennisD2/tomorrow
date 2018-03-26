#ifndef ___SAPFORM_H___
#define ___SAPFORM_H___

/*===========================================================================*/
/* First, DETERMINE the COMPILER being used                                  */
/*===========================================================================*/
#if !defined(MR90XX_COMPILER_MSC) && !defined(MR90XX_COMPILER_BC40) && !defined(MR90XX_COMPILER_LW40)
    #if defined(_MSC_VER) && !defined(_CVI_)
        #define MR90XX_COMPILER_MSC
    #elif defined(__BORLANDC__) || defined(__TURBOC__)
        #define MR90XX_COMPILER_BC40
    #elif defined(_CVI_)
        #define MR90XX_COMPILER_LW40
    #elif defined(__GNUC__)
        #define MR90XX_COMPILER_GNUC
    #else
        #error "Compiler type is unknown!"
    #endif
#endif
/*-------------------------------------------------------*/
/* fill-in the name of the compiler identified           */
/*-------------------------------------------------------*/
#if defined(MR90XX_COMPILER_MSC)
    #define MR90XX_NAME_COMPILER " MicroSoft "   
    /* Disable the "nonstandard extension 'single line comment' was used" warning */
    #pragma warning( disable : 4001 )
#elif defined(MR90XX_COMPILER_BC40)
    #define MR90XX_NAME_COMPILER " Borland "
#elif defined(MR90XX_COMPILER_LW40)
    #define MR90XX_NAME_COMPILER " LabWindows/CVI "
#elif defined(MR90XX_COMPILER_GNUC)
    #define MR90XX_NAME_COMPILER " GNU C 64Bit "
#else 
    #define MR90XX_NAME_COMPILER " (Unknown compler) "
#endif

/*===========================================================================*/
/*  Second, DETERMINE the OPERATING SYSTEM.  ie Is this is a DOS, 
    16-bit Windows, 32-bit Windows, or Windows NT target?                    */
/*===========================================================================*/
#if !defined(MR90XX_OS_DOS16) && !defined(MR90XX_OS_WIN16) && !defined(MR90XX_OS_WIN32)
    #if (defined(_MSDOS) || defined(MSDOS) || defined(__MSDOS__)) && !defined(_WINDOWS) && !defined(_Windows)
        #define MR90XX_OS_DOS16
    #elif (defined(_WINDOWS) || defined(_Windows)) && !defined(__WIN32__) && !defined (WIN32)
        #define MR90XX_OS_WIN16
    #elif defined(WIN32) || defined(_WIN32) || defined(__WIN32) || defined(__WIN32__)
        #define MR90XX_OS_WIN32
     #elif defined(__GNUC__) 
        #define MR90XX_OS_LINUX
   #else
        #error Could not determine if DOS16, WIN16, or WIN32 compile.
    #endif
#endif  
/*-------------------------------------------------------*/
/* fill in the name of the O/S identified.               */
/*-------------------------------------------------------*/
#if defined(MR90XX_OS_DOS16) 
    #define MR90XX_NAME_OS " 16-bit DOS "
#elif defined(MR90XX_OS_WIN16)
    #define MR90XX_NAME_OS " 16-bit Windows "
#elif defined(MR90XX_OS_WIN32)
    #define MR90XX_NAME_OS " 32-bit Windows "
#elif defined(MR90XX_OS_LINUX)
    #define MR90XX_NAME_OS " 64-bit Linux "
#else
    #define MR90XX_NAME_OS " (Unknown OS) "
#endif

/*===========================================================================*/
/* Third, DETERMINE if LIBRARY TYPE.  ie Is this is being compiled for static 
   or dynamic use                                                            */
/*===========================================================================*/
#if !defined(MR90XX_LINK_DYNAMIC) && !defined(MR90XX_LINK_STATIC)
   
    #if defined(_WINDLL) || defined(_WINDLL32) || defined(_DLL)
        #define MR90XX_LINK_DYNAMIC
    #else
        #define MR90XX_LINK_STATIC
    #endif
#endif
/*-------------------------------------------------------*/
/* fill in name of library type.                         */
/*-------------------------------------------------------*/
#if defined(MR90XX_LINK_DYNAMIC)
    #define MR90XX_NAME_LINK " Dynamic "
#elif defined(MR90XX_LINK_STATIC)
    #define MR90XX_NAME_LINK " Static "
#else
    #define MR90XX_NAME_LINK " (Unknown link) "
#endif


/*===========================================================================*/
/* Finally, DEFINE REQUIRED MACROS based upon interface type                 */
/*===========================================================================*/
#if defined(__GNUC__)
    #define MR90XX_IFACE_SICL
#endif

#if defined(MR90XX_IFACE_VISA)
    /*  VISA BUILD - Define the correct National Instruments preprocessor 
        macro for the operating system determined earlier in this header.   */
    #define MR90XX_NAME_IFACE " VISA "
    #if defined(MR90XX_IFACE_WIN16) && !defined(_NI_mswin16_)
        #pragma message("Defining _NI_mswin16_ for 16-bit VISA build")
        #define(_NI_mswin16_)
    #elif defined(MR90XX_IFACE_WIN32) && !defined(_NI_mswin32_)
        #pragma message("Defining _NI_mswin32_ for 32-bit VISA build")
        #define(_NI_mswin32_)
    #endif

#elif defined(MR90XX_IFACE_VXI)
    /*  VXI build.  Define the correct National Instruments preprocessor macros 
        based upon the operating system determine earlier in this header.  
        The possible macros are - VXIDOS, VXIWIN, VXIWIN32, VXINT             */
    #define MR90XX_NAME_IFACE " VXI "
    #if defined(MR90XX_OS_DOS16)
        #ifndef VXIDOS
            #pragma message("  SAPFORM.H is defining VXIDOS")
            #define VXIDOS
        #endif
        #ifndef VXINT
            #pragma message("  SAPFORM.H is defining VXINT to prevent compiler warnings in DATASIZE.H")
            #define VXINT
        #endif            
    #elif defined(MR90XX_OS_WIN16)
        #ifndef VXIWIN
            #pragma message("  SAPFORM.H is defining VXIWIN")
            #define VXIWIN
        #endif            
    #elif defined(MR90XX_OS_WIN32)
        #ifndef VXIWIN32
            #pragma message("  SAPFORM.H is defining VXIWIN32")
            #define VXIWIN32
        #endif            
    #else
        #error A MR90XX_OS_*** MACRO NEEDS TO BE DEFINED IN SAPFORM.H
    #endif        
    /* end of VXI section */
#elif defined(MR90XX_IFACE_ISA)
    #define MR90XX_NAME_IFACE " ISA "
#elif defined(MR90XX_IFACE_ISA_NT)
    #define MR90XX_NAME_IFACE " ISA-NT "
#elif defined(MR90XX_IFACE_SERIAL)
    #define MR90XX_NAME_IFACE " SERIAL "
#elif defined(MR90XX_IFACE_FAKE)
    #define MR90XX_NAME_IFACE " FAKE "
#elif defined(MR90XX_IFACE_MODEM)
    #define MR90XX_NAME_IFACE " MODEM "
#elif defined(MR90XX_IFACE_TCPIP)
    #define MR90XX_NAME_IFACE " TCP/IP "
#elif defined(MR90XX_IFACE_MXI)
    /*  MXI build.  Define the correct National Instruments preprocessor macros 
        based upon the operating system determine earlier in this header.  
        The possible macros are - VXIDOS, VXIWIN, VXIWIN32, VXINT             */
    #define MR90XX_NAME_IFACE " MXI "
    #if defined(MR90XX_OS_DOS16)
        #ifndef VXIDOS
            #pragma message("  SAPFORM.H is defining VXIDOS")
            #define VXIDOS
        #endif            
        #ifndef VXINT
            #pragma message("  SAPFORM.H is defining VXINT to prevent compiler warnings in DATASIZE.H")
            #define VXINT
        #endif            
    #elif defined(MR90XX_OS_WIN16)
        #ifndef VXIWIN
            #pragma message("  SAPFORM.H is defining VXIWIN")
            #define VXIWIN
        #endif
    #elif defined(MR90XX_OS_WIN32)
        #ifndef VXIWIN32
            #pragma message("  SAPFORM.H is defining VXIWIN32")
            #define VXIWIN32
            #if defined(__BORLANDC__) && !defined(VXINT)
                 #define VXINT
            #endif

        #endif            
    #else
        #error "A MR90XX_OS_*** MACRO NEEDS TO BE DEFINED IN SAPFORM.H"
    #endif        
    /* end of MXI section */

#elif defined(MR90XX_IFACE_SICL)
    #define MR90XX_NAME_IFACE " SICL "     

#elif defined(MR90XX_IFACE_POLY) || defined(MR90XX_IFACE_UNIFIED)
    /*  POLY BUILD - Define any and all of the correct National Instruments 
        preprocessors defines.  This version allows one version of the lib
        to handle multiple platforms.  Still in infant form but this feature
        will be fleashed out in the future.                                   */
    #define MR90XX_NAME_IFACE " ALL "     
    #if defined(MR90XX_OS_DOS16)
        #ifndef VXIDOS
            #pragma message("  SAPFORM.H is defining VXIDOS")
            #define VXIDOS
        #endif
        #ifndef VXINT
            #pragma message("  SAPFORM.H is defining VXINT to prevent compiler warnings in DATASIZE.H")
            #define VXINT
        #endif            
    #elif defined(MR90XX_OS_WIN16)
        #ifndef VXIWIN
            #pragma message("  SAPFORM.H is defining VXIWIN")
            #define VXIWIN
        #endif            
    #elif defined(MR90XX_OS_WIN32)
        #ifndef VXIWIN32
            #pragma message("  SAPFORM.H is defining VXIWIN32")
            #define VXIWIN32
        #endif            
    #else
        #error A MR90XX_OS_*** MACRO NEEDS TO BE DEFINED IN SAPFORM.H
    #endif        
#else 
    #error "Interface type not specified, choose one of:"
    #error    "MR90XX_IFACE_POLY, MR90XX_IFACE_ISA, MR90XX_IFACE_ISA_NT, MR90XX_IFACE_SERIAL, MR90XX_IFACE_MODEM, MR90XX_IFACE_VISA, MR90XX_IFACE_VXI, MR90XX_IFACE_MXI, MR90XX_IFACE_SICL, MR90XX_IFACE_FAKE"
#endif   

#ifndef MR90XX_COMPILER_LW40
    #pragma message("    " MR90XX_NAME_COMPILER MR90XX_NAME_OS MR90XX_NAME_LINK MR90XX_NAME_IFACE)    
#endif

#endif  



s��        ݑ   � ��  (   �   ����                               mr90xx      MR90XX - Spectrum Analyzer                    � � ��ViInt16     � ��ViUInt16     � ��ViPInt16  �  � ��ViInt32     � ��ViUInt32     � ��ViPInt32  � � ��ViReal64     	�  ViInt16[]     	�  ViInt32[]     
�  	ViReal64[]     � ��ViRsrc     
�  	ViUInt16[]     	� 	��ViSession     
  
��ViPSession     �  ViChar[]     � ��ViStatus     	� 	��ViBoolean  � � 	 
ViBoolean[]     � ��NANOVOLT     
� 
��IE_HAMPL *     � ��AMPL     � ��USECS     � ��UNINT     
�  	IE_HAMPL[]     
�  	IE_HFREQ[]  M    
             MORROW TECHNOLOGIES Model MR90XX


The Morrow Technologies model V9052 Spectrum Analyzer (Engine) is installed directly into the IBM type PCAT and has a frequency range of 10KHz to 1.6 GHz with the accuracy of fully synthesized tuning.

The Morrow Technologies model V9054/84 engine is the VXI based version of the spectrum analyzer and fits into a standard VXI chassis.  

This LabWindows Instrument Driver has high level application functions with the remainder being low level functions:

1.  The Application Class functions perform 9052 tasks through multiple calls to the low level functions in the C Engine Library.

2.  The low level functions are termed "C Engine Library Functions" and are the definitive and lowest level set of functions, grouped into Classes, that the calling application should use to control the V9052/54 engine.


The C Engine Libraries may be compiled for the PC bus interface (V9052 engine) or the VXI interface (V9054/84 engine). 

Associated documents include the Programmer's Reference Manual, the V9052/4 User Manual, and V9052/4 Technical Notes.

    $    These direct engine commands communicate over the VXI interface to the 2 engine processors.  One processor implements the VXI communication interface and the second processor handles engine data collection.

The V9054 engine conforms to all the requirements of a VXI Word Serial Device.  

     �    This Class of functions is used to determine the acquisition mode that the hardware engine has completed (or is in progress)
and to read (GET) the data from the 9052 engine hardware memory into calling application memory organized as array(s).
     �    The Initialization and Utility Class includes miscellaneous functions which are required in the course of developing a full 9052 application.      D    Opens a session based upon information encode in 'rName', queries the instrument for its ID, initialize engine and internal structures and configures communication interface. Assigns session_id with an appropriate identifier which is used to address device in all the data manipulation and engine communication functions.     l    This control specifies the interface and address of the device that is to be initialized (Instrument Descriptor). The exact grammar to be used in this control is shown in the note below. 

Default Value:  "GPIB-VXI::1"

Notes:

(1) Based on the Instrument Descriptor, this operation establishes a communication session with a device.  The grammar for the Instrument Descriptor is shown below.  Optional parameters are shown in square brackets ([]).

Interface   Grammar
------------------------------------------------------
VXI         KEYWORD[board]::VXI logical address[::INSTR]
            
The VXI keyword is used for VXI instruments via either embedded or MXIbus controllers.  Using the VISA.DLL VXI interface mode.

The default value for optional parameters are shown below.

Optional Parameter          Default Value
-----------------------------------------
board                       0
GPIB-VXI primary address    1



For the V905x instrument, the following keywords are available to support both the V9054 and V9052 spectrum analyzers in several configurations while maintaining the use of the standard Plug and Play instrument driver.

                                 Interface  
Session Type        Instrument   Keyword       
--------------------------------------------
 VXI                  V9054                   
   NI-VXI (MXI)         "         NIVXI  (not implemented) 
   NI-VXI (embedded)    "         NIVXI  (not implemented)
   VISA/VTL             "         VXI 
   SICL                 "         SICL   (not implemented) 
ISA                   V9052       ISA  
SERIAL                V9052       SERIAL (not implemented)
  
NOTES: 1. Hewlett Packard SICL is not supported.                            
       2. Serial sessions are not supported circa 09-26-96                  
       3. MTC C Library CORE and GLUE DLLs not available for  
          NI-VXI DLL use.
         
Identification query.
     =    Reset status. Engine is reset when reset status is  IE_TRUE     �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.    �    RETURNS:

MR90XX_IE_SUCCESS      initialization is sucessfull

VI_ERROR_PARAMETER1    First argument (rname)passed to this                                                    
                       function was invalid

VI_ERROR_PARAMETER2    Second argument (IDQuery) passed to this 
                       function was invalid

VI_ERROR_PARAMETER3    Third argument (reset) passed to this 
                       function was invalid

VI_ERROR_PARAMETER4    Fourth argument (sessionID) passed to 
                       this function was invalid

MR90XX_ERROR_NOSESSION Failure to open session - SET9052 memory 
                       not allocated.      
�  i  �  �    resourceName                      Q + �       IDQueryFlag                       r X) �       ResetFlag                         � O � �       SessionHandle                     J � 	���       Status                             "VXI0::127::INSTR"    On 1 Off 0   On 1 Off 0    	            	            D    This function closes the device session and shut downs the engine.     �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     �    RETURNS:

MR90XX_IE_SUCCESS   Engine is properly shutdown and session is successfully closed.
IE_FAILURE  Engine or/and session were not closed properly. 
    � #   �       SessionHandle                      K ���       Status                                 	            %    This function resets the instrument     �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device    �    RETURNS:

MR90XX_IE_SUCCESS       Engine is sucessfully reset

VI_WARN_NSUP_RESET      Reset function is not supported by the   
                        instrument

MR90XX_REPLY_BUSY       Engine is busy processing command.

MR90XX_REPLY_BAD_CMD    Engine does not recognize command #.",

MR90XX_REPLY_ERROR_GEN  General error.  No hex table on Cmd 4 .

MR90XX_REPLY_BAD_PARM1  Engine does not recognize 1st parameter 
                         of cmd.

MR90XX_REPLY_BAD_PARM2  Engine does not recognize 2nd parameter           
                        of cmd.

MR90XX_REPLY_BAD_PARM3  Engine does not recognize 3rd parameter 
                        of cmd

    _ $   �       SessionHandle                     � N ���       Status                                 	            G    This function executes  instrument self-test and returns the result.      �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device         Result of the self _test     B    Character string stores messages generated during the self test.     |    RETURNS:

VI_WARN_NSUP_SELF_TEST  The self test function is not supported    
                        by the instrument       V     �       SessionHandle                     � < � �       SelfTestResult                    
 8 �       Self Test Message                 T v ���       Status                          ���� � ��                                                	            	            	            2This function is  not supported by the instrument    L    This function queries the instrument error queue, and returns the result.      �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     -    Error code for which information is queried     K    Character string stores  error information returned by this function .        �    RETURNS:
 
VI_WARN_NSUP_ERROR_QUERY If the error query function is not          
                         supported by the instrument.     �    �       Sessionhandle                     !% C � �       ErrorCode                         !Z C �       Error Message                     !� p ���       Status                          ���� � ��                                                	            	            	            2This function is not supported by the instrument.    {    This function Translates the error return value from the instrument driver into a user-readable string.                       �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     /    error code to be translated by this function.     <    character string stores  translation of the error code  .      �    RETURNS:

MR90XX_IE_SUCCESS       error code is successfully translated     
                        and stroed in errMessage array
VI_WARN_UNKNOWN_STATUS  Error code is invalid

    $&  %  �       SessionHandle                     $� < � �       ErrorCode                         $� >	 �       ErrorMessage                      %4 f '���       Status                                         	            ?    This function returns the driver and instrument revisions.        �    Session Handle.This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     V    Character string which holds driver revision information generated by this function.     Z    Character string which holds instrument revision information generated by this function.     �    RETURNS:  

VI_WARN_NSUP_REV_QUERY  revision query function is not supported
                        by the instrument.                    
    '$     �       SessionHandle                     '� I � �       DriverRevision                    ( F � �       FirmwareRevision                  (w � ���       Status                          ���� � ��                                                	            	            	            2This function is not supported by the instrument.    �    Initialize MTC spectrum analyzer for sweep with cell mode off 
Set appropriate automatic modes and set  SET9052 structure elements with passed arguments.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     )    Start frequency  for normal sweep in Hz     '    Stopfrequency  for normal sweep in Hz     �    Default number of sweep points . 

 As long as calibration can be maintained number of samples returned by the engine will be same as num_points set by this function.     �    On failure:  Status of a function which failed when called 
             internally by this function.

MR90XX_IE_SUCCESS   SET9052 is successfully initiated for normal 
                    sweep     �    RBW code for the sweep. Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.        VBW code for the sweep. Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.    +    �       SessionHandle                     +� B� �       StartFreq                         ,% n � �       StopFreq                          ,T pt �       DefltNumPt                        - �  ���       status                            -� C f �      RbwCode                           .� C
 �      VbwCode                                        501    	            MR90XX_RBW_AUTO    MR90XX_VBW_AUTO    �    Set appropriate automatic modes for sweep with cell mode on.  Set SET9052 structure elements with passed arguments. This function must be called atleast once before making call to any of the Measure functions.      �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     *    Start frequency for normal sweep in Hz.      )    Stop frequency for normal sweep in Hz.          Reference level in dB.         Number of cell points     �    
On failure:  Status of a function which failed when called  
             internally by this function.

MR90XX_IE_SUCCESS   SET9052 is successfully initiated for normal 
                    sweep      �    RBW code for the sweep. Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.        VBW code for the sweep. Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.    2    �       SessionHandle                     3] >� �       StartFreq                         3� j f �       StopFreq                          3� h �       RefLevel                          3� h� �       CellNum                           3� � ���       Status                            4� > _ �      RbwCode                           5� > �      VbwCode                                                	            MR90XX_RBW_AUTO    MR90XX_VBW_AUTO    �    
Set appropriate automatic modes for zero span sweep with cell mode off.  Set SET9052 structure elements with passed arguments.

ADDITIONAL NOTES:
Default value for zero span sample rate is set to 50,000.

     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system      .    Center frequency for zero span sweep in Hz.      �    Default zero span sample numbers. Deflt_pt_cnt member of SET9052 structure is set with this argument . As long as calibration can be maintained. Number of Samples returned by the engine will be same as num_points set by this function.     �    RETURNS:

On failure:  Status of a function which failed when called 
             internally by this function.

MR90XX_IE_SUCCESS   SET9052 is successfully initiated for zero    
                    span sweep 
     �    RBW code for the sweep. Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.        VBW code for the sweep. Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.    9�    �       SessionHandle                     :b A� �       CenterFreq                        :� o  �       DefaltNumPts                      ;� � ���       Status                            <j A ~ �      RbwCode                           =` A �      VbwCode                                    501    	            MR90XX_RBW_AUTO    MR90XX_VBW_AUTO        Set appropriate automatic modes for zero span sweep with cell mode on.  Set  SET9052 structure elements with passed arguments     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     .    Center frequency for Zero span sweep in Hz.          Reference level in dB.         number of cell points      �    RETURNS:

On failure:  Status of a function which failed when called  
             internally by this function.

MR90XX_IE_SUCCESS   SET9052 is successfully initiated for zero      �    RBW code for the sweep. Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.        VBW code for the sweep. Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.    @�  
  �       SessionHandle                     Ai @� �       CenterFreq                        A� l � �       RefLevel                          A� lY �       CellNum                           A� � 
���       Status                            B� ? k �      RbwCode                           C� > � �      VbwCode                                            	            MR90XX_RBW_AUTO    MR90XX_VBW_AUTO    �    Set appropriate automatic modes for directed search mode data capture (Frequency Hop).  Set SET9052 structure element with passed arguments.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.         Reference level in db.     .    Number of frequency points to be stepped to.     �    On failure:  Status of a function which failed when called 
             internally by this function.
  
MR90XX_IE_SUCCESS   SET9052 is successfully initiated for 
                    frequency HOP. 
     �    RBW code for the sweep. Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.        VBW code for the sweep. Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.    G   	  �       SessionHandle                     G� >� �       RefLevel                          G� g i �       HopTbCnt                          H4 � 	���       Status                            I = i �      RbwCode                           I� = � �      VbwCode                                        	            MR90XX_RBW_AUTO    MR90XX_VBW_AUTO   
    Set appropriate settings for normal sweep which returns min/max value of amplitude and frequency from each cell. Starts sweep and gathers data from the FIFO of the engine. Stores measured data in to ouput arguments in the format (dbm,nV,uV) indicated by an input argument.

 Note        : This function does not call init functions.This is to allow a calling application to set GUI settings for step_size,swp_time,detect_log and trigmode.We recommend to call IntGuiSweep atleast once before making call to this function.        Value of rbw. Use MR90XX_RBW_AUTO to set rbw mode Automatically.

Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.       H    Value of vbw. Use MR90XX_VBW_AUTO to set Vbw mode Automatically   
Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.         Start frequency in Hz.         Stop frequency in Hz.         Referance level in dB.         Number of cell points.        This argument specifies the format of the amplitude stored in to the output argument DataArray. 


MR90XX_DBM_FORMAT: return data in Dbm
MR90XX_NV_FORMAT : return data in neno volt 
MR90XX_UV_FORMAT : return data in micro volt

Default is set with MR90XX_DBM_FORMAT.     �    This is an output argument. Output amplitude data is stored in to this array. Format of the amplitude data is specified with 'DataFormat' argument.     S    This is an output argument. Output frequency values are stored in to this array.      H    MR90XX_IE_SUCCESS on success
Status of the failed function on failure.     �    MR90XX_SWP_MIN for min amplitude value from each cell
MR90XX_SWP_MAX for max amplitude value from each cell

Default value is set with MR90XX_SWP_MIN.  ���� :    �       SessionHandle                     N� 9  �      RbwCode                           O� < � �      VbwCode                           Q" <� �       StartFreq                         QB f } �       StopFreq                          Qa f � �       RefLevel                          Q� g� �       CellNum                           Q� � � � ~    DataFormat                        R� � } 	�       DataArray                         SR � 
�       FreqArray                         S�  ���       Status                          ����,  ��                                           S� � { ��      MinOrMax                               MR90XX_RBW_AUTO    MR90XX_VBW_AUTO                    MR90XX_DBM_FORMAT    	            	            	            zAllocate memory for DataArray and FreqArray before passing  them to this function. 
Use 'CellNum ' for memory allocation.    MR90XX_SWP_MIN    �    Set appropriate settings for normal sweep which returns min/max value of amplitude from each cell.Starts sweep and gather data from the FIFO of the engine. Store measured data in to ouput arguments in the format(dbm,nV,uV)indicated by an input argument.        Value of rbw. Use RBW_AUTO to set rbw mode Automatically   

Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.       B    Value of vbw. Use VBW_AUTO to set Vbw mode Automatically 

Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.           Start frequency in Hz.         Stop frequency in Hz.         Reference level in dB.         Number of cell points.     m    MR90XX_SWP_MIN for min ampletude value from each cell
MR90XX_SWP_MAX for max amplitude value from each cell        This argument specifies the format of the amplitude stored in to the output argument DataArray. 


MR90XX_DBM_FORMAT: return data in Dbm
MR90XX_NV_FORMAT : return data in neno volt 
MR90XX_UV_FORMAT : return data in micro volt

Default is set with MR90XX_DBM_FORMAT.     �    This is an output argument. Output amplitude data is stored in to this array. Format of the amplitude data is specified with 'DataFormat' argument.     H    MR90XX_IE_SUCCESS on success
Status of the failed function on failure.  ����    �       Sessionhandle                     YW B w �      RbwCode                           Zu B � �      VbwCode                           [� B �       StartFreq                         [� l t �       StopFreq                          [� l � �       RefLevel                          \ o� �       CellNum                           \> � w ��      MinOrMax                          \� � � �� ~    DataFormat                        ]� �� 	�       DataArray                         ^d � ���       Status                          ���� ��                                            0    MR90XX_RBW_AUTO    MR90XX_VBW_AUTO                    MR90XX_SWP_MIN    Mr90XX_DBM_FORMAT    	            	            jAllocate memory for DataArray  before passing it to this function. 
Use 'CellNum ' for memory allocation.       Set appropreate settings for normal sweep which returnsminvalue ,max value of amplitude and frequency from each cell.Start sweep and gather data from the FIFO of the engine. Store measured data in to ouput arguments in the format(dbm,nV,uV)indicated by an input argument.        Value of rbw. Use RBW_AUTO to set rbw mode Automatically 

Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.         B    Value of vbw. Use VBW_AUTO to set Vbw mode Automatically  

Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.          Start frequency in Hz.         Stop frequency in Hz.         Reference level in dB.          Number of cell points.     �    MR90XX_DBM_FORMAT: return data in Dbm
MR90XX_NV_FORMAT : return data in neno volt 
MR90XX_UV_FORMAT : return data in micro volt     �    This is an output argument. Output max amplitude data is stored in to this array. Format of the amplitude data is specified with 'DataFormat' argument.     H    MR90XX_IE_SUCCESS on success
Status of the failed function on failure.     �    This is an output argument. Output min amplitude data is stored in to this array. Format of the amplitude data is specified with 'DataFormat' argument.     W    This is an output argument. Output min frequency values are stored in to this array.      W    This is an output argument. Output max frequency values are stored in to this array.   ����     �       Sessionhandle                     c0 B x �      RbwCode                           dN ? � �      VbwCode                           e� ?� �       StartFreq                         e� j t �       StopFreq                          e� i �       RefLevel                          e� h� �       CellNum                           f �� �� ~    DataFormat                        f� � 	�       MaxDataArray                      gB � ���       Status                          ���� ��                                           g� � u �       MinDataArray                      h3 �� 
�       MinFreqArray                      h� � � �       MaxFreqArray                       0    MR90XX_RBW_AUTO    MR90XX_VBW_AUTO                    MR90XX_DBM_FORMAT    	            	            �Allocate memory for MinDataArray, MaxDataArray,MinFreqArray and MaxFreqArray  before passing  them to this 
function. 
Use 'CellNum ' for memory allocation.    	            	            	               Set appropreate settings for normal sweep which returns. minvalue and max value of amplitude from each cell.Start sweep and gather data from the FIFO of the engine. Store measured data in to ouput arguments in the format(dbm,nV,uV)indicated by an input argument.        Value of rbw. Use RBW_AUTO to set rbw mode Automatically


Possible values are

MR90XX_RBW_300HZ
MR90XX_RBW_3KHZ
MR90XX_RBW_30KHZ
MR90XX_RBW_300KHZ
MR90XX_RBW_3MHZ
MR90XX_RBW_AUTO

Above macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_RBW_AUTO.          B    Value of vbw. Use VBW_AUTO to set Vbw mode Automatically 

Possible values are

MR90XX_VBW_NONE
MR90XX_VBW_3HZ
MR90XX_VBW_30HZ
MR90XX_VBW_300HZ
MR90XX_VBW_3KHZ
MR90XX_VBW_30KHZ
MR90XX_VBW_300KHZ
MR90XX_VBW_3MHZ
MR90XX_VBW_AUTO

These macros are defined under MR_DEFIN.H file.
Default value is set with MR90XX_VBW_AUTO.           Start frequency in Hz.         Stop frequency in Hz.         Reference level in Hz.     �    This is an output argument. Output min amplitude data is stored in to this array. Format of the amplitude data is specified with 'DataFormat' argument.     �    This is an output argument. Output max amplitude data is stored in to this array. Format of the amplitude data is specified with 'DataFormat' argument.     �    MR90XX_DBM_FORMAT: return data in Dbm
MR90XX_NV_FORMAT : return data in neno volt 
MR90XX_UV_FORMAT : return data in micro volt     H    MR90XX_IE_SUCCESS on success
Status of the failed function on failure.         Number of cell points.  ����     �       Sessionhandle                     n @ l �      RbwCode                           o2 B �      VbwCode                           p| ?� �       StartFreq                         p� i l �       StopFreq                          p� h �       RefLevel                          p� � k �       MinDataArray                      q| � 	�       MaxDataArray                      r �� �� ~    DataFormat                        r� �  ���       Status                          ���� ��                                           r� j� �       CellNum                            0    MR90XX_RBW_AUTO    MR90XX_VBW_CODE                	            	            MR90XX_DBM_FORMAT    	            �Allocate memory for MinDataArray and MaxDataArray  before passing  them to this function. 
Use 'CellNum ' for memory allocation.        �    Initializes internal structures and opens a session based upon information encoded in 'sessionstring'. Assigns session_id with an appropriate identifier which is used to address device in all the data manipulation and engine communication functions.     �    
This control contains the status code returned by the function call.

Possible Status Codes are listed below:
RETURNS:

MR90XX_IE_SUCCESS   If internal structures were initialized 
                    and connection was successful.  
MR90XX_IE_FAILURE   Otherwise

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0102  Reset not supported - VI_WARN_NSUP_RESET      
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  No listeners condition was detected.
BFFF0060  This interface is not the controller in charge.
BFFF0067  Operation is not supported on this session.


V905x Instrument Specific Error Codes.  see also file mr_defin.h

MR90XX_IE_FAILURE  From Engine - General Function Failure." },     
MR90XX_IE_SUCCESS  From Engine - No Error - SUCCESS." },      
MR90XX_IE_ERRORR:  From Engine - General Error." },    
MR90XX_IE_ERR_VALS From Engine - Argument out of range, or null 
    pointer arg.    
MR90XX_IE_ERR_AUTO From Engine - Value can't be manually set 
    because of auto mode    ."},
MR90XX_IE_ERR_SPAN From Engine - Start and Stop frequency span 
    parameters error.
                                                                
MR90XX_IE_ERR_STEP  From Engine - Specified span is too narrow 
    for number of points.
MR90XX_IE_ERR_DWELL From Engine - Tried to set to non-auto mode 
    when dwell is defined.
MR90XX_IE_ERR_DIFDTEC From engine - a different detector is 
    needed for the attempted operation.
MR90XX_IE_WARN_VALS  From Engine - Value is out of range but 
    still acceptable.
      
MR90XX_ERROR_NODECODE  Failure to decode magic number and 
    SET9052 pointer from session handle. 
MR90XX_ERROR_NOSESSION Failure to initialize session - SET9052 
    memory not allocated.


MR90XX_REPLY_BUSY From Engine - Engine is busy processing 
    command.
MR90XX_REPLY_ACK,          From Engine - Acknowledgement of 
    command byte.
MR90XX_REPLY_NOMAIN,       From Engine - No main code programmed 
    into flash.
MR90XX_REPLY_NODSP,        From Engine - No DSP code programmed 
    into flash .
MR90XX_REPLY_NOCAL,        From Engine - No Calibration tables 
    programmed into flash.
MR90XX_REPLY_ERASE,        From Engine - Error while trying to 
    erase FLASH .
MR90XX_REPLY_FLASH,        From Engine - Error while trying to 
    program FLASH.
MR90XX_REPLY_NYBYTES,      From Engine - Invld # bytes recv'd in 
    program data buf.
MR90XX_REPLY_CKSUM,        From Engine - Invld checksum recv'd 
    with prog data buf.
MR90XX_REPLY_COLON,        From Engine - First char in data 
    buffer not a colon.
MR90XX_REPLY_BAD_CMD,      From Engine - Engine does not 
    recognize command #.
MR90XX_REPLY_ERROR_GEN,    From Engine - General error.  No hex 
    table on Cmd 4 .
MR90XX_REPLY_BAD_PARM1,    From Engine - Engine does recognize 
    1st param of cmd.
MR90XX_REPLY_BAD_PARM2,    From Engine - Engine does recognize 
    2nd param of cmd.
MR90XX_REPLY_BAD_PARM3,    From Engine - Engine does recognize 
    3rd param of cmd.
MR90XX_REPLY_BAD_PARM4,    From Engine - Engine does recognize 
    4th param of cmd.
MR90XX_REPLY_BAD_PARM5,    From Engine - Engine does recognize 
    5th param of cmd.
MR90XX_REPLY_BAD_PARM6,    From Engine - Engine does recognize 
    6th param of cmd.
MR90XX_REPLY_BAD_PARM7,    From Engine - Engine does recognize 
    7th param of cmd.
MR90XX_REPLY_BAD_PARM8,    From Engine - Engine does recognize 
    8th param of cmd.
MR90XX_REPLY_BAD_PARM9,    From Engine - Engine does recognize 
    9th param of cmd.
MR90XX_IE_ERR_DTEC,        From Engine - CommTrigDetect called 
    inside sweep cmds.
MR90XX_IE_ERR_TRIG,        From Engine - Trigger or Detector 
    parameter error.
MR90XX_REPLY_INMAIN,       From Engine - Executing from main 
    code block after reset.
MR90XX_REPLY_INBOOT,       From Engine - Executing from boot 
    code block after reset.
MR90XX_REPLY_INWEEDS,      From Engine - Execution of boot block 
    began but control did not transfer.

    '    Unique symbolic name of the of the instrument which specifies interface type and a logical address of device.  Format of this address string is:  interface :: logic address::INSTR   


This control specifies the interface and address of the device that is to be initialized (Instrument Descriptor). The exact grammar to be used in this control is shown in the note below. 

Default Value: VXI0::INSTR::127

Notes:

(1) Based on the Instrument Descriptor, this operation establishes a communication session with a device.  The grammar for the Instrument Descriptor is shown below.  Optional parameters are shown in square brackets ([]).

Interface   Grammar
------------------------------------------------------
VXI         KEYWORD[board]::VXI logical address[::INSTR]
            
The VXI keyword is used for VXI instruments via either embedded or MXIbus controllers.  Using the VISA.DLL VXI interface mode.

The default value for optional parameters are shown below.

Optional Parameter          Default Value
-----------------------------------------
board                       0
GPIB-VXI primary address    1



For the V905x instrument, the following keywords are available to support both the V9054 and V9052 spectrum analyzers in several configurations while maintaining the use of the standard Plug and Play instrument driver.

                                 Interface  
Session Type        Instrument   Keyword       
--------------------------------------------
 VXI                  V9054                   
   NI-VXI (MXI)         "         NIVXI  (not implemented) 
   NI-VXI (embedded)    "         NIVXI  (not implemented)
   VISA/VTL             "         VXI 
   SICL                 "         SICL   (not implemented) 
ISA                   V9052       ISA  
SERIAL                V9052       SERIAL (not implemented)
  
NOTES: 1. Hewlett Packard SICL is not supported.                            
       2. Serial sessions are not supported circa 09-26-96                  
       3. MTC C Library CORE and GLUE DLLs not available for  
          NI-VXI DLL use.
    w� n ����       Status                            �[ ( %  �  �    resourceName                    ���� & � �       SessionHandle                      	           "VXI0::127::INSTR"    	            a    This function closes a session that was formerly opened with the mr90xx_OpenSession() function.    g    
This control contains the status code returned by the function call.

Possible Status Codes are listed below:
MR90XX_IE_SUCCESS  On Success 
MR90XX_IE_FAILURE  Otherwise

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0102  Reset not supported - VI_WARN_NSUP_RESET      
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  No listeners condition was detected.
BFFF0060  This interface is not the controller in charge.
BFFF0067  Operation is not supported on this session.


V905x Instrument Specific Error Codes.  see also file mr_defin.h

MR90XX_IE_FAILURE  From Engine - General Function Failure." },     
MR90XX_IE_SUCCESS  From Engine - No Error - SUCCESS." },      
MR90XX_IE_ERRORR:  From Engine - General Error." },    
MR90XX_IE_ERR_VALS From Engine - Argument out of range, or null 
    pointer arg.    
MR90XX_IE_ERR_AUTO From Engine - Value can't be manually set 
    because of auto mode    ."},
MR90XX_IE_ERR_SPAN From Engine - Start and Stop frequency span 
    parameters error.
                                                                
MR90XX_IE_ERR_STEP  From Engine - Specified span is too narrow 
    for number of points.
MR90XX_IE_ERR_DWELL From Engine - Tried to set to non-auto mode 
    when dwell is defined.
MR90XX_IE_ERR_DIFDTEC From engine - a different detector is 
    needed for the attempted operation.
MR90XX_IE_WARN_VALS  From Engine - Value is out of range but 
    still acceptable.
      
MR90XX_ERROR_NODECODE  Failure to decode magic number and 
    SET9052 pointer from session handle. 
MR90XX_ERROR_NOSESSION Failure to initialize session - SET9052 
    memory not allocated.


MR90XX_REPLY_BUSY From Engine - Engine is busy processing 
    command.
MR90XX_REPLY_ACK,          From Engine - Acknowledgement of 
    command byte.
MR90XX_REPLY_NOMAIN,       From Engine - No main code programmed 
    into flash.
MR90XX_REPLY_NODSP,        From Engine - No DSP code programmed 
    into flash .
MR90XX_REPLY_NOCAL,        From Engine - No Calibration tables 
    programmed into flash.
MR90XX_REPLY_ERASE,        From Engine - Error while trying to 
    erase FLASH .
MR90XX_REPLY_FLASH,        From Engine - Error while trying to 
    program FLASH.
MR90XX_REPLY_NYBYTES,      From Engine - Invld # bytes recv'd in 
    program data buf.
MR90XX_REPLY_CKSUM,        From Engine - Invld checksum recv'd 
    with prog data buf.
MR90XX_REPLY_COLON,        From Engine - First char in data 
    buffer not a colon.
MR90XX_REPLY_BAD_CMD,      From Engine - Engine does not 
    recognize command #.
MR90XX_REPLY_ERROR_GEN,    From Engine - General error.  No hex 
    table on Cmd 4 .
MR90XX_REPLY_BAD_PARM1,    From Engine - Engine does recognize 
    1st param of cmd.
MR90XX_REPLY_BAD_PARM2,    From Engine - Engine does recognize 
    2nd param of cmd.
MR90XX_REPLY_BAD_PARM3,    From Engine - Engine does recognize 
    3rd param of cmd.
MR90XX_REPLY_BAD_PARM4,    From Engine - Engine does recognize 
    4th param of cmd.
MR90XX_REPLY_BAD_PARM5,    From Engine - Engine does recognize 
    5th param of cmd.
MR90XX_REPLY_BAD_PARM6,    From Engine - Engine does recognize 
    6th param of cmd.
MR90XX_REPLY_BAD_PARM7,    From Engine - Engine does recognize 
    7th param of cmd.
MR90XX_REPLY_BAD_PARM8,    From Engine - Engine does recognize 
    8th param of cmd.
MR90XX_REPLY_BAD_PARM9,    From Engine - Engine does recognize 
    9th param of cmd.
MR90XX_IE_ERR_DTEC,        From Engine - CommTrigDetect called 
    inside sweep cmds.
MR90XX_IE_ERR_TRIG,        From Engine - Trigger or Detector 
    parameter error.
MR90XX_REPLY_INMAIN,       From Engine - Executing from main 
    code block after reset.
MR90XX_REPLY_INBOOT,       From Engine - Executing from boot 
    code block after reset.
MR90XX_REPLY_INWEEDS,      From Engine - Execution of boot block 
    began but control did not transfer.

     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    �� � F���       Status                            �/ 0 8  �      SessionHandle                      	              �    NOTE: this function is called automatically by function mr90xx_init() when the session is created and initialized.

Initialize the 905x hardware engine. 

The InitEngine() function must be called before any of the other function calls to the engine are made.  The InitEngine() routine performs essential tasks for the 9052 spectrum analyzer operation and the 9052 hardware will not function unless this function is called.

SEE ALSO

InitInstrData()    �    RETURNS:
The return value from the engine is passed through to the calling application.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_ENG_BUSY Engine is busy processing command.

MR90XX_ENG_ACK  Acknowledgment of command byte.

MR90XX_ENG_BAD_CMD  Engine does not recognize command #.

MR90XX_ENG_ERROR_GEN    General error.  No hex table on cmd 4.

MR90XX_ENG_BAD_PARM1    Engine does recognize 1st parameter of command

MR90XX_ENG_BAD_PARM2    Engine does recognize 2nd parameter of command ... etc.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    � & ����       Status                            �� 4   �      SessionHandle                      	                  The PC based 9052 has no requirements for shutdown.

For the VXI based 9054 this performs other VXI shutdown related requirements.

NOTE: this function is automatically called by the mr90xx_close() function as part of standard instrument session closure.

    �    RETURNS:
The return value from the engine is passed through to the calling application.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_ENG_BUSY Engine is busy processing command.

MR90XX_ENG_ACK  Acknowledgment of command byte.

MR90XX_ENG_BAD_CMD  Engine does not recognize command #.

MR90XX_ENG_ERROR_GEN    General error.  No hex table on cmd 4.

MR90XX_ENG_BAD_PARM1    Engine does recognize 1st parameter of command

MR90XX_ENG_BAD_PARM2    Engine does recognize 2nd parameter of command ... etc.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None    �< ^ 4���       Status                            �� 4   �      SessionHandle                      	              C    This function initiates a "sweep" of consecutive measurement points by the 905x engine.  Using the data stored in the SET9052 structure, the necessary parameters for the engine are calculated and transmitted.  The engine begins generating data as soon as the current trigger condition fires.

The StartSweep() command is one of the three commands used to initiate data capture with the 9052 engine.  Once StartSweep() is called, it will check the current trigger condition.  If the analyzer is set to free run, the engine will begin generating data immediately.  Otherwise it will wait for the trigger to fire and then start generating data.

StartSweep() causes the engine to begin the sweep.  To actually retrieve the data, the application must call one of the following functions:  GetTraceData(), GetMinMaxData(), GetTraceWithFreq(), GetMinMaxWithFreq().  Which function to call depends on the settings for sweep code.

SEE ALSO:
SetAttenuatr()
SetStartFreq()    SetStopFreq()
SetStepSize()
SetDwellTime()    SetTimeMode()
SetRBW()          SetRBWmode()
SetVBW()          SetVBWmode()
    �    RETURNS:

The return value from the engine is passed through to the calling application.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_ENG_BUSY Engine is busy processing command.

MR90XX_ENG_ACK  Acknowledgment of command byte.

MR90XX_ENG_BAD_CMD  Engine does not recognize command #.

MR90XX_ENG_ERROR_GEN    General error.  No hex table on cmd 4.

MR90XX_ENG_BAD_PARM1    Engine does recognize 1st parameter of command

MR90XX_ENG_BAD_PARM2    Engine does recognize 2nd parameter of command ... etc.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None    �� J (���       Status                            �Y  %  �      Sessionhandle                      	              7    Start zero span command for the 905x.  Using the data stored in the SET9052 structure, the necessary parameters for the engine control are calculated and transmitted.  

SEE ALSO:

SetZspanFreq()
SetZSamplCnt()
SetZSamplRate()    
SetRBW()           SetRBWmode()
SetVBW()           SetVBWmode()
SetAttenuatr()    �    RETURNS:

The return value from the engine is passed through to the calling application.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ENG_BUSY  Engine is busy processing command

MR90XX_IE_ENG_ACK   Acknowledgment of command byte

MR90XX_IE_ENG_BAD_CMD   Engine does not recognize command #

MR90XX_IE_ENG_BAD_PARM1 Engine does recognize 1st parameter of command

MR90XX_IE_ENG_BAD_PARM2 Engine does recognize 2nd parameter of command ... etc.

MR90XX_IE_ENG_ERROR_GEN General error.  No hex table on cmd 4.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    � A <���       Status                            ��    �      SessionHandle                      	              �    Start Frequency Hop command for the 905x.  Using the data stored in the SET9052 structure, the necessary parameters for the engine are calculated and transmitted.  In frequency hop mode, the 905x steps to specific frequency points previously downloaded to the engine.  Therefore function LoadHopTable() must be called prior to calling StartFreqHop().  

SEE ALSO:
LoadHopTable()    SetHopTabCnt()
SetAttenuatr()
SetDwellTime()
SetRBW()          SetRBWmode()
SetVBW()          SetVBWmode()
    r    RETURNS:
The return value from the engine is passed through to the calling application.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ENG_BUSY  Engine is busy processing command

MR90XX_IE_ENG_ACK   Acknowledgment of command byte

MR90XX_IE_ENG_BAD_CMD   Engine does not recognize command #

MR90XX_IE_ENG_BAD_PARM1 Engine does recognize 1st parameter of command

MR90XX_IE_ENG_BAD_PARM2 Engine does recognize 2nd parameter of command ... etc.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None    �# B 7���       Status                                �      SessionHandle                      	              H    Load the specific frequency points the 905x should step to  directly to the engine hardware.  This function must be called before calling function StartFreqHop().  Also it is important that the number of points in the frequency point array match the number of the num_points argument.

SEE ALSO:

StartFreqHop()
SetHopTabCnt()     _    Number of points in table to be stepped to.

Valid Range:      0 to 1024

Default Value:    1     `    Pointer to array of frequency points (Hz units) to be stepped to.

Default Value:    freq_list        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    �\ E � �      num_points                        �� 6 �       freq_list                         �+ o >���       Status                            �?    �      SessionHandle                      1    	            	               �    Interrupt Sweep command.  Use this command to control the engine when it is acquiring data from StartSweep(), StartZSpan(), or StartFreqHop() command.  With this command the engine can be stopped, paused, or made to resume after a pause.    �    RETURNS:
The return value from the engine is passed through to the calling application.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_ENG_BUSY Engine is busy processing command.

MR90XX_ENG_ACK  Acknowledgment of command byte.

MR90XX_ENG_BAD_CMD  Engine does not recognize command #.

MR90XX_ENG_ERROR_GEN    General error.  No hex table on cmd 4.

MR90XX_ENG_BAD_PARM1    Engine does recognize 1st parameter of command

MR90XX_ENG_BAD_PARM2    Engine does recognize 2nd parameter of command ... etc.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None        Code corresponds to the values shown below for the engine parameter.  Value is passed through to the engine.

� STOP_NOW(0)       Terminate immediately

� STOP_AFTER(1) Terminate after completing sweep

� PAUSE_SWP(2)  Pause the sweep

� RESUME_SWP(3) Resume the sweep
    � t ;���       Status                            ��    �      SessionHandle                     �� I � �       BreakCode                          	               0       Retrieve amplitude data generated by a mr90xx_StartSweep(), mr90xx_StartFreqHop() or mr90xx_StartZspan() command. mr90xx_GetAmplData() must be called iteratively, since it only retrieves the data most recently returned by the engine.  i.e. If the engine is performing a slow sweep, mr90xx_GetAmplData() will return as soon as possible so you can process the partial data available.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None     �    Non-NULL pointer to an array of amplitude points. The client is responsible allocating and deallocating this memory.This function will copy amplitude data to the array at this.    � � 2���       Status                            �* $   �      SessionHandle                     � M � �       ampl                               	               	           �    Retrieve amplitude and frequency data generated by a mr90xx_StartSweep(), mr90xx_StartFreqHop() or mr90xx_StartZspan() command. mr90xx_GetAmplWithFreq() must be called iteratively, since it only retrieves the data most recently returned by the engine.  i.e. If the engine is performing a slow sweep mr90xx_GetAmplWithFreq() will return as soon as possible so you can process the partial data available.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     �    Non-NULL pointer to an array of amplitude points.  The client is responsible for allocating and deallocating this memory.  This function will copy amplitude data to this array    1    RETURNS

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERROR User mistake        
     �    Non-NULL pointer to an array of frequency points.  The client is responsible for allocating and deallocating this memory.  This function will copy frequency data to this array.    �0 %   �      SessionHandle                     �$ N � �       ampl_data                         �� � ,���       Status                            � P �       freq_data                              	            	           	           s    Retrieve the minimum and maximum amplitude points generated by a mr90xx_StartSweep() command.  The function must be called iteratively, since it only retrieves the data already returned by the engine before returning.  i.e. If the engine is performing a slow sweep, mr90xx_GetMinMaxAmpl() will return as soon as possible so you can process the partial data available.       �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None     �    Non-NULL pointer to an array of minimum amplitude points.  The client is responsible for allocating and deallocating this memory.  This function will copy amplitude data to this array.     �    Non-NULL pointer to an array of maximum amplitude points.  The client is responsible for allocating and deallocating this memory.  This function will copy amplitude data to this array.    9    RETURNS

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_IE_ERROR User mistake                

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
    �G $ 
  �      SessionHandle                     �< N � �       min_ampl_data                     �� O �       max_ampl_data                     �� � *���       Status                                 	            	            	          {    Retrieve the minimum and maximum amplitude points generated by a mr90xx_StartSweep() command.  The function must be called iteratively, since it only retrieves the data already returned by the engine before returning.  i.e. If the engine is performing a slow sweep, mr90xx_GetMinMaxAmplWithFreq() will return as soon as possible so you can process the partial data available.       �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None     �    Non-NULL pointer to an array of amplitude points.  Calling application must allocate this memory, and then the function uses it as the location for trace data made up of the minimum points from each cell or dwell period.    9    RETURNS

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_IE_ERROR User mistake                

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Non-NULL pointer to an array of amplitude points.  Calling application must allocate this memory, and then the function uses it as the location for trace data made up of the maximum points from each cell or dwell period.     �    Non-NULL pointer to an array of frequency points.  Calling application must allocate this memory.  This function uses it as the target for frequency values which correspond to the retrieved amplitude points in the a_maxampl[] array.     �    Non-NULL pointer to an array of frequency points.  Calling application must allocate this memory.  This function uses it as the target for frequency values which correspond to the retrieved amplitude points in the a_minampl[] array.    � *   �      SessionHandle                     �u S � �       min_ampl_data                     �[ � *���       Status                            � Q �       max_ampl_data                     � � �       max_freq_data                     �t � � �       min_freq_data                          	            	           	            	            	            �    This function ensures that the 9052 engine is ready to receive an InitEngine() command.

A hardware reset is issued to the 9052 processor and data buffers are cleared.         RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None    � G 1���       Status                            �    �      SessionHandle                      	               q    Initialize the engine to default values.  All modes are set to AUTO_ON so the instrument is completely coupled.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
    �< Q ���       status                            �Q %   �       Sessionhandle                      	            0   �    Recouple all parameters of the 9052.  In the process of normal use, it is quite likely that many of the mode and parameter settings will be significantly changed from the defaults.  Recouple() provides a convenient one function call method of returning the library to full automated, "known" state.  After calling this function the calling  application knows that the 902 will generate calibrated data.

This function resets step_mode, time_mode, cell_mode, auto_cell, auto_rbw, and auto_vbw flags to AUTO_ON and then automatically sets the step_size, num_swp_pts, sweep_time, rbw_code, vbw_code and other values to the correct values to return calibrated data based upon the current start and stop frequencies.

The calling application should be sure to call RdNumSwpPts() after calling Recouple() to ensure enough memory has been allocated to handle the number of data points the 9052 will generate for the new settings.

SEE ALSO:

IsCoupled()        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None    �g L 6���       Status                            �{    �      SessionHandle                      	               �    Return the value of the start element of the SET9052 structure.  

The mr90xx_Rdxxx (Rd means Read) functions provide a standard way of checking values in the SET9052 structure by using these function calls to access the SET9052 strucutre members.     j    Returns the value of the start element of the SET9052 structure.

Valid Range:   0 to 1,600,000,000 (Hz)        RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    �� B � �       startFreq                         �] z =���       Status                            �s     �      SessionHandle                      	           	              �    Return the value of the step element of the SET9052 structure.  The Rd functions provide a standard way of checking values in the SET9052 structure.  The step size value can be set automatically by the 9052 if the step_mode element is set to MR90XX_AUTO_ON.  When this flag is in automatic mode the library will set the step size to the largest possible frequency value that is less than or equal to 1/3 of the current resolution bandwidth (RBW).  Calling RdStepSize() lets the user determine what value the 905X is using.  The current step size in use is critical for determining the frequency of a point at a given offset into the trace.

SEE ALSO:

SetStepSize()
StepSizeMode()    SetNumSwpPts()     d    Returns the value of the step element of the SET9052 structure.

Valid Range:   1 to 1,600,000,000        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None    �� K � �       stepSize                          �R � ;���       Status                            �f     �      SessionHandle                      	           	              7    Obtain the frequency value from the SET9052 structure, which defines the video trigger frequency location.

The functions SetTrigFreq() and RdTrigFreq() are only needed when the 9052 is set to use video triggering.  Video trigger mode causes the spectrum analyzer to watch a designated frequency value and measure the incoming amplitude values.  If the signal level exceeds the defined threshold level, then the trigger fires and the entire sweep is taken according to the current parameters.

SEE ALSO:

SetTrigMode()    RdTrigMode()
SetTrigThrsh()   RdTrigThrsh()     j    Returns the trig_freq element from the SET9052 structure.

Variable Range: 0 to 1,600,000,000 (Hz units)        RETURNS:    

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   U I � �       TriggerFreq                      � � :���       Status                           �    �      SessionHandle                      	           	               y    Return the value of zspan_freq element of the SET9052 structure.

SEE ALSO:

SetZspanFreq()
SetZSamplCnt()
StartZspan()     p    Returns the value of the zspan_freq element of the SET9052 structure.

Valid Range:   0 to 1,600,000,000  (Hz)        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    G � �       zSpanFrequency                   � � 9���       Status                           �    �      SessionHandle                      	           	               }    Return the value of the stop element of the SET9052 structure.  

SEE ALSO:

RdStartFreq()
SetStartFreq()    SetStopFreq()
     l    Returns the value of the stop element of the SET9052 structure.

Variable Range:   0 to 1,600,000,000 (Hz)        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   	� F � �       stopFreq                         
C  9���       Status                           X    �      SessionHandle                      	           	               7    To report whether the Pre-Amp is enabled or disabled.     �    Pointer to storage for function result value.  Value of currently selected preamp state is assigned to this variable.  Possible values are:

� IE_TRUE   The Pre-Amp is enabled.
� IE_FALSE  The Pre-amp is disabled.
        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
  ���� (   �       SessionHandle                    F Q x �       PreAmp                           & � ���       Status                                 	            	           J    Get the current index into the array of sweep data.  When conducting a sweep with a 90xx spectrum analyzer, it is very likely that not all of the sweep data will be retrieved with a single call to mr90xx_GetAmplData().  mr90xx_RdSwpIdx() allows the application to keep track of the progress of the sweep.  The mr90xx_GetAmplData() family of functions internally tracks how much data has been retrieved from the engine so a call to mr90xx_RdSwpIdx() will reflect the current offset.
It is the application's responsibility to allocate the memory for the actual sweep data, but the driver keeps track of where we are in the array.


Used to obtain the current index into the array of sweep data.  It is the application's responsibility to allocate the memory for the actual sweep data, but the library keeps track of where we are in the array.     `    Pointer to storage for function result value.  The current index into the array of sweep data.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   G J � �       index                            � � 8���       Status                           �    �      SessionHandle                      	            	                  Return the amount of attenuation that is currently set for the 9052 engine in the attenuation element of the SET9052 structure.

SEE ALSO:

SetAttenuatr()

EXAMPLE:

/* Determine the difference in attenuation settings between two different sweeps captured with two distinct instrument setups.  Each sweep has its own SET9052 structure to keep track of the test parameters and allow the data to be interpreted.       */

ViInt16 atten_test_1, atten_test_2;

mr90xx_RdAttenuatr( instrSession, &atten_test_1);
mr90xx_RdAttenuatr( instrSession, &atten_test_2 );

/* find the absolute value of the difference between the 
attenuation values */

delta_atten = ( short )abs( atten_test_1 - atten_test_2 );
printf( "The attenuation between test1 and test2 varied by
         %d dB. \n", delta_atten );
     �    Returns the amount of attenuation currently set in dB.  This is the attenuation element of the SET9052 structure.

Valid Range:   0 - 60 (dB units)        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   � D � �       Atttenuation                     4 � A���       Status                           H  !  �      SessionHandle                      	            	              �    Obtain the value of the 90xx driver's auto cell flag.  Cell mode is a very common mode of operation with the 90xx spectrum analyzer.  The mr90xx_SetAutoCell() function allows the driver to determine the best time to start celling the data.  The function allows the calling application to verify if this mode is active.  mr90xx_RdCellMode() would allow the application to check on the 90xx driver's current cell mode setting.    $    Pointer to storage for function result value.  Value of currently selected auto cell status is assigned to this variable.  Possible values are:

� AUTO_OFF  The user is responsible for setting the cell mode  flag.

� AUTO_ON   The engine will be responsible for setting the cell mode flag.
    ?    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding 
                         function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   � = � �       autoCellStat                     � z 7���       Status                           !    �      SessionHandle                      	            	               �    Returns the value of the cell_mode flag.  This code determines if the engine should create cells and whether it should return minimum and/or maximum values for each cell, or if every data point read by the engine is returned.     �    Returns the current value of the cell_mode flag.

Valid Range:

MR90XX_IE_TRUE    cell mode is on

MR90XX_IE_FALSE   cell mode is off    J    
RETURNS:
MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding        
                        function.
      
MR90XX_ERROR_NULLHANDLE If session_id is 0.      �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   #� G � �       CellMode                         $E � <���       Status                           %�     �      SessionHandle                      	            	                  Gets the value of the default number of points that the 9052 engine will return from a given sweep.   This is the number of points the engine uses when step_mode is set to MR90XX_AUTO_ON.  If min and max points are set for return, the actual number of points returned is doubled.     �    Returns the value of the deflt_pt_cnt element of the SET9052 structure that sets the default number of return data points.

Valid Range:    0 to 1,000,000,000        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   (g G � �       defaultPoints                    ) � 2���       Status                           *$    �      SessionHandle                      	            	                  Obtain the bit value of the currently selected detector.  This is different from many of the mr90xx_RdXxxx functions in that it does not simply return the value of the structure element.  The detect_code field is a bit field with several internal functions.    $    Returns the bit value of the current detector.  Constants for these values are defined in file MR_DEFIN.H.  Detector modes currently available for the 9052 engine are listed below:

Valid Range:

MR90XX_DTEC_LOG    log detector

MR90XX_DTEC_LIN    linear detector

MR90XX_DTEC_3IF    3rd IF        
RETURNS:
MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   ,� C � �       Detector                         . s 8���       Status                           /    �      SessionHandle                      	            	               w    Report the entire detector code as it is passed as argument 1 to the Set Detector/Trigger Parameters Command (CMD 4).     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     G    Pointer to storage for function result value.  Value of detector code     d    MR90XX_IE_SUCCESS   Operational success.
MR90XX_IE_FAILURE   General engine or calculation error.
   1M $   �       session_id                       2+ R � �       rp_detect_code                   2z � !���       status                             0    	            	           �    Find the value currently set for the dwell_time element of the SET9052 structure.  By default the value will be 0 but if the calling application chooses to set this value it can be retrieved by this function.  See Chapter 4 of the Programmer's Reference Manual for more details about dwell time and how to use it.

SEE ALSO:

SetDwellTime()       SwpTimeMode()
SetSwpTime()         RdSwpTime()
OverrideSetTime()    RdSettleTime()

EXAMPLE:

/* Dwell time is normally used to catch transient signals.  This fragment assumes you are looking for a transient in a known frequency range, within which the transient will exceed a known amplitude level.  This code fragment increases dwell time and resweeps in an attempt to catch the transient signal.  Return codes are ignored for brevity.  Always check return status codes!   */

ViInt32 cur_dwell_time, next_peak;

mr90xx_SetSweepCode( instrSession, MR90XX_SWP_SINGLE );
mr90xx_RdDwellTime( instrSession, &cur_dwell_time );

do
{
    mr90xx_SetDwellTime( instrSession, cur_dwell_time );
    if( mr90xx_StartSweep( instrSession ) != MR90XX_REPLY_ACK )
        exit( -1 );

    while( cur_cnt < sa_data_cnt )
    { 
        mr90xx_GetTraceData( RdPortNum( &instr ), sa_data1,          
                      &sa_data_cnt, &cur_cnt ); 
    }

    /* ------------------------------------------------------ */
    /* next_peak returns IE_FAILURE if it cannot find a peak 
       which exceeds the minimum threshold level              */
    /* ------------------------------------------------------ */
    mr90xx_FindNextPeak( sa_data1, sa_data_cnt, 0, 
                         MR90XX_HIGHER_PK, -30, &next_peak );    

    /* increase dwell time by 100 microseconds  */
    cur_dwell += 100;
}
     �    Returns the value of dwell time in microseconds.

Valid Range:  0 (MR90XX_MIN_TIME) to 2,147,483,647 (MR90XX_MAX_TIME) microseconds        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   :v A � �       dwellTime                        ; { =���       Status                           <     �      SessionHandle                      	            	               �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     2    The Engine Model code: SA9052, SA9054 or SA9085     +    
This control contains the status code returned by the function call.

Possible Status Codes are listed below:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0102  Reset not supported - VI_WARN_NSUP_RESET      
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  No listeners condition was detected.
BFFF0060  This interface is not the controller in charge.
BFFF0067  Operation is not supported on this session.


V905x Instrument Specific Error Codes.  see also file mr_defin.h

MR90XX_IE_FAILURE  From Engine - General Function Failure." },     
MR90XX_IE_SUCCESS  From Engine - No Error - SUCCESS." },      
MR90XX_IE_ERRORR:  From Engine - General Error." },    
MR90XX_IE_ERR_VALS From Engine - Argument out of range, or null 
    pointer arg.    
MR90XX_IE_ERR_AUTO From Engine - Value can't be manually set 
    because of auto mode    ."},
MR90XX_IE_ERR_SPAN From Engine - Start and Stop frequency span 
    parameters error.
                                                                
MR90XX_IE_ERR_STEP  From Engine - Specified span is too narrow 
    for number of points.
MR90XX_IE_ERR_DWELL From Engine - Tried to set to non-auto mode 
    when dwell is defined.
MR90XX_IE_ERR_DIFDTEC From engine - a different detector is 
    needed for the attempted operation.
MR90XX_IE_WARN_VALS  From Engine - Value is out of range but 
    still acceptable.
      
MR90XX_ERROR_NODECODE  Failure to decode magic number and 
    SET9052 pointer from session handle. 
MR90XX_ERROR_NOSESSION Failure to initialize session - SET9052 
    memory not allocated.


MR90XX_REPLY_BUSY From Engine - Engine is busy processing 
    command.
MR90XX_REPLY_ACK,          From Engine - Acknowledgement of 
    command byte.
MR90XX_REPLY_NOMAIN,       From Engine - No main code programmed 
    into flash.
MR90XX_REPLY_NODSP,        From Engine - No DSP code programmed 
    into flash .
MR90XX_REPLY_NOCAL,        From Engine - No Calibration tables 
    programmed into flash.
MR90XX_REPLY_ERASE,        From Engine - Error while trying to 
    erase FLASH .
MR90XX_REPLY_FLASH,        From Engine - Error while trying to 
    program FLASH.
MR90XX_REPLY_NYBYTES,      From Engine - Invld # bytes recv'd in 
    program data buf.
MR90XX_REPLY_CKSUM,        From Engine - Invld checksum recv'd 
    with prog data buf.
MR90XX_REPLY_COLON,        From Engine - First char in data 
    buffer not a colon.
MR90XX_REPLY_BAD_CMD,      From Engine - Engine does not 
    recognize command #.
MR90XX_REPLY_ERROR_GEN,    From Engine - General error.  No hex 
    table on Cmd 4 .
MR90XX_REPLY_BAD_PARM1,    From Engine - Engine does recognize 
    1st param of cmd.
MR90XX_REPLY_BAD_PARM2,    From Engine - Engine does recognize 
    2nd param of cmd.
MR90XX_REPLY_BAD_PARM3,    From Engine - Engine does recognize 
    3rd param of cmd.
MR90XX_REPLY_BAD_PARM4,    From Engine - Engine does recognize 
    4th param of cmd.
MR90XX_REPLY_BAD_PARM5,    From Engine - Engine does recognize 
    5th param of cmd.
MR90XX_REPLY_BAD_PARM6,    From Engine - Engine does recognize 
    6th param of cmd.
MR90XX_REPLY_BAD_PARM7,    From Engine - Engine does recognize 
    7th param of cmd.
MR90XX_REPLY_BAD_PARM8,    From Engine - Engine does recognize 
    8th param of cmd.
MR90XX_REPLY_BAD_PARM9,    From Engine - Engine does recognize 
    9th param of cmd.
MR90XX_IE_ERR_DTEC,        From Engine - CommTrigDetect called 
    inside sweep cmds.
MR90XX_IE_ERR_TRIG,        From Engine - Trigger or Detector 
    parameter error.
MR90XX_REPLY_INMAIN,       From Engine - Executing from main 
    code block after reset.
MR90XX_REPLY_INBOOT,       From Engine - Executing from boot 
    code block after reset.
MR90XX_REPLY_INWEEDS,      From Engine - Execution of boot block 
    began but control did not transfer.

   =q )   �      SessionHandle                    >e S � �       model                            >� � 2���       Status                                 	            	           \    To report the value of one of the tenative options flags within the given SET9052 object.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    o    indicates which flag is being queried.

Possible Values are:


MR90xx_ENGOPT_FAKE9085--allows application software configured for a 9085 to be tested on a 9052 or 9054. Acceptable values are 1 (do fake a 9085 with a 9054) or 0 (do not fake a 9085 with a
9054).

MR90xx_ENGOPT_NOCAL--turn on/off calibration forStartFreqSweep(), StartZspan(), and StartFreqHop() [bit-3 of their Sweep Mode Bits word arguement].Acceptable values are 1 (calibration off) or 0 (calibration on).

MR90xx_ENGOPT_PERSERRS--persistent error codes.  If 1 then when the first time an error code (negative value) is set with SetFuncStatusCode(), that code will be persistently returned by RdFuncStatusCode() until a call to ClearFuncStatusCode() clears the value to 0 explicitly.  If 0, then error codes can             be overwritten just as warnings are success codes                  are overwritten.

     %    the value of the specified flag.


   P� $   �       Sessionhandle                    Q� G � �       FlagNo                           U\ G � �       EngOption                       ���� �  ���       status                                 0    	            	            C    Reports the last error occurrence as it was stored in the engine.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     ~    OUTPUT ARGUMENTS:
ViPUInt32 rp_errorStatus    Pointer to storage for function  result value.  Error code set in the engine.
    	    RETURNS:
MR90XX_IE_SUCCESS   Operational success.
MR90XX_IE_FAILURE   General engine or calculation error.
MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 

   V�  &  �       Sessionhandle                    W� @ � �       errorStatus                      X. x &���       Status                                 	            	            �    Obtain the filter_ratio element currently set in the SET9052 structure and return it through the passed-in pointer.  A pointer is used because Microsoft and Borland return floating point values differently from a DLL.       f    Pointer to a ViReal64 type floating point memory position to be filled with the ratio information.

     �    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  If rp_ratio is NULL.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   Z� A � �       ratio                            [M { B���       Status                           \Q  %  �      SessionHandle                      	           	              �    Return the number of points that will be generated by a call to StartFreqHop().  This function's primary purpose is to determine how many data points and therefore how much memory must be allocated.

The calling application must allocate sufficient memory to hold at least num_hop_pts count of amplitude values returned from the engine.  However, the 905x may return 2 data points for each location in the hop table, depending on the sweep_code settings.  If the engine has been instructed to return MIN and MAX data for each point in the hop table, then the calling application must allocate two data arrays, each of which is large enough to hold num_hop_pts count of data.

SEE ALSO:

SetHopTabCnt()
LoadHopTable()

EXAMPLE:

/*  Use RdHopTabCnt() to determine amount of memory to allocate */

data_cnt = RdHopTabCnt( &instr );
if( ( sa_data1 = ( IE_HAMPL * )halloc( ( data_cnt ),
      sizeof( AMPL ) ) ) == NULL
{
    printf( "Error allocating memory for amplitude data.\n" );
    exit( 1);
}

     u    Returns the actual number of points that will be generated by a call to StartFreqHop().  

Valid Range:   0 to 1024        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   a� G � �       hopTableCount                    bn � 7���       Status                           c�    �      SessionHandle                      	            	               r    Obtain the reference level that is currently set for the engine and report it in the rp_lin_ref_level parameter.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     �    OUTPUT ARGUMENTS:
ViPInt16 rp_iface_type  Pointer to storage for function result value.  One of InterfaceEnum:
� UNKNOWNp(0)
� ISAp(1)
� VISAp(2)
� SERIALp(3)
� NIVXIp(4)
� SICLp(5)
� MODEMp(6)

     :    MR90XX_IE_SUCCESS On sucess
MR90XX_IE_FAILURE Ohter wise   e� $   �       SessionHandle                    f� L } �       ifaceType                        gX � ���       Status                                 	            	            z    Return the reference level that is currently set for the 9052 in the linref_level element of the SET9052 data structure.     k    Pointer to storage for function result value.  Value of reference level (nV) at which the engine was set.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   h� B � �       linearRefLevel                   iJ w  ���       Status                           j^    �      SessionHandle                      	           	               {    Each engine can be set to one of several addresses. This function reads the value of the logical address from the engine.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     V    Pointer to storage for function result value.  Logical address of the engine (0-255)    <    Returns

MR90XX_IE_SUCCESS   Operational success.
MR90XX_IE_FAILURE   General engine or calculation error.
MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                         recognized by the session decoding 
                         function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 
   l� $   �       SessionHandle                    mo O { �       LogAddr                          m� � ���       Status                                 	            	            9    To reveal the minimum frequency limit of the SA Engine
     =    Value of minimum frequency limit returned by this function.  ���� $   �       session_id                       p R � �       min_limit                       ���� � "���       status                             0    	           	            ;     To reveal the maximum frequency limit of the SA Engine.
     =    Value of maximum frequency limit returned by this function.  ���� $   �       session_id                       qQ U � �       max_limit                       ���� � $���       status                             0    	           	           �    Return the value of the num_cells element of the SET9052 structure.  If the 905x is in cell mode this value is essential for calculating the amount of data the engine will return.  Based upon the current sweep code the engine will either return the minimum amplitude point, the maximum, or both for each cell.  There are limits to the number of cells the engine can handle.  Please see the sister function of RdNumCells() - SetNumCells(), for a complete explanation.

SEE ALSO:

SetNumCells()     �    Returns the value of the num_cells element of the SET9052 structure.

Valid Range:    1 - 65535.  If all cell sizes are not the same size then the maximum number of cells is only 1024.    D    Returns

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                         recognized by the session decoding 
                         function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
n.

Default Value:  None   tH E � �       numberCells                      u
 � :���       Status                           vV    �      SessionHandle                      	            	              H    Returns the value of num_cells element of SA9052 if cell mode is in use. When cell mode is not on, returns num_swp_pts, num_sample or num_hop_pts elements of SA9052, depending upon a current operating mode. mr90xx_StartSweep(), mr90xx_StartFreqHop() or mr90xx_StartZspan() must have been called before a call to this function.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.     �    Pointer to storage for function result value.  The long integer value of actual number of points the StartSweep commands will generate; or -1L if session_id is a NULL pointer.    L    MR90XX_IE_SUCCESS   Operational success.
MR90XX_IE_FAILURE   General engine or calculation error.
MR90XX_IE_ERR_NOSWP If sweep is not carried out prior to this function call.
MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 
   yX $   �       session_id                       z6 O � �       num_data_points                  z� �  ���       status                             0    	            	           U    Return the value of num_swp_pts element of the SET9052 structure.  The Rd functions provide a standard way of checking values in the SET9052 structure.  The num_swp_pts value is important so that the calling application can determine how many data points it should expect to be returned and how much memory should be allowed to accommodate those points.

The num_swp_pts element of the SET9052 structure is designed to always reflect the number of points the engine will return from a sweep.  This is regardless of whether the engine is in cell mode or not.  When in cell mode the num_swp_pts element is simply the same as the num_cells element.  Otherwise the value is under the control of the library and will vary as the library needs to maintain calibration for the given sweep parameters.

SEE ALSO:

StepSizeMode()
SetStepSize()     RdStepSize()     �    Returns the value of the actual number of points the StartSweep type commands (see Direct Engine Class) will generate.

Valid Range:   1 to 1,000,000,000        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �\ C � �       numberSweepPoints                �� ~ :���       Status                           �    �      SessionHandle                      	            	               �    Each engine can be set to one of several addresses and one of four IRQ settings.  This function reads the value of the address for the data port of the engine.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     �    Pointer to storage for function result value.  The current port number used by the engine; or 0xffff if the function return status indicates an error occurred.    @    Returns:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                         recognized by the session decoding 
                         function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
   �k $   �       Sessionhandle                    �J J } �       PortNum                          �� � ���       Status                             0    	            	           K    Return the value of rbw_code in the SET9052 structure.  The calling application can use this to retrieve the current RBW setting.  This is especially useful when auto_rbw flag is set to MR90XX_AUTO_ON and the library selected the best value for the RBW based upon the start and stop frequencies.

SEE ALSO:

SetRBW()
SetRBWmode()    =    Returns the code representing the resolution bandwidth setting which matches the given frequency.  

Valid Range:

MR90XX_RBW_300HZ     (width is 300 Hz)
MR90XX_RBW_3KHZ      (width is   3 KHz)
MR90XX_RBW_30KHZ     (width is  30 KHz)
MR90XX_RBW_300KHZ    (width is 300 KHz)
MR90XX_RBW_3MHZ      (width is   3 MHz)

        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   �J  � �       rbwCode                          �� ���       Status                           ��    �      SessionHandle                      	            	              �    Provides a standard method for reading the value in the ref_level element of the SET9052 structure.

The ref_level is used as an alternative way to define the correct attenuation setting.  Thus the ref_level changes whenever the attenuation element is changed and the attenuation element changes when the ref_level is changed.  See chapter 2 in the Programmer's Reference Manual for more details.     �    Returns the ref_level element from the SET9052 structure.  This amplitude value represents the maximum value of the vertical scale.

Variable Range:   -40 to 20  (MIN_REFL to MAX_REFL)
                  -50 to 20  with preamplifier option        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� Q � �       ReferenceLevel                   �� � ,���       Status                           �� (   �      SessionHandle                      	            	               l     Return the current interrupt mode setting stored in the intr_code element of the SET9052 structure.           �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
         Intterrupt code settings.   �� "   �       Sessionhandle                    �� K  �       IntrptCode                      ���� � ���       Status                             0    	            	            �    Each 9052 engine can be set to one of several addresses and one of four interrupts.  This function reads the value of the IRQ of the engine from the SET9052 structure.       �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     0    Value of IRQ number returned by this function.   �3 $   �       SessionHandle                    � L } �       IrqNum                          ���� � ���       Status                             0    	            	            �    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  rp_auto_on was null.
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Pointer to storage for function result value.  

On success:

� AUTO_ON(1)        RBW will be automatically set by the driver.
� AUTO_OFF(0)   RBW will be set by the client.
   � %���       Status                           � )   �      instrSession                     �� ) � �       autoOn                             	               	           �    Provides a standard method for reading the value in the settle_time element of the SET9052 structure.  Unless the calling application has chosen to set time_mode to MR90XX_AUTO_OFF and override the default sweep time, this function will return 0.  A non-zero value would factor into the total sweep time.

When the time_mode element is set to MR90XX_AUTO_ON, calling RdSettleTime() will return 0.  This means that the engine should use the default settle time for the current RBW.  The only circumstance in which settle_time can be non-zero is when time_mode has been changed to either MR90XX_TIMESWP or MR90XX_TIMESET with a call to SwpTimeMode().  If the time_mode element has been changed from automatic to one of these manual modes, and either OverrideSetTime() or SetSwpTime() has been called, then RdSettleTime() will return the current settling time value.

In order to determine the default settling time for an RBW filter you would call the function DefltSetTimeRBW().  This function can be extremely useful in determining a new value for the settle time and interpreting the results.

SEE ALSO:

DefltSetTimeRBW()
OverrideSetTime()    RdSettleTime()
SwpTimeMode()
SetSwpTime()         RdSwpTime()

    �    Returns the time in microseconds that the 905x will allow a resolution bandwidth (RBW) filter to settle before taking a reading.  Returns constant MR90XX_IE_FAILURE if an invalid code is passed into the function.

Valid Range:   - 0x77359400 to 0x77359400 (HEX microseconds)

     negative values indicate user has overridden the default

     0 indicates that time mode is MR90XX_AUTO_ON.        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �� F � �       settleTime                       �n  5���       Status                           ��     �      SessionHandle                      	            	              _    Reads the sweep_code member of the SET9052 structure.  The sweep_code is used to control how the 905X conducts a sweep.  Constants for the bit functions are defined in file MR_DEFIN.H.  See the Programmer's Reference Manual for related topics - sweep mode flags, cell sampling, and dwell time.

SEE ALSO:

SetSweepCode()
SetDwellTime()
SetNumCells()    /    Pointer to storage for function result value.  The bit field sweep code setting.  Constants for bit values are defined in MR_DEFIN.H.  One or more of the following bits may be set. 

� SWP_SINGLE    Zero.  No other bits are set which indicates the engine should perform a single sweep.

� SWP_CONT  Set this bit when the engine should sweep and resweep as quickly as possible, continuously once the current trigger condition has fired.

� SWP_MIN   Set this bit when the minimum amplitude point of a group should be  returned.  Can be set alone or in combination with SWP_MAX and SWP_FRQPTS.  Ignored if cell mode or dwell time is not set.

� SWP_MAX   Set this bit when the maximum amplitude point of a group should  be returned.Can be set alone or in combination with SWP_MIN and SWP_FRQPTS.Ignored if cell mode or dwell time is not set.

� SWP_FRQPTS    Set this bit to retrieve the exact frequency values of the selected min. and/or max. amplitude points from each cell.  This bit does nothing if neither SWP_MIN nor SWP_MAX is set, or if cell mode is not active.

        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� H � �       sweepCode                        �� � :���       Status                           ��    �      SessionHandle                      	            	              :    Return the current value of the sweep_time element of the SET9052 structure.  The sweep_time is the total time it will take to make a complete sweep from start frequency to stop frequency with num_swp_pts steps.  Normally the figure is calculated as follows:

sweep_time = ( ( synthesizer settle time + RBW settle time 
                 + VBW settle time + dwell time )
                 * number of points in sweep )

If the time_mode element is set to MR90XX_TIMESET, then sweep time is equal to the last value set with a SetSwpTime() function call, and the RBW settle time is calculated from that instead.

Please see Chapter 3 of the Programmer's Reference Manual concerning calibration and decoupled operation.

SEE ALSO:

SetSwpTime()
SwpTimeMode()
OverrideSetTime()    RdSettleTime()
SetDwellTime()       RdDwellTime()     W    Pointer to the swp_time element of the SET9052 structure.

Default Value:    &dbl_ptr        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� F � �       dbl_ptr                          �5 � =���       Status                           �J    �      SessionHandle                      	           	              m    Return the value of the trig_code.  This allows the calling application to determine what triggering method the 9052 is currently set for.

SEE ALSO:

SetTrigMode()
SetTrigFreq()
SetTrigThrsh()

EXAMPLE:

/*  Unless the trigger mode is set to video triggering, the trigger frequency and threshold are ignored by the engine.  */

ViInt16 trigMode;

mr90xx_RdTrigMode( instrSession, &trigMode )
if( trigMode == TRIG_VIDEO )
{
    /* Set video trigger freq to 100 MHz  */
    mr90xx_SetTrigFreq( instrSession, 100000000 ); 

    /* Set video trigger threshold to -20 dB  */
    mr90xx_SetTrigThrsh( instrSession, -20 );
}
    b    Returns the trig_code element from the SET9052 structure.  

Valid Range:

MR90XX_TRIG_FREE    Free sweep.  Sweep as fast as possible

MR90XX_TRIG_EXT_HI  External trigger, high-going: start sweep when trigger goes high

MR90XX_TRIG_EXT_LO  External trigger, low-going: start sweep when trigger goes low

MR90XX_TRIG_MANUAL  Manual trigger: start sweep upon resume sweep command

MR90XX_TRIG_VIDEO   Video trigger: start sweep once an amplitude threshold is reached at a specific frequency point.  The frequency and amplitude for this trigger mode are defined with functions SetTrigFreq() and SetTrigThrsh().        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �n E � �       TriggerMode                      �� � 8���       Status                           ��    �      SessionHandle                      	            	              7    Obtain the amplitude value from the SET9052 structure which defines the video trigger amplitude threshold.

The functions SetTrigThrsh() and RdTrigThrsh() are only needed when the 9052 is set to use video triggering.  Video trigger mode causes the spectrum analyzer to watch a designated frequency value and measure the incoming amplitude values.  If the signal level exceeds the defined threshold level, then the trigger fires and the entire sweep is taken according to the current parameters.

SEE ALSO:

SetTrigMode()    RdTrigMode()
SetTrigThrsh()
SetTrigFreq()     �    Returns the trig_thresh element from the SET9052 structure.

Variable Range:   -120 to 20 ( MR90XX_MIN_THRSH to 
                               MR90XX_MAX_THRSH )        RETURNS:    

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �� B � �       TriggerThreshold                 �� | C���       Status                           ��     �      SessionHandle                      	            	              \    Return the value of vbw_code in the SET9052 structure.  The calling application can use this to retrieve the current VBW setting.  This is especially useful when the auto_vbw flag is set to MR90XX_AUTO_ON and the C Library functions selected the best value for the VBW based upon the start and stop frequencies.

SEE ALSO:

SetVBW()
SetVBWmode()
    �    Returns the code representing the video bandwidth setting which matches the given frequency.  

Valid Range:

MR90XX_VBW_NONE      (vbw mode is not active)
MR90XX_VBW_3HZ       (width is 3   Hz)
MR90XX_VBW_30HZ      (width is 30  KHz)
MR90XX_VBW_300HZ     (width is 300 Hz)
MR90XX_VBW_3KHZ      (width is 3   KHz)
MR90XX_VBW_30KHZ     (width is 30  KHz)
MR90XX_VBW_300KHZ    (width is 300 KHz)
VMR90XX_BW_3MHZ      (width is 3   MHz)

        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� ] � �       vbwCode                          �o � :���       Status                           Ã 2   �      SessionHandle                      	            	               �    
Report the VBW auto enable/disable mode status.  The VBW auto mode indicates whether the VBW filter will be automatically adjusted by the driver.     �    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  rp_auto_on was NULL.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     �    Pointer to storage for function result value. 
 
On success:
� AUTO_ON(1)        VBW will be automatically set by the driver.

� AUTO_OFF(0)       VBW will be set by the client.

If an error occurs, the value in AutoOn is undefined
   �� � 1���       Status                           ��    �      SessionHandle                    �� D � �       autoOn                             	               	           #    Return the number of points that will be generated by a call to StartZspan().  The num_samples value always represents the number of sample steps the program wants the 905x to make.  However, if both the min and max flags are set in the sweep parameters, then the 905x will return both a min and a max point for each reading, and the number of points the engine returns will be ( num_samples * 2 ).

Thus this function does not simply echo back the num_samples value in the structure.

SEE ALSO:

SetZSamplCnt()
SetZSamplRate()    RdZSamplRate()     �    Returns the actual number of points a call to StartZspan will generate.

Valid Range:  0 (MR90XX_MIN_SAMP) to 1,000,000,000    
                                           (MR90XX_MAX_SAMP)          RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   ˞ H � �       zSpanSampleCount                 �f � >���       Status                           �z     �      SessionHandle                      	            	               g    Return the 12-bit sample rate divider that is passed to the engine when initiating a zero span sweep.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     �    Pointer to storage for function result value. The sample rate divider from the engine; or -1L if the function return status indicates an error occurred.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
   ϙ $   �       SessionHandle                    �x M ~ �       SmplDvdr                         � � ���       Status                                 	            	            �    Return the value of the sample_rate element of the SET9052 structure.  The sample rate determines how quickly the 9052 takes samples in zero-span mode.

SEE ALSO:

SetZSamplRate()     l    Returns the sample_rate element of the SET9052 structure.

Valid Range:   10 to 32767   (1 MHz to 305 MHz)        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   Ӧ G � �       zSpanSampleRate                  � � =���       Status                           �.  !  �      SessopnHandle                      	            	              (    Verify the passed-in filter_code is a legal code value and if so set the rbw_code member of the SET9052 structure to equal that value.

If this function is called, then the calling application should have already called SetRBWmode(MR90XX_AUTO_OFF).  When in AUTO_ON mode, the library will automatically set the RBW based upon the values for start frequency, stop frequency, step_mode flag, and num_swp_pts variable.  Using this function to override the RBW setting creates the possibility of return data being decalibrated.  The program should call the IsCalibrated() function to check if the given parameters maintain calibration.  Please see the sections of the Programmer's Reference Manual which discuss automatic modes, step size, and data calibration.

SEE ALSO:

RdRBW()
SetRBWmode()
StepSizeMode()
    �    
RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_AUTO  Value cannot be manually set because of auto mode.

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None     �    Short integer code representing the RBW setting.  Constants are define in MR_DEFIN.H.  Possible values are: 
� RBW_300HZ
� RBW_3KHZ
� RBW_30KHZ
� RBW_300KHZ
� RBW_3MHZ
   � !���       Status                           ۬     �      SessionHandle                    �K   � �       code                               	               0    �    Verify the passed-in value of freq_val is in the correct range, and if so set the start member of the SET9052 structure to equal the value.

SEE ALSO:

RdStartFreq()
SetStopFreq()    RdStopFreq()     m    Frequency value for start of the sweep (Hz).

Valid Range:      0 to 1,600,000,000

Default Value:    10000    �    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_STEP  Specified span is too narrow for number of points.

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.

MR90XX_IE_WARN_SPAN Stop frequency is greater than start frequency..
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �~ D � �      freq_value                       �� o ;���       Status                           ��    �      SessionHandle                      10000    	              �    Verify the passed-in freq_val parameter is in the correct range and if so set the step member of the SET9052 structure to equal the value.  The step member is used to specify the frequency interval at which the synthesizer should be stepped when doing a sweep.  The library will automatically set this value if the step_mode element is set to MR90XX_AUTO_ON.

However, if the flag is set to MR90XX_AUTO_OFF, the user can use this function to set the step size to any legal value.  The step value is a critical value as it is used to calculate the frequency of points at given offsets into a sweep.

SEE ALSO:

StepSizeMode()
SetNumSwpPts()
RdStepSize()     p    Value in Hz that the step element should be set to.

Valid Range:      1 to 1,600,000,000

Default Value:    1    N    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   � G � �      freq_value                       � s @���       Status                           ��  $  �      SessionHandle                      1    	               �    Verify the passed-in freq_val value is in the correct range, and if so set the stop element of the SET9052 structure to equal that value.

SEE ALSO:

RdStopFreq()
SetStartFreq()    RdStartFreq()     q    Frequency value for stop of the sweep (Hz).

Valid Range:      0 to 1,600,000,000

Default Value:    1600000000        RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �[ J � �      freq_val                         �� q =���       Status                           ��     �      SessionHandle                      1600000000    	                  Check that the passed-in frequency value is within the legal range and if so set the zspan_freq element of the SET9052 data structure.  zspan_freq is the frequency at which the zero-span mode makes its amplitude readings.

SEE ALSO:

RdZspanFreq()
SetZSamplCnt()
StartZspan()     c    Frequency value for zero-span mode in Hz.

Valid Range:   0 to 1,600,000,000

Default Value:    0    M    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �� L � �      freq_value                       �" t >���       Status                           �w      �      SessionHandle                      0    	                  Verify the passed-in parameter freq_value and, if it is legal, set the trigger frequency for the engine.  When the trig_code is set to TRIG_VIDEO, this function should be called to set the frequency location at which the amplitude value will be monitored.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None     |    Frequency value to which the trig_freq parameter should be set.

Valid Range:      0 to 1,600,000,000

Default Value:    0    `    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
ADDITIONAL NOTES:
   �)    �      SessionHandle                    � I � �      freqValue                        � v ;���       Status                                     	           �    Sets the current index into the array of sweep data.  It is 
the application's responsibility to allocate the memory for
the actual sweep data, but the library keeps track of where
the update point is in the array range.     3    Index value which is to be set as current index .        
RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �� I � �       index                            �� v 3���       Status                           ��    �      SessionHandle                      0    	              	0    If the calling application set the time_mode element of the SET9052 structure to MR90XX_TIMESET, it can then specify the time period that the 905x should allow for the filter to settle before taking a reading from the A/D converter.  Normally this would only be done to decrease the settling time in order to speed up the sweep.

The settle time can also be increased, but there is almost nothing to be gained from this action.  Normally, if the program wants to spend more time at each frequency step, it would define a dwell time value rather than increasing settling time.

Decreasing the settling time in order to increase sweep speed will generate decalibrated data.  Therefore this should only be done when sweep speed is more important than the accuracy of the data.

PLEASE NOTE!  When in MR90XX_AUTO_ON for time_mode, the settle_time is normally reset every time the RBW is reset.  However, when the calling application has specified MR90XX_TIMESET for time_mode, this is no longer true.  The application is responsible for adjusting the settle_time when not in MR90XX_AUTO_ON mode.

SEE ALSO:

RdSettleTime()
SwpTimeMode()
SetSwpTime()      RdSwpTime()
SetDwellTime()    RdDwellTime()

EXAMPLE:

/* This fragment attempts to cut the sweep time by 1/3.  This will definitely generate decalibrated data.  But the purpose of the function is to trade amplitude accuracy for speed  */

cur_rbw_code = RBW_3KHZ;
ViInt32 norm_setl_time;
ViReal64 new_sweeptime;
ViStatus status;

/* manually set the RBW filter */
mr90xx_SetRBWMode( instrSession, MR90XX_AUTO_OFF );
mr90xx_SetRBW( instrSession, cur_rbw_code );

/* get the normal calibrated settle time  */
mr90xx_DefltSetTimeRBW( instrSession, cur_rbw_code,                 
                        &norm_setl_time );

/* set the new value to 1/3 less time */
new_setl_time = ( long )( norm_setl_time * ( 2 / 3 ) );

/* change time mode to allow override  */
mr90xx_SwpTimeMode( instrSession,  MR90XX_TIMESET );

/* set the new settle time */
status = mr90xx_OverrideSetTime( instrSession, new_setl_time );

if( status == VI_SUCCESS )
{
    mr90xx_RdSwpTime( &instr, &new_sweeptime );
    /* swp time is double */
    printf( "The new sweep time using the new RBW settling time 
             is %f.\n", new_sweep_time );
}
else
{
   /* Process the status code and take the appropriate action */
}
    �    The number of microseconds the 9052 should delay to allow the filter to settle before reading the A/D converter.  Please note that this is a value for the settle_time, not the overall step time.  The settling time of the synthesizer and any specified dwell_time must be added together to determine what the actual step time is.

Valid Range:    1 to 2,147,483,647

Default Value:    1    �    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_AUTO  Value cannot be manually set because of auto mode.

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   � H � �      time_val                         _ s 7���       Status                           �    �      SessionHandle                      1    	              p    This function sets the attenuation element of the SET9052 data structure, to the passed-in atten_value, if atten_value is within the legal range of 0 to 60 dB.

All of the 9052 engine commands to generate data (i.e. StartSweep(), StartZSpan(), StartFreqHop() ) pass the amount of attenuation for the input attenuator to add in.  This value can range from 0 dB to 60 dB.  The attenuator value will determine what the value is for the top scale that is the reference level.  If you are trying to achieve a specific reference level, the function SetRefLevel() is provided.  For instance 0 dB of attenuation places the reference level at -30 dBm and so on.  Thus to achieve a reference level of +20 dBm the attenuation should be set to 60 dB.  Since the 9052 has 80 dB of dynamic range this 60 dB setting would achieve an amplitude range of +20 dBm to -60 dBm.

As already mentioned, the attenuation setting determines the reference level and visa versa.  Because of this a call to SetAttenuatr() will update both the attenuation and the ref_level elements of the SET9052 structure.

SEE ALSO:

RdAttenuatr()
SetRefLevel()    RdRefLevel()     M    Amount of attenuation.

Valid Range:      0 to 60 (dB)

Default Value:    0    M    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    @ � �      attenValue                       q k 8���       Status                           �  !  �      SessionHandle                      0    	               �    Set the value of the auto_cell flag in the SET9052 data structure.  This code determines if the cell_mode flag can be automatically set by the 9052 engine or if it must be specified by the calling application.    ?    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding 
                        function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     Q    Specifies the desired code using one of the two constants, AUTO_ON or AUTO_OFF.   I x 0���       Status                           � #   �      SessionHandle                    � O � �       Code                               	               0   5    Sets the value of the cell_mode flag.  This code determines if the engine should divide the span into cells and return just one minimum and/or maximum point value for each cell, or if every data point read by the engine should be returned.  This desired action is determined by the passed-in code parameter.    I    RETURNS:
MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding        
                        function.
      
MR90XX_ERROR_NULLHANDLE If session_id is 0.      �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     Q    Specifies the desired code using one of the two constants, IE_TRUE or IE_FALSE.   � s 5���       Status                               �      SessionHandle                     K � �       Mode                               	               0   �    Set the correct bits in the detect_code element of the SET9052 structure to indicate the 9052 should use the linear detector of the engine.  The detect_code is used to control what signal is being routed into the A/D converter for acquisition.  Because detect_code is a bit field which the library uses for storing internal flags, it is especially important that you not directly access the detect_code element of the SET9052 structure.

SetDetectLin(), is one of a group of three functions used to set the 9052 detectors.  The other two functions are SetDetectLog() and SetDetect3IF().  The related function for reading the current detector setting is RdDetect().

SEE ALSO:

RdDetect()
SetDetectLog()
SetDetect3IF()
    o    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  If offset is negative, greater than, or equal to the number of sweep points.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   � O 9���       Status                           o  !  �      Sessionhandle                      	               �    To specify the entire detector code as should be passed as argument 1 for the Set Detector/Trigger Parameters Command (CMD 4) to the engine.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.         Value of detect code.     d    MR90XX_IE_SUCCESS   Operational success.
MR90XX_IE_FAILURE   General engine or calculation error.
   s $   �       session_id                       Q [ � �       detect_code                      p � !���       status                             0    0    	           �    This function sets the deflt_pt_cnt element of the SET9052 structure.  Successfully sets the number of points returned by an engine sweep if the value in the parameter number_pts is in the range of MR90XX_MIN_PTS to MR90XX_MAX_PTS inclusively.

When the engine is fully coupled, the 9052 has a number of parameters it changes to maintain calibration.  Among these are the number of sweep points, the synthesizer frequency step size, and the RBW setting.  The deflt_pt_cnt element helps the library choose which parameters to vary and which to hold constant.  This allows the calling application to provide a target number for the number of sweep points as long as it maintains calibration.  This causes the library to increase the RBW size and the frequency step size to their maximums before the number of sweep points is allowed to increase.

Even though the value set by SetDefltPts() can be changed by the library to maintain calibration, the function MUST BE called if StepSizeMode() is called with MR90XX_AUTO_ON.
     r    Number of points to be returned by an engine sweep.

Valid Range:      1 to 1,000,000,000

Default Value:    401    M    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   $� I � �      numpts                           % s 6���       Status                           &f  !  �      SessionHandle                      501    	              �    Set the correct bits in the detect_code element of the SET9052 structure to indicate the 9052 should use the log detector of the engine.  The detect_code is used to control what signal is being routed into the A/D converter for acquisition.  Because detect_code is a bit field which the library uses for storing internal flags, it is especially important that you not directly access the detect_code element of the SET9052 structure.

SetDetectLog(), is one of a group of three functions used to set the 9052 detectors.  The other two functions are SetDetectLin() and SetDetect3IF().  The related function for reading the current detector setting is RdDetect().

SEE ALSO:

RdDetect()
SetDetectLin()
SetDetect3IF()
     �    
RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   *� F 5���       Status                           +�    �      SessionHandle                      	              �    Set the correct bits in the detect_code element of the SET9052 structure to indicate the 9052 engine should use the third intermediate filter of the engine.  The detect_code is used to control what signal is being routed into the A/D converter for acquisition.  Because detect_code is a bit field which the library uses for storing internal flags, it is especially important that you not directly access the detect_code element of the SET9052 structure.

SetDetect3IF(), is one of a group of three functions used to set the 9052 detectors.  The other two functions are SetDetectLog() and SetDetectLin().  The related function for reading the current detector setting is RdDetect().

SEE ALSO:

RdDetect()
SetDetectLog()
SetDetectLin()
     �    
RETURNS: 

MR90XX_IE_SUCCESS   Operational success.


MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   0 A 5���       Status                           0�    �      SessionHandle                      	              �    Verify that the passed-in time_value is a legal value and if so assign the dwell_time element of the SET9052 structure to equal time_value.

Dwell time is a special feature of the 905x that helps detect transient signals which would normally be difficult to detect with a traditional analyzer using a digital based display.  In normal operation the 905x divides the span into many small steps.  It then looks at each of these frequency increments and returns the amplitude value before moving to the next frequency point.  But what happens if the signal of interest is not constant and hits after the 905x has moved (swept) past the frequency the signal occurred at?  The 905x would miss the signal.  This is a problem inherent with digital capture and display.  If the signal has a very short duration then no matter how fast the spectrum analyzer sweeps the signal could be missed.

Dwell time gets around this not by speeding up the sweep but by slowing it down.  When a dwell time is defined the 905x will linger at each frequency step and sample the A/D converter, storing the min and/or max value until the dwell time elapses, at which time the min/max point is returned and the synthesizer steps again and dwells again.  Any brief burst of a particularly powerful or weak signal will be stored and returned from that frequency point.

It is important to realize that the dwell time is distinct from the filter settling time.  The filter settling time is the period of time which must elapse before the 905x will read the A/D at each step.  Increasing this value only slows down the sweep without any real benefit.

When defining dwell time it is also important to set up a sweep code that matches your application.  For instance, if you are looking for a transient burst of energy, you would want to make sure you activate the sweep code flag to MR90XX_SWP_MAX.  For measuring dropouts you would probably set the sweep code flag to MR90XX_SWP_MIN.  If necessary you can set both.  Please see the function SetSweepCode() for more information.

SEE ALSO:

RdDwellTime()
SwpTimeMode()
SetSwpTime()         RdSwpTime()
SetSweepCode()
OverrideSetTime()    RdSettleTime()

EXAMPLE:

See code example for function RdDwellTime().     �    The amount of time in microseconds that the synthesizer should remain at each step to sample the A/D converter.

Valid Range:   1 to 2,147,483,647

Default Value:    1    M    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   ;! D � �      time_val                         ;� l <���       Status                           ='  #  �      SessionHandle                      1    	               e    To set the engine model reference to the current engine type with the enumerated Engine Model code.     1    The Engine Model code: SA9052, SA9054 or SA9085    �    
This control contains the status code returned by the function call.

Possible Status Codes are listed below:

MR90XX_IE_SUCCESS       Operational success.
MR90XX_IE_FAILURE       General engine or calculation error.
MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding  
                        function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 
MR90XX_IE_ERROR         User mistake.
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None   ?= N � �      model                            ?v z 2���       Status                           AN $   �      SessionHandle                      0    	               D    To set one of the tenative options flags within a SET9052 object.      �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None    �    indicates which flag is being changed.
The values accepted are "#defined"ed in AUX9052.H. Possible values are

MR90xx_ENGOPT_FAKE9085--allows application software configured for a 9085 to be tested on a 9052 or 9054. Acceptable values are 1 (do fake a 9085 with a 9054) or 0 (do not fake a 9085 with a
9054).

MR90xx_ENGOPT_NOCAL--turn on/off calibration forStartFreqSweep(), StartZspan(), and StartFreqHop() [bit-3 of their Sweep Mode Bits word arguement].Acceptable values are 1 (calibration off) or 0 (calibration on).

MR90xx_ENGOPT_PERSERRS--persistent error codes.  If 1 then when the first time an error code (negative value) is set with SetFuncStatusCode(), that code will be persistently returned by RdFuncStatusCode() until a call to ClearFuncStatusCode() clears the value to 0 explicitly.  If 0, then error codes can             be overwritten just as warnings are success codes                  are overwritten.
    c    value--the flag's new value.

Possible values are

MR90xx_ENGOPT_FAKE9085--allows application software configured for a 9085 to be tested on a 9052 or 9054. Acceptable values are 1 (do fake a 9085 with a 9054) or 0 (do not fake a 9085 with a
9054).

MR90xx_ENGOPT_NOCAL--turn on/off calibration forStartFreqSweep(), StartZspan(), and StartFreqHop() [bit-3 of their Sweep Mode Bits word arguement].Acceptable values are 1 (calibration off) or 0 (calibration on).

MR90xx_ENGOPT_PERSERRS--persistent error codes.  If 1 then when the first time an error code (negative value) is set with SetFuncStatusCode(), that code will be persistently returned by RdFuncStatusCode() until a call to ClearFuncStatusCode() clears the value to 0 explicitly.  If 0, then error codes can             be overwritten just as warnings are success codes                  are overwritten.

     G    This control contains the status code returned by the function call.
   B� (   �       SessionHandle                    C� R o �       FlagNo                           G� R �       EngOption                        J� { ���       Status                             0    0    0    	           �    Verifies that the parameter ratio value is a valid VBW to RBW ratio.  If it is a valid ratio this function sets the filter_ratio element of the SET9052 data structure to the passed parameter's value.  The filter_ratio is used to help auto-set the VBW and/or the RBW.  Normally, auto_vbw is set to AUTO_ON and a ratio is defined (default is 0.10).  Then as the RBW is changed, whether automatically or manually, the VBW is automatically changed to keep the ratio setting accurate.

        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  ratio was not a valid filter ratio.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None     |    Value for the VBW to RBW ratio 
Logical values are 10000, 1000, 100, 10, 1, 0.1, 0.01, 0.001, 0.0001, 0.00001, 0.000001.     N y %���       Status                           O/ % 	  �      SessionHandle                    P$ P � �       ratio                              	               0   �    Check that the passed-in value of num_points is within the legal range of values for the number of points to store in the frequency hop table and if so, set the num_hop_points element in the SET9052 structure.

The frequency hop table is a list of frequency points which you can download to the 905x engine.  After the table is loaded using the LoadHopTable() function, a call to StartFreqHop() will cause the engine to step to the exact frequencies in the table instead of conducting a normal sweep.  The num_hop_pts element is used to tell the engine how many hop points are in the table to be loaded with the LoadHopTable() command.

SEE ALSO:

RdHopTabCnt()
LoadHopTable()     �    Number of points that will be downloaded to the engine with the LoadHopTable function.

Valid Range:      0 to 1024

Default Value:    1    M    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   T
 I � �      numPoints                        T� s 5���       Status                           U�    �      SessionHandle                      1    	              i    Verify the passed in new_int_code is a legal code value for the interrupt mode,and if so set the intr_code element of the SET9052 structure.  If new_int_code is equal to 1 then the upper byte should be set to thenwords value passed in.  This indicates the engineshould interrupt every n number of words.  The nwords
value is ignored if new_int_code is not 1.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None         Value of interrrupt code.         Number of words.   Y $   �       SessionHandle                    Y� K } �       NewIntrCode                      Z" K          nWords                          ���� u ���       Status                                         	            �    Each 9052 engine can be set to one of several addresses and one of four interrupts.  This function sets the irq number for the engine in the SET9052 data structure.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
         Vlue of IRQ number.   [� $   �       SessionHandle                    \� L y �       IrqNum                          ���� w ���       Status                             0    0    	           '    Specify the reference level (top of vertical scale) for the 9052.  This function adjusts the ref_level and attenuation elements of the SET9052 structure.  

------------------------------------------------------------   
The table below depicts when the linear attenuator is switched in and how the stepped attenuator is affected when it is.  The linear atten adds 30 dB of attenuation.  It is necessary since the linear detector has only a 50 dB range while the log detector has 80 dB.  In order to achieve the same range of examination, an extra 30 dB of attenuation is necessary to move the signal into the detection range of the linear attenuator.  The linear attenuator can only switched into the circuit when the linear detector is active.  (This means that the hardware will not allow it, regardless of the settings specified by the library.)
                                                                                     
(dBm)                 (+30dBm)   (dBm)              (+30dBm)                                    
RefLevel   Step Attn  LinAttn | RefLevel  Step Attn  LinAttn
--------   ---------  ------- | --------- ---------  -------
 -70          0        Off    |    -10        60       Off
 -65          5        Off    |    - 9        31       On
 -60         10        Off    |    - 8        32       On
 -55         15        Off    |    - 7        33       On
 -50         20        Off    |    - 6        34       On
 -45         25        Off    |    - 5        35       On
 -40         30        Off    |    - 4        36       On
 -35         35        Off    |    - 3        37       On
 -30         40        Off    |    - 2        38       On
 -25         45        Off    |    - 1        39       On
 -20         50        Off    |    - 0        40       On
 -15         55        Off    |    + 1        41       On
 -11         59        Off    |    + 2        42       On
                              |    + 5        45       On
                              |    +10        50       On
                              |    +20        60       On 
     <    Valid Range:      
                  

Default Value:    0    �    RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range or null pointer arg.

MR90XX_IE_ERR_DIFDTEC   Error code indicating a different detector is needed for the attempted operation.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   e� E � �       LinRefLevel                      e� q 6���       Status                           g�    �      SessionHandle                          	               �    Each engine can be set to one of several addresses and one of four interrupts.  This function sets the logical address to the given integer address, logaddr.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     0    
Logical address at which engine is to be set.    :    RETURNS:
MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not .                       recognized by the session decoding 
                        function
MR90XX_ERROR_NULLHANDLE If session_id is 0. 
   j
 $   �       SessionHandle                    j� P ~ �       LogAddr                          k! z ���       Status                                 0    	           k    This function is used to set the num_cells element of the SET9052 structure.  The function verifies the passed-in value new_cell_cnt, and if it is valid sets the element in the structure.

SEE ALSO:

SetZSamplCnt()
SetDwellTime()
SetSweepCode()

When making a measurement, the 905x divides the defined span into a number of frequency steps.  To maintain calibration these step sizes must be no larger than 1/3 of the bandwidth of the current resolution bandwidth (RBW) filter.  The C Library varies the step size and thus the number of samples taken as the span varies to make sure calibration is maintained.  However, as the span gets very large or the RBW becomes very small the number of steps the 905x must take can become quite large.  If the calling application desires, the engine will return every data point sampled to the PC.

However, many applications would prefer to get a constant number of return points from the engine regardless of the sweep parameters.  A graphical interface which displays the trace data is a good example.  Chances are, there is a limited screen resolution for displaying the data, and that resolution rarely (if ever) changes.  In this and similar kinds of situations the 905x does provide a mode to return a fixed number of points to represent the entire span.  This mode of operation is referred to as cell mode.

When placed in this cell mode the span is divided into a number of cells the calling application defines with the SetNumCells() function.  A "cell" is simply our term for a number of consecutive frequency points which are treated as a group and are represented by a single point in the returned data.  Thus the number of cells is the number of points for which data will be returned.

The calling application also has control of what rules the 905x engine will use in determining what data to pass back to represent the cell.  The normal method of operation is to have the 905x return the peak point from each cell.  However, it is also possible to have the engine return the lowest amplitude point of each cell, or even both the minimum and maximum points.  The calling application defines this behavior by calling the SetSweepCode() function.

Using cell mode complicates how the 905x determines the frequency of an amplitude point.  When the 905x is conducting a sweep, the frequency step size of the synthesizer is constant.  Thus it is very easy to determine the frequency of any given point in a trace with a simple calculation.  The frequency of an amplitude point equals the offset into the trace, multiplied by the frequency step size and added to the start frequency.  While this calculation still works in cell mode, there is a problem.  If the engine only returns an amplitude point for the cell, the calling application (PC based) software has no way to know what the offset into the total data set would be, and thus cannot accurately calculate the frequency.  Although the PC software does know the cell offset, the cells can be quite large and represent a very large frequency span.  Thus the best way for the PC application to know the exact frequency of an amplitude point returned in cell mode is to have the engine return the frequency of the point as well.  This maintains the 905x's extreme frequency accuracy, but increases the amount of data the engine must transfer back, because each frequency is a long integer value.  Since not all applications require this level of frequency accuracy, the return of frequency data is optional and is also set with the SetSweepCode() function.

While breaking a sweep into cells and sampling points from the cell is a normal mode of operation on most spectrum analyzers with digital displays, it is not the default mode of operation for the programming library.  By default the 9052 passes back all of the data points taken in a sweep so that they are available for whatever data manipulation the calling program intends to perform.  Using cell mode, by definition, throws away data.  By returning the minimum or maximum from each cell, theoretically the most significant data will be returned and the calling application or end user can determine if the sweep parameters should be changed to zoom in and take a closer look.

This type of behavior is normal for spectrum analyzers with digital displays.  However, traditional spectrum analyzers typically return a fixed (either 401 or 1001) number of points.  The 905x allows you to set the number of cells to any value up to 65535.  There is however, one caveat to this.  If the cell sizes are not all the same size then the maximum number of cells is 1024.  This may seem like an unusual limitation, but the process of creating the cells and acquiring the data for them can be complicated in certain situations, and there is a finite amount of memory on board the 9052 engine for this task.

Cell mode can also be used in Zero-Span mode.  This causes the 905x to create what basically represents time cells and to return the minimum, maximum or both measurements from those cells.  The number of data points returned in this mode will still be the number of cells, but the engine will actually take the number of readings set with a call to SetZSamplCnt().
     �    The value of num_cells parameter to be set.

Valid Range:      1 to 65535   if cells are same size
                  1 to  1024   if cells are different sizes

Default Value:    1    �    Returns

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                         recognized by the session decoding 
                         function.
MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.     
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
   �� I � �      NewCellCnt                       �G u 6���       Status                           ��     �      SessionHandle                      1    	              F    This function allows the calling application to determine the number of frequency steps the engine should use to generate a sweep for the current parameters.  The calling application is allowed to do this, if and only if it has already called StepSizeMode( MR90XX_STEPCNT ) or StepSizeMode( MR90XX_STEPSIZ ).  This is because the num_swp_pts element is normally set automatically by the library and one of these modes must be set in order to override it. If cell mode is not active then this function will also determine the number of data points the engine will return.

The number of points in the sweep is inversely related to the frequency step size the engine uses to create the sweep.  The following equations show the relationship:

num_swp_pts = ( stop - start ) / step

step = ( stop - start ) / num_swp_pts

When the C Library is setting these values automatically it maintains calibration by ensuring the frequency step size is less than 1/3 * RBW filter width.  If the calling application uses SetNumSwpPts() to override the number of points the engine should return, it is important to realize that the frequency step size is affected, and calibration could be lost.  If amplitude calibration is important then the calling application should be sure to call IsCalibrated() to verify that any recent override values it has set are still calibrated.  The equations above also show that the step size is also affected by the current frequency span.  Calibration should be rechecked if the span or RBW changes as well.

Please see the functional help for StepSizeMode() and IsCalibrated() for information on how to utilize those functions.  Please see Chapter 3 of the Programmer's Reference Manual for more information on decoupled operation of the 9052 and the issues involved.

SEE ALSO:

RdNumSwpPts()
StepSizeMode()
SetStepSize()     RdStepSize()     �    Number of step points which should be used to make up a "sweep".  This value is assigned to the num_swp_pts element of the SET9052 structure.

Valid Range:      1 to 1,000,000,000

Default Value:    401    �    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_AUTO  Value cannot be manually set because of auto mode.

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� K � �      SwpNumPts                        �� o 2���       Status                           �&    �      SessionHansdle                     501    	               �    Each engine can be set to one of several port addresses and one of four IRQ settings.  This function sets the address of the data port for the engine.  The status port will always be the current data port + 2.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     i    The port number which will determine the port address that the engine will use in its access functions.    �    RETURNS:
MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                         recognized by the session decoding  
                         function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
    �� $   �       SerronHandle                     �� N ~         PortNum                          �� � ���       Status                                     	                  To enable/disable the preamp.     {    the new state in which the pre-amp selection is to be made.  If 0, the pre-amp is turned off; otherwise it is turned on.
  ���� $   �       session_id                       �` P � �       on_or_off                       ���� ~ .���       status                             0    0    	           �    This function is used to define the current amplitude range of the 9052 structure by defining the highest amplitude level.  Since the V905x has an 80 dB dynamic range, the input level ranges from ref_level to ref_level - 80 dB.  This function validates the passed-in ref_value, and if it is a legal value assigns the ref_level element of the SET9052 structure to it.  The function also adjusts the attenuation element of the SET9052 structure.

The reference level is set by adjusting the attenuation.  Thus, SetRefLevel() and SetAttenuatr() perform the same task.  Since both of these functions adjust the attenuation element of the SET9052, whichever one of these two functions is called most recently, will be the call which determines the attenuation and ref_level.  See chapter 2 of the Programmer's Reference Manual for more details.

SEE ALSO:

RdRefLevel()
SetAttenuatr()    RdAttenuatr()
     �    Valid Range:      -40 to 20  (dB) without preamplifier option
                  -50 to 20  (dB) with the 10 dB preamplifier

Default Value:    0    P    
RETURNS : 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �# V � �      AmplValue                        �� � /���       Status                           � ,   �      SessionHandle                      0    	                  This function is used to set the rbw_auto flag.  This flag indicates if the RBW is coupled (configured to deliver calibrated results) and thus guaranteed to be the correct value to generate calibrated data for the given sweep parameters.

SEE ALSO:

SetRBW()
RdRBW()        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    This control accepts the Instrument Handle returned by the Initialize function to select the desired instrument driver session.

Default Value:  None        
Possible settings for the auto_rbw are AUTO_ON and AUTO_OFF.  

If the calling application wishes to override the automatic value for the RBW, it should set the flag to AUTO_OFF before calling mr90xx_SetRBW() for the desired value.  AUTO_ON and AUTO_OFF are defined in MR_DEFIN.H.   �� %���       Status                           �� %   �      SessionHandle                    �� % � �       mode                               	               0   �    Verify the passed-in bit_flag is a legal value and if so set the sweep_code element of the SET9052 structure.  The sweep_code is used to control how the 905X conducts a sweep.  Constants for the bit functions are defined in file MR_DEFIN.H.  See the Programmer's Reference Manual for related topics - sweep mode flags, cell sampling, and dwell time.

SEE ALSO:

RdSweepCode()
SetDwellTime()
SetNumCells()    �    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding 
                        function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_AUTO  Value cannot be manually set because of auto 
                     mode.
MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    �    The bit field which specifies the sweep options to be activated.  One or more of the following bits may be set:

� SWP_CONT      Sweep Mode: 0=>Single sweep, 1=>continuous
� SWP_MIN       Min.: 1=> Collect min. point at each step. 
                0=>Min off
� SWP_MAX       Max: 1=> Collect max. point at each step. 
                0=>Max off
� SWP_FRQPTS    1=>Return frequency of min. or max. point.
   �� k 9���       Status                           ��    �      SessionHandle                    �� G � �       code                               	               0   4    SetSwpTime() is used to override the automatic setting of the total sweep time and therefore is overriding the default value for the filter settling time.  Adjusting the total sweep time should be done with extreme care as it is very easy to cause decalibrated data by doing so.  Before calling SetSwpTime() the calling application should set the time_mode = TIMESWP to specify that the analyzer should not remain in AUTO mode.  This accepts an argument which should represent the time for the entire sweep in micro seconds.  This value will be assigned to the sweep_time element of the SET9052 structure.  The sweep_time element, when set, overrides the automatic settings used to calculate values for the settle_time element where:

settle_time =
      ( ( sweep_time - ( 100uS * num_swp_pts ) ) / num_swp_pts;

This formula shows that the synthesizer settle time cannot be reduced.  The sweep will NEVER be faster that 100uS * num_swp_pts.  Therefore that value is deducted from the sweep time first.  If there is any remaining time, it will be evenly distributed over each synthesizer step.  If settle_time becomes <= 0 then the RBW is not allowed any time to settle.  This would allow faster sweeps but would generate decalibrated data.

Please note that dwell times are defined separately but do affect the calculations.  Please see the sections of the Programmer's Reference Manual concerning maintaining spectrum analyzer calibration (coupled) and decoupled operation.

SEE ALSO:

RdSwpTime()
SwpTimeMode()
OverrideSetTime()    RdSettleTime()
SetDwellTime()       RdDwellTime()
     �    The amount of time in microseconds that the entire sweep should take.

Valid Range:   1 to 4,294,967,296  (microseconds)

Default Value:    1    �    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_AUTO  Value cannot be manually set because of auto mode.

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �a J � �      sweep_time                       �� v 8���       Status                           ��    �      SessionHandle                      1    	              �    Verify the passed-in trigger_flag is a legal value and if so set the trig_code element of the SET9052 structure.  The trig_code is used to control how the 9052 initiates a sweep.  Constants for the code values are defined in file sa_defin.h.  Also, the short norm_flag argument is used to set the trig_norm_flag element of the SET9052 structure.

Triggers in continuous mode can operate in 2 ways.  The normal method is to start a sweep each time the trigger hits.  Optionally the trigger can start continuous sweeps and the analyzer then free runs and ignores further triggers.  

The default value for the triggering mode is the free sweep mode.  To explicitly set this mode, the following function call would be made:

    status = mr90xx_SetTrigMode( instrSession, MR90XX_TRIG_FREE, 
                          MR90XX_CONT_TRIG_NORM );

The video trigger is different from the other modes in that it needs input for a specific frequency value at which to monitor, and a threshold value which the signal must exceed to fire the trigger.  The functions which allow the calling application to set these values are SetTrigFreq() and SetTrigThresh().  The following example shows how to set up a video trigger waiting for the signal to exceed -40 dBm at 225 MHz.

    status = mr90xx_SetTrigFreq( instrSession, 225000000 );
    status = mr90xx_SetTrigThrsh( instrSession, -40 );
    status = mr90xx_SetTrigMode( instrSession,MR90XX_TRIG_VIDEO, 
                                  MR90XX_CONT_TRIG_NORM );
    N    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
    ,    The code which specifies the type of trigger to be activated.  The possible values are:

� TRIG_FREE     Free sweep.  Sweep as fast as possible

� TRIG_EXT_HI_GO    External trigger, high-going:start sweep 
                    when trig goes high
� TRIG_EXT_LO_GO    External trigger, low-going:start sweep when 
                    trig goes low
� TRIG_EXT_HI_LVL   External trigger, high-going:start sweep 
                    when trig is high
� TRIG_EXT_LO_LVL   External trigger, low-going:start sweep when 
                    trig is low
� TRIG_MANUAL       Manual trigger: start sweep upon resume   
                    sweep command

� TRIG_VIDEO        Video trigger: start sweep once an ampl   
                    threshold is reached at a specific             
                    frequency point.     �    The norm_flag is used only when the sweep mode bit for continuous sweep is set.  The flag can take on one of the following values:

� CONT_TRIG_ONCE    Start on first trigger hit then free run.

� CONT_TRIG_NORM    Start sweep each time trigger hits. 
   �& m ;���       Status                           �|  !  �      SessionHandle                    �[ B � �       triggerFlag                      �� E �       NormFlag                           	               0    0   b    Verify the ampl_value passed in and if it is legal set the trig_thresh element of the SET9052 structure.  When the trig_code is set to MR90XX_TRIG_VIDEO, then this function should be called to set the trigger amplitude value which must be exceeded at the trigger frequency location.

SEE ALSO:

SetTrigMode()    RdTrigMode()
RdTrigThrsh()
SetTrigFreq()     h    Amplitude to which trig_thresh should be set.

Valid Range:      -120 to 20  (dB)

Default Value:    0    M    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� B � �      AmplValue                        �] j 5���       Status                           ò    �      SessionHandle                      0    	              �    Verify the passed-in filter code is a legal code and if so set the vbw_code member of the SET9052 structure to equal the value.  If this function is called, then the calling application should have already called SetVBWmode( MR90XX_AUTO_OFF ).  When in MR90XX_AUTO_ON mode the C Library functions will automatically set the VBW based upon the values for start and stop frequencies.

SEE ALSO:

RdVBW()
SetVBWmode()    `    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_AUTO  Value cannot be manually set because VBW auto mode is on.

MR90XX_IE_ERR_VALS  vbw_code was not a valid VBW filter code.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None     q    Possible VBW code


� VBW_NONE
� VBW_3HZ
� VBW_30HZ
� VBW_300HZ
� VBW_3KHZ
� VBW_30KHZ
� VBW_300KHZ
� VBW_3MHZ
   � � 2���       Status                           �j *   �      SessionHandle                    �_ U � �       code                               	               0    �    This function is used to set the auto_vbw flag.  This flag indicates if the VBW is coupled and guaranteed to be the correct value to generate calibrated data for the given sweep parameters.

SEE ALSO:

SetVBW()
RdVBW()    O    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   If mode_flag was neither AUTO_ON nor AUTO_OFF.  In this case, the VBW auto mode will be set to AUTO_ON.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    H    Possible settings for the auto_vbw are AUTO_ON and AUTO_OFF.  If the calling program wishes to override the automatic value for the VBW, it should set the flag AUTO_OFF before calling mr90xx_SetVBW() for the desired value.  AUTO_ON and AUTO_OFF are defined in MR_DEFIN.H.

Possible VBW modes are
MR90XX_AUTO_ON
MR90XX_AUTO_OFF   �p | H���       Status                           �� ) )  �      SessionHandle                    ͻ P � �       mode                               	               0   �    Check that the passed-in sampl_cnt value is within the legal range and if so set the num_samples element of the SET9052 structure.

Zero-span mode allows the capture of min/max amplitude values at a given frequency and sampling rate.  The num_samples element controls the number of points the 9052 captures and returns to the PC.  At this version release time between 1 and 100,000,000 points may be specified.  If a value of 0 is passed in, the 905x will continuously capture until the PC commands it to stop.

Please note:  when the cell mode is set for zero-span measurements the 905x will actually acquire num_samples * cell_size points, but only num_samples points are returned from the engine.

SEE ALSO:

RdZSamplCnt()
SetZSamplRate()    RdZSamplRate()     �    Number of points the 9052 should collect while in zero-span mode.  

Valid Range:   0 to 100,000,000 (maximum subject to change)
                  0 means collect and return point continuously 

Default Value:    0        RETURNS:

MR90XX_IE_SUCCESS   Specified sample was accepted.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range of 0 to 100,000,000.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �� B � �      num_samples                      Ӡ k ?���       Status                           ��  #  �      SessionHandle                      0    	               >    To accept the specified Zero Span Sample Rate Divider value.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     `    The 12-bit divider value which will be passed to the engine when initiating a Zero Span sweep.    #    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range of 2442 Hz to 1000000 Hz (inclusive).
   ֳ $   �       SessionHandle                    ג J ~ �       RateDvdr                         �� y ���       Status                                 0    	           �    Check that the passed-in value of rate_value is within the legal range of values for the sampling rate and if so set the sample_rate element in the SET9052 structure.  The sample_rate value is used to determine the frequency at which the A/D converter in the hardware should capture data.

The minimum value is 10 (representing 1 MHz) and the maximum value is 32,767 (representing 305 Hz).  The actual sampling rate will be 10 MHz / sample_rate.

SEE ALSO:

RdZSamplRate()
SetZSamplCnt()    RdZSamplCnt()
     j    Value to set in the SET9052 structure for sample_rate.

Valid Range:   10 to 32767

Default Value:    10    #    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range of 2442 Hz to 1000000 Hz (inclusive).
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �� O � �      rate_value                       �N { =���       Status                           �y " #  �      SessionHandle                      10    	              `    The step element of the SET9052 structure determines the frequency increment by which the synthesizer should step.  This value is placed in automatic mode by setting the step_mode to MR90XX_AUTO_ON.  When in this automatic mode the library will default step size to be equal to 1/3 of the current RBW size.  This value will be placed in the step element, which the calling program can read to determine the frequency step interval.

If step size mode is set to MR90XX_AUTO_ON, the application must call SetDefltPts() to specify the desired number of points for a calibrated sweep.

SEE ALSO:

SetDefltPts()        
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    �    Short integer code defined in MR_DEFIN.H with new step mode settings for the engine.

� AUTO_ON   Calling application specifies the number of
            frequency steps, but the driver automatically number 
            calculates the frequency step size for the         
            synthesizer and the of points used to conduct a 
            sweep.

� STEPCNT   Calling application specifies the number of 
            frequency steps, and the driver will adjust the  
            synthesizer step size accordingly.

� STEPSIZ   Calling application specifies the synthesizer step 
            size, and the driver will adjust the number of     
            frequency steps accordingly.

� AUTO_OFF  Calling application specifies both the synthesizer 
            step size and the number of steps to take.  This 
            mode should be used with extreme caution since the 
            user has control of all parameters, and the driver  
            cannot adjust to maintain calibration.
   � n ;���       Status                           �    �      SessionHandle                    � B � �       mode                               	               0        There are several ways to set the time it takes the 9052 to complete a sweep.  The time_mode element of the SET9052 structure determines what method will actually be used.  Normally the time_mode would be set to MR90XX_AUTO_ON.  This allows the library to select the optimal value for the sweep_time based upon the sweep parameters ( start freq, stop freq, and RBW filter ).  AUTO mode guarantees that the data returned by the 9052 is calibrated and that the analyzer is sweeping as quickly as possible while maintaining that calibration.  However, the calling application also has the option to specify the amount of time the total sweep should take or how long an individual step should take.  There are flags defined in file MR_DEFIN.H to represent these two possibilities.  The flags are MR90XX_TIMESWP indicating that the sweep_time element takes precedence, and MR90XX_TIMESET indicating that the settle_time element determines sweep_time.

It is important to realize that while the step time is ultimately affected by the dwell_time element, the two are not one and the same.  By specifying a very long step time, the program forces the 905x to wait longer before reading the signal coming in to the A/D converter.  However, defining a dwell time causes the 905x to linger at each step reading the A/D and storing the MIN and/or MAX point for that step.  Defining a dwell time will help the 9054 to detect transient signals, while boosting the step time just causes the sweep to slow down with little added advantage.  Please see the sections of the Programmer's Reference Manual concerning maintaining spectrum analyzer calibration (coupled) and decoupled operation.

SEE ALSO:

SetSwpTime()         RdSwpTime()
OverrideSetTime()    RdSettleTime()
SetDwellTime()       RdDwellTime()    >    
RETURNS:   

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_DWELL A sweep time mode other than AUTO_ON when a dwell time has already been specified.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None        Short integer code defined in MR_DEFIN.H with time mode settings for the engine.  

Possible values are

MR90XX_AUTO_ON   Driver selects sweep time
MR90XX_TIMESWP   Use sweep time to calculate settle time.    
MR90XX_TIMESET   Use settle times to calculate sweep time.       �= � :���       Status                           �� 2   �      SessionHandle                    �w ] � �       mode                               	               0       Determine if the 905x library code is operating in a manner designating that a sweep is currently being performed.  If the calling application has called BreakSweep() with the MR90XX_PAUSE or MR90XX_STOP_NOW constants, then this value will be false.  A call to BreakSweep() with MR90XX_RESUME or one of the sweep commands (StartSweep(), StartZspan() or StartFreqHop() ) will cause the flag to reset to MR90XX_TRUE.  Also, if the engine is in single sweep mode with manual triggering, IsSweeping() should return MR90XX_FALSE.  

In summary, the main purpose of this command function is to determine if the engine was operational when a command was issued.  The status of the engine can affect how some commands behave or what other commands may need to be called in combination.     �    Valid Range:

MR90XX_IE_TRUE    The engine is in the process of sweeping.

MR90XX_IE_FALSE   The engine is currently not sweeping.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   �X F � �       sweepStatus                      �� � :���       Status                           ��    �      SessionHandle                      	            	               �    This function serves as a quick check to see if the engine is currently set up to return FREQUENCY type data along with MIN/MAX type data for cell mode operation.    ;    Returns: 

MR90XX_IE_TRUE if the sweep code indicates that FREQUENCY data should be returned.

MR90XX_IE_FALSE if the sweep code indicates that FREQUENCY data is
not desired.  (Or perhaps not allowed.  If the frequency bit is set in the sweep code, but neither min nor max is, then no frequencies can be returned.     �    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �S J � �       freqPointStatus                  �� � 8���       Status                           �p    �      SessionHandle                      	            	              �    Check the value of the sweep_code bit field in the SET9052 data structure.  This allows the calling application to check the nature of the data coming back from the engine.  Essentially, this function returns the number of data values representing the sweep range which will be returned for each cell.  This value will be either none, one if either the min or max point is set, and two when both min and max are set.     �    The return value represents the number of data elements per sweep point (cell).

Valid Range: 0 - 2
    0 - no data elements
    1 - minimum OR maximum data available      
    2 - both minimum AND maximum data available
        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
      �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   �� D � �       minMaxStatus                      � { 5���       Status                           �    �      SessionHandle                      	            	               �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.
     �    ViPInt16 rp_inrange_stat    Status returned by the function.  

Possible values are:

� 1:    If frequency is in range

� 0:    If frequency is not in range
     #    Frequency checked for valid range     e    RETURNS:


MR90XX_IE_SUCCESS   On success
MR90XX_IE_FAILURE   General engine or calculation error.
   v $   �       SessionHandle                    U I ~ �       InRangeStat                      � I �       Freq                             ' � ���       Status                                 	            0    	            X    To report the value of the last function status code stored in 'gFuncStatusCode' flag.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    �    Returns the function status code.

Posibble values are
MR90XX_IE_SUCCESS          VI_SUCCESS 
MR90XX_IE_WARN_VALS        Value is out of range but  
                           stillacceptable.
MR90XX_IE_WARN_OBSOL       The function is now obsolete.

Error codes 
MR90XX_IE_FAILURE         
MR90XX_IE_ERROR          
MR90XX_IE_ERR_VALS       Argument out of range, or null pointer 
                         arg.      
MR90XX_IE_ERR_AUTO       Value can't be manually set because of 
                         auto mode 
MR90XX_IE_ERR_SPAN       Start and stop vals exchanged. Yields 
                         neg. span                                 
MR90XX_IE_ERR_STEP       Specified span is too narrow for number             .                        of points This cause step size to be <1 
MR90XX_IE_ERR_DWELL      Tried to set to non-auto mode when  
                         dwell is defin
MR90XX_IE_ERR_DIFDTEC    Error code indicating a different     
                         detector is needed for the attempted  
                         operation for example the instrument                                   
                         was in log mode when the user
                         attempted an op needing linear mode or                                
                         visa versa.                                                                            
MR90XX_IE_ERR_NULLPTR    The pointer argument being passed was 
                         NULL  
MR90XX_IE_ERR_ENGMOD     Engine model is unknown or bad
MR90XX_IE_UNKNOWN        Undefined status code 
MR90XX_ERROR_SESSIONINUSE Attempted to open a session that is  
                          already been opened.     
MR90XX_ERROR_NOSESSION   The mr90xx_init() function failed to 
                         open the session with the given 
                         inialization string.
MR90XX_ERROR_BADHANDLE   The the handle that was being passed  
                         was not recognized as belonging to any                                                             
                         known session.
#define MR90XX_ERROR_NULLHANDLE The handle argument being passed                   
                                 was 0.     � $   �       SessionHandle                    � m '���       Status                             0    	            7    To report the value of the last function status code.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None    �    Returns the engine IE_ENG code.


MR90XX_IE_ENG_BUSY         Engine is busy processing command        
MR90XX_IE_ENG_ACK          Acknowledgement of command byte          
MR90XX_IE_ENG_NOMAIN       main code programmed into flash       
MR90XX_IE_ENG_NODSP        No DSP code programmed into flash        MR90XX_IE_ENG_NOCAL        No Calibration tables programmed into 
                           flash
MR90XX_IE_ENG_ERASE        Error while trying to erase FLASH        
MR90XX_IE_ENG_FLASH        Error while trying to program FLASH      
MR90XX_IE_ENG_NYBYTES      Invld # bytes recv'd in program data 
                           buf 
MR90XX_IE_ENG_CKSUM        Invld checksum recv'd with prog data         
                           buf
MR90XX_IE_ENG_COLON        First char in data buffer not a colon    
MR90XX_IE_ENG_BAD_CMD      Engine does not recognize command      
MR90XX_IE_ENG_ERROR_GEN    General error.  
MR90XX_IE_ENG_BAD_PARM1   Engine does recognize 1st param of cmd   
MR90XX_IE_ENG_BAD_PARM2   Engine does recognize 2nd param of cmd   
MR90XX_IE_ENG_BAD_PARM3   Engine does recognize 3rd param of cmd   
MR90XX_IE_ENG_BAD_PARM4   Engine does recognize 4th param of cmd   
MR90XX_IE_ENG_BAD_PARM5   Engine does recognize 5th param of cmd   
MR90XX_IE_ENG_BAD_PARM6   Engine does recognize 6th param of cmd   
MR90XX_IE_ENG_BAD_PARM7   Engine does recognize 7th param of cmd   MR90XX_IE_ENG_BAD_PARM8   Engine does recognize 8th param of cmd   
MR90XX_IE_ENG_BAD_PARM9   Engine does recognize 9th param of cmd   
MR90XX_IE_ENG_INMAIN      Executing from main code block after  
                          reset 
MR90XX_IE_ENG_INBOOT      Executing from boot code block after 
                          reset 
MR90XX_IE_ENG_INWEEDS     Execution of boot block began, but did 
                          not successfully transfer control 
                          anywhere This implies that engine is   
                          in the weeds                                                                                                          
MR90XX_IE_ENG_ERR_DTEC    CommTrigDetect called inside sweep      
                          cmds.   
MR90XX_IE_ENG_ERR_TRIG    These code provide way of informing app   
   O $   �       Sessionhandle                    C N ~ �       EngReply                        ���� � ���       Status                                 	            	           r    Check to see if the current settings in the SET9052 structure will return calibrated data.  If all parameter modes are set to automatic this function call is not needed as the library will ensure calibrated data is returned.

When all modes of the 905x are set to MR90XX_AUTO_ON the instrument is considered to be completely coupled.  When this is the case, then the data returned by the 9052 will always be calibrated.  However, when the calling program needs to specify one or more of the sweep parameters, it becomes possible that the settings could cause the instrument to become uncalibrated.  This function exists to check and see if the current settings are calibrated or not.

The two main criteria for determining if the 9052 is calibrated or not are the sweep_time, settle_time, and step size for the synthesizer.  In order for the return data to be calibrated, the step size must be less than or equal to 1/3 * RBW.  This step size guarantees that the maximum amplitude drop for a signal falling exactly between two steps of the synthesizer to be no more than 1/2 dB.  The other key factor is the sweep_time.  The sweep_time must not force the value of the settle_time for a filter to drop below its defined settling time.

The calling application can use this function to search for the optimal values for the current parameters when not in automatic modes.  See the example below.

EXAMPLE:

/* This fragment attempts to achieve calibrated data by increasing the size of the RBW filter.  If IsCalibrated() returns false even after the RBW is 3 MHz then other ways must be found to achieve calibration */

ViInt16 status;

current_rbw = RBW_300HZ;
status - MR90XX_IE_FALSE;

while( status == MR90XX_IE_FALSE )
{
    mr90xx_IsCalibrated( instrSession, &status );
    
    if( current_rbw < MR90XX_RBW_3MHZ )
    {
        current_rbw++;
        mr90xx_SetRBW( instrSession, current_rbw );
    }
    else
    {
        printf( "Cannot achieve calibration with current sweep 
                 parameters. \n" );
        printf( "Either decrease the span or increase the number 
                 of points in the sweep.\n" );
        break;
    }
}



     �    Valid Range:

MR90XX_IE_TRUE     indicates the 905x will generate calibrated data.

MR90XX_IE_FALSE    indicates the 905x data is not guaranteed to be calibrated.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   $A F � �       calibratedStatus                 $� � >���       Status                           &    �      SessionHandle                      	            	               �    This function is similar to IsCalibrated().  IsValidStep() only
verifies if the step size is valid for the given sweep
parameters.
        The function returns a MR90XX_IE_TRUE value if the step size is 
not larger than 1/3 of the size of the selected RBW.

Valid Range:

MR90XX_IE_TRUE     indicates the 9052 will generate calibrated data.

MR90XX_IE_FALSE    indicates the 9052 data is not guaranteed to be calibrated.     �    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   (> B � �       status                           )a | :���       Status                           *;    �      SessionHandle                      	            	              b    After executing engine command 0 there are several valid return statuses besides MR90XX_REPLY_ACK.  This is a simple Function for calling programs to verify that the init was a success without having to check against a variety of flags at the application level, and without swallowing the actual status that the calling application may want to look at.     l    Returns: 
MR90XX_IE_TRUE - if response was ACK

MR90XX_IE_FALSE - any other return value from the engine.
         RETURNS:

MR90XX_IE_SUCCESS   Engine initialization was successful.

MR90XX_IE_FAILURE   Engine initialization was unsuccessful.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
   -U "   �       init_return_val                  -� M ���       Status                                 	           �    Finds the highest value amplitude point and returns its index in the data array.  The algorithm used will return the last occurrence of points with the same amplitude value.

SEE ALSO:

FindNextPeak()
FindPtAtSwpFreq()
RdSwpPtFreq()
RdCellPtFreq()
     �    Returns the index of the value of the highest peak.  

Valid Range:   1 to 1,000,000,000 

Returns 0 if the number of points is 0 or there are not any peaks greater than -9999 in value.     o    A huge pointer to the array of data points from which to extract the high peak value.

Default Value:    data     �    The value specifying the number of points to include in the high peak search.

Valid Range:      1 to 1,000,000,000

Default Value:    1     n    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_ERR_VALS  If a_ampl is NULL or if numpts <=0.
   0m � �       peakIndex                        10  �  �       data                             1�  �      numPts                           29 [ $���       Status                             	                1    	           �    Find the next peak to the left or right of the current peak.

SEE ALSO:

FindHighFreq()
FindPtAtSwpFreq()
RdSwpPtFreq()
RdCellPtFreq()     o    A huge pointer to the array of data points from which to extract the high peak value.

Default Value:    data     �    Specifies the minimum threshold peak value which will be accepted as an adjacent peak value.  This parameter helps ensure that random noise will not be interpreted as an adjacent peak.

Valid Range:   -130 to 20  (dB)

Default Value:    0     n    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_ERR_VALS  If a_ampl is NULL or if numpts <=0.
     �    The value specifying the number of points to include in the high peak search.

Valid Range:   1 to 1,000,000,000

Default Value:    1     �    The current index in the array from which the previous peak value was found with FindHighPeak().

Valid Range:   1 to 1,000,000,000

Default Value:    1     �    Returns the index of the first peak satisfying the threshold peak amplitude value.

Valid Range:   1 to 1,000,000,000

Returns 0 if the number of points is 0 or there are not any peaks greater than -9999 in value.
   44 / ~  �       data                             4� /� �      min_peak_val                     5� � ���       Status                           6 Y } �      numPts                           6� / �      cur_peak_indx                    7J Y� �       nextIndex                       ���� Y �       UpOrDown                               0    	           1    1    	            0    �    Finds the amplitude value in the data array which most closely matches the amplitude of the frequency specified in the freq parameter.

SEE ALSO:

FindHighFreq()
FindNextPeak()
RdSwpPtFreq()     �    Returns the index of the frequency which has an amplitude most closely corresponding to that of the indicated parameter frequency.

Valid Range:   1 to 1,000,000,000     o    A huge pointer to the array of data points from which to extract the high peak value.

Default Value:    data     {    The frequency of the amplitude value which is to be approximated.

Valid Range:   0 to 1,600,000,000

Default Value:    0    +    
This control contains the status code returned by the function call.

Possible Status Codes are listed below:

Status    Description
-------------------------------------------------
       0  No error (the call was successful).

3FFC0102  Reset not supported - VI_WARN_NSUP_RESET      
3FFF0005  The specified termination character was read.
3FFF0006  The specified number of bytes was read.

BFFF0000  Miscellaneous or system error occurred.
BFFF000E  Invalid session handle.
BFFF0015  Timeout occurred before operation could complete.
BFFF0034  Violation of raw write protocol occurred.
BFFF0035  Violation of raw read protocol occurred.
BFFF0036  Device reported an output protocol error.
BFFF0037  Device reported an input protocol error.
BFFF0038  Bus error occurred during transfer.
BFFF003A  Invalid setup (attributes are not consistent).
BFFF005F  No listeners condition was detected.
BFFF0060  This interface is not the controller in charge.
BFFF0067  Operation is not supported on this session.


V905x Instrument Specific Error Codes.  see also file mr_defin.h

MR90XX_IE_FAILURE  From Engine - General Function Failure." },     
MR90XX_IE_SUCCESS  From Engine - No Error - SUCCESS." },      
MR90XX_IE_ERRORR:  From Engine - General Error." },    
MR90XX_IE_ERR_VALS From Engine - Argument out of range, or null 
    pointer arg.    
MR90XX_IE_ERR_AUTO From Engine - Value can't be manually set 
    because of auto mode    ."},
MR90XX_IE_ERR_SPAN From Engine - Start and Stop frequency span 
    parameters error.
                                                                
MR90XX_IE_ERR_STEP  From Engine - Specified span is too narrow 
    for number of points.
MR90XX_IE_ERR_DWELL From Engine - Tried to set to non-auto mode 
    when dwell is defined.
MR90XX_IE_ERR_DIFDTEC From engine - a different detector is 
    needed for the attempted operation.
MR90XX_IE_WARN_VALS  From Engine - Value is out of range but 
    still acceptable.
      
MR90XX_ERROR_NODECODE  Failure to decode magic number and 
    SET9052 pointer from session handle. 
MR90XX_ERROR_NOSESSION Failure to initialize session - SET9052 
    memory not allocated.


MR90XX_REPLY_BUSY From Engine - Engine is busy processing 
    command.
MR90XX_REPLY_ACK,          From Engine - Acknowledgement of 
    command byte.
MR90XX_REPLY_NOMAIN,       From Engine - No main code programmed 
    into flash.
MR90XX_REPLY_NODSP,        From Engine - No DSP code programmed 
    into flash .
MR90XX_REPLY_NOCAL,        From Engine - No Calibration tables 
    programmed into flash.
MR90XX_REPLY_ERASE,        From Engine - Error while trying to 
    erase FLASH .
MR90XX_REPLY_FLASH,        From Engine - Error while trying to 
    program FLASH.
MR90XX_REPLY_NYBYTES,      From Engine - Invld # bytes recv'd in 
    program data buf.
MR90XX_REPLY_CKSUM,        From Engine - Invld checksum recv'd 
    with prog data buf.
MR90XX_REPLY_COLON,        From Engine - First char in data 
    buffer not a colon.
MR90XX_REPLY_BAD_CMD,      From Engine - Engine does not 
    recognize command #.
MR90XX_REPLY_ERROR_GEN,    From Engine - General error.  No hex 
    table on Cmd 4 .
MR90XX_REPLY_BAD_PARM1,    From Engine - Engine does recognize 
    1st param of cmd.
MR90XX_REPLY_BAD_PARM2,    From Engine - Engine does recognize 
    2nd param of cmd.
MR90XX_REPLY_BAD_PARM3,    From Engine - Engine does recognize 
    3rd param of cmd.
MR90XX_REPLY_BAD_PARM4,    From Engine - Engine does recognize 
    4th param of cmd.
MR90XX_REPLY_BAD_PARM5,    From Engine - Engine does recognize 
    5th param of cmd.
MR90XX_REPLY_BAD_PARM6,    From Engine - Engine does recognize 
    6th param of cmd.
MR90XX_REPLY_BAD_PARM7,    From Engine - Engine does recognize 
    7th param of cmd.
MR90XX_REPLY_BAD_PARM8,    From Engine - Engine does recognize 
    8th param of cmd.
MR90XX_REPLY_BAD_PARM9,    From Engine - Engine does recognize 
    9th param of cmd.
MR90XX_IE_ERR_DTEC,        From Engine - CommTrigDetect called 
    inside sweep cmds.
MR90XX_IE_ERR_TRIG,        From Engine - Trigger or Detector 
    parameter error.
MR90XX_REPLY_INMAIN,       From Engine - Executing from main 
    code block after reset.
MR90XX_REPLY_INBOOT,       From Engine - Executing from boot 
    code block after reset.
MR90XX_REPLY_INWEEDS,      From Engine - Execution of boot block 
    began but control did not transfer.

     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   :� ? �       pointIndex                       ;D M� �       data                             ;� F � �      freq                             <> p :���       Status                           Mq    �      SessionHandle                      	                0    	              �    Once an amplitude value of interest is located, this function is used to determine the frequency of that amplitude value.  The FindPeak functions (see Data Analysis Class) return the offset into the amplitude point arrays.  This function is handed those offset values to identify the corresponding frequency.  Frequency values are determined in one of two ways depending on the operational mode of the spectrum analyzer.

If the analzer was in cell mode returning minimum and/or maximum points then there are arrays of frequency points that correspond to the data arrays.  The function RdCellPtFreq() handles this case.

The other case is when there is no cell mode, and each amplitude point is at an equal frequency interval from the others.  This frequency step size can be used with the offset and the start frequency to determine the frequency of the point at the given offset.

SEE ALSO:

FindHighFreq()
FindNextPeak()
FindPtAtSwpFreq()
RdCellPtFreq()
     N    Returns the frequency of the data point specified by the offset parameter.

     h    Offset into the current data sample array.

Valid Range:      0 to 1,000,000,000

Default Value:    0     m    RETURNS:
MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  If offset is negative, greater than, or equal to the number of sweep points.
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   SZ ?/ �       freqValue                        S� B � �      offset                           T  ~ ���       Status                           U�    �      instrSession                       	           0    	              �    Once an amplitude value of interest is located, this function is used to determine the frequency of that amplitude value.  The FindPeak functions (see the Data Analysis Class of functions) return the offset into the amplitude point arrays.  This function is then handed those offset values used to identify the frequency. Frequency values are determined in one of two ways depending on the operational mode of the spectrum analyzer. 

If the analyzer was in cell mode returning min and/or max points then there are arrays of frequency points that correspond to the data arrays.  This function handles this situation and is really an array indexing mechanism.  It is intended to provide a consistent interface function for finding the frequencies, and doing the checks against the SET9052 data structure.  In most 
cases, it will be easier for the calling application to access the array directly, but in certain situations this function can provide greater ease or program consistency. 

The other case is when cell mode is currently not in operation and each amplitude point is at an equal frequency interval from the others.  The function RdSwpPtFreq() deals with that case.

SEE ALSO:

FindHighFreq()       FindNextPeak()
FindPtAtSwpFreq()    RdSwpPtFreq()     �    Returns the frequency of the currently selected data point specified by offset.  

Variable Range:   0 to 1,600,000,000.  Returns MR90XX_IE_FAILURE if a frequency cannot be calculated for the given offset - this usually means that the offset is invalid.     �    The offset into the amplitude array for which a frequency point is desired

Valid Range:      0 to 1,000,000,000

Default Value:    0     |    Pointer to array of frequencies which corresponds to the minimum point array.  Can be NULL.

Default Value:    min_freqs

     z    Pointer to array of frequencies which corresponds to the maximum point array.  Can be NULL.

Default Value:    max_freqs    >    Returns:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not 
                        recognized by the session decoding 
                        function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     $    Determines the indexing operation.   \t �W �       FreqValue                        ]{ F � �      Offset                           ^
 C� �       MinFreq                          ^� � � �       MaxFreq                          _ � ���       Status                           `V    �      SessionHandle                    aJ F �       MinMaxCode                         	           0    	            	            	               0   e    For a given value in nanovolts, find the best dBm reference
level to accomodate the value.  This function exists to help set the reference level in linear mode.

The key to this function is find the next highest dBm value to 
accomodate the passed in voltage.  When the dBm value is greater
then zero it is simply a matter of rounding up to the next highest dBm value.  This rounding is accomplished by adding nearly 1 and then truncating.  We cannot actually add 1 because the next lower dBm value should not be rounded up.

If the dBm value is less then 0, simply truncating is sufficient. This is because higher fractions actually mean lower voltage values, i.e. decimals make the number more negative and thus result in a lower dBm value, while on the positive dBm scale, decimals make the number more positive and thus result in higher voltage values.          
         Value in units of nanoVolts.     F    Optimum dBm reference corresponding to the passed-in nanoVolt value.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   f� C � �       voltage                          f� 3 �       dbmRef                           g o 3���       Status                           h    �      SessionHandle                      0    	            	               �    Obtains a raw hardware measurement value that corresponds to a passed-in dBm value for the V905x.  This raw value depends on the selected detector, input attenuation setting, and if the preamplifier option is presetn.        Returns the amplitude value corresponding to the passed-in value of dBm.  The amplitude value

amplitude = 128.0 ( dbmval - ( attenuation - preamp gain ) )

this equation results in a range of -15,360 to +5,120 for raw amplitude measurements using a calibrated V905x. 
     �    A dBm value that is to be converted into units equivalent to a raw engine A/D convertor measurement.

Valid Range:

-130 to 20 dBm ( maximum measurement range for the V905x )
        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   j� 30 �       amplitude                        l  D � �       dbmval                           l� p D���       Status                           m�  $  �      SessionHandle                      	                	               G    Converts a nanoVolt value to the equivaltne V905x raw hardware value.     h    Value in nanoVolt units that is to be converted into the equivalent raw amplitude value for the V905x.     w    Raw amplitude value that represents the V905x hardware measurement corresponding to the passed-in value of nanoVolts.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.
 
MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   p J � �       NanoVolts                        pt ;  �       amplitude                        p� w 9���       Status                           r    �      SessionHandle                          	            	              l    This function converts a given amplitude returned from the engine to dB measurement units.  Amplitude values from the engine should always be converted to a dB or Voltage units prior to making adjustments to the SET9052 structure.  The input impedance and stepped attenuator are used to determine the correct value in dB.

SEE ALSO:

GetnVForAmpl()
GetnVForDbm()     L    Returns the converted dBm value.

Variable Range:   -130.0 to 20.0   (dBm)        The current amplitude reading from the engine to be converted to dBm.

Valid Range:       0 to  4095  for uncalibrated engine
              -17000 to -5100  for LOG detector & calibrated
                   0 to 22400  for LIN detector & calibrated

Default Value:    0
        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None   ud ? �       dbm                              u� K � �      amp                              v� u 6���       Status                           w�    �      SessionHandle                      	           0    	               A    Converts a voltage value to equivalent dBm units for the V905x.     I    Passed-in value in Volt units to the equivalent dBm units of the V905x.     H    dBm value returned that corresponds to the passed-in value of voltage.        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   z J � �       voltage                          zf > �       dbm                              z� x 2���       Status                           {�    �      SessionHandle                          	           	                  For a given amplitude value returned from the engine determine its value in nanoVolts.  Amplitude values from the engine should always be converted to a dBm or nanoVoltage value prior to making adjustments to the SET9052 data structure.  The input impedance and the stepped attenuator are used to determine the correct value in nano Volts.

SEE ALSO:

GetDbmForAmpl()
GetnVForDbm()        The current amplitude reading from the engine to be converted to nanoVolts.

Valid Range:       0 to  4095  for uncalibrated engine
              -17000 to -5100  for LOG detector & calibrated
                   0 to 22400  for LIN detector & calibrated

Default Value:    0     C    Returns the converted nanoVolt value.

Variable Range:   0 to TBD        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   : M � �      amp                              �V < �       nanoVolt                         �� x >���       Status                           �� !   �      SessionHandle                      0    	           	               ^    For a given value of nV, return its value in dBm.

SEE ALSO:

GetnVForAmpl()
GetDbmForAmpl()     Y    The converted nanoVolt value.

Valid Range:      -130 to 20  (dBm)

Default Value:    0     @    Returns the converted nanoVolt value.

Valid Range:   0 to TBD        RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 
     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.


Default Value:  None   � H � �      dbmval                           �f ; �       nanoVolt                         �� w 6���       Status                           ��    �      SessionHandle                      0    	           	               h    Get the default settling time of the passed-in RBW code in microseconds.

SEE ALSO:

DefltSetTimeVBW()    .    Returns the number of microseconds for the settling time for the given RBW.  Returns MR90XX_IE_FAILURE if an invalid code is passed into the function.

Valid Range:   1 to 6000 (microseconds).
  
Return values are discrete numbers 1, 6, 60, 600, 6000 that correspond to the passed-in RBW filter code.    N    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
         The code for the desired RBW   � * �       rbwSettlingTime                  �R u ���       Status                           �� + �  �       filtCode                           	            	           0    h    Get the default settling time of the passed-in VBW code in microseconds.

SEE ALSO:

DefltSetTimeRBW()    A    Returns the number of microseconds for the settling time for the given VBW.  Returns MR90XX_IE_FAILURE if an invalid code is passed to the function.

Valid Range:   0 to 250,000 (microseconds).
  
Return values are discrete numbers 0, 1, 3, 25, 250, 2500, 25000, 250000 that correspond to the passed-in VBW filter code.    e    Code for the desired VBW.

Valid Range:

MR90XX_VBW_3HZ       (width is   3 Hz)
MR90XX_VBW_30HZ      (width is  30 KHz)
MR90XX_VBW_300HZ     (width is 300 Hz)
MR90XX_VBW_3KHZ      (width is   3 KHz)
MR90XX_VBW_30KHZ     (width is  30 KHz)
MR90XX_VBW_300KHZ    (width is 300 KHz)
MR90XX_VBW_3MHZ      (width is   3 MHz)

Default Value:    MR90XX_VBW_300HZ
    N    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.

MR90XX_ERROR_BADHANDLE  The handle that was being passed was not recognized by the session decoding function.

MR90XX_ERROR_NULLHANDLE If session_id is 0. 

MR90XX_IE_ERR_VALS  Argument out of range, or null pointer arg.
   �� $ �       vbwSettlingTime                  �C   �  ��      filt_code                       ����5 ��                                          �� i %���       Status                             	                VBW Filter Code    	           �    Pause until the amount of time specified by this_long has expired.  The time period for delay is expressed as a double for the number of seconds to wait.  The currently supported timing granularity is 55 milliseconds.

     w    The number of seconds to pause program execution.

Valid Range:   0 to ( ( 2^31 - 1 ) / 1000.0 )

Default Value:    1     6    
RETURNS:

MR90XX_IE_SUCCESS   Operational success.
   �� $ o  �      this_long                        �m W ���       Status                                 	           �    To reset the function status code held in 'gFuncStatusCode' to zero. 
This is the only way a calling application can reset the function status code once an error has occurred.     �    Session handle returned from a successful call to mr90xx_OpenSession() or mr90xx_init().  This handle uniquely identifies an individual spectrum analyzer in your system and provides access to control that device.

Default Value:  None     :    MR90XX_IE_SUCCESS on success
MR90XX_IE_FAILURE otherwise   �� $   �       SessionHandle                    �� R !���       Status                                 	            D    The passed-in code value will be converted into the RBW/VBW ratio.     �    RETURNS: 

MR90XX_IE_SUCCESS   Operational success.  Ratio was successfully retrieved.

MR90XX_IE_FAILURE   General engine or calculation error.  Value of code is not in legal range (legal range: 1 to 11).
    �    The passed-in code value will be converted into the RBW/VBW ratio as described in the table below:

Valid Range:

ratio              code
------------------------
10000               0
 1000               1
  100               2
   10               3
    1               4 
    0.1             5
    0.01            6
    0.001           7
    0.0001          8
    0.00001         9
    0.000001        10     �    Returns the ratio of RBW to VBW width in Hz.

Valid Range:

10000,
 1000,
  100,
   10,
    1,
    0.1,
    0.01,
    0.001,
    0.0001,
    0.00001,
    0.000001    �� )���       Status                           �� )   �       code                             �R ) � �       ratio                              	               	           �    Used to retrieve a code number representation of the VBW::RBW
ratio as passed in by the ratio argument.  The filter ratio defines the size relationship between the RBW and the VBW (RBW/VBW).     �    RETURNS: 

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error.  Value of ratio passed to the function was out of legal range (legal range: 104 to 10-6 )
     �    Ratio of RBW to VBW width in Hz.

Valid Range:

10000,
 1000,
  100,
   10,
    1,
    0.1,
    0.01,
    0.001,
    0.0001,
    0.00001,
    0.000001 
    o    The code return value represents the RBW/VBW ratio as indicated below:


ratio              code
------------------------
10000               0
 1000               1
  100               2
   10               3
    1               4 
    0.1             5
    0.01            6
    0.001           7
    0.0001          8
    0.00001         9
    0.000001        10   ��  ����       Status                           �T    �       ratio                            ��   �       code                               	               	            U    Returns a text string describing the RBW filter for a passed-in value of filt_code.        RETURNS

MR90XX_IE_SUCCESS   Operational success.  Corresponding string name was successfully stored in retstring.

MR90XX_IE_FAILURE   General engine or calculation error.  If an invalid RBW code is passed in or a NULL pointer is passed for the string value to be returned.

     �    Pointer to string of text that describes the RBW

Possible values are listed below:

"300 Hz"
"3 KHz" 
"30 KHz"
"300 KHz
"3 MHz" 
"     " 
     A    Filter code for which string name of RBW filter will retrieved.   �� $���       Status                           ��  � �  d    retstring                        �8    �       code                               	           	            0    M    Returns a text string describing the VBW filter given a passed-in VBW code.     �    Returns the status of the close instrument function.

Valid Range:

 MR90XX_IE_SUCCESS - successful

 MR90XX_IE_FAILURE - not successful
     �    Pointer to text string describing the VBW filter.  May be one of the following values.

"NONE" 
"3 Hz" 
"30 Hz" 
"300 Hz" 
"3 KHz"
"30 KHz" 
"300 KHz"
"3 MHz"
     @    Filter code for which string name of VBW filter will retrieved   �� ���       Status                           �%  � �  d    retstring                        ��    �       code                               	           	            0    R    The integer code for the RBW which corresponds to the frequency value passed in.     8    Specified bandwidth frequency used to select RBW code.     �    RETURNS:

MR90XX_IE_SUCCESS   Operational success.

MR90XX_IE_FAILURE   General engine or calculation error, returned if no filter code matches the frequency
   �� $   �       code                             �, % � �       rbwFreq                          �l h ���       Status                             	            	           	               Returns the VBW code which matches the given frequency width specified in Hz.  This function is provided in case the calling application stores current filter widths in Hz instead of the defined VBW code constants.  CalcVBWCode() would then be used to find the code values to pass to functions such as SetVBW().  

Please note that the passed-in width variable value must exactly match one of the VBWs built into the 9052.  

SEE ALSO:

GetRBWwide()
CalcRBWCode()

EXAMPLE:

See the code example for CalcRBWCode()    �    Returns the code corresponding to the VBW filter width (Hz).

Valid Range:  The following discrete frequency values between 3 and 3,000,000.

filter width    VBW Code
--------------------------------
    NONE       MR90XX_VBW_NONE
    3          MR90XX_VBW_3HZ
    30         MR90XX_VBW_30HZ
    300        MR90XX_VBW_300HZ
    3,000      MR90XX_VBW_3KHZ
    30,000     MR90XX_VBW_30KHZ
    300,000    MR90XX_VBW_300KHZ
    3,000,000  MR90XX_VBW_3MHZ

       �    Returns the status of the close instrument function.

Valid Range:

 MR90XX_IE_SUCCESS - successful

 MR90XX_IE_FAILURE - not successful
         
Value of VBW in Hz.   ��  )  ��      vbwCode                          �� $B���       Status                           �E / � �       freq                               	            	           0   +    Get the frequency width of the passed-in RBW filter code in Hz units.  This function helps make it easier to move between calculations which need to know the real width of a filter versus the 9052 C Library internal codes for those real widths.

SEE ALSO:

CalcRBWCode()
GetVBWwide()
CalcVBWCode()    �    Returns the frequency (Hz) corresponding to the passed-in rbw_code.

Valid Range:

    The following discrete values may be returned:

    300        for passed-in code of MR90XX_RBW_300HZ
    3000        "      "       "     MR90XX_RBW_3KHz
    30000       "      "       "     MR90XX_RBW_30KHz
    300000      "      "       "     MR90XX_RBW_300KHz
    3000000     "      "       "     MR90XX_RBW_3MHz     o    RETURNS:

MR90XX_IE_SUCCESS   Operational success.
MR90XX_IE_FAILURE   General engine or calculation error.

         The filter code used as an index in to an array containing the frequency value. Constant for values are defined in MR_DEFIN.H   �R  !  �       RbwFreq                          �� "���       Status                           �f 3 � �       code                               	           	           0   )    Get the frequency width of the passed-in VBW filter code in Hz units.  This function helps make it easier to move between calculations which need to know the real width of a filter versus the 9052 C Library code selected for those real widths.

SEE ALSO

CalcRBWCode()
GetRBWwide()
CalcRBWCode()    W    Returns the frequency value that corresponds to the passed-in VBW code parameter.

Valid Range:   The following discrete values between 0 and 3,000,000 may be returned:

    0          for passed-in code of MR90XX_VBW_NONE
    3          "      "       "      MR90XX_VBW_3HZ
    30         "      "       "      VMR90XX_BW_30HZ
    300        "      "       "      MR90XX_VBW_300HZ 
    3,000      "      "       "      MR90XX_VBW_3KHZ
    30,000     "      "       "      MR90XX_VBW_30KHZ
    300,000    "      "       "      MR90XX_VBW_300KHZ
    3,000,000  "      "       "      MR90XX_VBW_3MHZ     �    Returns the status of the close instrument function.

Valid Range:

 MR90XX_IE_SUCCESS - successful

 MR90XX_IE_FAILURE - not successful
     �    The filter code used as an index in to an array containing the frequency value. Constant for values are defined in MR_DEFIN.H

Possible VBW codes


� VBW_NONE
� VBW_3HZ
� VBW_30HZ
� VBW_300HZ
� VBW_3KHZ
� VBW_30KHZ
� VBW_300KHZ
� VBW_3MHZ
   ��    �       freq                             �9 ���       Status                           �� ' � �       code                               	           	           0 ����         	�  �     K.    init                            ����         4  �     K.    close                           ����         2  �     K.    reset                           ����           �     K.    self_test                       ����          >  "=     K.    error_query                     ����         #�  %�     K.    error_message                   ����         &�  )     K.    revision_query                  ����         *s  /�     K.    InitDataCapSweep                ����         1�  6�     K.    InitGuiSweep                    ����         8�  >�     K.    InitDataCapZspan                ����         @  D�     K.    InitGuiZspan                    ����         Fj  K!     K.    InitFreqHop                     ����         L�  T�     K.    MeasureAmplWithFreq             ����         XP  ^�     K.    MeasureAmplData                 ����         b  h�     K.    MeasureMinMaxAmplWithFreq       ����         m  s     K.    MeasureMinMaxAmpl               ����         v�  ��     1    OpenSession                     ����      �� � � �                                    ����         �W  ��      � �    CloseSession                    ����         �H  ��     K.    InitEngine                      ����         �2  ��     K.    ShutdownEngine                  ����         �\  �N     K.    StartSweep                      ����         ��  ��     K.    StartZspan                      ����         �0  Ò     K.    StartFreqHop                    ����         �  �3     K.    LoadHopTableExt                 ����         �(  ��     K.    BreakSweep                      ����         Ϗ  ��      ��    GetAmplData                     ����         Ԕ  ��     �    GetAmplWithFreqExt              ����         ��  �      �3    GetMinMaxAmpl                   ����         ��  �f     �    GetMinMaxAmplWithFreqExt        ����         ��  �I     K.    ResetEngine                     ����         ��  �0     K.    InitInstrData                   ����         �  �p     K.    Recouple                        ����         ��  �g     K.    ReadStartFreq                   ����         �"  �[     K.    ReadStepSize                    ����          �     K.    ReadTrigFreq                    ����        � �     K.    ReadZspanFreq                   ����        	J L     K.    ReadStopFreq                    ����         :     K.    RdPreAmp                        ����        � �     K.    RdSwpIdx                        ����        s <     K.    RdAttenuatr                     ����        � "     K.    RdAutoCell                      ����        "� &�     K.    RdCellMode                      ����        'F +     K.    RdDefltPts                      ����        +� 0     K.    RdDetect                        ����        0� 2�     K.    RdDetectCode                    ����        3� <�     K.    RdDwellTime                     ����       ���� O�     �    RdEngineModel                   ����        P� U�     K.    RdEngOption                     ����        V~ Y?     K.    RdErrorStatus                   ����        Y� ]F      ��    RdFiltRatio                     ����        ^ dw     K.    RdHopTabCnt                     ����        e2 g�     K.    RdInterfaceType                 ����        hU kR     K.    RdLinRefLevel                   ����        l o     K.    RdLogAddr                       ����        o� pR     K.    RdMinFreqLimit                  ����        q q�     K.    RdMaxFreqLimit                  ����        rR wM     K.    RdNumCells                      ����        x |C     K.    RdNumDataPts                    ����        |� �     K.    RdNumSwpPts                     ����        �� �;     K.    RdPortNum                       ����        �� �B      m�    RdRBW                           ����        �� ��      ��    RdRefLevel                      ����        �N ��     K.    RdIntrCode                      ����        �� �J     K.    RdIrqNum                        ����       ���� �b      d�    RdRBWmode                       ����        � �x     K.    RdSettleTime                    ����        �3 ��     K.    RdSweepCode                     ����        �� �>     K.    RdSwpTime                       ����        �� ��     K.    RdTrigMode                      ����        �� ��     K.    RdTrigThrsh                     ����        �N �w      ��    RdVBW                           ����        �2 ȸ      �Q    RdVBWmode                       ����        �s �o     K.    RdZSamplCnt                     ����        �* �.     K.    RdZSamplDvdr                    ����        �� �"     K.    RdZSamplRate                    ����        �� ��      [�    SetRBW                          ����        ݱ ��     K.    ConfigStartFreq                 ����        � ��     K.    ConfigStepSize                  ����        � ��     K.    ConfigStopFreq                  ����        � �l     K.    ConfigZspanFreq                 ����        �  �
     K.    ConfigTrigFreq                  ����        �� ��     K.    SetSwpIdx                       ����        �� �     K.    OverrideSetTime                 ����        � �     K.    SetAttenuatr                    ����        n �      �|    SetAutoCell                     ����        � l      ��    SetCellMode                     ����          c     K.    SetDetectLin                    ����        � �     K.    SetDetectCode                   ����         � 'Z     K.    SetDefltPts                     ����        ( ,�     K.    SetDetectLog                    ����        -/ 1�     K.    SetDetect3IF                    ����        2c >     K.    SetDwellTime                    ����        >� A�     �    SetEngineModel                  ����        B� KB     K.    SetEngOption                    ����        L1 P�      �y    SetFiltRatio                    ����        Q\ V�     K.    SetHopTabCnt                    ����        W� Z<     K.    SetIntrCode                     ����        [( \�     K.    SetIrqNum                       ����        ]� h�     K.    SetLinRefLevel                  ����        ic lc     K.    SetLogAddr                      ����        m ��     K.    SetNumCells                     ����        �f �     K.    SetNumSwpPts                    ����        �� ��     K.    SetPortNum                      ����        �8 ��     K.    SetPreamp                       ����        �� �	      ��    SetRefLevel                     ����        �� ��      W�    SetRBWmode                      ����        �\ �q     K.    SetSweepCode                    ����        �% ��     K.    SetSwpTime                      ����        �> ��      ��    SetTrigMode                     ����        �� Ħ     K.    SetTrigThrsh                    ����        �Z ��      ��    SetVBW                          ����        ʌ �      ��    SetVBWmode                      ����        Ͽ չ     K.    SetZSamplCnt                    ����        �m �%     K.    SetZSamplDvdr                   ����        �� �m     K.    SetZSamplRate                   ����        �" �     K.    StepSizeMode                    ����        �5 �     K.    SwpTimeMode                     ����        �E ��     K.    IsSweeping                      ����        �� �e     K.    CheckForFreqpts                 ����        �  �     K.    CheckForMinMax                  ����       ���� �     K.    FreqInRange                     ����        � �     K.    GetFuncStatusCode               ����              K.    GetEngReplyCode                 ����        � &�     K.    IsCalibrated                    ����        '� +0     K.    IsValidStep                     ����        +� .�     K.    IsValidInit                     ����        /k 2�     K.    FindHighPeak                    ����        3� 8*     K.    FindNextPeak                    ����        9� Ne     K.    FindIdxForSwpFreq               ����        O� V�     G.    ReadSwpPtFreq                   ����        W av     K.    ReadCellPtFreq                  ����        c' i     K.    FindEquivDbmRef                 ����        j n�     K.    GetAmplForDbm                   ����        o� r�     K.    GetAmplFornV                    ����        s� x�     K.    GetDbmForAmpl                   ����        y� |�     K.    GetDbmForVoltage                ����        }� ��     K.    GetnVForAmpl                    ����        �� ��     K.    GetnVForDbm                     ����        �� ��     K.    DefltSetTimeRBW                 ����        �� �     K.    DefltSetTimeVBW                 ����        �	 ��     K.    DelayOps                        ����        �% �     K.    ClearFuncStatusCode             ����        �� ��      n�    GetRatioForCode                 ����        �� �m      Ze    GetCodeForRatio                 ����        �( ��      X�    GetRBWString                    ����        �= �      ]~    GetVBWString                    ����       ���� �     K.    RBWCodeFromFreq                 ����        �� �c      a�    VBWCodeFromFreq                 ����        � ��     -�    RBWFreqFromCode                 ����        �� ��      ]�    VBWFreqFromCode                       y                                  ����Pnp Driver Functions              ����Initialize Functions                 DInitialize                        ����Close Functions                      DClose                             ����Utility Functions                    DReset                                DSelf-Test                            DError Query                          DError Messege                        DRevision Query                    ����Application Functions             ����Set Up Function                      DInitialize Data Capture Sweep        DInitialize Gui Sweep                 DInitialize Data Capture Zspan        DInitialize Gui Zspan                 DInitialize Freqency Hop           ����Action/Data Functions                DMeasure Ampl  And Frequency          DMeasure Ampl  Data                   DMeasure Min/Max Data and Freq        DMeasure Min/Max Data              ����Component Functions               ����Session Functions                    |Open Session                         DClose Session                     ����Command and Data Retrieval          �Action Functions                     DInitialize Eng                       DShut Down Engine                     DStart Sweep                          DStart Zero Span                      DStart Frequency Hop                  DLoad Frequency Hop Table             DBreak Sweep                         �Acquisition Functions                DGet Ampl Data                        DGet Ampl and Freq Data               DGet Min/Max Ampl Data                DGet Min/Max Ampl and Freq Data      �Utility Functions                    DReset Engine                         DInitialize Instrument Data           DRe Couple (Engine calibration)    ����Reading the Engine's Parameters      DRead Start Frequency                 DRead Step Size                       DRead Trigger Frequency               DRead Zero Span Frequency             DRead Stop Frequency                  DRead Pre Amp                         DRead Sweep Index                     DRead Attenuator Setting              DRead Auto Cell                       DRead Cell Mode                       DRead Default Points                  DRead Detector Mode                   DRead Detector Code                   DRead Dwell Time                      DRead Engine Model                    DRead Engine Option                   DRead Error Status                    DRead Filter Ratio                    DRead Hop Table Count                 DRead Interface Type                  DRead Linear Reference Level          DRead Logical  Address                DRead Minimum Frequency Limit         DRead Maximum Frequency Limit         DRead Number of Cells                 DRead Number Of Data Points           DRead Number of Sweep Points          DRead Port Number                     DRead RBW                             DRead Input Reference Level           DRead Interrupt Code                  DRead IRQ Number                      DRead RBW Mode                        DRead Settling Time                   DRead Sweep Code                      DRead Sweep Time                      DRead Trigger Mode                    DRead Trigger Threshold               DRead VBW                             DRead VBW Mode                        DRead Zero Span Sample Count          DRead ZSpan Sample Rate Divider       DRead Zero Span Sample Rate           DSet RBW                           ����Setting The Engine's Parameters      DConfig Start Frequency               DConfig Step Size                     DConfig Stop Frequency                DConfig Zero Span Frequency           DConfig Trigger Frequency             DSet Sweep Index                      DOverride Settling Time`              DSet Attenuator Value                 DSet Auto Cell                        DSet Cell Mode                        DSet Linear Detector                  DSet Detector Code                    DSet Default Points                   DSet Log Detector                     DSet 3rd IF Detector                  DSet Dwell Time                       DSet Engine Model                     DSet Engine Option                    DSet Filter Ratio                     DSet Hop Table Count                  DSet Interrupt Code                   DSet IRQ Number                       DSet Linear Reference Level           DSet Logical Address                  DSet Number of Cells                  DSet Number of Sweep Points           DSet Port Number                      DSet Preamp                           DSet Input Reference Level            DSet RBW Mode                         DSet Sweep Code                       DSet Sweep Time                       DSet Trigger Mode                     DSet Trigger Threshold                DSet VBW                              DSet VBW Mode                         DSet Zero Span Sample Count           DSet ZSpan Sample Rate Divider        DSet Zero Span Sample Rate            DStep Size Mode                       DSweep Time Mode                   ����Obtaining Status & Information       DIs Sweeping                          DCheck for Frequency Data Mode        DCheck For Min/Max Mode               DFrequency Range                      DGet Function Status Code             DGet Engine Reply                     DIs Calibrated                        DIs Valid Step                        DIs Valid Initialization           ����Processing Sweep Data                DFind High Peak                       DFind Next Peak                       DFind Index for Sweep Frequency       DRead Sweep Point Frequency           DRead Cell Point Frequency         ����Data Conversion Function             DFind Equivalent dBm Reference        DGet Amplitude for dBm                DGet Amplitude for nano Voltage       DGet dBm for Amplitude                DGet dBm for (nano)  Voltage          DGet nano Volts for Amplitude         DGet nano Volts for dBm            ����Helper Functions                     DDefault Settling Time RBW            DDefault Settling Time VBW            DDelay Operations                     DClear Function status Code           DGet RBW/VBW Ratio for Code           DGet RBW/VBW Code for Ratio           DGet RBW (descriptor) String          DGet VBW (descriptor) String          DGet RBW Code From Frequency          DGet VBW Code From Frequency          DGet RBW Frequency From Code          DGet VBW Frequency From Code     
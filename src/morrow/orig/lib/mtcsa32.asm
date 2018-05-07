
_SCOPETABLE_ENTRY struc ; (sizeof=0xC, align=0x4, copyof_1)
                        ; XREF: CommInterrupts+4C/o
                        ; StartSweep+3F/o ...
EnclosingLevel dd ?
FilterFunc dd ?         ; offset
HandlerFunc dd ?        ; offset
_SCOPETABLE_ENTRY ends


struc_2 struc ; (sizeof=0x18, align=0x4, mappedto_20)
                        ; XREF: CommInterrupts+4C/o
                        ; StartSweep+3F/o ...
old_esp dd ?
exc_ptr dd ?            ; offset
registration _EH3_EXCEPTION_REGISTRATION ?
struc_2 ends


CPPEH_RECORD struc ; (sizeof=0x18, align=0x4, copyof_6)
                        ; XREF: CommInterrupts+4C/o
                        ; sub_10001718+309/o ...
old_esp dd ?            ; XREF: sub_1001239E+23/w
                        ; sub_1001239E+E4/w ...
exc_ptr dd ?            ; offset
registration _EH3_EXCEPTION_REGISTRATION ?
                        ; XREF: sub_1000D97B+40/w
                        ; sub_1000D97B:loc_1000D9D6/w ...
CPPEH_RECORD ends


_EH3_EXCEPTION_REGISTRATION struc ; (sizeof=0x10, align=0x4, copyof_3)
                        ; XREF: CommInterrupts+4C/o
                        ; sub_10001718+309/o ...
Next dd ?               ; XREF: sub_1000D97B:loc_1000DA55/r
                        ; sub_1000DAA2:loc_1000DB8F/r ... ; offset
ExceptionHandler dd ?   ; offset
ScopeTable dd ?         ; offset
TryLevel dd ?           ; XREF: sub_1000D97B+40/w
                        ; sub_1000D97B:loc_1000D9D6/w ...
_EH3_EXCEPTION_REGISTRATION ends


_OSVERSIONINFOA struc ; (sizeof=0x94, align=0x4, copyof_7)
                        ; XREF: CommInterrupts+4C/o
                        ; sub_10001718+1EE/o ...
dwOSVersionInfoSize dd ? ; XREF: sub_100035DD+9/w
                        ; sub_1000F243+15/w
dwMajorVersion dd ?     ; XREF: sub_1000F243+32/r
dwMinorVersion dd ?
dwBuildNumber dd ?
dwPlatformId dd ?       ; XREF: sub_100035DD+20/r
                        ; sub_1000F243+29/r
szCSDVersion db 128 dup(?)
_OSVERSIONINFOA ends


_STARTUPINFOA struc ; (sizeof=0x44, align=0x4, copyof_10)
                        ; XREF: CommInterrupts+4C/o
                        ; CommTrigDetect+39/o ...
cb dd ?
lpReserved dd ?         ; offset
lpDesktop dd ?          ; offset
lpTitle dd ?            ; offset
dwX dd ?
dwY dd ?
dwXSize dd ?
dwYSize dd ?
dwXCountChars dd ?
dwYCountChars dd ?
dwFillAttribute dd ?
dwFlags dd ?
wShowWindow dw ?
cbReserved2 dw ?        ; XREF: sub_1001100B+64/r
lpReserved2 dd ?        ; XREF: sub_1001100B+6F/r ; offset
hStdInput dd ?          ; offset
hStdOutput dd ?         ; offset
hStdError dd ?          ; offset
_STARTUPINFOA ends


_cpinfo struc ; (sizeof=0x14, align=0x4, copyof_16)
                        ; XREF: sub_10001718+309/o
                        ; StartSweep+59/o ...
MaxCharSize dd ?        ; XREF: sub_100138CC+73/r
DefaultChar db 2 dup(?)
LeadByte db 12 dup(?)   ; XREF: sub_100138CC+85/r
                        ; sub_100138CC+8F/o ...
db ? ; undefined
db ? ; undefined
_cpinfo ends


S struc ; (sizeof=0x298, align=0x8, copyof_19)
                        ; XREF: CommInterrupts+4C/o
                        ; CommTrigDetect+3D/o ...
op_mode dw ?
engine_model dw ?
swp_in_prog dw ?
db ? ; undefined
db ? ; undefined
start dq ?              ; XREF: sub_10001718+39/r
                        ; StartSweep+43/r
stop dq ?               ; XREF: sub_10001718+36/r
                        ; StartSweep+5D/r
step dq ?               ; XREF: sub_10001718+158/w
                        ; sub_10001718+161/r ...
step_mode dw ?          ; XREF: sub_10001718+76/r
time_mode dw ?
dwell_time dd ?
settle_time dd ?        ; XREF: StartSweep+132/r
                        ; StartSweep+142/r
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
sweep_time dq ?
swp_time_unit dw ?
db ? ; undefined
db ? ; undefined
synth_time dd ?
cell_mode dw ?          ; XREF: sub_10001718+DD/r
                        ; sub_10001718+12A/r ...
auto_cell dw ?          ; XREF: sub_10001718+D1/r
deflt_pt_cnt dd ?       ; XREF: sub_10001718+5B/r
                        ; sub_10001718+6A/r ...
rbw_code dw ?           ; XREF: sub_10001718+13A/r
                        ; sub_10001718+22B/r ...
auto_rbw dw ?           ; XREF: sub_10001718+9F/r
vbw_code dw ?           ; XREF: StartSweep+C9/r
auto_vbw dw ?           ; XREF: sub_10001718+B9/r
filter_code dw ?        ; XREF: StartSweep+DC/w
                        ; StartSweep+110/r
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
filter_ratio dq ?
attenuation dw ?        ; XREF: StartSweep+14F/r
ref_level dw ?
PreampAvailable dw ?
PreampEnabled dw ?      ; XREF: StartSweep+162/r
PreampGain dw ?
EngineRefLevel dw ?
trig_code dw ?          ; XREF: CommTrigDetect+82/r
                        ; CommTrigDetect+8F/r ...
trig_norm_flag dw ?     ; XREF: CommTrigDetect+77/r
trig_delay dd ?         ; XREF: CommTrigDetect+AA/r
                        ; CommTrigDetect+BA/r
trig_thresh dw ?        ; XREF: CommTrigDetect+C7/r
                        ; CommTrigDetect+D7/r
db ? ; undefined
db ? ; undefined
trig_freq dq ?          ; XREF: CommTrigDetect+3D/r
detect_code dw ?        ; XREF: CommTrigDetect+53/r
                        ; GetDbmForAmpl+24/r ...
sweep_code dw ?         ; XREF: StartSweep+1A2/r
num_cells dd ?          ; XREF: sub_10001718+184/r
                        ; sub_10001718+192/r ...
intr_code dw ?          ; XREF: CommInterrupts+36/r
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
zspan_freq dq ?
num_samples dd ?
zsampl_dvdr dw ?
db ? ; undefined
db ? ; undefined
sweepIndex dd ?
num_swp_pts dd ?        ; XREF: sub_10001718+5E/w
                        ; sub_10001718+1C5/w
num_step_pts dd ?       ; XREF: sub_10001718+6D/w
                        ; sub_10001718+172/w ...
num_hop_pts dd ?
impedance dw ?          ; XREF: GetDbmForVoltage+4B/r
                        ; GetnVForDbm+24/r
db ? ; undefined
db ? ; undefined
ie_duration dd ?
extern_ref dw ?
db ? ; undefined
db ? ; undefined
z_cell_size dd ?
err_status dd ?
interfaceType dw ?
db ? ; undefined
db ? ; undefined
eng_options dd ?
func_status_code dw ?
engine_reply_code dw ?
openStep dw ?
sessionString db 256 dup(?)
db ? ; undefined
db ? ; undefined
session_handle dd ?
data_port dw ?
irq_num dw ?
logical_addr dw ?
db ? ; undefined
db ? ; undefined
commHandle dd ?         ; offset
serialErrs dd 12 dup(?)
commNumber dw ?
comm_addr dw ?
comm_irq dw ?
commRateCode dw ?
commDialMeth dw ?
commSpeakMode dw ?
commPhoneNum db 50 dup(?)
commInitString db 50 dup(?)
modemConnectTimeout dw ?
db ? ; undefined
db ? ; undefined
baseAddr dd ?           ; offset
vxiID dd ?
funcLink dd ?
db ? ; undefined
db ? ; undefined
db ? ; undefined
db ? ; undefined
S ends


;
; +-------------------------------------------------------------------------+
; |   This file has been generated by The Interactive Disassembler (IDA)    |
; |           Copyright (c) 2018 Hex-Rays, <support@hex-rays.com>           |
; |                            Freeware version                             |
; +-------------------------------------------------------------------------+
;
; Input SHA256 : 0CEB1802C13CA880776CA812D53C676F95D577DC59EA2C0F244FDDCCDBE0C91C
; Input MD5    : 504637EB54418EA840A3186063DC8238
; Input CRC32  : EAD08B08

; File Name   : /home/dennis/git/tomorrow/src/morrow/orig/lib/mtcsa32.dll
; Format      : Portable executable for 80386 (PE)
; Imagebase   : 10000000
; Timestamp   : 38E0D1D8 (Tue Mar 28 15:38:00 2000)
; Section 1. (virtual address 00001000)
; Virtual size                  : 00014066 (  82022.)
; Section size in file          : 00015000 (  86016.)
; Offset to raw data for section: 00001000
; Flags 60000020: Text Executable Readable
; Alignment     : default
; Exported entry  28. FuncStatusFromEngineReply

.486p
.model flat


; Segment type: Pure code
; Segment permissions: Read/Execute
_text segment para public 'CODE' use32
assume cs:_text
;org 10001000h
assume es:nothing, ss:nothing, ds:_data, fs:nothing, gs:nothing


; Attributes: bp-based frame

public FuncStatusFromEngineReply
FuncStatusFromEngineReply proc near

var_8= dword ptr -8
var_4= word ptr -4
arg_0= word ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
movsx   eax, [ebp+arg_0]
mov     [ebp+var_8], eax
cmp     [ebp+var_8], 41h ; switch 66 cases
ja      loc_100010F6    ; jumptable 10001022 default case
mov     edx, [ebp+var_8]
xor     ecx, ecx
mov     cl, ds:byte_10001164[edx]
jmp     ds:off_10001104[ecx*4] ; switch jump

loc_10001029:           ; jumptable 10001022 case 0
mov     [ebp+var_4], 40h
jmp     loc_100010FC

loc_10001034:           ; jumptable 10001022 case 1
mov     [ebp+var_4], 41h
jmp     loc_100010FC

loc_1000103F:           ; jumptable 10001022 case 2
mov     [ebp+var_4], 42h
jmp     loc_100010FC

loc_1000104A:           ; jumptable 10001022 case 3
mov     [ebp+var_4], 43h
jmp     loc_100010FC

loc_10001055:           ; jumptable 10001022 case 4
mov     [ebp+var_4], 44h
jmp     loc_100010FC

loc_10001060:           ; jumptable 10001022 case 5
mov     [ebp+var_4], 45h
jmp     loc_100010FC

loc_1000106B:           ; jumptable 10001022 case 6
mov     [ebp+var_4], 46h
jmp     loc_100010FC

loc_10001076:           ; jumptable 10001022 case 7
mov     [ebp+var_4], 47h
jmp     short loc_100010FC

loc_1000107E:           ; jumptable 10001022 case 8
mov     [ebp+var_4], 48h
jmp     short loc_100010FC

loc_10001086:           ; jumptable 10001022 case 9
mov     [ebp+var_4], 49h
jmp     short loc_100010FC

loc_1000108E:           ; jumptable 10001022 case 17
mov     [ebp+var_4], 51h
jmp     short loc_100010FC

loc_10001096:           ; jumptable 10001022 case 18
mov     [ebp+var_4], 52h
jmp     short loc_100010FC

loc_1000109E:           ; jumptable 10001022 case 19
mov     [ebp+var_4], 53h
jmp     short loc_100010FC

loc_100010A6:           ; jumptable 10001022 case 20
mov     [ebp+var_4], 54h
jmp     short loc_100010FC

loc_100010AE:           ; jumptable 10001022 case 21
mov     [ebp+var_4], 55h
jmp     short loc_100010FC

loc_100010B6:           ; jumptable 10001022 case 22
mov     [ebp+var_4], 56h
jmp     short loc_100010FC

loc_100010BE:           ; jumptable 10001022 case 23
mov     [ebp+var_4], 57h
jmp     short loc_100010FC

loc_100010C6:           ; jumptable 10001022 case 24
mov     [ebp+var_4], 58h
jmp     short loc_100010FC

loc_100010CE:           ; jumptable 10001022 case 25
mov     [ebp+var_4], 59h
jmp     short loc_100010FC

loc_100010D6:           ; jumptable 10001022 case 26
mov     [ebp+var_4], 5Ah
jmp     short loc_100010FC

loc_100010DE:           ; jumptable 10001022 case 27
mov     [ebp+var_4], 5Bh
jmp     short loc_100010FC

loc_100010E6:           ; jumptable 10001022 case 64
mov     [ebp+var_4], 90h
jmp     short loc_100010FC

loc_100010EE:           ; jumptable 10001022 case 65
mov     [ebp+var_4], 91h
jmp     short loc_100010FC

loc_100010F6:           ; jumptable 10001022 default case
mov     [ebp+var_4], 0FEh

loc_100010FC:
mov     ax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
FuncStatusFromEngineReply endp

off_10001104 dd offset loc_10001029, offset loc_10001034 ; jump table for switch statement
dd offset loc_1000103F, offset loc_1000104A
dd offset loc_10001055, offset loc_10001060
dd offset loc_1000106B, offset loc_10001076
dd offset loc_1000107E, offset loc_10001086
dd offset loc_1000108E, offset loc_10001096
dd offset loc_1000109E, offset loc_100010A6
dd offset loc_100010AE, offset loc_100010B6
dd offset loc_100010BE, offset loc_100010C6
dd offset loc_100010CE, offset loc_100010D6
dd offset loc_100010DE, offset loc_100010E6
dd offset loc_100010EE, offset loc_100010F6
byte_10001164 db      0,     1,     2,     3 ; indirect table for switch statement
db      4,     5,     6,     7
db      8,     9,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   0Ah,   0Bh,   0Ch
db    0Dh,   0Eh,   0Fh,   10h
db    11h,   12h,   13h,   14h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    15h,   16h
push    ebp
mov     ebp, esp
sub     esp, 8
movsx   eax, word ptr [ebp+8]
mov     [ebp-8], eax
mov     ecx, [ebp-8]
sub     ecx, 40h
mov     [ebp-8], ecx
cmp     dword ptr [ebp-8], 51h ; switch 82 cases
ja      loc_100012A5    ; jumptable 100011D1 default case
mov     eax, [ebp-8]
xor     edx, edx
mov     dl, ds:byte_10001313[eax]
jmp     ds:off_100012B3[edx*4] ; switch jump

loc_100011D8:           ; jumptable 100011D1 case 0
mov     word ptr [ebp-4], 0
jmp     loc_100012AB

loc_100011E3:           ; jumptable 100011D1 case 1
mov     word ptr [ebp-4], 1
jmp     loc_100012AB

loc_100011EE:           ; jumptable 100011D1 case 2
mov     word ptr [ebp-4], 2
jmp     loc_100012AB

loc_100011F9:           ; jumptable 100011D1 case 3
mov     word ptr [ebp-4], 3
jmp     loc_100012AB

loc_10001204:           ; jumptable 100011D1 case 4
mov     word ptr [ebp-4], 4
jmp     loc_100012AB

loc_1000120F:           ; jumptable 100011D1 case 5
mov     word ptr [ebp-4], 5
jmp     loc_100012AB

loc_1000121A:           ; jumptable 100011D1 case 6
mov     word ptr [ebp-4], 6
jmp     loc_100012AB

loc_10001225:           ; jumptable 100011D1 case 7
mov     word ptr [ebp-4], 7
jmp     short loc_100012AB

loc_1000122D:           ; jumptable 100011D1 case 8
mov     word ptr [ebp-4], 8
jmp     short loc_100012AB

loc_10001235:           ; jumptable 100011D1 case 9
mov     word ptr [ebp-4], 9
jmp     short loc_100012AB

loc_1000123D:           ; jumptable 100011D1 case 17
mov     word ptr [ebp-4], 11h
jmp     short loc_100012AB

loc_10001245:           ; jumptable 100011D1 case 18
mov     word ptr [ebp-4], 12h
jmp     short loc_100012AB

loc_1000124D:           ; jumptable 100011D1 case 19
mov     word ptr [ebp-4], 13h
jmp     short loc_100012AB

loc_10001255:           ; jumptable 100011D1 case 20
mov     word ptr [ebp-4], 14h
jmp     short loc_100012AB

loc_1000125D:           ; jumptable 100011D1 case 21
mov     word ptr [ebp-4], 15h
jmp     short loc_100012AB

loc_10001265:           ; jumptable 100011D1 case 22
mov     word ptr [ebp-4], 16h
jmp     short loc_100012AB

loc_1000126D:           ; jumptable 100011D1 case 23
mov     word ptr [ebp-4], 17h
jmp     short loc_100012AB

loc_10001275:           ; jumptable 100011D1 case 24
mov     word ptr [ebp-4], 18h
jmp     short loc_100012AB

loc_1000127D:           ; jumptable 100011D1 case 25
mov     word ptr [ebp-4], 19h
jmp     short loc_100012AB

loc_10001285:           ; jumptable 100011D1 case 26
mov     word ptr [ebp-4], 1Ah
jmp     short loc_100012AB

loc_1000128D:           ; jumptable 100011D1 case 27
mov     word ptr [ebp-4], 1Bh
jmp     short loc_100012AB

loc_10001295:           ; jumptable 100011D1 case 80
mov     word ptr [ebp-4], 40h
jmp     short loc_100012AB

loc_1000129D:           ; jumptable 100011D1 case 81
mov     word ptr [ebp-4], 41h
jmp     short loc_100012AB

loc_100012A5:           ; jumptable 100011D1 default case
mov     word ptr [ebp-4], 0FFh

loc_100012AB:
mov     ax, [ebp-4]
mov     esp, ebp
pop     ebp
retn
off_100012B3 dd offset loc_100011D8, offset loc_100011E3 ; jump table for switch statement
dd offset loc_100011EE, offset loc_100011F9
dd offset loc_10001204, offset loc_1000120F
dd offset loc_1000121A, offset loc_10001225
dd offset loc_1000122D, offset loc_10001235
dd offset loc_1000123D, offset loc_10001245
dd offset loc_1000124D, offset loc_10001255
dd offset loc_1000125D, offset loc_10001265
dd offset loc_1000126D, offset loc_10001275
dd offset loc_1000127D, offset loc_10001285
dd offset loc_1000128D, offset loc_10001295
dd offset loc_1000129D, offset loc_100012A5
byte_10001313 db      0,     1,     2,     3 ; indirect table for switch statement
db      4,     5,     6,     7
db      8,     9,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   0Ah,   0Bh,   0Ch
db    0Dh,   0Eh,   0Fh,   10h
db    11h,   12h,   13h,   14h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    17h,   17h,   17h,   17h
db    15h,   16h
; Exported entry 157. SetFuncStatusCode


; Attributes: bp-based frame

public SetFuncStatusCode
SetFuncStatusCode proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
cmp     [ebp+arg_0], 0
jnz     short loc_10001374
mov     ax, 0FFF6h
jmp     short loc_100013AF

loc_10001374:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+0CCh]
test    ecx, ecx
jge     short loc_10001397
push    2
mov     edx, [ebp+arg_0]
push    edx
call    RdEngOption
add     esp, 8
movsx   eax, ax
test    eax, eax
jnz     short loc_100013A5

loc_10001397:
mov     ecx, [ebp+arg_0]
mov     dx, [ebp+arg_4]
mov     [ecx+0CCh], dx

loc_100013A5:
mov     eax, [ebp+arg_0]
mov     ax, [eax+0CCh]

loc_100013AF:
pop     ebp
retn
SetFuncStatusCode endp

; Exported entry  40. GetFuncStatusCode


; Attributes: bp-based frame

public GetFuncStatusCode
GetFuncStatusCode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
cmp     [ebp+arg_0], 0
jnz     short loc_100013C0
mov     ax, 0FFF6h
jmp     short loc_100013CA

loc_100013C0:
mov     eax, [ebp+arg_0]
mov     ax, [eax+0CCh]

loc_100013CA:
pop     ebp
retn
GetFuncStatusCode endp

; Exported entry  10. ClearFuncStatusCode


; Attributes: bp-based frame

public ClearFuncStatusCode
ClearFuncStatusCode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
cmp     [ebp+arg_0], 0
jz      short loc_100013E1
mov     eax, [ebp+arg_0]
mov     word ptr [eax+0CCh], 0

loc_100013E1:
pop     ebp
retn
ClearFuncStatusCode endp

; Exported entry 153. SetEngineReplyCode


; Attributes: bp-based frame

public SetEngineReplyCode
SetEngineReplyCode proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
cmp     [ebp+arg_0], 0
jnz     short loc_100013F2
mov     ax, 0FFh
jmp     short loc_10001404

loc_100013F2:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+0CEh], cx
mov     ax, [ebp+arg_4]

loc_10001404:
pop     ebp
retn
SetEngineReplyCode endp

; Exported entry  38. GetEngineReplyCode


; Attributes: bp-based frame

public GetEngineReplyCode
GetEngineReplyCode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
cmp     [ebp+arg_0], 0
jnz     short loc_10001415
mov     ax, 0FFh
jmp     short loc_1000141F

loc_10001415:
mov     eax, [ebp+arg_0]
mov     ax, [eax+0CEh]

loc_1000141F:
pop     ebp
retn
GetEngineReplyCode endp

; Exported entry 193. TestFuncStatusAndPtr


; Attributes: bp-based frame

public TestFuncStatusAndPtr
TestFuncStatusAndPtr proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
cmp     [ebp+arg_0], 0
jnz     short loc_10001431
mov     ax, 0FFF6h
jmp     short loc_1000146C

loc_10001431:
push    2
mov     eax, [ebp+arg_0]
push    eax
call    RdEngOption
add     esp, 8
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000144B
xor     ax, ax
jmp     short loc_1000146C

loc_1000144B:
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10001469
mov     ax, [ebp+var_4]
jmp     short loc_1000146C

loc_10001469:
xor     ax, ax

loc_1000146C:
mov     esp, ebp
pop     ebp
retn
TestFuncStatusAndPtr endp

; Exported entry 169. SetPreamp


; Attributes: bp-based frame

public SetPreamp
SetPreamp proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10001497
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000153C

loc_10001497:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+64h]
test    ecx, ecx
jnz     short loc_100014AB
or      ax, 0FFFFh
jmp     loc_1000153C

loc_100014AB:
movsx   edx, [ebp+arg_4]
test    edx, edx
jz      short loc_100014F3
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+66h]
test    ecx, ecx
jnz     short loc_100014F3
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_0]
mov     cx, [edx+6Ah]
sub     cx, [eax+68h]
mov     edx, [ebp+arg_0]
mov     [edx+6Ah], cx
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_0]
mov     dx, [eax+62h]
sub     dx, [ecx+68h]
mov     eax, [ebp+arg_0]
mov     [eax+62h], dx
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+66h], 1
jmp     short loc_10001539

loc_100014F3:
movsx   edx, [ebp+arg_4]
test    edx, edx
jnz     short loc_10001539
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+66h]
test    ecx, ecx
jz      short loc_10001539
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_0]
mov     cx, [edx+6Ah]
add     cx, [eax+68h]
mov     edx, [ebp+arg_0]
mov     [edx+6Ah], cx
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_0]
mov     dx, [eax+62h]
add     dx, [ecx+68h]
mov     eax, [ebp+arg_0]
mov     [eax+62h], dx
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+66h], 0

loc_10001539:
xor     ax, ax

loc_1000153C:
pop     ebp
retn
SetPreamp endp

; Exported entry 109. RdPreamp


; Attributes: bp-based frame

public RdPreamp
RdPreamp proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000155A
or      ax, 0FFFFh
jmp     short loc_10001567

loc_1000155A:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+66h]
neg     eax
sbb     eax, eax
neg     eax

loc_10001567:
pop     ebp
retn
RdPreamp endp

; Exported entry  12. CommInterrupts


; Attributes: bp-based frame

public CommInterrupts
CommInterrupts proc near

numWords= word ptr -0Ch
var_8= word ptr -8
icode= word ptr -4
a1= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     [ebp+numWords], 1
mov     [ebp+var_8], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000159C
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100015D2

loc_1000159C:
mov     eax, [ebp+a1]
mov     cx, [eax+S.intr_code]
mov     [ebp+icode], cx
lea     edx, [ebp+icode]
push    edx
mov     ax, [ebp+numWords]
push    eax
push    6
mov     ecx, [ebp+a1]
push    ecx
call    SendCommand
add     esp, 10h
mov     [ebp+var_8], ax
mov     dx, [ebp+var_8]
push    edx
call    FuncStatusFromEngineReply
add     esp, 4

loc_100015D2:
mov     esp, ebp
pop     ebp
retn
CommInterrupts endp

; Exported entry  13. CommTrigDetect


; Attributes: bp-based frame

public CommTrigDetect
CommTrigDetect proc near

numWords= word ptr -1Ch
var_18= word ptr -18h
det_code= word ptr -14h
var_12= word ptr -12h
tdelay_lo= word ptr -10h
tdelay_hi= word ptr -0Eh
tthres_lo= word ptr -0Ch
tthres_hi= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
trig_freq= dword ptr -4
a1= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 1Ch
mov     [ebp+numWords], 8
mov     [ebp+var_18], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000160C
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10001714

loc_1000160C:
mov     eax, [ebp+a1]
mov     ecx, [eax+7Ch]  ; S.trig_freq, 2 bytes offset inside!
push    ecx
mov     edx, dword ptr [eax+S.trig_freq]
push    edx             ; value
mov     eax, [ebp+a1]
push    eax             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+trig_freq], eax
mov     ecx, [ebp+a1]
mov     dx, [ecx+S.detect_code]
mov     [ebp+det_code], dx
mov     eax, [ebp+a1]
push    eax
call    RdSweepCode
add     esp, 4
movsx   ecx, ax
and     ecx, 1
test    ecx, ecx
jz      short loc_10001672
mov     edx, [ebp+a1]
movsx   eax, [edx+S.trig_norm_flag]
test    eax, eax
jnz     short loc_10001662
mov     ecx, [ebp+a1]
mov     dx, [ecx+S.trig_code]
mov     [ebp+var_12], dx
jmp     short loc_10001670

loc_10001662:
mov     eax, [ebp+a1]
movsx   ecx, [eax+S.trig_code]
or      ch, 80h
mov     [ebp+var_12], cx

loc_10001670:
jmp     short loc_1000167D

loc_10001672:
mov     edx, [ebp+a1]
mov     ax, [edx+S.trig_code]
mov     [ebp+var_12], ax

loc_1000167D:
mov     ecx, [ebp+a1]
mov     edx, [ecx+S.trig_delay]
and     edx, 0FFFFh
mov     [ebp+tdelay_lo], dx
mov     eax, [ebp+a1]
mov     ecx, [eax+S.trig_delay]
sar     ecx, 10h
mov     [ebp+tdelay_hi], cx
mov     edx, [ebp+a1]
movsx   eax, [edx+S.trig_thresh]
and     eax, 0FFFFh
mov     [ebp+tthres_lo], ax
mov     ecx, [ebp+a1]
movsx   edx, [ecx+S.trig_thresh]
sar     edx, 10h
mov     [ebp+tthres_hi], dx
mov     eax, [ebp+trig_freq]
and     eax, 0FFFFh
mov     [ebp+var_8], ax
mov     ecx, [ebp+trig_freq]
shr     ecx, 10h
mov     [ebp+var_6], cx
lea     edx, [ebp+det_code]
push    edx
mov     ax, [ebp+numWords]
push    eax
push    4
mov     ecx, [ebp+a1]
push    ecx
call    SendCommand
add     esp, 10h
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
cmp     edx, 13h
jnz     short loc_100016F8
mov     ax, 90h
jmp     short loc_10001714

loc_100016F8:
movsx   eax, [ebp+var_18]
cmp     eax, 14h
jl      short loc_10001707
mov     ax, 91h
jmp     short loc_10001714

loc_10001707:
mov     cx, [ebp+var_18]
push    ecx
call    FuncStatusFromEngineReply
add     esp, 4

loc_10001714:
mov     esp, ebp
pop     ebp
retn
CommTrigDetect endp



; Attributes: bp-based frame

sub_10001718 proc near

var_38= dword ptr -38h
var_34= dword ptr -34h
var_30= dword ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
v25= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= qword ptr -18h
step_mode= dword ptr -10h
var_C= word ptr -0Ch
v6= qword ptr -8
a1= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 38h
mov     [ebp+var_C], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10001748
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10001B0F

loc_10001748:
mov     eax, [ebp+a1]
mov     ecx, [ebp+a1]
fld     [eax+S.stop]    ; stop
fsub    [ecx+S.start]   ; start
fst     [ebp+v6]
fcomp   ds:dbl_100160F8
fnstsw  ax
test    ah, 1
jz      short loc_1000176D ; I think its tested stop-start!=0
mov     ax, 0FFFBh
jmp     loc_10001B0F

loc_1000176D:
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+S.deflt_pt_cnt]
mov     [edx+S.num_swp_pts], ecx
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+S.deflt_pt_cnt]
mov     [edx+S.num_step_pts], ecx
mov     edx, [ebp+a1]
movsx   eax, [edx+S.step_mode]
mov     [ebp+step_mode], eax
cmp     [ebp+step_mode], 1
jz      short loc_100017B4
cmp     [ebp+step_mode], 2
jz      loc_10001AA7
cmp     [ebp+step_mode], 3
jz      loc_10001A49
jmp     loc_10001AF2

loc_100017B4:
mov     ecx, [ebp+a1]
movsx   edx, [ecx+S.auto_rbw]
cmp     edx, 1
jnz     short loc_100017CE
mov     eax, [ebp+a1]
push    eax
call    sub_10001D01
add     esp, 4
jmp     short loc_100017E6

loc_100017CE:
mov     ecx, [ebp+a1]
movsx   edx, [ecx+S.auto_vbw]
cmp     edx, 1
jnz     short loc_100017E6
mov     eax, [ebp+a1]
push    eax
call    sub_10001E98
add     esp, 4

loc_100017E6:
mov     ecx, [ebp+a1]
movsx   edx, [ecx+S.auto_cell]
cmp     edx, 1
jnz     short loc_1000183F
mov     eax, [ebp+a1]
movsx   ecx, [eax+S.cell_mode]
test    ecx, ecx
jnz     short loc_1000183F
mov     edx, [ebp+a1]
fild    [edx+S.deflt_pt_cnt]
fsub    ds:dbl_100160F0
fdivr   [ebp+v6]
fstp    [ebp+var_18]
push    4
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     [ebp+var_1C], eax
fild    [ebp+var_1C]
fcomp   [ebp+var_18]
fnstsw  ax
test    ah, 1
jz      short loc_1000183F
push    1
mov     edx, [ebp+a1]
push    edx
call    SetCellMode
add     esp, 8

loc_1000183F:
mov     eax, [ebp+a1]
movsx   ecx, [eax+S.cell_mode]
cmp     ecx, 1
jnz     loc_10001940
mov     edx, [ebp+a1]
mov     ax, [edx+S.rbw_code]
push    eax
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     edx, [ebp+a1]
mov     [ebp+v25], eax
fild    [ebp+v25]
fstp    [edx+S.step]
mov     eax, [ebp+a1]
fld     [ebp+v6]
fdiv    [eax+S.step]
fadd    ds:dbl_100160F0
call    sub_1000D53C
mov     ecx, [ebp+a1]
mov     [ecx+S.num_step_pts], eax
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [edx+S.num_step_pts]
cmp     ecx, [eax+S.num_cells]
jge     short loc_100018D1
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+S.num_cells]
mov     [edx+S.num_step_pts], ecx
mov     edx, [ebp+a1]
mov     eax, [edx+S.num_step_pts]
sub     eax, 1
mov     [ebp+var_24], eax
fild    [ebp+var_24]
fdivr   [ebp+v6]
mov     ecx, [ebp+a1]
fstp    [ecx+S.step]

loc_100018D1:
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+S.num_step_pts]
mov     [edx+S.num_swp_pts], ecx
mov     edx, [ebp+a1]
push    edx
call    IsValidStep
add     esp, 4
movsx   eax, ax
cmp     eax, 1
jz      short loc_1000193B

loc_100018F7:
mov     ecx, [ebp+a1]
mov     edx, [ecx+S.num_step_pts]
add     edx, 0Ah
mov     eax, [ebp+a1]
mov     [eax+S.num_step_pts], edx
mov     ecx, [ebp+a1]
mov     edx, [ecx+S.num_step_pts]
sub     edx, 1
mov     [ebp+var_28], edx
fild    [ebp+var_28]
fdivr   [ebp+v6]
mov     eax, [ebp+a1]
fstp    [eax+S.step]
mov     ecx, [ebp+a1]
push    ecx
call    IsValidStep
add     esp, 4
movsx   edx, ax
cmp     edx, 1
jnz     short loc_100018F7

loc_1000193B:
jmp     loc_10001A38

loc_10001940:
mov     eax, [ebp+a1]
mov     cx, [eax+S.rbw_code]
push    ecx
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     edx, [ebp+a1]
mov     [ebp+var_2C], eax
fild    [ebp+var_2C]
fstp    [edx+S.step]
mov     eax, [ebp+a1]
fld     [ebp+v6]
fdiv    [eax+S.step]
fadd    ds:dbl_100160F0
call    sub_1000D53C
mov     ecx, [ebp+a1]
mov     [ecx+0A8h], eax
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [edx+S.num_step_pts]
cmp     ecx, [eax+S.deflt_pt_cnt]
jge     short loc_100019BC
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+44h]  ; deflt_pt_cnt
mov     [edx+0A8h], ecx ; num_step_pts
mov     edx, [ebp+a1]
mov     eax, [edx+0A8h] ; num_step_pts
sub     eax, 1
mov     [ebp+var_30], eax
fild    [ebp+var_30]
fdivr   [ebp+v6]
mov     ecx, [ebp+a1]
fstp    qword ptr [ecx+18h]

loc_100019BC:
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+0A8h]
mov     [edx+0A4h], ecx
mov     edx, [ebp+a1]
push    edx
call    IsValidStep
add     esp, 4
movsx   eax, ax
cmp     eax, 1
jz      short loc_10001A38

loc_100019E2:
mov     ecx, [ebp+a1]
mov     edx, [ecx+0A8h] ; num_step_pts
add     edx, 0Ah
mov     eax, [ebp+a1]
mov     [eax+0A8h], edx ; num_step_pts
mov     ecx, [ebp+a1]
mov     edx, [ebp+a1]
mov     eax, [edx+0A8h] ; num_step_pts
mov     [ecx+0A4h], eax ; num_swp_pts
mov     ecx, [ebp+a1]
mov     edx, [ecx+0A8h] ; num_step_pts
sub     edx, 1
mov     [ebp+var_34], edx
fild    [ebp+var_34]
fdivr   [ebp+v6]
mov     eax, [ebp+a1]
fstp    qword ptr [eax+18h] ; step
mov     ecx, [ebp+a1]
push    ecx
call    IsValidStep
add     esp, 4
movsx   edx, ax
cmp     edx, 1
jnz     short loc_100019E2

loc_10001A38:
mov     eax, [ebp+a1]
push    eax
call    sub_10001B13
add     esp, 4
jmp     loc_10001AF2

loc_10001A49:
mov     ecx, [ebp+a1]
fld     [ebp+v6]
fdiv    qword ptr [ecx+18h]
call    sub_1000D53C
add     eax, 1
mov     edx, [ebp+a1]
mov     [edx+0A8h], eax
mov     eax, [ebp+a1]
mov     ecx, [ebp+a1]
mov     edx, [ecx+0A8h]
mov     [eax+0A4h], edx
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+4Ah]
cmp     ecx, 1
jnz     short loc_10001A8D
mov     edx, [ebp+a1]
push    edx
call    sub_10001D01
add     esp, 4

loc_10001A8D:
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+4Eh]
cmp     ecx, 1
jnz     short loc_10001AA5
mov     edx, [ebp+a1]
push    edx
call    sub_10001E98
add     esp, 4

loc_10001AA5:
jmp     short loc_10001AF2

loc_10001AA7:
mov     eax, [ebp+a1]
mov     ecx, [eax+0A8h]
sub     ecx, 1
mov     [ebp+var_38], ecx
fild    [ebp+var_38]
fdivr   [ebp+v6]
mov     edx, [ebp+a1]
fstp    qword ptr [edx+18h]
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+4Ah]
cmp     ecx, 1
jnz     short loc_10001ADA
mov     edx, [ebp+a1]
push    edx
call    sub_10001D01
add     esp, 4

loc_10001ADA:
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+4Eh]
cmp     ecx, 1
jnz     short loc_10001AF2
mov     edx, [ebp+a1]
push    edx
call    sub_10001E98
add     esp, 4

loc_10001AF2:
mov     eax, [ebp+a1]
fld     [eax+S.step]
fcomp   ds:dbl_100160F0
fnstsw  ax
test    ah, 1
jz      short loc_10001B0B
mov     [ebp+var_C], 0FFFFh

loc_10001B0B:
mov     ax, [ebp+var_C]

loc_10001B0F:
mov     esp, ebp
pop     ebp
retn
sub_10001718 endp



; Attributes: bp-based frame

sub_10001B13 proc near

var_30= dword ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 30h
mov     [ebp+var_8], 0
mov     [ebp+var_4], 0
mov     [ebp+var_C], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10001B46
jmp     loc_10001CFD

loc_10001B46:
mov     edx, [ebp+arg_0]
mov     eax, [edx+0A8h]
mov     [ebp+var_10], eax
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+22h]
mov     [ebp+var_14], edx
cmp     [ebp+var_14], 1
jz      short loc_10001B7B
cmp     [ebp+var_14], 2
jz      loc_10001C03
cmp     [ebp+var_14], 3
jz      loc_10001C74
jmp     loc_10001CFD

loc_10001B7B:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+24h], 0
jle     short loc_10001B92
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_0]
mov     eax, [edx+24h]
mov     [ecx+28h], eax
jmp     short loc_10001B9C

loc_10001B92:
mov     ecx, [ebp+arg_0]
mov     dword ptr [ecx+28h], 0

loc_10001B9C:
mov     edx, [ebp+arg_0]
mov     ax, [edx+48h]
push    eax
call    DefltSetTimeRBW
add     esp, 4
mov     [ebp+var_8], eax
mov     ecx, [ebp+arg_0]
mov     dx, [ecx+4Ch]
push    edx
call    DefltSetTimeVBW
add     esp, 4
mov     [ebp+var_4], eax
mov     eax, [ebp+var_4]
cmp     eax, [ebp+var_8]
jle     short loc_10001BD2
mov     ecx, [ebp+var_4]
mov     [ebp+var_18], ecx
jmp     short loc_10001BD8

loc_10001BD2:
mov     edx, [ebp+var_8]
mov     [ebp+var_18], edx

loc_10001BD8:
mov     eax, [ebp+var_18]
mov     [ebp+var_C], eax
fild    [ebp+var_10]
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+3Ch]
add     edx, [ebp+var_C]
mov     eax, [ebp+arg_0]
add     edx, [eax+24h]
mov     [ebp+var_1C], edx
fild    [ebp+var_1C]
fmulp   st(1), st
mov     ecx, [ebp+arg_0]
fstp    qword ptr [ecx+30h]
jmp     loc_10001CFD

loc_10001C03:
mov     edx, [ebp+arg_0]
mov     eax, [edx+3Ch]
imul    eax, [ebp+var_10]
mov     [ebp+var_20], eax
fild    [ebp+var_20]
mov     ecx, [ebp+arg_0]
fcomp   qword ptr [ecx+30h]
fnstsw  ax
test    ah, 41h
jnz     short loc_10001C45
mov     edx, [ebp+arg_0]
mov     dword ptr [edx+28h], 0FFFFFFFFh
mov     eax, [ebp+arg_0]
mov     ecx, [eax+3Ch]
imul    ecx, [ebp+var_10]
add     ecx, [ebp+var_10]
mov     edx, [ebp+arg_0]
mov     [ebp+var_24], ecx
fild    [ebp+var_24]
fstp    qword ptr [edx+30h]
jmp     short loc_10001C6F

loc_10001C45:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+3Ch]
imul    edx, [ebp+var_10]
mov     [ebp+var_28], edx
fild    [ebp+var_28]
fsubr   qword ptr [eax+30h]
fidiv   [ebp+var_10]
fmul    ds:dbl_10016100
call    sub_1000D53C
mov     ecx, [ebp+arg_0]
mov     [ecx+28h], eax

loc_10001C6F:
jmp     loc_10001CFD

loc_10001C74:
mov     edx, [ebp+arg_0]
cmp     dword ptr [edx+24h], 0
jle     short loc_10001CAF
mov     eax, [ebp+arg_0]
mov     dword ptr [eax+28h], 0
mov     ecx, [ebp+arg_0]
mov     dx, [ecx+48h]
push    edx
call    DefltSetTimeRBW
add     esp, 4
mov     [ebp+var_8], eax
mov     eax, [ebp+arg_0]
mov     cx, [eax+4Ch]
push    ecx
call    DefltSetTimeVBW
add     esp, 4
mov     [ebp+var_4], eax
jmp     short loc_10001CC1

loc_10001CAF:
mov     edx, [ebp+arg_0]
mov     eax, [edx+28h]
push    eax
call    sub_1000D563
add     esp, 4
mov     [ebp+var_8], eax

loc_10001CC1:
mov     ecx, [ebp+var_4]
cmp     ecx, [ebp+var_8]
jle     short loc_10001CD1
mov     edx, [ebp+var_4]
mov     [ebp+var_2C], edx
jmp     short loc_10001CD7

loc_10001CD1:
mov     eax, [ebp+var_8]
mov     [ebp+var_2C], eax

loc_10001CD7:
mov     ecx, [ebp+var_2C]
mov     [ebp+var_C], ecx
fild    [ebp+var_10]
mov     edx, [ebp+arg_0]
mov     eax, [edx+3Ch]
add     eax, [ebp+var_C]
mov     ecx, [ebp+arg_0]
add     eax, [ecx+24h]
mov     [ebp+var_30], eax
fild    [ebp+var_30]
fmulp   st(1), st
mov     edx, [ebp+arg_0]
fstp    qword ptr [edx+30h]

loc_10001CFD:
mov     esp, ebp
pop     ebp
retn
sub_10001B13 endp



; Attributes: bp-based frame

sub_10001D01 proc near

var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= qword ptr -14h
var_C= dword ptr -0Ch
var_8= qword ptr -8
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 2Ch
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0A4h]
mov     [ebp+var_C], ecx
mov     dword ptr [ebp+var_14], 0
mov     dword ptr [ebp+var_14+4], 0
mov     edx, [ebp+arg_0]
push    edx
call    TestFuncStatusAndPtr
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_10001D39
jmp     loc_10001E94

loc_10001D39:
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+4Ah]
test    edx, edx
jnz     short loc_10001D49
jmp     loc_10001E94

loc_10001D49:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_0]
fld     qword ptr [eax+10h]
fsub    qword ptr [ecx+8]
fstp    [ebp+var_8]
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+40h]
test    eax, eax
jnz     short loc_10001D83
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+0A4h]
mov     [ebp+var_C], edx
mov     eax, [ebp+var_C]
sub     eax, 1
mov     [ebp+var_18], eax
fild    [ebp+var_18]
fdivr   [ebp+var_8]
fstp    [ebp+var_14]
jmp     short loc_10001DAD

loc_10001D83:
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+40h]
cmp     edx, 1
jnz     short loc_10001DAD
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0A8h]
mov     [ebp+var_C], ecx
mov     edx, [ebp+var_C]
sub     edx, 1
mov     [ebp+var_1C], edx
fild    [ebp+var_1C]
fdivr   [ebp+var_8]
fstp    [ebp+var_14]

loc_10001DAD:
push    0
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     [ebp+var_20], eax
fild    [ebp+var_20]
fcomp   [ebp+var_14]
fnstsw  ax
test    ah, 1
jnz     short loc_10001DDD
mov     edx, [ebp+arg_0]
mov     word ptr [edx+48h], 0
jmp     loc_10001E6D

loc_10001DDD:
push    1
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     [ebp+var_24], eax
fild    [ebp+var_24]
fcomp   [ebp+var_14]
fnstsw  ax
test    ah, 1
jnz     short loc_10001E0A
mov     edx, [ebp+arg_0]
mov     word ptr [edx+48h], 1
jmp     short loc_10001E6D

loc_10001E0A:
push    2
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     [ebp+var_28], eax
fild    [ebp+var_28]
fcomp   [ebp+var_14]
fnstsw  ax
test    ah, 1
jnz     short loc_10001E37
mov     edx, [ebp+arg_0]
mov     word ptr [edx+48h], 2
jmp     short loc_10001E6D

loc_10001E37:
push    3
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     [ebp+var_2C], eax
fild    [ebp+var_2C]
fcomp   [ebp+var_14]
fnstsw  ax
test    ah, 1
jnz     short loc_10001E64
mov     edx, [ebp+arg_0]
mov     word ptr [edx+48h], 3
jmp     short loc_10001E6D

loc_10001E64:
mov     eax, [ebp+arg_0]
mov     word ptr [eax+48h], 4

loc_10001E6D:
mov     ecx, [ebp+arg_0]
mov     edx, dword ptr [ebp+var_14]
mov     [ecx+18h], edx
mov     eax, dword ptr [ebp+var_14+4]
mov     [ecx+1Ch], eax
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+4Eh]
cmp     edx, 1
jnz     short loc_10001E94
mov     eax, [ebp+arg_0]
push    eax
call    sub_10001E98
add     esp, 4

loc_10001E94:
mov     esp, ebp
pop     ebp
retn
sub_10001D01 endp



; Attributes: bp-based frame

sub_10001E98 proc near

var_C= qword ptr -0Ch
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     dword ptr [ebp+var_C], 0
mov     dword ptr [ebp+var_C+4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10001EC4
jmp     loc_10001F4F

loc_10001EC4:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+4Eh]
test    eax, eax
jnz     short loc_10001ED1
jmp     short loc_10001F4F

loc_10001ED1:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdRBW
add     esp, 4
push    eax
call    RBWFreqFromCode
add     esp, 4
mov     edx, [ebp+arg_0]
fmul    qword ptr [edx+58h]
fstp    [ebp+var_C]
push    7
call    VBWFreqFromCode
add     esp, 4
fcomp   [ebp+var_C]
fnstsw  ax
test    ah, 41h
jz      short loc_10001F0B
mov     [ebp+var_4], 7
jmp     short loc_10001F3B

loc_10001F0B:
push    1
call    VBWFreqFromCode
add     esp, 4
fcomp   [ebp+var_C]
fnstsw  ax
test    ah, 1
jnz     short loc_10001F27
mov     [ebp+var_4], 1
jmp     short loc_10001F3B

loc_10001F27:
mov     eax, dword ptr [ebp+var_C+4]
push    eax
mov     ecx, dword ptr [ebp+var_C]
push    ecx             ; double
call    VBWCodeFromFreq
add     esp, 8
mov     [ebp+var_4], ax

loc_10001F3B:
movsx   edx, [ebp+var_4]
cmp     edx, 0FFFFFFFFh
jz      short loc_10001F4F
mov     eax, [ebp+arg_0]
mov     cx, [ebp+var_4]
mov     [eax+4Ch], cx

loc_10001F4F:
mov     esp, ebp
pop     ebp
retn
sub_10001E98 endp

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10001F78
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10001F82

loc_10001F78:
mov     word ptr [ebp-4], 0
mov     ax, [ebp-4]

loc_10001F82:
mov     esp, ebp
pop     ebp
retn
; Exported entry  33. GetCalPoint


; Attributes: bp-based frame

public GetCalPoint
GetCalPoint proc near

value= qword ptr -3Ch
var_34= qword ptr -34h
var_2C= word ptr -2Ch
var_28= dword ptr -28h
var_24= word ptr -24h
var_20= word ptr -20h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_10= word ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= dword ptr  10h
arg_C= word ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 34h
mov     [ebp+var_2C], 6
mov     [ebp+var_10], 0
mov     [ebp+var_24], 0
mov     [ebp+var_4], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10001FC9
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_100021D1

loc_10001FC9:
fild    [ebp+arg_8]
sub     esp, 8
fstp    [esp+3Ch+value] ; value
mov     eax, [ebp+a1]
push    eax             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_C], eax
mov     ecx, [ebp+a1]
push    ecx
call    CommTrigDetect
add     esp, 4
mov     [ebp+var_24], ax
movsx   edx, [ebp+var_24]
cmp     edx, 41h
jz      short loc_10002003
mov     ax, [ebp+var_24]
jmp     loc_100021D1

loc_10002003:
mov     eax, [ebp+a1]
mov     cx, [eax+48h]
push    ecx
call    DefltSetTimeRBW
add     esp, 4
cdq
mov     ecx, 3E8h
idiv    ecx
mov     [ebp+var_4], eax
mov     edx, [ebp+a1]
mov     ax, [edx+4Ch]
push    eax
call    DefltSetTimeVBW
add     esp, 4
cdq
mov     ecx, 3E8h
idiv    ecx
cmp     eax, [ebp+var_4]
jle     short loc_10002056
mov     edx, [ebp+a1]
mov     ax, [edx+4Ch]
push    eax
call    DefltSetTimeVBW
add     esp, 4
cdq
mov     ecx, 3E8h
idiv    ecx
mov     [ebp+var_4], eax

loc_10002056:
mov     edx, [ebp+a1]
push    edx
call    RdTimeoutWait
add     esp, 4
mov     [ebp+var_8], eax
mov     eax, [ebp+var_4]
add     eax, 1F4h
mov     [ebp+var_28], eax
mov     ecx, [ebp+var_28]
cmp     ecx, [ebp+var_8]
jge     short loc_1000207E
mov     edx, [ebp+var_8]
mov     [ebp+var_28], edx

loc_1000207E:
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+4Ch]
shl     ecx, 8
mov     [ebp+var_10], cx
movsx   edx, [ebp+var_10]
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+48h]
or      edx, ecx
mov     [ebp+var_10], dx
mov     edx, [ebp+a1]
mov     ax, [ebp+var_10]
mov     [edx+50h], ax
mov     ecx, [ebp+var_C]
and     ecx, 0FFFFh
mov     [ebp+var_20], cx
mov     edx, [ebp+var_C]
shr     edx, 10h
mov     [ebp+var_1E], dx
mov     eax, [ebp+a1]
mov     cx, [eax+50h]
mov     [ebp+var_1C], cx
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+60h]
and     eax, 0FFh
mov     ecx, [ebp+a1]
movsx   edx, word ptr [ecx+66h]
neg     edx
sbb     edx, edx
and     edx, 100h
or      eax, edx
mov     [ebp+var_1A], ax
mov     ax, [ebp+arg_4]
mov     [ebp+var_18], ax
mov     ecx, [ebp+a1]
push    ecx
call    RdEngineModel
add     esp, 4
movsx   edx, ax
cmp     edx, 300h
jnz     short loc_10002146
mov     eax, [ebp+var_C]
mov     dword ptr [ebp+var_34], eax
mov     dword ptr [ebp+var_34+4], 0
fild    [ebp+var_34]
fcomp   ds:dbl_10016108
fnstsw  ax
test    ah, 41h
jnz     short loc_10002146
mov     ecx, [ebp+a1]
push    ecx
call    sub_100031AB
add     esp, 4
movsx   edx, ax
shl     edx, 8
mov     ax, [ebp+var_18]
or      ax, dx
mov     [ebp+var_18], ax

loc_10002146:
mov     cx, [ebp+arg_C]
mov     [ebp+var_16], cx
lea     edx, [ebp+var_20]
push    edx
mov     ax, [ebp+var_2C]
push    eax
push    0Ah
mov     ecx, [ebp+a1]
push    ecx
call    SendCommand
add     esp, 10h
mov     [ebp+var_24], ax
movsx   edx, [ebp+var_24]
cmp     edx, 1
jnz     short loc_100021AC
mov     eax, [ebp+var_28]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetTimeoutWait
add     esp, 8
mov     edx, [ebp+a1]
push    edx
call    WaitRecvWord
add     esp, 4
mov     ecx, [ebp+arg_10]
mov     [ecx], ax
mov     edx, [ebp+a1]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_100021AA
mov     [ebp+var_24], 0FFF4h

loc_100021AA:
jmp     short loc_100021B4

loc_100021AC:
mov     eax, [ebp+arg_10]
mov     word ptr [eax], 0

loc_100021B4:
mov     ecx, [ebp+var_8]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetTimeoutWait
add     esp, 8
mov     ax, [ebp+var_24]
push    eax
call    FuncStatusFromEngineReply
add     esp, 4

loc_100021D1:
mov     esp, ebp
pop     ebp
retn
GetCalPoint endp

; Exported entry  34. GetCalPointExt


; Attributes: bp-based frame

public GetCalPointExt
GetCalPointExt proc near

var_34= qword ptr -34h
var_2C= word ptr -2Ch
var_28= dword ptr -28h
var_24= word ptr -24h
var_20= word ptr -20h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_10= word ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
value= qword ptr  10h
arg_10= word ptr  18h
arg_14= dword ptr  1Ch

push    ebp
mov     ebp, esp
sub     esp, 34h
mov     [ebp+var_2C], 6
mov     [ebp+var_10], 0
mov     [ebp+var_24], 0
mov     [ebp+var_4], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002218
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10002409

loc_10002218:
mov     eax, dword ptr [ebp+value+4]
push    eax
mov     ecx, dword ptr [ebp+value]
push    ecx             ; value
mov     edx, [ebp+a1]
push    edx             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_C], eax
mov     eax, [ebp+a1]
push    eax
call    CommTrigDetect
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
cmp     ecx, 41h
jz      short loc_10002251
mov     ax, [ebp+var_24]
jmp     loc_10002409

loc_10002251:
mov     edx, [ebp+a1]
mov     ax, [edx+48h]
push    eax
call    DefltSetTimeRBW
add     esp, 4
cdq
mov     ecx, 3E8h
idiv    ecx
mov     [ebp+var_4], eax
mov     edx, [ebp+a1]
mov     ax, [edx+4Ch]
push    eax
call    DefltSetTimeVBW
add     esp, 4
cdq
mov     ecx, 3E8h
idiv    ecx
cmp     eax, [ebp+var_4]
jle     short loc_100022A4
mov     edx, [ebp+a1]
mov     ax, [edx+4Ch]
push    eax
call    DefltSetTimeVBW
add     esp, 4
cdq
mov     ecx, 3E8h
idiv    ecx
mov     [ebp+var_4], eax

loc_100022A4:
mov     edx, [ebp+a1]
push    edx
call    RdTimeoutWait
add     esp, 4
mov     [ebp+var_8], eax
mov     eax, [ebp+var_4]
add     eax, 1F4h
mov     [ebp+var_28], eax
mov     ecx, [ebp+var_28]
cmp     ecx, [ebp+var_8]
jge     short loc_100022CC
mov     edx, [ebp+var_8]
mov     [ebp+var_28], edx

loc_100022CC:
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+4Ch]
shl     ecx, 8
mov     [ebp+var_10], cx
movsx   edx, [ebp+var_10]
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+48h]
or      edx, ecx
mov     [ebp+var_10], dx
mov     edx, [ebp+a1]
mov     ax, [ebp+var_10]
mov     [edx+50h], ax
mov     ecx, [ebp+var_C]
and     ecx, 0FFFFh
mov     [ebp+var_20], cx
mov     edx, [ebp+var_C]
shr     edx, 10h
mov     [ebp+var_1E], dx
mov     eax, [ebp+a1]
mov     cx, [eax+50h]
mov     [ebp+var_1C], cx
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+60h]
and     eax, 0FFh
mov     ecx, [ebp+a1]
movsx   edx, word ptr [ecx+66h]
neg     edx
sbb     edx, edx
and     edx, 8000h
or      eax, edx
mov     [ebp+var_1A], ax
mov     ax, [ebp+arg_4]
mov     [ebp+var_18], ax
mov     ecx, [ebp+a1]
push    ecx
call    RdEngineModel
add     esp, 4
movsx   edx, ax
cmp     edx, 300h
jnz     short loc_10002394
mov     eax, [ebp+var_C]
mov     dword ptr [ebp+var_34], eax
mov     dword ptr [ebp+var_34+4], 0
fild    [ebp+var_34]
fcomp   ds:dbl_10016108
fnstsw  ax
test    ah, 41h
jnz     short loc_10002394
mov     ecx, [ebp+a1]
push    ecx
call    sub_100031AB
add     esp, 4
movsx   edx, ax
shl     edx, 8
mov     ax, [ebp+var_18]
or      ax, dx
mov     [ebp+var_18], ax

loc_10002394:
mov     cx, [ebp+arg_10]
mov     [ebp+var_16], cx
lea     edx, [ebp+var_20]
push    edx
mov     ax, [ebp+var_2C]
push    eax
push    0Ah
mov     ecx, [ebp+a1]
push    ecx
call    SendCommand
add     esp, 10h
mov     [ebp+var_24], ax
movsx   edx, [ebp+var_24]
cmp     edx, 1
jnz     short loc_100023E4
mov     eax, [ebp+var_28]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetTimeoutWait
add     esp, 8
mov     edx, [ebp+a1]
push    edx
call    WaitRecvWord
add     esp, 4
mov     ecx, [ebp+arg_14]
mov     [ecx], ax
jmp     short loc_100023EC

loc_100023E4:
mov     edx, [ebp+arg_14]
mov     word ptr [edx], 0

loc_100023EC:
mov     eax, [ebp+var_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetTimeoutWait
add     esp, 8
mov     dx, [ebp+var_24]
push    edx
call    FuncStatusFromEngineReply
add     esp, 4

loc_10002409:
mov     esp, ebp
pop     ebp
retn
GetCalPointExt endp

push    ebp
mov     ebp, esp
sub     esp, 14h
mov     word ptr [ebp-8], 0
mov     word ptr [ebp-0Ch], 6
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002443
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000268E

loc_10002443:
movsx   eax, word ptr [ebp+0Ch]
cmp     eax, 1
jnz     loc_100025D1
mov     ecx, [ebp+8]
push    ecx
call    CommTrigDetect
add     esp, 4
mov     [ebp-8], ax
movsx   edx, word ptr [ebp-8]
cmp     edx, 41h
jz      short loc_10002472
mov     ax, [ebp-8]
jmp     loc_1000268E

loc_10002472:
mov     eax, [ebp+8]
mov     cx, [eax+48h]
push    ecx
call    DefltSetTimeRBW
add     esp, 4
mov     dword_1001B3E4, eax
mov     edx, [ebp+8]
mov     ax, [edx+4Ch]
push    eax
call    DefltSetTimeVBW
add     esp, 4
cmp     eax, dword_1001B3E4
jle     short loc_100024B4
mov     ecx, [ebp+8]
mov     dx, [ecx+4Ch]
push    edx
call    DefltSetTimeVBW
add     esp, 4
mov     dword_1001B3E4, eax

loc_100024B4:
mov     eax, [ebp+8]
push    eax
call    RdTimeoutWait
add     esp, 4
mov     dword_1001B3C8, eax
mov     ecx, dword_1001B3E4
add     ecx, 0C8h
mov     dword_1001B3DC, ecx
mov     edx, dword_1001B3DC
cmp     edx, dword_1001B3C8
jge     short loc_100024EF
mov     eax, dword_1001B3C8
mov     dword_1001B3DC, eax

loc_100024EF:
mov     ecx, [ebp+8]
movsx   edx, word ptr [ecx+4Ch]
shl     edx, 8
mov     word_1001B3E0, dx
movsx   eax, word_1001B3E0
mov     ecx, [ebp+8]
movsx   edx, word ptr [ecx+48h]
or      eax, edx
mov     word_1001B3E0, ax
mov     eax, [ebp+8]
mov     cx, word_1001B3E0
mov     [eax+50h], cx
mov     edx, [ebp+8]
mov     ax, [edx+50h]
mov     word_1001B3D0, ax
mov     ecx, [ebp+8]
movsx   edx, word ptr [ecx+60h]
and     edx, 0FFh
mov     word_1001B3D2, dx
mov     eax, [ebp+8]
movsx   ecx, word ptr [eax+66h]
neg     ecx
sbb     ecx, ecx
and     ecx, 100h
mov     dx, word_1001B3D2
or      dx, cx
mov     word_1001B3D2, dx
mov     ax, [ebp+10h]
mov     word_1001B3D4, ax
mov     ecx, [ebp+8]
push    ecx
call    RdEngineModel
add     esp, 4
movsx   edx, ax
cmp     edx, 300h
jnz     short loc_100025C6
mov     eax, [ebp-4]
mov     [ebp-14h], eax
mov     dword ptr [ebp-10h], 0
fild    qword ptr [ebp-14h]
fcomp   ds:dbl_10016108
fnstsw  ax
test    ah, 41h
jnz     short loc_100025C6
mov     ecx, [ebp+8]
push    ecx
call    sub_100031AB
add     esp, 4
movsx   edx, ax
shl     edx, 8
mov     ax, word_1001B3D4
or      ax, dx
mov     word_1001B3D4, ax

loc_100025C6:
mov     cx, [ebp+1Ch]
mov     word_1001B3D6, cx

loc_100025D1:
mov     edx, [ebp+18h]
push    edx
mov     eax, [ebp+14h]
push    eax
mov     ecx, [ebp+8]
push    ecx
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp-4], eax
mov     edx, [ebp-4]
and     edx, 0FFFFh
mov     word_1001B3CC, dx
mov     eax, [ebp-4]
shr     eax, 10h
mov     word_1001B3CE, ax
push    offset word_1001B3CC
mov     cx, [ebp-0Ch]
push    ecx
push    0Ah
mov     edx, [ebp+8]
push    edx
call    SendCommand
add     esp, 10h
mov     [ebp-8], ax
movsx   eax, word ptr [ebp-8]
cmp     eax, 41h
jnz     short loc_10002666
mov     ecx, dword_1001B3DC
push    ecx
mov     edx, [ebp+8]
push    edx
call    SetTimeoutWait
add     esp, 8
mov     eax, [ebp+8]
push    eax
call    WaitRecvWord
add     esp, 4
mov     ecx, [ebp+20h]
mov     [ecx], ax
mov     edx, [ebp+8]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10002664
mov     word ptr [ebp-8], 0FFF4h

loc_10002664:
jmp     short loc_1000266E

loc_10002666:
mov     eax, [ebp+20h]
mov     word ptr [eax], 0

loc_1000266E:
mov     ecx, dword_1001B3C8
push    ecx
mov     edx, [ebp+8]
push    edx
call    SetTimeoutWait
add     esp, 8
mov     ax, [ebp-8]
push    eax
call    FuncStatusFromEngineReply
add     esp, 4

loc_1000268E:
mov     esp, ebp
pop     ebp
retn
push    ebp
mov     ebp, esp
sub     esp, 18h
mov     word ptr [ebp-18h], 6
mov     word ptr [ebp-10h], 0
mov     word ptr [ebp-14h], 0Bh
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100026CB
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10002727

loc_100026CB:
mov     word ptr [ebp-0Ch], 4
mov     word ptr [ebp-0Ah], 0
mov     word ptr [ebp-8], 0Ch
mov     ax, [ebp+0Ch]
mov     [ebp-6], ax
mov     ecx, [ebp+10h]
and     ecx, 0FFFFh
mov     [ebp-4], cx
mov     edx, [ebp+10h]
shr     edx, 10h
mov     [ebp-2], dx
lea     eax, [ebp-0Ch]
push    eax
mov     cx, [ebp-18h]
push    ecx
mov     dx, [ebp-14h]
push    edx
mov     eax, [ebp+8]
push    eax
call    SendCommand
add     esp, 10h
mov     [ebp-10h], ax
mov     cx, [ebp-10h]
push    ecx
call    FuncStatusFromEngineReply
add     esp, 4

loc_10002727:
mov     esp, ebp
pop     ebp
retn
; Exported entry  73. PulseGetMinMax


; Attributes: bp-based frame

public PulseGetMinMax
PulseGetMinMax proc near

var_24= word ptr -24h
var_20= word ptr -20h
var_1C= dword ptr -1Ch
var_18= word ptr -18h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 24h
mov     [ebp+var_24], 8
mov     [ebp+var_20], 0Bh
mov     [ebp+var_18], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002767
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10002898

loc_10002767:
cmp     [ebp+arg_4], 132h
jb      short loc_10002779
cmp     [ebp+arg_4], 0F4240h
jbe     short loc_10002782

loc_10002779:
mov     ax, 0FFFDh
jmp     loc_10002898

loc_10002782:
cmp     [ebp+arg_8], 1
jl      short loc_10002791
cmp     [ebp+arg_8], 3B9ACA00h
jle     short loc_1000279A

loc_10002791:
mov     ax, 0FFFDh
jmp     loc_10002898

loc_1000279A:
mov     eax, [ebp+arg_0]
push    eax
call    RdTimeoutWait
add     esp, 4
mov     [ebp+var_4], eax
mov     eax, [ebp+arg_8]
cdq
mov     ecx, 3E8h
idiv    ecx
add     eax, 64h
mov     [ebp+var_1C], eax
mov     edx, [ebp+var_1C]
cmp     edx, [ebp+var_4]
jge     short loc_100027C8
mov     eax, [ebp+var_4]
mov     [ebp+var_1C], eax

loc_100027C8:
mov     [ebp+var_14], 6
mov     [ebp+var_12], 2
mov     [ebp+var_10], 0Bh
mov     [ebp+var_E], 0
mov     eax, 989680h
xor     edx, edx
div     [ebp+arg_4]
mov     [ebp+var_C], ax
mov     ecx, [ebp+arg_8]
and     ecx, 0FFFFh
mov     [ebp+var_A], cx
mov     edx, [ebp+arg_8]
sar     edx, 10h
mov     [ebp+var_8], dx
mov     [ebp+var_6], 0
lea     eax, [ebp+var_14]
push    eax
mov     cx, [ebp+var_24]
push    ecx
mov     dx, [ebp+var_20]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SendCommand
add     esp, 10h
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
cmp     ecx, 1
jnz     short loc_1000286E
mov     edx, [ebp+var_1C]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetTimeoutWait
add     esp, 8
mov     ecx, [ebp+arg_0]
push    ecx
call    WaitRecvWord
add     esp, 4
mov     edx, [ebp+arg_C]
mov     [edx], ax
mov     eax, [ebp+arg_0]
push    eax
call    WaitRecvWord
add     esp, 4
mov     ecx, [ebp+arg_10]
mov     [ecx], ax
mov     [ebp+var_18], 41h
jmp     short loc_10002884

loc_1000286E:
mov     edx, [ebp+arg_C]
mov     word ptr [edx], 1
mov     eax, [ebp+arg_10]
mov     word ptr [eax], 1
mov     [ebp+var_18], 0FFFFh

loc_10002884:
mov     ecx, [ebp+var_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetTimeoutWait
add     esp, 8
mov     ax, [ebp+var_18]

loc_10002898:
mov     esp, ebp
pop     ebp
retn
PulseGetMinMax endp

; Exported entry  75. PulseSigPresent


; Attributes: bp-based frame

public PulseSigPresent
PulseSigPresent proc near

var_20= word ptr -20h
var_1C= dword ptr -1Ch
var_18= word ptr -18h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_6= word ptr -6
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= word ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 20h
mov     [ebp+var_20], 8
mov     [ebp+var_18], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100028D2
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10002A05

loc_100028D2:
cmp     [ebp+arg_4], 132h
jb      short loc_100028E4
cmp     [ebp+arg_4], 0F4240h
jbe     short loc_100028ED

loc_100028E4:
mov     ax, 0FFFDh
jmp     loc_10002A05

loc_100028ED:
cmp     [ebp+arg_8], 1
jl      short loc_100028FC
cmp     [ebp+arg_8], 3B9ACA00h
jle     short loc_10002905

loc_100028FC:
mov     ax, 0FFFDh
jmp     loc_10002A05

loc_10002905:
movsx   eax, [ebp+arg_C]
test    eax, eax
jl      short loc_10002919
movsx   ecx, [ebp+arg_C]
cmp     ecx, 0FFFh
jle     short loc_10002922

loc_10002919:
mov     ax, 0FFFDh
jmp     loc_10002A05

loc_10002922:
mov     edx, [ebp+arg_0]
push    edx
call    RdTimeoutWait
add     esp, 4
mov     [ebp+var_4], eax
mov     eax, [ebp+arg_8]
cdq
mov     ecx, 3E8h
idiv    ecx
add     eax, 64h
mov     [ebp+var_1C], eax
mov     edx, [ebp+var_1C]
cmp     edx, [ebp+var_4]
jge     short loc_10002950
mov     eax, [ebp+var_4]
mov     [ebp+var_1C], eax

loc_10002950:
mov     [ebp+var_14], 6
mov     [ebp+var_12], 1
mov     [ebp+var_10], 0Bh
mov     [ebp+var_E], 1
mov     eax, 989680h
xor     edx, edx
div     [ebp+arg_4]
mov     [ebp+var_C], ax
mov     ecx, [ebp+arg_8]
and     ecx, 0FFFFh
mov     [ebp+var_A], cx
mov     edx, [ebp+arg_8]
sar     edx, 10h
mov     [ebp+var_8], dx
mov     ax, [ebp+arg_C]
mov     [ebp+var_6], ax
lea     ecx, [ebp+var_14]
push    ecx
mov     dx, [ebp+var_20]
push    edx
push    0Bh
mov     eax, [ebp+arg_0]
push    eax
call    SendCommand
add     esp, 10h
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
cmp     ecx, 1
jnz     short loc_100029E3
mov     edx, [ebp+var_1C]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetTimeoutWait
add     esp, 8
mov     ecx, [ebp+arg_0]
push    ecx
call    WaitRecvWord
add     esp, 4
mov     edx, [ebp+arg_10]
mov     [edx], ax
mov     [ebp+var_18], 41h
jmp     short loc_100029F1

loc_100029E3:
mov     eax, [ebp+arg_10]
mov     word ptr [eax], 0
mov     [ebp+var_18], 0FFFFh

loc_100029F1:
mov     ecx, [ebp+var_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetTimeoutWait
add     esp, 8
mov     ax, [ebp+var_18]

loc_10002A05:
mov     esp, ebp
pop     ebp
retn
PulseSigPresent endp

; Exported entry  74. PulseMeasure


; Attributes: bp-based frame

public PulseMeasure
PulseMeasure proc near

var_28= word ptr -28h
var_24= dword ptr -24h
var_20= word ptr -20h
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= word ptr  14h
arg_10= dword ptr  18h
arg_14= dword ptr  1Ch

push    ebp
mov     ebp, esp
sub     esp, 28h
mov     [ebp+var_28], 8
mov     [ebp+var_20], 0
mov     word ptr [ebp+var_8], 0
mov     word ptr [ebp+var_C], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002A4B
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10002BFB

loc_10002A4B:
cmp     [ebp+arg_4], 132h
jb      short loc_10002A5D
cmp     [ebp+arg_4], 0F4240h
jbe     short loc_10002A66

loc_10002A5D:
mov     ax, 0FFFDh
jmp     loc_10002BFB

loc_10002A66:
cmp     [ebp+arg_8], 1
jl      short loc_10002A75
cmp     [ebp+arg_8], 3B9ACA00h
jle     short loc_10002A7E

loc_10002A75:
mov     ax, 0FFFDh
jmp     loc_10002BFB

loc_10002A7E:
movsx   eax, [ebp+arg_C]
test    eax, eax
jl      short loc_10002A92
movsx   ecx, [ebp+arg_C]
cmp     ecx, 0FFFh
jle     short loc_10002A9B

loc_10002A92:
mov     ax, 0FFFDh
jmp     loc_10002BFB

loc_10002A9B:
mov     edx, [ebp+arg_0]
push    edx
call    RdTimeoutWait
add     esp, 4
mov     [ebp+var_4], eax
mov     eax, [ebp+arg_8]
cdq
mov     ecx, 3E8h
idiv    ecx
add     eax, 64h
mov     [ebp+var_24], eax
mov     edx, [ebp+var_24]
cmp     edx, [ebp+var_4]
jge     short loc_10002AC9
mov     eax, [ebp+var_4]
mov     [ebp+var_24], eax

loc_10002AC9:
mov     [ebp+var_1C], 6
mov     [ebp+var_1A], 4
mov     [ebp+var_18], 0Bh
mov     [ebp+var_16], 2
mov     eax, 989680h
xor     edx, edx
div     [ebp+arg_4]
mov     [ebp+var_14], ax
mov     ecx, [ebp+arg_8]
and     ecx, 0FFFFh
mov     [ebp+var_12], cx
mov     edx, [ebp+arg_8]
sar     edx, 10h
mov     [ebp+var_10], dx
mov     ax, [ebp+arg_C]
mov     [ebp+var_E], ax
lea     ecx, [ebp+var_1C]
push    ecx
mov     dx, [ebp+var_28]
push    edx
push    0Bh
mov     eax, [ebp+arg_0]
push    eax
call    SendCommand
add     esp, 10h
mov     [ebp+var_20], ax
movsx   ecx, [ebp+var_20]
cmp     ecx, 1
jnz     loc_10002BCF
mov     edx, [ebp+var_24]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetTimeoutWait
add     esp, 8
mov     ecx, [ebp+arg_0]
push    ecx
call    WaitRecvWord
add     esp, 4
mov     word ptr [ebp+var_8], ax
mov     edx, [ebp+arg_0]
push    edx
call    WaitRecvWord
add     esp, 4
mov     word ptr [ebp+var_C], ax
mov     eax, [ebp+var_8]
and     eax, 0FFFFh
and     eax, 0FFFFh
mov     ecx, [ebp+var_C]
and     ecx, 0FFFFh
shl     ecx, 10h
add     eax, ecx
mov     edx, [ebp+arg_10]
mov     [edx], eax
mov     eax, [ebp+arg_0]
push    eax
call    WaitRecvWord
add     esp, 4
mov     word ptr [ebp+var_8], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    WaitRecvWord
add     esp, 4
mov     word ptr [ebp+var_C], ax
mov     edx, [ebp+var_8]
and     edx, 0FFFFh
and     edx, 0FFFFh
mov     eax, [ebp+var_C]
and     eax, 0FFFFh
shl     eax, 10h
add     edx, eax
mov     ecx, [ebp+arg_14]
mov     [ecx], edx
mov     [ebp+var_20], 41h
jmp     short loc_10002BE7

loc_10002BCF:
mov     edx, [ebp+arg_10]
mov     dword ptr [edx], 0
mov     eax, [ebp+arg_14]
mov     dword ptr [eax], 0
mov     [ebp+var_20], 0FFFFh

loc_10002BE7:
mov     ecx, [ebp+var_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetTimeoutWait
add     esp, 8
mov     ax, [ebp+var_20]

loc_10002BFB:
mov     esp, ebp
pop     ebp
retn
PulseMeasure endp

; Exported entry 164. SetLinearAttn


; Attributes: bp-based frame

public SetLinearAttn
SetLinearAttn proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002C26
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10002CCA

loc_10002C26:
movsx   eax, [ebp+arg_4]
test    eax, eax
jnz     short loc_10002C7C
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+80h]
and     edx, 40h
test    edx, edx
jnz     short loc_10002C7A
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
or      ecx, 40h
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
mov     cx, [eax+62h]
sub     cx, 1Eh
mov     edx, [ebp+arg_0]
mov     [edx+62h], cx
mov     eax, [ebp+arg_0]
mov     cx, [eax+6Ah]
sub     cx, 1Eh
mov     edx, [ebp+arg_0]
mov     [edx+6Ah], cx

loc_10002C7A:
jmp     short loc_10002CC7

loc_10002C7C:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
and     ecx, 40h
test    ecx, ecx
jz      short loc_10002CC7
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+80h]
and     al, 0BFh
mov     ecx, [ebp+arg_0]
mov     [ecx+80h], ax
mov     edx, [ebp+arg_0]
mov     ax, [edx+62h]
add     ax, 1Eh
mov     ecx, [ebp+arg_0]
mov     [ecx+62h], ax
mov     edx, [ebp+arg_0]
mov     ax, [edx+6Ah]
add     ax, 1Eh
mov     ecx, [ebp+arg_0]
mov     [ecx+6Ah], ax

loc_10002CC7:
xor     ax, ax

loc_10002CCA:
pop     ebp
retn
SetLinearAttn endp

; Exported entry  99. RdLinearAttn


; Attributes: bp-based frame

public RdLinearAttn
RdLinearAttn proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002CF0
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10002D10

loc_10002CF0:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ecx, [ebp+arg_0]
movsx   eax, word ptr [ecx+80h]
and     eax, 40h
neg     eax
sbb     eax, eax
inc     eax

loc_10002D10:
pop     ebp
retn
RdLinearAttn endp



; Attributes: bp-based frame

sub_10002D12 proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002D36
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10002D4F

loc_10002D36:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+4], cx
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_10002D4F:
pop     ebp
retn
sub_10002D12 endp

; Exported entry 177. SetTimeoutWait


; Attributes: bp-based frame

public SetTimeoutWait
SetTimeoutWait proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002D75
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10002D84

loc_10002D75:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+0B4h], ecx
xor     ax, ax

loc_10002D84:
pop     ebp
retn
SetTimeoutWait endp

; Exported entry 119. RdTimeoutWait


; Attributes: bp-based frame

public RdTimeoutWait
RdTimeoutWait proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002DA1
or      eax, 0FFFFFFFFh
jmp     short loc_10002DB8

loc_10002DA1:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+0B4h]

loc_10002DB8:
pop     ebp
retn
RdTimeoutWait endp

; Exported entry 154. SetErrorStatus


; Attributes: bp-based frame

public SetErrorStatus
SetErrorStatus proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002DE5
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10002DF5

loc_10002DE5:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+0C0h], ecx
mov     ax, word ptr [ebp+arg_4]

loc_10002DF5:
mov     esp, ebp
pop     ebp
retn
SetErrorStatus endp



; Attributes: bp-based frame

; int __cdecl sub_10002DF9(int a1, double value)
sub_10002DF9 proc near

var_C= qword ptr -0Ch
var_4= dword ptr -4
a1= dword ptr  8
value= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002E1A
or      eax, 0FFFFFFFFh
jmp     loc_10002EA2

loc_10002E1A:
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+2]
mov     [ebp+var_4], eax
cmp     [ebp+var_4], 300h
jg      short loc_10002E4A
cmp     [ebp+var_4], 300h
jz      short loc_10002E5F
cmp     [ebp+var_4], 100h
jz      short loc_10002E55
cmp     [ebp+var_4], 200h
jz      short loc_10002E55
jmp     short loc_10002E9F

loc_10002E4A:
cmp     [ebp+var_4], 400h
jz      short loc_10002E55
jmp     short loc_10002E9F

loc_10002E55:
fld     [ebp+value]
call    sub_1000D53C
jmp     short loc_10002EA2

loc_10002E5F:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    RdEngOption
add     esp, 8
movsx   edx, ax
test    edx, edx
jz      short loc_10002E84
mov     dword ptr [ebp+var_C], 0
mov     dword ptr [ebp+var_C+4], 40180000h
jmp     short loc_10002E92

loc_10002E84:
mov     dword ptr [ebp+var_C], 0
mov     dword ptr [ebp+var_C+4], 40000000h

loc_10002E92:
fld     [ebp+value]
fdiv    [ebp+var_C]
call    sub_1000D53C
jmp     short loc_10002EA2

loc_10002E9F:
or      eax, 0FFFFFFFFh

loc_10002EA2:
mov     esp, ebp
pop     ebp
retn
sub_10002DF9 endp



; Attributes: bp-based frame

sub_10002EA6 proc near

var_1C= qword ptr -1Ch
var_14= qword ptr -14h
var_C= qword ptr -0Ch
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 1Ch
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002ECA
fld     ds:dbl_10016100
jmp     loc_10002F65

loc_10002ECA:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+2]
mov     [ebp+var_4], eax
cmp     [ebp+var_4], 300h
jg      short loc_10002EFA
cmp     [ebp+var_4], 300h
jz      short loc_10002F17
cmp     [ebp+var_4], 100h
jz      short loc_10002F05
cmp     [ebp+var_4], 200h
jz      short loc_10002F05
jmp     short loc_10002F5F

loc_10002EFA:
cmp     [ebp+var_4], 400h
jz      short loc_10002F05
jmp     short loc_10002F5F

loc_10002F05:
mov     ecx, [ebp+arg_4]
mov     dword ptr [ebp+var_C], ecx
mov     dword ptr [ebp+var_C+4], 0
fild    [ebp+var_C]
jmp     short loc_10002F65

loc_10002F17:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    RdEngOption
add     esp, 8
movsx   eax, ax
test    eax, eax
jz      short loc_10002F3C
mov     dword ptr [ebp+var_14], 0
mov     dword ptr [ebp+var_14+4], 40180000h
jmp     short loc_10002F4A

loc_10002F3C:
mov     dword ptr [ebp+var_14], 0
mov     dword ptr [ebp+var_14+4], 40000000h

loc_10002F4A:
mov     ecx, [ebp+arg_4]
mov     dword ptr [ebp+var_1C], ecx
mov     dword ptr [ebp+var_1C+4], 0
fild    [ebp+var_1C]
fmul    [ebp+var_14]
jmp     short loc_10002F65

loc_10002F5F:
fld     ds:dbl_10016100

loc_10002F65:
mov     esp, ebp
pop     ebp
retn
sub_10002EA6 endp

; Exported entry 151. SetEngOption


; Attributes: bp-based frame

public SetEngOption
SetEngOption proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= word ptr  10h

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10002F91
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000309F

loc_10002F91:
mov     eax, [ebp+arg_4]
mov     [ebp+var_4], eax
cmp     [ebp+var_4], 0
jz      short loc_10002FB2
cmp     [ebp+var_4], 1
jz      short loc_10003000
cmp     [ebp+var_4], 2
jz      loc_1000304C
jmp     loc_10003096

loc_10002FB2:
movsx   ecx, [ebp+arg_8]
and     ecx, 0FFFEh
test    ecx, ecx
jz      short loc_10002FC9
mov     ax, 0FFFEh
jmp     loc_1000309F

loc_10002FC9:
mov     edx, [ebp+arg_0]
mov     eax, [edx+0C8h]
and     al, 0FEh
mov     ecx, [ebp+arg_0]
mov     [ecx+0C8h], eax
movsx   edx, [ebp+arg_8]
neg     edx
sbb     edx, edx
neg     edx
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0C8h]
or      ecx, edx
mov     edx, [ebp+arg_0]
mov     [edx+0C8h], ecx
jmp     loc_1000309C

loc_10003000:
movsx   eax, [ebp+arg_8]
and     eax, 0FFFEh
test    eax, eax
jz      short loc_10003016
mov     ax, 0FFFEh
jmp     loc_1000309F

loc_10003016:
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+0C8h]
and     edx, 0FFFFFFFDh
mov     eax, [ebp+arg_0]
mov     [eax+0C8h], edx
movsx   ecx, [ebp+arg_8]
neg     ecx
sbb     ecx, ecx
and     ecx, 2
mov     edx, [ebp+arg_0]
mov     eax, [edx+0C8h]
or      eax, ecx
mov     ecx, [ebp+arg_0]
mov     [ecx+0C8h], eax
jmp     short loc_1000309C

loc_1000304C:
movsx   edx, [ebp+arg_8]
and     edx, 0FFFEh
test    edx, edx
jz      short loc_10003060
mov     ax, 0FFFEh
jmp     short loc_1000309F

loc_10003060:
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0C8h]
and     ecx, 0FFFFFFFBh
mov     edx, [ebp+arg_0]
mov     [edx+0C8h], ecx
movsx   eax, [ebp+arg_8]
neg     eax
sbb     eax, eax
and     eax, 4
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+0C8h]
or      edx, eax
mov     eax, [ebp+arg_0]
mov     [eax+0C8h], edx
jmp     short loc_1000309C

loc_10003096:
mov     ax, 0FFFEh
jmp     short loc_1000309F

loc_1000309C:
xor     ax, ax

loc_1000309F:
mov     esp, ebp
pop     ebp
retn
SetEngOption endp

; Exported entry  89. RdEngOption


; Attributes: bp-based frame

public RdEngOption
RdEngOption proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
cmp     [ebp+arg_0], 0
jnz     short loc_100030B3
mov     ax, 0FFF6h
jmp     short loc_1000311D

loc_100030B3:
mov     eax, [ebp+arg_0]
mov     word ptr [eax+0CCh], 0
mov     ecx, [ebp+arg_4]
mov     [ebp+var_4], ecx
cmp     [ebp+var_4], 0
jz      short loc_100030D9
cmp     [ebp+var_4], 1
jz      short loc_100030E7
cmp     [ebp+var_4], 2
jz      short loc_100030FB
jmp     short loc_1000310F

loc_100030D9:
mov     edx, [ebp+arg_0]
mov     eax, [edx+0C8h]
and     eax, 1
jmp     short loc_1000311D

loc_100030E7:
mov     eax, [ebp+arg_0]
mov     eax, [eax+0C8h]
and     eax, 2
neg     eax
sbb     eax, eax
neg     eax
jmp     short loc_1000311D

loc_100030FB:
mov     ecx, [ebp+arg_0]
mov     eax, [ecx+0C8h]
and     eax, 4
neg     eax
sbb     eax, eax
neg     eax
jmp     short loc_1000311D

loc_1000310F:
push    0FFFFFFFFh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_1000311D:
mov     esp, ebp
pop     ebp
retn
RdEngOption endp

; Exported entry 159. SetIFStepAttn


; Attributes: bp-based frame

public SetIFStepAttn
SetIFStepAttn proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003145
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100031A9

loc_10003145:
mov     eax, [ebp+arg_0]
push    eax
call    RdEngineModel
add     esp, 4
movsx   ecx, ax
cmp     ecx, 300h
jz      short loc_1000316C
push    0FFFFFFFFh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_100031A9

loc_1000316C:
movsx   eax, [ebp+arg_4]
test    eax, eax
jl      short loc_1000317D
movsx   ecx, [ebp+arg_4]
cmp     ecx, 1Fh
jle     short loc_1000318D

loc_1000317D:
push    0FFFFFFFDh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_100031A9

loc_1000318D:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+0BAh], cx
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_100031A9:
pop     ebp
retn
SetIFStepAttn endp



; Attributes: bp-based frame

sub_100031AB proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100031C7
or      ax, 0FFFFh
jmp     short loc_10003209

loc_100031C7:
mov     edx, [ebp+arg_0]
push    edx
call    RdEngineModel
add     esp, 4
movsx   eax, ax
cmp     eax, 300h
jz      short loc_100031F1
push    0FFFFFFFFh
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
or      ax, 0FFFFh
jmp     short loc_10003209

loc_100031F1:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+0BAh]

loc_10003209:
pop     ebp
retn
sub_100031AB endp

; Exported entry 178. SetTrigDelay


; Attributes: bp-based frame

public SetTrigDelay
SetTrigDelay proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000322F
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003246

loc_1000322F:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+70h], ecx
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_10003246:
pop     ebp
retn
SetTrigDelay endp

; Exported entry 120. RdTrigDelay


; Attributes: bp-based frame

public RdTrigDelay
RdTrigDelay proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003263
or      eax, 0FFFFFFFFh
jmp     short loc_10003277

loc_10003263:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+70h]

loc_10003277:
pop     ebp
retn
RdTrigDelay endp

align 10h


; Attributes: bp-based frame

sub_10003280 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
push    offset unk_1001B3E8
call    sub_1000D570
add     esp, 8
mov     ecx, [ebp+arg_4]
push    ecx
push    offset unk_1001B3E8
call    sub_1000D580
add     esp, 8
mov     eax, offset unk_1001B3E8
pop     ebp
retn
sub_10003280 endp



; Attributes: bp-based frame

sub_100032AC proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
call    sub_100035DD
test    eax, eax
jz      short loc_100032BE
mov     ax, 0FFECh
jmp     short loc_10003327

loc_100032BE:
push    3
push    offset unk_10018030
mov     eax, [ebp+arg_4]
push    eax
call    sub_10014E60
add     esp, 0Ch
test    eax, eax
jz      short loc_100032DB
mov     ax, 0FFEFh
jmp     short loc_10003327

loc_100032DB:
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_10003613
add     esp, 4
push    eax
mov     edx, [ebp+arg_0]
push    edx
call    SetPortNum
add     esp, 8
movsx   eax, ax
test    eax, eax
jz      short loc_10003301
mov     ax, 0FFFDh
jmp     short loc_10003327

loc_10003301:
push    offset aIsa     ; "ISA_"
push    offset aMtcisa32Dll ; "mtcisa32.dll"
mov     ecx, [ebp+arg_0]
push    ecx             ; int
call    sub_10003329
add     esp, 0Ch
movsx   edx, ax
test    edx, edx
jz      short loc_10003324
mov     ax, 0FFEBh
jmp     short loc_10003327

loc_10003324:
xor     ax, ax

loc_10003327:
pop     ebp
retn
sub_100032AC endp



; Attributes: bp-based frame

; int __cdecl sub_10003329(int, LPCSTR lpLibFileName, int)
sub_10003329 proc near

hModule= dword ptr -4
arg_0= dword ptr  8
lpLibFileName= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+lpLibFileName]
push    eax             ; lpLibFileName
call    ds:LoadLibraryA
mov     ecx, [ebp+arg_0]
mov     [ecx+294h], eax
mov     edx, [ebp+arg_0]
mov     eax, [edx+294h]
mov     [ebp+hModule], eax
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+294h], 0
jnz     short loc_10003361
or      ax, 0FFFFh
jmp     loc_100035D9

loc_10003361:
push    offset aOpensessionste ; "OpenSessionStep"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2D0h], eax
push    offset aCleardatafifo_0 ; "ClearDataFIFO"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+298h], eax
push    offset aCheckswstatus_0 ; "CheckSWStatus"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+29Ch], eax
push    offset aCheckhwstatus_0 ; "CheckHWStatus"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2A0h], eax
push    offset aFetchdataword ; "FetchDataWord"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2A8h], eax
push    offset aWaitrecvword_0 ; "WaitRecvWord"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2ACh], eax
push    offset aSenddataitem ; "SendDataItem"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2B0h], eax
push    offset aSendcommand_0 ; "SendCommand"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2B4h], eax
push    offset aVerdatablock ; "VerDataBlock"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2B8h], eax
push    offset aGetdatablock ; "GetDataBlock"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2A4h], eax
push    offset aSendword_0 ; "SendWord"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2BCh], eax
push    offset aCheckswstatnot_0 ; "CheckSWStatNoTO"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2C0h], eax
push    offset aShutdownengine_0 ; "ShutdownEngine"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2C4h], eax
push    offset aInitengine_0 ; "InitEngine"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2C8h], eax
push    offset aResetengine_0 ; "ResetEngine"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2CCh], eax
push    offset aClosesession_0 ; "CloseSession"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2D4h], eax
push    offset aIdquery_0 ; "IdQuery"
mov     edx, [ebp+arg_8]
push    edx
call    sub_10003280
add     esp, 8
push    eax             ; lpProcName
mov     eax, [ebp+hModule]
push    eax             ; hModule
call    ds:GetProcAddress
mov     ecx, [ebp+arg_0]
mov     [ecx+2D8h], eax
xor     ax, ax

loc_100035D9:
mov     esp, ebp
pop     ebp
retn
sub_10003329 endp



; Attributes: bp-based frame

sub_100035DD proc near

VersionInformation= _OSVERSIONINFOA ptr -94h

push    ebp
mov     ebp, esp
sub     esp, 94h
mov     [ebp+VersionInformation.dwOSVersionInfoSize], 94h
lea     eax, [ebp+VersionInformation]
push    eax             ; lpVersionInformation
call    ds:GetVersionExA
cmp     [ebp+VersionInformation.dwPlatformId], 2
jnz     short loc_1000360D
mov     eax, 1
jmp     short loc_1000360F

loc_1000360D:
xor     eax, eax

loc_1000360F:
mov     esp, ebp
pop     ebp
retn
sub_100035DD endp



; Attributes: bp-based frame

sub_10003613 proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
cmp     [ebp+arg_0], 0
jnz     short loc_10003622
xor     ax, ax
jmp     short loc_10003675

loc_10003622:
mov     [ebp+var_4], 0
jmp     short loc_10003634

loc_1000362B:
mov     eax, [ebp+var_4]
add     eax, 1
mov     [ebp+var_4], eax

loc_10003634:
mov     ecx, [ebp+arg_0]
add     ecx, [ebp+var_4]
movsx   edx, byte ptr [ecx]
test    edx, edx
jz      short loc_10003672
push    2
push    offset asc_10018144 ; "::"
mov     eax, [ebp+arg_0]
add     eax, [ebp+var_4]
push    eax
call    sub_1000D700
add     esp, 0Ch
test    eax, eax
jnz     short loc_10003670
mov     ecx, [ebp+var_4]
mov     edx, [ebp+arg_0]
lea     eax, [edx+ecx+2]
push    eax
call    sub_1000D6EB
add     esp, 4
jmp     short loc_10003675

loc_10003670:
jmp     short loc_1000362B

loc_10003672:
xor     ax, ax

loc_10003675:
mov     esp, ebp
pop     ebp
retn
sub_10003613 endp



; Attributes: bp-based frame

sub_10003679 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    3
push    offset aVxi     ; "VXI"
mov     eax, [ebp+arg_4]
push    eax
call    sub_10014E60
add     esp, 0Ch
test    eax, eax
jz      short loc_10003699
or      ax, 0FFFFh
jmp     short loc_100036EE

loc_10003699:
mov     ecx, [ebp+arg_0]
push    ecx
call    ClearFuncStatusCode
add     esp, 4
mov     edx, [ebp+arg_0]
mov     dword ptr [edx+0C8h], 0
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
add     ecx, 0D2h
push    ecx
call    sub_1000D570
add     esp, 8
push    offset aVisa    ; "VISA_"
push    offset aMtcvsa32Dll ; "mtcvsa32.dll"
mov     edx, [ebp+arg_0]
push    edx             ; int
call    sub_10003329
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jz      short loc_100036EB
mov     ax, 0FFEBh
jmp     short loc_100036EE

loc_100036EB:
xor     ax, ax

loc_100036EE:
pop     ebp
retn
sub_10003679 endp



; Attributes: bp-based frame

sub_100036F0 proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
push    7
mov     eax, [ebp+arg_4]
push    eax
push    offset aTcpip   ; "TCPIP::"
call    sub_10014E60
add     esp, 0Ch
test    eax, eax
jz      short loc_10003714
mov     ax, 0FFEFh
jmp     loc_100037B3

loc_10003714:
mov     [ebp+var_4], 7
jmp     short loc_10003726

loc_1000371D:
mov     ecx, [ebp+var_4]
add     ecx, 1
mov     [ebp+var_4], ecx

loc_10003726:
mov     edx, [ebp+arg_4]
add     edx, [ebp+var_4]
movsx   eax, byte ptr [edx]
test    eax, eax
jz      short loc_10003743
mov     ecx, [ebp+arg_4]
add     ecx, [ebp+var_4]
movsx   edx, byte ptr [ecx]
cmp     edx, 2Ch
jz      short loc_10003743
jmp     short loc_1000371D

loc_10003743:
mov     eax, [ebp+var_4]
sub     eax, 7
push    eax
mov     ecx, [ebp+arg_4]
add     ecx, 7
push    ecx
mov     edx, [ebp+arg_0]
add     edx, 252h
push    edx
call    sub_1000D740
add     esp, 0Ch
mov     eax, [ebp+arg_0]
add     eax, [ebp+var_4]
mov     byte ptr [eax+24Bh], 0
mov     ecx, [ebp+var_4]
mov     edx, [ebp+arg_4]
lea     eax, [edx+ecx+1]
push    eax
call    sub_1000D6EB
add     esp, 4
mov     ecx, [ebp+arg_0]
mov     [ecx+214h], ax
push    offset aTcpip_0 ; "TCPIP_"
push    offset aMtctcpipDll ; "mtctcpip.dll"
mov     edx, [ebp+arg_0]
push    edx             ; int
call    sub_10003329
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jz      short loc_100037B0
mov     ax, 0FFEBh
jmp     short loc_100037B3

loc_100037B0:
xor     ax, ax

loc_100037B3:
mov     esp, ebp
pop     ebp
retn
sub_100036F0 endp



; Attributes: bp-based frame

sub_100037B7 proc near
push    ebp
mov     ebp, esp
push    ecx
or      ax, 0FFFFh
mov     esp, ebp
pop     ebp
retn
sub_100037B7 endp



; Attributes: bp-based frame

sub_100037C3 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100037E7
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000382A

loc_100037E7:
push    3
push    offset aSim_0   ; "SIM"
mov     eax, [ebp+arg_4]
push    eax
call    sub_10014E60
add     esp, 0Ch
test    eax, eax
jz      short loc_10003804
mov     ax, 0FFEFh
jmp     short loc_1000382A

loc_10003804:
push    offset aSim     ; "SIM_"
push    offset aMtcsim32Dll ; "mtcsim32.dll"
mov     ecx, [ebp+arg_0]
push    ecx             ; int
call    sub_10003329
add     esp, 0Ch
movsx   edx, ax
test    edx, edx
jz      short loc_10003827
mov     ax, 0FFEBh
jmp     short loc_1000382A

loc_10003827:
xor     ax, ax

loc_1000382A:
pop     ebp
retn
sub_100037C3 endp



; Attributes: bp-based frame

sub_1000382C proc near
push    ebp
mov     ebp, esp
push    ecx
or      ax, 0FFFFh
mov     esp, ebp
pop     ebp
retn
sub_1000382C endp



; Attributes: bp-based frame

sub_10003838 proc near
push    ebp
mov     ebp, esp
push    ecx
or      ax, 0FFFFh
mov     esp, ebp
pop     ebp
retn
sub_10003838 endp



; Attributes: bp-based frame

sub_10003844 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
call    sub_100035DD
test    eax, eax
jnz     short loc_10003856
mov     ax, 0FFECh
jmp     short loc_100038BF

loc_10003856:
push    3
push    offset aIsa_0   ; "ISA"
mov     eax, [ebp+arg_4]
push    eax
call    sub_10014E60
add     esp, 0Ch
test    eax, eax
jz      short loc_10003873
or      ax, 0FFFFh
jmp     short loc_100038BF

loc_10003873:
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_10003613
add     esp, 4
push    eax
mov     edx, [ebp+arg_0]
push    edx
call    SetPortNum
add     esp, 8
movsx   eax, ax
test    eax, eax
jz      short loc_10003899
or      ax, 0FFFFh
jmp     short loc_100038BF

loc_10003899:
push    offset aIsant   ; "ISANT_"
push    offset aMtcisantDll ; "mtcisant.dll"
mov     ecx, [ebp+arg_0]
push    ecx             ; int
call    sub_10003329
add     esp, 0Ch
movsx   edx, ax
test    edx, edx
jz      short loc_100038BC
mov     ax, 0FFEBh
jmp     short loc_100038BF

loc_100038BC:
xor     ax, ax

loc_100038BF:
pop     ebp
retn
sub_10003844 endp



; Attributes: bp-based frame

sub_100038C1 proc near
push    ebp
mov     ebp, esp
push    ecx
or      ax, 0FFFFh
mov     esp, ebp
pop     ebp
retn
sub_100038C1 endp

; Exported entry   9. ClearDataFIFO


; Attributes: bp-based frame

public ClearDataFIFO
ClearDataFIFO proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100038E6
jmp     short loc_10003914

loc_100038E6:
mov     edx, [ebp+arg_0]
cmp     dword ptr [edx+294h], 0
jz      short loc_100038FE
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+298h], 0
jnz     short loc_10003900

loc_100038FE:
jmp     short loc_10003914

loc_10003900:
mov     ecx, [ebp+arg_0]
push    ecx
mov     edx, [ebp+arg_0]
call    dword ptr [edx+298h]
mov     [ebp+var_4], 0

loc_10003914:
mov     esp, ebp
pop     ebp
retn
ClearDataFIFO endp

; Exported entry   8. CheckSWStatus


; Attributes: bp-based frame

public CheckSWStatus
CheckSWStatus proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000393D
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003970

loc_1000393D:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003955
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+29Ch], 0
jnz     short loc_1000395B

loc_10003955:
mov     ax, 0FFEBh
jmp     short loc_10003970

loc_1000395B:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+29Ch]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003970:
mov     esp, ebp
pop     ebp
retn
CheckSWStatus endp

; Exported entry   6. CheckHWStatus


; Attributes: bp-based frame

public CheckHWStatus
CheckHWStatus proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003999
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100039CC

loc_10003999:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_100039B1
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2A0h], 0
jnz     short loc_100039B7

loc_100039B1:
mov     ax, 0FFEBh
jmp     short loc_100039CC

loc_100039B7:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2A0h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_100039CC:
mov     esp, ebp
pop     ebp
retn
CheckHWStatus endp



; Attributes: bp-based frame

sub_100039D0 proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100039F5
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003A2C

loc_100039F5:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003A0D
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2A8h], 0
jnz     short loc_10003A13

loc_10003A0D:
mov     ax, 0FFEBh
jmp     short loc_10003A2C

loc_10003A13:
mov     edx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
mov     ecx, [ebp+arg_0]
call    dword ptr [ecx+2A8h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003A2C:
mov     esp, ebp
pop     ebp
retn
sub_100039D0 endp

; Exported entry 140. SendWord


; Attributes: bp-based frame

public SendWord
SendWord proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003A55
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003A8D

loc_10003A55:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003A6D
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2BCh], 0
jnz     short loc_10003A73

loc_10003A6D:
mov     ax, 0FFEBh
jmp     short loc_10003A8D

loc_10003A73:
mov     dx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
mov     ecx, [ebp+arg_0]
call    dword ptr [ecx+2BCh]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003A8D:
mov     esp, ebp
pop     ebp
retn
SendWord endp

; Exported entry 197. WaitRecvWord


; Attributes: bp-based frame

public WaitRecvWord
WaitRecvWord proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003AB6
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003AE9

loc_10003AB6:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003ACE
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2ACh], 0
jnz     short loc_10003AD4

loc_10003ACE:
mov     ax, 0FFEBh
jmp     short loc_10003AE9

loc_10003AD4:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2ACh]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003AE9:
mov     esp, ebp
pop     ebp
retn
WaitRecvWord endp



; Attributes: bp-based frame

sub_10003AED proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003B12
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003B4A

loc_10003B12:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003B2A
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2B0h], 0
jnz     short loc_10003B30

loc_10003B2A:
mov     ax, 0FFEBh
jmp     short loc_10003B4A

loc_10003B30:
mov     dx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
mov     ecx, [ebp+arg_0]
call    dword ptr [ecx+2B0h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003B4A:
mov     esp, ebp
pop     ebp
retn
sub_10003AED endp

; Exported entry 139. SendCommand


; Attributes: bp-based frame

public SendCommand
SendCommand proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003B73
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003BB4

loc_10003B73:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003B8B
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2B4h], 0
jnz     short loc_10003B91

loc_10003B8B:
mov     ax, 0FFEBh
jmp     short loc_10003BB4

loc_10003B91:
mov     edx, [ebp+arg_C]
push    edx
mov     ax, [ebp+arg_8]
push    eax
mov     cx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2B4h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003BB4:
mov     esp, ebp
pop     ebp
retn
SendCommand endp



; Attributes: bp-based frame

sub_10003BB8 proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003BDD
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003C15

loc_10003BDD:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003BF5
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2B8h], 0
jnz     short loc_10003BFB

loc_10003BF5:
mov     ax, 0FFEBh
jmp     short loc_10003C15

loc_10003BFB:
mov     dx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
mov     ecx, [ebp+arg_0]
call    dword ptr [ecx+2B8h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003C15:
mov     esp, ebp
pop     ebp
retn
sub_10003BB8 endp

; Exported entry 187. ShutdownEngine


; Attributes: bp-based frame

public ShutdownEngine
ShutdownEngine proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003C3E
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003C71

loc_10003C3E:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003C56
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2C4h], 0
jnz     short loc_10003C5C

loc_10003C56:
mov     ax, 0FFEBh
jmp     short loc_10003C71

loc_10003C5C:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2C4h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003C71:
mov     esp, ebp
pop     ebp
retn
ShutdownEngine endp

; Exported entry  55. InitEngine


; Attributes: bp-based frame

public InitEngine
InitEngine proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003C9A
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003CCD

loc_10003C9A:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003CB2
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2C8h], 0
jnz     short loc_10003CB8

loc_10003CB2:
mov     ax, 0FFEBh
jmp     short loc_10003CCD

loc_10003CB8:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2C8h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003CCD:
mov     esp, ebp
pop     ebp
retn
InitEngine endp

; Exported entry 138. ResetEngine


; Attributes: bp-based frame

public ResetEngine
ResetEngine proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003CF6
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003D29

loc_10003CF6:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003D0E
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2CCh], 0
jnz     short loc_10003D14

loc_10003D0E:
mov     ax, 0FFEBh
jmp     short loc_10003D29

loc_10003D14:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2CCh]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003D29:
mov     esp, ebp
pop     ebp
retn
ResetEngine endp

; Exported entry  71. OpenSession


; Attributes: bp-based frame

public OpenSession
OpenSession proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= word ptr  10h

push    ebp
mov     ebp, esp
push    ecx
cmp     [ebp+arg_0], 0
jnz     short loc_10003D40
mov     ax, 0FFF6h
jmp     loc_10003F76

loc_10003D40:
cmp     [ebp+arg_4], 0
jnz     short loc_10003D4F
mov     ax, 0FFFDh
jmp     loc_10003F76

loc_10003D4F:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+1D4h], 0
jz      short loc_10003D64
mov     ax, 0FFEDh
jmp     loc_10003F76

loc_10003D64:
mov     ecx, [ebp+arg_0]
push    ecx
call    ClearFuncStatusCode
add     esp, 4
mov     edx, [ebp+arg_0]
mov     dword ptr [edx+0C8h], 0
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10003844
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jnz     short loc_10003DAC
push    1
mov     eax, [ebp+arg_0]
push    eax
call    SetInterfaceType
add     esp, 8
jmp     loc_10003F21

loc_10003DAC:
mov     ecx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100032AC
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jnz     short loc_10003DDB
push    1
mov     ecx, [ebp+arg_0]
push    ecx
call    SetInterfaceType
add     esp, 8
jmp     loc_10003F21

loc_10003DDB:
mov     edx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003838
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jnz     short loc_10003E0A
push    3
mov     edx, [ebp+arg_0]
push    edx
call    SetInterfaceType
add     esp, 8
jmp     loc_10003F21

loc_10003E0A:
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_1000382C
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jnz     short loc_10003E39
push    6
mov     eax, [ebp+arg_0]
push    eax
call    SetInterfaceType
add     esp, 8
jmp     loc_10003F21

loc_10003E39:
mov     ecx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100038C1
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jnz     short loc_10003E68
push    4
mov     ecx, [ebp+arg_0]
push    ecx
call    SetInterfaceType
add     esp, 8
jmp     loc_10003F21

loc_10003E68:
mov     edx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100037B7
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jnz     short loc_10003E97
push    5
mov     edx, [ebp+arg_0]
push    edx
call    SetInterfaceType
add     esp, 8
jmp     loc_10003F21

loc_10003E97:
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100037C3
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jnz     short loc_10003EC3
push    7
mov     eax, [ebp+arg_0]
push    eax
call    SetInterfaceType
add     esp, 8
jmp     short loc_10003F21

loc_10003EC3:
mov     ecx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100036F0
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jnz     short loc_10003EEF
push    9
mov     ecx, [ebp+arg_0]
push    ecx
call    SetInterfaceType
add     esp, 8
jmp     short loc_10003F21

loc_10003EEF:
mov     edx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003679
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jnz     short loc_10003F1B
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetInterfaceType
add     esp, 8
jmp     short loc_10003F21

loc_10003F1B:
mov     ax, 0FFEFh
jmp     short loc_10003F76

loc_10003F21:
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
add     ecx, 0D2h
push    ecx
call    sub_1000D570
add     esp, 8
mov     edx, [ebp+arg_0]
mov     word ptr [edx+0D0h], 0
movsx   eax, [ebp+arg_8]
test    eax, eax
jz      short loc_10003F73

loc_10003F4B:
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10003F7A
add     esp, 4
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jle     short loc_10003F65
jmp     short loc_10003F4B

loc_10003F65:
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10003F73
mov     ax, [ebp+var_4]
jmp     short loc_10003F76

loc_10003F73:
xor     ax, ax

loc_10003F76:
mov     esp, ebp
pop     ebp
retn
OpenSession endp



; Attributes: bp-based frame

sub_10003F7A proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003F9F
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10003FD2

loc_10003F9F:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10003FB7
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2D0h], 0
jnz     short loc_10003FBD

loc_10003FB7:
mov     ax, 0FFEBh
jmp     short loc_10003FD2

loc_10003FBD:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2D0h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10003FD2:
mov     esp, ebp
pop     ebp
retn
sub_10003F7A endp

; Exported entry  50. IdQuery


; Attributes: bp-based frame

public IdQuery
IdQuery proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10003FFB
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10004032

loc_10003FFB:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10004013
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2D8h], 0
jnz     short loc_10004019

loc_10004013:
mov     ax, 0FFEBh
jmp     short loc_10004032

loc_10004019:
mov     edx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
mov     ecx, [ebp+arg_0]
call    dword ptr [ecx+2D8h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10004032:
mov     esp, ebp
pop     ebp
retn
IdQuery endp

; Exported entry  11. CloseSession


; Attributes: bp-based frame

public CloseSession
CloseSession proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000405B
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100040C5

loc_1000405B:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10004073
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2D4h], 0
jnz     short loc_10004079

loc_10004073:
mov     ax, 0FFEBh
jmp     short loc_100040C5

loc_10004079:
mov     edx, [ebp+arg_0]
push    edx
mov     eax, [ebp+arg_0]
call    dword ptr [eax+2D4h]
movsx   ecx, ax
mov     [ebp+var_4], ecx
cmp     [ebp+var_4], 0
jz      short loc_10004098
mov     ax, word ptr [ebp+var_4]
jmp     short loc_100040C5

loc_10004098:
mov     edx, [ebp+arg_0]
mov     eax, [edx+294h]
push    eax             ; hLibModule
call    ds:FreeLibrary
mov     ecx, [ebp+arg_0]
mov     dword ptr [ecx+294h], 0
mov     edx, [ebp+arg_0]
mov     dword ptr [edx+1D4h], 0
xor     ax, ax

loc_100040C5:
mov     esp, ebp
pop     ebp
retn
CloseSession endp



; Attributes: bp-based frame

sub_100040C9 proc near

var_4= word ptr -4
a1= dword ptr  8
reversePointIndex= dword ptr  0Ch
a3= dword ptr  10h
a4= dword ptr  14h
pointPtr= dword ptr  18h

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100040EE
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10004131

loc_100040EE:
mov     eax, [ebp+a1]
cmp     dword ptr [eax+294h], 0
jz      short loc_10004106
mov     ecx, [ebp+a1]
cmp     dword ptr [ecx+2A4h], 0
jnz     short loc_1000410C

loc_10004106:
mov     ax, 0FFEBh
jmp     short loc_10004131

loc_1000410C:
mov     edx, [ebp+pointPtr]
push    edx
mov     eax, [ebp+a4]
push    eax
mov     ecx, [ebp+a3]
push    ecx
mov     edx, [ebp+reversePointIndex]
push    edx
mov     eax, [ebp+a1]   ; 2 times a1?!?
push    eax
mov     ecx, [ebp+a1]
call    dword ptr [ecx+2A4h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10004131:
mov     esp, ebp
pop     ebp
retn
sub_100040C9 endp

; Exported entry   7. CheckSWStatNoTO


; Attributes: bp-based frame

public CheckSWStatNoTO
CheckSWStatNoTO proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000415A
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10004192

loc_1000415A:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+294h], 0
jz      short loc_10004172
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+2C0h], 0
jnz     short loc_10004178

loc_10004172:
mov     ax, 0FFEBh
jmp     short loc_10004192

loc_10004178:
mov     dx, [ebp+arg_4]
push    edx
mov     eax, [ebp+arg_0]
push    eax
mov     ecx, [ebp+arg_0]
call    dword ptr [ecx+2C0h]
mov     [ebp+var_4], ax
mov     ax, [ebp+var_4]

loc_10004192:
mov     esp, ebp
pop     ebp
retn
CheckSWStatNoTO endp

align 10h
; Exported entry  63. IsValidInit


; Attributes: bp-based frame

public IsValidInit
IsValidInit proc near

var_4= dword ptr -4
arg_0= word ptr  8

push    ebp
mov     ebp, esp
push    ecx
movsx   eax, [ebp+arg_0]
cmp     eax, 41h
jz      short loc_100041CE
movsx   ecx, [ebp+arg_0]
cmp     ecx, 94h
jz      short loc_100041CE
movsx   edx, [ebp+arg_0]
cmp     edx, 95h
jz      short loc_100041CE
mov     [ebp+var_4], 0
jmp     short loc_100041D5

loc_100041CE:
mov     [ebp+var_4], 1

loc_100041D5:
mov     ax, word ptr [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
IsValidInit endp

push    ebp
mov     ebp, esp
sub     esp, 10h
mov     word ptr [ebp-10h], 4
mov     word ptr [ebp-0Ch], 0
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004210
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10004250

loc_10004210:
mov     word ptr [ebp-8], 0
mov     word ptr [ebp-6], 0
mov     word ptr [ebp-4], 0
mov     word ptr [ebp-2], 0
lea     eax, [ebp-8]
push    eax
mov     cx, [ebp-10h]
push    ecx
push    0
mov     edx, [ebp+8]
push    edx
call    SendCommand
add     esp, 10h
mov     [ebp-0Ch], ax
mov     ax, [ebp-0Ch]
push    eax
call    FuncStatusFromEngineReply
add     esp, 4

loc_10004250:
mov     esp, ebp
pop     ebp
retn
; Exported entry 189. StartSweep


; Attributes: bp-based frame

public StartSweep
StartSweep proc near

var_34= dword ptr -34h
numWords= word ptr -30h
var_2C= word ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= word ptr -20h
var_1E= word ptr -1Eh
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_14= word ptr -14h
settlet_lo= word ptr -12h
settlet_hi= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 34h
mov     [ebp+numWords], 0Ch
mov     [ebp+var_2C], 0
mov     [ebp+var_4], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004290
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_100044AE

loc_10004290:
mov     eax, [ebp+a1]
mov     ecx, [eax+0Ch]
push    ecx
mov     edx, dword ptr [eax+S.start]
push    edx             ; value
mov     eax, [ebp+a1]
push    eax             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_8], eax
mov     ecx, [ebp+a1]
mov     edx, [ecx+14h]
push    edx
mov     eax, dword ptr [ecx+S.stop]
push    eax             ; value
mov     ecx, [ebp+a1]
push    ecx             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_24], eax
mov     edx, [ebp+a1]
mov     eax, [edx+1Ch]
push    eax
mov     ecx, dword ptr [edx+S.step]
push    ecx             ; value
mov     edx, [ebp+a1]
push    edx             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_28], eax
push    0
mov     eax, [ebp+a1]
push    eax
call    BreakSweep
add     esp, 8
mov     ecx, [ebp+a1]
push    ecx
call    ClearDataFIFO
add     esp, 4
mov     edx, [ebp+a1]
push    edx
call    CommTrigDetect
add     esp, 4
mov     [ebp+var_2C], ax
movsx   eax, [ebp+var_2C]
cmp     eax, 41h
jz      short loc_1000431A
mov     ax, [ebp+var_2C]
jmp     loc_100044AE

loc_1000431A:
mov     ecx, [ebp+a1]
movsx   edx, [ecx+S.vbw_code]
shl     edx, 8
mov     eax, [ebp+a1]
movsx   ecx, [eax+S.rbw_code]
or      edx, ecx
mov     eax, [ebp+a1]
mov     [eax+S.filter_code], dx
mov     ecx, [ebp+var_8]
and     ecx, 0FFFFh
mov     [ebp+var_20], cx
mov     edx, [ebp+var_8]
shr     edx, 10h
mov     [ebp+var_1E], dx
mov     eax, [ebp+var_24]
and     eax, 0FFFFh
mov     [ebp+var_1C], ax
mov     ecx, [ebp+var_24]
shr     ecx, 10h
mov     [ebp+var_1A], cx
mov     edx, [ebp+a1]
mov     ax, [edx+S.filter_code]
mov     [ebp+var_18], ax
mov     ecx, [ebp+var_28]
and     ecx, 0FFFFh
mov     [ebp+var_16], cx
mov     edx, [ebp+var_28]
shr     edx, 10h
mov     [ebp+var_14], dx
mov     eax, [ebp+a1]
mov     ecx, [eax+S.settle_time]
and     ecx, 0FFFFh
mov     [ebp+settlet_lo], cx
mov     edx, [ebp+a1]
mov     eax, [edx+S.settle_time]
sar     eax, 10h
mov     [ebp+settlet_hi], ax
mov     ecx, [ebp+a1]
movsx   edx, [ecx+S.attenuation]
and     edx, 0FFh
and     edx, 0FFFFh
mov     eax, [ebp+a1]
movsx   ecx, [eax+S.PreampEnabled]
neg     ecx
sbb     ecx, ecx
and     ecx, 8000h
or      edx, ecx
mov     [ebp+var_E], dx
mov     edx, [ebp+a1]
movsx   eax, [edx+S.cell_mode]
cmp     eax, 1
jnz     short loc_100043E4
mov     ecx, [ebp+a1]
mov     edx, [ecx+S.num_cells]
mov     [ebp+var_34], edx
jmp     short loc_100043EB

loc_100043E4:
mov     [ebp+var_34], 0

loc_100043EB:
mov     ax, word ptr [ebp+var_34]
mov     [ebp+var_C], ax
mov     ecx, [ebp+a1]
mov     dx, [ecx+S.sweep_code]
mov     [ebp+var_A], dx
push    1
mov     eax, [ebp+a1]
push    eax
call    RdEngOption
add     esp, 8
movsx   ecx, ax
neg     ecx
sbb     ecx, ecx
and     ecx, 10h
mov     dx, [ebp+var_A]
or      dx, cx
mov     [ebp+var_A], dx
lea     eax, [ebp+var_20]
push    eax
mov     cx, [ebp+numWords]
push    ecx
push    1
mov     edx, [ebp+a1]
push    edx
call    SendCommand
add     esp, 10h
mov     [ebp+var_2C], ax
movsx   eax, [ebp+var_2C]
cmp     eax, 1
jnz     short loc_1000449B
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10004468
mov     ax, 0FFF0h
jmp     short loc_100044AE

loc_10004468:
push    81h
mov     eax, [ebp+a1]
push    eax
call    sub_10002D12
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000448B
mov     ax, 0FFF0h
jmp     short loc_100044AE

loc_1000448B:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_100044AA

loc_1000449B:
mov     ax, [ebp+var_2C]
push    eax
call    FuncStatusFromEngineReply
add     esp, 4
jmp     short loc_100044AE

loc_100044AA:
mov     ax, 41h

loc_100044AE:
mov     esp, ebp
pop     ebp
retn
StartSweep endp

; Exported entry 190. StartZspan


; Attributes: bp-based frame

public StartZspan
StartZspan proc near

var_2C= dword ptr -2Ch
var_28= word ptr -28h
var_24= word ptr -24h
var_20= dword ptr -20h
var_1C= word ptr -1Ch
var_1A= word ptr -1Ah
var_18= word ptr -18h
var_16= word ptr -16h
var_14= word ptr -14h
var_12= word ptr -12h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 2Ch
mov     [ebp+var_28], 0Ah
mov     [ebp+var_24], 0
mov     [ebp+var_4], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100044EE
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_100046E4

loc_100044EE:
push    0
mov     eax, [ebp+a1]
push    eax
call    BreakSweep
add     esp, 8
mov     ecx, [ebp+a1]
push    ecx
call    ClearDataFIFO
add     esp, 4
mov     edx, [ebp+a1]
push    edx
call    CommTrigDetect
add     esp, 4
mov     [ebp+var_24], ax
movsx   eax, [ebp+var_24]
cmp     eax, 41h
jz      short loc_1000452A
mov     ax, [ebp+var_24]
jmp     loc_100046E4

loc_1000452A:
mov     ecx, [ebp+a1]
mov     edx, [ecx+94h]
push    edx
mov     eax, [ecx+90h]
push    eax             ; value
mov     ecx, [ebp+a1]
push    ecx             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_8], eax
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+4Ch]
shl     eax, 8
mov     ecx, [ebp+a1]
movsx   edx, word ptr [ecx+48h]
or      eax, edx
mov     ecx, [ebp+a1]
mov     [ecx+50h], ax
mov     edx, [ebp+var_8]
and     edx, 0FFFFh
mov     [ebp+var_1C], dx
mov     eax, [ebp+var_8]
shr     eax, 10h
mov     [ebp+var_1A], ax
mov     ecx, [ebp+a1]
mov     dx, [ecx+50h]
mov     [ebp+var_18], dx
mov     eax, [ebp+a1]
mov     ecx, [eax+98h]
and     ecx, 0FFFFh
mov     [ebp+var_16], cx
mov     edx, [ebp+a1]
mov     eax, [edx+98h]
sar     eax, 10h
mov     [ebp+var_14], ax
mov     ecx, [ebp+a1]
mov     dx, [ecx+9Ch]
mov     [ebp+var_12], dx
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+60h]
and     ecx, 0FFh
and     ecx, 0FFFFh
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+66h]
neg     eax
sbb     eax, eax
and     eax, 8000h
or      ecx, eax
mov     [ebp+var_10], cx
mov     ecx, [ebp+a1]
movsx   edx, word ptr [ecx+40h]
cmp     edx, 1
jnz     short loc_100045FA
mov     eax, [ebp+a1]
mov     ecx, [eax+0BCh]
mov     [ebp+var_2C], ecx
jmp     short loc_10004601

loc_100045FA:
mov     [ebp+var_2C], 0

loc_10004601:
mov     edx, [ebp+var_2C]
mov     [ebp+var_20], edx
mov     eax, [ebp+var_20]
and     eax, 0FFFFh
mov     [ebp+var_E], ax
mov     ecx, [ebp+var_20]
shr     ecx, 10h
mov     [ebp+var_C], cx
mov     edx, [ebp+a1]
mov     ax, [edx+82h]
mov     [ebp+var_A], ax
push    1
mov     ecx, [ebp+a1]
push    ecx
call    RdEngOption
add     esp, 8
movsx   edx, ax
neg     edx
sbb     edx, edx
and     edx, 8
mov     ax, [ebp+var_A]
or      ax, dx
mov     [ebp+var_A], ax
mov     [ebp+var_E], 0
mov     [ebp+var_C], 0
lea     ecx, [ebp+var_1C]
push    ecx
mov     dx, [ebp+var_28]
push    edx
push    2
mov     eax, [ebp+a1]
push    eax
call    SendCommand
add     esp, 10h
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
cmp     ecx, 1
jnz     short loc_100046D1
push    0
mov     edx, [ebp+a1]
push    edx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000469E
mov     ax, 0FFF0h
jmp     short loc_100046E4

loc_1000469E:
push    82h
mov     ecx, [ebp+a1]
push    ecx
call    sub_10002D12
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100046C1
mov     ax, 0FFF0h
jmp     short loc_100046E4

loc_100046C1:
push    0
mov     eax, [ebp+a1]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_100046E0

loc_100046D1:
mov     cx, [ebp+var_24]
push    ecx
call    FuncStatusFromEngineReply
add     esp, 4
jmp     short loc_100046E4

loc_100046E0:
mov     ax, 41h

loc_100046E4:
mov     esp, ebp
pop     ebp
retn
StartZspan endp

; Exported entry 188. StartFreqHop


; Attributes: bp-based frame

public StartFreqHop
StartFreqHop proc near

var_18= word ptr -18h
var_14= word ptr -14h
var_10= word ptr -10h
var_E= word ptr -0Eh
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 18h
mov     [ebp+var_18], 5
mov     [ebp+var_14], 0
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004724
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000486B

loc_10004724:
mov     eax, [ebp+arg_0]
push    eax
call    CommTrigDetect
add     esp, 4
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
cmp     ecx, 41h
jz      short loc_10004746
mov     ax, [ebp+var_14]
jmp     loc_1000486B

loc_10004746:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+4Ch]
shl     eax, 8
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+48h]
or      eax, edx
mov     ecx, [ebp+arg_0]
mov     [ecx+50h], ax
mov     edx, [ebp+arg_0]
mov     ax, [edx+50h]
mov     [ebp+var_10], ax
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+28h]
and     edx, 0FFFFh
mov     [ebp+var_E], dx
mov     eax, [ebp+arg_0]
mov     ecx, [eax+28h]
sar     ecx, 10h
mov     [ebp+var_C], cx
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+60h]
and     eax, 0FFh
and     eax, 0FFFFh
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+66h]
neg     edx
sbb     edx, edx
and     edx, 8000h
or      eax, edx
mov     [ebp+var_A], ax
mov     eax, [ebp+arg_0]
mov     cx, [eax+82h]
mov     [ebp+var_8], cx
push    1
mov     edx, [ebp+arg_0]
push    edx
call    RdEngOption
add     esp, 8
movsx   eax, ax
neg     eax
sbb     eax, eax
and     eax, 8
mov     cx, [ebp+var_8]
or      cx, ax
mov     [ebp+var_8], cx
lea     edx, [ebp+var_10]
push    edx
mov     ax, [ebp+var_18]
push    eax
push    3
mov     ecx, [ebp+arg_0]
push    ecx
call    SendCommand
add     esp, 10h
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
cmp     edx, 1
jnz     short loc_10004858
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10004825
mov     ax, 0FFF0h
jmp     short loc_1000486B

loc_10004825:
push    83h
mov     edx, [ebp+arg_0]
push    edx
call    sub_10002D12
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10004848
mov     ax, 0FFF0h
jmp     short loc_1000486B

loc_10004848:
push    0
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_10004867

loc_10004858:
mov     dx, [ebp+var_14]
push    edx
call    FuncStatusFromEngineReply
add     esp, 4
jmp     short loc_1000486B

loc_10004867:
mov     ax, 41h

loc_1000486B:
mov     esp, ebp
pop     ebp
retn
StartFreqHop endp

; Exported entry  65. LoadHopTable


; Attributes: bp-based frame

public LoadHopTable
LoadHopTable proc near

var_10= word ptr -10h
var_C= word ptr -0Ch
var_8= word ptr -8
var_6= word ptr -6
var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 10h
mov     [ebp+var_C], 0
mov     [ebp+var_10], 0
mov     [ebp+var_4], 400h
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100048AB
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_100049F8

loc_100048AB:
push    5
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003AED
add     esp, 8
mov     [ebp+var_10], ax
movsx   ecx, [ebp+var_10]
test    ecx, ecx
jnz     short loc_100048D8
mov     edx, [ebp+arg_0]
push    edx
call    CheckSWStatus
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_100048E1

loc_100048D8:
mov     ax, 0FFFEh
jmp     loc_100049F8

loc_100048E1:
mov     cx, word ptr [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10003AED
add     esp, 8
mov     [ebp+var_10], ax
movsx   eax, [ebp+var_10]
test    eax, eax
jnz     short loc_10004911
mov     ecx, [ebp+arg_0]
push    ecx
call    CheckSWStatus
add     esp, 4
movsx   edx, ax
test    edx, edx
jz      short loc_1000491A

loc_10004911:
mov     ax, 0FFFEh
jmp     loc_100049F8

loc_1000491A:
mov     [ebp+var_C], 0
jmp     short loc_1000492E

loc_10004922:
mov     ax, [ebp+var_C]
add     ax, 1
mov     [ebp+var_C], ax

loc_1000492E:
movsx   ecx, [ebp+var_C]
cmp     ecx, [ebp+arg_4]
jge     short loc_10004988
movsx   edx, [ebp+var_C]
mov     eax, [ebp+arg_8]
mov     ecx, [eax+edx*4]
and     ecx, 0FFFFh
mov     [ebp+var_8], cx
movsx   edx, [ebp+var_C]
mov     eax, [ebp+arg_8]
mov     ecx, [eax+edx*4]
sar     ecx, 10h
mov     [ebp+var_6], cx
mov     dx, [ebp+var_8]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003AED
add     esp, 8
mov     [ebp+var_10], ax
mov     cx, [ebp+var_6]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10003AED
add     esp, 8
mov     [ebp+var_10], ax
jmp     short loc_10004922

loc_10004988:
push    3
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003AED
add     esp, 8
mov     [ebp+var_10], ax
mov     [ebp+var_C], 0
jmp     short loc_100049AE

loc_100049A2:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_100049AE:
movsx   edx, [ebp+var_C]
movsx   eax, [ebp+var_4]
cmp     edx, eax
jge     short loc_100049E3
mov     ecx, [ebp+arg_0]
push    ecx
call    CheckSWStatus
add     esp, 4
movsx   edx, ax
test    edx, edx
jz      short loc_100049CF
jmp     short loc_100049E3

loc_100049CF:
push    3
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003AED
add     esp, 8
mov     [ebp+var_10], ax
jmp     short loc_100049A2

loc_100049E3:
movsx   ecx, [ebp+var_C]
movsx   edx, [ebp+var_4]
cmp     ecx, edx
jnz     short loc_100049F5
mov     ax, 0FFFEh
jmp     short loc_100049F8

loc_100049F5:
xor     ax, ax

loc_100049F8:
mov     esp, ebp
pop     ebp
retn
LoadHopTable endp

; Exported entry   1. BreakSweep


; Attributes: bp-based frame

public BreakSweep
BreakSweep proc near

var_10= dword ptr -10h
var_C= word ptr -0Ch
var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 10h
mov     [ebp+var_C], 1
mov     [ebp+var_8], 0
mov     ax, [ebp+arg_4]
mov     [ebp+var_4], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    TestFuncStatusAndPtr
add     esp, 4
movsx   edx, ax
test    edx, edx
jz      short loc_10004A3A
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10004B80

loc_10004A3A:
lea     ecx, [ebp+var_4]
push    ecx
mov     dx, [ebp+var_C]
push    edx
push    7
mov     eax, [ebp+arg_0]
push    eax
call    SendCommand
add     esp, 10h
mov     [ebp+var_8], ax
movsx   ecx, [ebp+var_8]
cmp     ecx, 1
jz      short loc_10004A7D
mov     dx, [ebp+var_8]
push    edx
call    FuncStatusFromEngineReply
add     esp, 4
push    eax
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10004B80

loc_10004A7D:
movsx   ecx, [ebp+arg_4]
mov     [ebp+var_10], ecx
cmp     [ebp+var_10], 3 ; switch 4 cases
ja      loc_10004B6C    ; jumptable 10004A91 default case
mov     edx, [ebp+var_10]
jmp     ds:off_10004B84[edx*4] ; switch jump

loc_10004A98:           ; jumptable 10004A91 case 1
jmp     loc_10004B7C

loc_10004A9D:           ; jumptable 10004A91 case 3
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+4]
or      cl, 80h
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10002D12
add     esp, 8
mov     [ebp+var_8], ax
movsx   eax, [ebp+var_8]
test    eax, eax
jge     short loc_10004AD6
mov     cx, [ebp+var_8]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10004B80

loc_10004AD6:
jmp     loc_10004B7C

loc_10004ADB:           ; jumptable 10004A91 case 0
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_8], ax
movsx   ecx, [ebp+var_8]
test    ecx, ecx
jge     short loc_10004B05
push    0FFFFFFFFh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_10004B80

loc_10004B05:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    sub_10002D12
add     esp, 8
mov     [ebp+var_8], ax
movsx   ecx, [ebp+var_8]
test    ecx, ecx
jge     short loc_10004B32
mov     dx, [ebp+var_8]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_10004B80

loc_10004B32:
jmp     short loc_10004B7C

loc_10004B34:           ; jumptable 10004A91 case 2
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+4]
and     dl, 7Fh
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_10002D12
add     esp, 8
mov     [ebp+var_8], ax
movsx   ecx, [ebp+var_8]
test    ecx, ecx
jge     short loc_10004B6A
mov     dx, [ebp+var_8]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_10004B80

loc_10004B6A:
jmp     short loc_10004B7C

loc_10004B6C:           ; jumptable 10004A91 default case
push    0FFFFFFFDh
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_10004B80

loc_10004B7C:
mov     ax, 41h

loc_10004B80:
mov     esp, ebp
pop     ebp
retn
BreakSweep endp

off_10004B84 dd offset loc_10004ADB ; jump table for switch statement
dd offset loc_10004A98
dd offset loc_10004B34
dd offset loc_10004A9D
; Exported entry  59. InitInstrData


; Attributes: bp-based frame

public InitInstrData
InitInstrData proc near

a1= dword ptr  8

push    ebp
mov     ebp, esp
cmp     [ebp+a1], 0
jnz     short loc_10004BA6
mov     ax, 0FFF6h
jmp     loc_10004EE3

loc_10004BA6:
mov     eax, [ebp+a1]
mov     word ptr [eax+0C4h], 0
mov     ecx, [ebp+a1]
movsx   edx, word ptr [ecx+2]
cmp     edx, 100h
jz      short loc_10004BF6
mov     eax, [ebp+a1]
movsx   ecx, word ptr [eax+2]
cmp     ecx, 200h
jz      short loc_10004BF6
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+2]
cmp     eax, 400h
jz      short loc_10004BF6
mov     ecx, [ebp+a1]
movsx   edx, word ptr [ecx+2]
cmp     edx, 300h
jz      short loc_10004BF6
mov     eax, [ebp+a1]
mov     word ptr [eax+2], 100h

loc_10004BF6:
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+8], 0
mov     dword ptr [ecx+0Ch], 4197D784h
mov     edx, [ebp+a1]
mov     dword ptr [edx+10h], 0
mov     dword ptr [edx+14h], 41A7D784h
mov     eax, [ebp+a1]
mov     word ptr [eax+0CCh], 0
mov     ecx, [ebp+a1]
mov     word ptr [ecx+0CEh], 0
mov     edx, [ebp+a1]
mov     word ptr [edx+4], 0
mov     eax, [ebp+a1]
mov     dword ptr [eax+18h], 0
mov     dword ptr [eax+1Ch], 40E86A00h
mov     ecx, [ebp+a1]
mov     word ptr [ecx+20h], 1
mov     edx, [ebp+a1]
mov     word ptr [edx+22h], 1
mov     eax, [ebp+a1]
mov     word ptr [eax+40h], 1
mov     ecx, [ebp+a1]
mov     word ptr [ecx+42h], 1
mov     edx, [ebp+a1]
mov     dword ptr [edx+24h], 0
mov     eax, [ebp+a1]
mov     dword ptr [eax+28h], 0
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+30h], 0
mov     dword ptr [ecx+34h], 0
mov     edx, [ebp+a1]
mov     dword ptr [edx+3Ch], 78h
mov     eax, [ebp+a1]
mov     word ptr [eax+48h], 4
mov     ecx, [ebp+a1]
mov     word ptr [ecx+4Ah], 1
mov     edx, [ebp+a1]
mov     word ptr [edx+4Ch], 7
mov     eax, [ebp+a1]
mov     word ptr [eax+4Eh], 1
mov     ecx, [ebp+a1]
mov     word ptr [ecx+50h], 0
mov     edx, [ebp+a1]
mov     dword ptr [edx+58h], 9999999Ah
mov     dword ptr [edx+5Ch], 3FB99999h
mov     eax, [ebp+a1]
mov     word ptr [eax+60h], 14h
mov     ecx, [ebp+a1]
mov     word ptr [ecx+62h], 0
mov     edx, [ebp+a1]
mov     word ptr [edx+6Ch], 0
mov     eax, [ebp+a1]
mov     word ptr [eax+6Eh], 1
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+70h], 0
mov     edx, [ebp+a1]
mov     word ptr [edx+74h], 0
mov     eax, [ebp+a1]
mov     dword ptr [eax+78h], 0
mov     dword ptr [eax+7Ch], 0
mov     ecx, [ebp+a1]
mov     word ptr [ecx+80h], 24h
mov     edx, [ebp+a1]
mov     word ptr [edx+82h], 5
mov     eax, [ebp+a1]
mov     dword ptr [eax+84h], 1F5h
mov     ecx, [ebp+a1]
mov     word ptr [ecx+88h], 0
mov     edx, [ebp+a1]
mov     dword ptr [edx+90h], 0
mov     dword ptr [edx+94h], 411E8480h
mov     eax, [ebp+a1]
mov     dword ptr [eax+0A0h], 0
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+44h], 1F5h
mov     edx, [ebp+a1]
mov     dword ptr [edx+98h], 1F5h
push    0F4240h
mov     eax, [ebp+a1]
push    eax
call    SetZSamplRate
add     esp, 8
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+0A4h], 1F5h
mov     edx, [ebp+a1]
mov     dword ptr [edx+0A8h], 1F5h
mov     eax, [ebp+a1]
mov     dword ptr [eax+0ACh], 1F5h
mov     ecx, [ebp+a1]
mov     word ptr [ecx+0B0h], 32h
mov     edx, [ebp+a1]
mov     word ptr [edx+0B8h], 0
mov     eax, [ebp+a1]
mov     dword ptr [eax+0BCh], 0
mov     ecx, [ebp+a1]
mov     word ptr [ecx+1D8h], 370h
mov     edx, [ebp+a1]
mov     word ptr [edx+1DAh], 5
mov     eax, [ebp+a1]
mov     word ptr [eax+1DCh], 7Fh
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+0C8h], 0
mov     edx, [ebp+a1]
mov     dword ptr [edx+1E0h], 0
mov     eax, [ebp+a1]
mov     word ptr [eax+214h], 0FFFFh
mov     ecx, [ebp+a1]
mov     word ptr [ecx+218h], 0FFFFh
mov     edx, [ebp+a1]
mov     word ptr [edx+216h], 0FFFFh
mov     eax, [ebp+a1]
mov     word ptr [eax+21Ah], 0FFFFh
mov     ecx, [ebp+a1]
mov     word ptr [ecx+21Ch], 0
mov     edx, [ebp+a1]
mov     word ptr [edx+21Eh], 1
mov     eax, [ebp+a1]
mov     byte ptr [eax+220h], 0
mov     ecx, [ebp+a1]
mov     byte ptr [ecx+252h], 0
mov     edx, [ebp+a1]
mov     dword ptr [edx+0C0h], 0
mov     eax, [ebp+a1]
mov     dword ptr [eax+0B4h], 37h
mov     ecx, [ebp+a1]
mov     word ptr [ecx+64h], 0
mov     edx, [ebp+a1]
mov     word ptr [edx+66h], 0
mov     eax, [ebp+a1]
mov     word ptr [eax+68h], 0Ah
mov     ecx, [ebp+a1]
mov     dword ptr [ecx+1D4h], 0
mov     edx, [ebp+a1]
push    edx
call    sub_10001718
add     esp, 4
mov     eax, [ebp+a1]
push    eax
call    sub_10001B13
add     esp, 4
xor     ax, ax

loc_10004EE3:
pop     ebp
retn
InitInstrData endp

; Exported entry  95. RdInterfaceType


; Attributes: bp-based frame

public RdInterfaceType
RdInterfaceType proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004F01
or      ax, 0FFFFh
jmp     short loc_10004F19

loc_10004F01:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+0C4h]

loc_10004F19:
pop     ebp
retn
RdInterfaceType endp

; Exported entry 160. SetInterfaceType


; Attributes: bp-based frame

public SetInterfaceType
SetInterfaceType proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004F3F
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10004F50

loc_10004F3F:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+0C4h], cx
xor     ax, ax

loc_10004F50:
pop     ebp
retn
SetInterfaceType endp

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004F79
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10004FCB

loc_10004F79:
mov     eax, [ebp+8]
movsx   ecx, word ptr [eax+20h]
cmp     ecx, 1
jnz     short loc_10004F8B
mov     ax, 0FFFCh
jmp     short loc_10004FCB

loc_10004F8B:
cmp     dword ptr [ebp+0Ch], 0
jle     short loc_10004FAD
fild    dword ptr [ebp+0Ch]
fstp    qword ptr [ebp-8]
mov     edx, [ebp+8]
push    edx
call    RdMaxFreqLimit
add     esp, 4
fcomp   qword ptr [ebp-8]
fnstsw  ax
test    ah, 41h
jz      short loc_10004FB3

loc_10004FAD:
mov     ax, 0FFFDh
jmp     short loc_10004FCB

loc_10004FB3:
mov     eax, [ebp+8]
fild    dword ptr [ebp+0Ch]
fstp    qword ptr [eax+18h]
mov     ecx, [ebp+8]
push    ecx
call    sub_10001718
add     esp, 4
xor     ax, ax

loc_10004FCB:
mov     esp, ebp
pop     ebp
retn


; Attributes: bp-based frame

sub_10004FCF proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10004FEA
or      eax, 0FFFFFFFFh
jmp     short loc_10005003

loc_10004FEA:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+18h]
call    sub_1000D53C

loc_10005003:
pop     ebp
retn
sub_10004FCF endp

; Exported entry 191. StepSizeMode


; Attributes: bp-based frame

public StepSizeMode
StepSizeMode proc near

var_8= dword ptr -8
v1= word ptr -4
a1= dword ptr  8
mode= word ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+v1], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005035
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_100050C2

loc_10005035:
movsx   eax, [ebp+mode]
mov     [ebp+var_8], eax
cmp     [ebp+var_8], 3  ; switch 4 cases
ja      short loc_1000509B ; jumptable 10005045 default case
mov     ecx, [ebp+var_8]
jmp     ds:off_100050C6[ecx*4] ; switch jump

loc_1000504C:           ; jumptable 10005045 case 1
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
mov     ecx, [eax+44h]  ; a1->deflt_pt_cnt
mov     [edx+0A4h], ecx ; a1->num_swp_points
jmp     short loc_100050A7

loc_1000505D:           ; jumptable 10005045 case 0
jmp     short loc_100050A7

loc_1000505F:           ; jumptable 10005045 case 3
push    0
mov     edx, [ebp+a1]
push    edx
call    SetAutoCell
add     esp, 8
push    0
mov     eax, [ebp+a1]
push    eax
call    SetCellMode
add     esp, 8
jmp     short loc_100050A7

loc_1000507D:           ; jumptable 10005045 case 2
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetAutoCell
add     esp, 8
push    0
mov     edx, [ebp+a1]
push    edx
call    SetCellMode
add     esp, 8
jmp     short loc_100050A7

loc_1000509B:           ; jumptable 10005045 default case
mov     [ebp+mode], 1
mov     [ebp+v1], 1

loc_100050A7:
mov     eax, [ebp+a1]
mov     cx, [ebp+mode]
mov     [eax+20h], cx   ;  a1->step_mode
mov     edx, [ebp+a1]
push    edx
call    sub_10001718
add     esp, 4
mov     ax, [ebp+v1]

loc_100050C2:
mov     esp, ebp
pop     ebp
retn
StepSizeMode endp

off_100050C6 dd offset loc_1000505D ; jump table for switch statement
dd offset loc_1000504C
dd offset loc_1000507D
dd offset loc_1000505F
; Exported entry 145. SetDefltPts


; Attributes: bp-based frame

public SetDefltPts
SetDefltPts proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005103
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_4], ax

loc_10005103:
cmp     [ebp+arg_4], 1
jl      short loc_10005112
cmp     [ebp+arg_4], 3B9ACA00h
jle     short loc_1000511A

loc_10005112:
mov     [ebp+var_4], 0FFFDh
jmp     short loc_10005123

loc_1000511A:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+44h], ecx

loc_10005123:
mov     ax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
SetDefltPts endp

; Exported entry  85. RdDefltPts


; Attributes: bp-based frame

public RdDefltPts
RdDefltPts proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005146
or      eax, 0FFFFFFFFh
jmp     short loc_1000515A

loc_10005146:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+44h]

loc_1000515A:
pop     ebp
retn
RdDefltPts endp

; Exported entry 167. SetNumSwpPts


; Attributes: bp-based frame

public SetNumSwpPts
SetNumSwpPts proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000518B
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_4], ax
jmp     short loc_100051E5

loc_1000518B:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+20h]
cmp     ecx, 1
jnz     short loc_1000519F
mov     [ebp+var_4], 0FFFCh
jmp     short loc_100051E5

loc_1000519F:
cmp     [ebp+arg_4], 1
jl      short loc_100051AE
cmp     [ebp+arg_4], 3B9ACA00h
jle     short loc_100051B6

loc_100051AE:
mov     [ebp+var_4], 0FFFDh
jmp     short loc_100051E5

loc_100051B6:
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_4]
mov     [edx+0A4h], eax
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+40h]
test    edx, edx
jnz     short loc_100051D9
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+0A8h], ecx

loc_100051D9:
mov     edx, [ebp+arg_0]
push    edx
call    sub_10001718
add     esp, 4

loc_100051E5:
mov     ax, [ebp+var_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     esp, ebp
pop     ebp
retn
SetNumSwpPts endp

; Exported entry 113. RdSessionHandle


; Attributes: bp-based frame

public RdSessionHandle
RdSessionHandle proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005214
xor     eax, eax
jmp     short loc_1000522B

loc_10005214:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+1D4h]

loc_1000522B:
pop     ebp
retn
RdSessionHandle endp

; Exported entry 173. SetSessionHandle


; Attributes: bp-based frame

public SetSessionHandle
SetSessionHandle proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005251
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005260

loc_10005251:
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+1D4h], ecx
xor     ax, ax

loc_10005260:
pop     ebp
retn
SetSessionHandle endp

; Exported entry 107. RdNumSwpPts


; Attributes: bp-based frame

public RdNumSwpPts
RdNumSwpPts proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000527E
or      eax, 0FFFFFFFFh
jmp     short loc_100052B5

loc_1000527E:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+40h]
cmp     eax, 1
jnz     short loc_10005298
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+84h]
mov     [ebp+var_4], edx
jmp     short loc_100052A4

loc_10005298:
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0A4h]
mov     [ebp+var_4], ecx

loc_100052A4:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+var_4]

loc_100052B5:
mov     esp, ebp
pop     ebp
retn
RdNumSwpPts endp

; Exported entry 106. RdNumDataPts


; Attributes: bp-based frame

public RdNumDataPts
RdNumDataPts proc near

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100052DA
or      eax, 0FFFFFFFFh
jmp     loc_10005391

loc_100052DA:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+4]
and     eax, 7Fh
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jnz     short loc_100052FC
mov     [ebp+var_8], 0
jmp     loc_10005380

loc_100052FC:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+40h]
cmp     eax, 1
jnz     short loc_10005328
movsx   ecx, [ebp+var_4]
cmp     ecx, 3
jz      short loc_10005328
movsx   edx, [ebp+var_4]
cmp     edx, 2
jz      short loc_10005328
mov     eax, [ebp+arg_0]
mov     ecx, [eax+84h]
mov     [ebp+var_8], ecx
jmp     short loc_10005380

loc_10005328:
movsx   edx, [ebp+var_4]
mov     [ebp+var_C], edx
cmp     [ebp+var_C], 1
jz      short loc_10005343
cmp     [ebp+var_C], 2
jz      short loc_10005351
cmp     [ebp+var_C], 3
jz      short loc_1000535F
jmp     short loc_1000536D

loc_10005343:
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0A4h]
mov     [ebp+var_8], ecx
jmp     short loc_10005380

loc_10005351:
mov     edx, [ebp+arg_0]
mov     eax, [edx+98h]
mov     [ebp+var_8], eax
jmp     short loc_10005380

loc_1000535F:
mov     ecx, [ebp+arg_0]
mov     edx, [ecx+0ACh]
mov     [ebp+var_8], edx
jmp     short loc_10005380

loc_1000536D:
push    0FFFFFFF2h
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
movsx   eax, ax
jmp     short loc_10005391

loc_10005380:
push    0
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+var_8]

loc_10005391:
mov     esp, ebp
pop     ebp
retn
RdNumDataPts endp

; Exported entry 117. RdSwpIdx


; Attributes: bp-based frame

public RdSwpIdx
RdSwpIdx proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100053AF
xor     eax, eax
jmp     short loc_100053C6

loc_100053AF:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+0A0h]

loc_100053C6:
pop     ebp
retn
RdSwpIdx endp

; Exported entry 175. SetSwpIdx


; Attributes: bp-based frame

public SetSwpIdx
SetSwpIdx proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100053F3
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000541F

loc_100053F3:
cmp     [ebp+arg_4], 0
jz      short loc_10005410
mov     eax, [ebp+arg_0]
push    eax
call    RdNumDataPts
add     esp, 4
cmp     [ebp+arg_4], eax
jle     short loc_10005410
mov     ax, 0FFFDh
jmp     short loc_1000541F

loc_10005410:
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_4]
mov     [ecx+0A0h], edx
xor     ax, ax

loc_1000541F:
mov     esp, ebp
pop     ebp
retn
SetSwpIdx endp

; Exported entry 192. SwpTimeMode


; Attributes: bp-based frame

public SwpTimeMode
SwpTimeMode proc near

var_8= dword ptr -8
var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005450
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100054CC

loc_10005450:
mov     eax, [ebp+arg_0]
cmp     dword ptr [eax+24h], 0
jle     short loc_1000546A
movsx   ecx, [ebp+arg_4]
cmp     ecx, 1
jz      short loc_1000546A
mov     [ebp+var_4], 0FFF9h
jmp     short loc_100054C8

loc_1000546A:
movsx   edx, [ebp+arg_4]
mov     [ebp+var_8], edx
cmp     [ebp+var_8], 3  ; switch 4 cases
ja      short loc_100054AD ; jumptable 1000547A default case
mov     eax, [ebp+var_8]
jmp     ds:off_100054D0[eax*4] ; switch jump

loc_10005481:           ; jumptable 1000547A case 1
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+22h], 1
jmp     short loc_100054BC

loc_1000548C:           ; jumptable 1000547A case 0
mov     edx, [ebp+arg_0]
mov     word ptr [edx+22h], 0
jmp     short loc_100054BC

loc_10005497:           ; jumptable 1000547A case 2
mov     eax, [ebp+arg_0]
mov     word ptr [eax+22h], 2
jmp     short loc_100054BC

loc_100054A2:           ; jumptable 1000547A case 3
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+22h], 3
jmp     short loc_100054BC

loc_100054AD:           ; jumptable 1000547A default case
mov     edx, [ebp+arg_0]
mov     word ptr [edx+22h], 1
mov     [ebp+var_4], 1

loc_100054BC:
mov     eax, [ebp+arg_0]
push    eax
call    sub_10001B13
add     esp, 4

loc_100054C8:
mov     ax, [ebp+var_4]

loc_100054CC:
mov     esp, ebp
pop     ebp
retn
SwpTimeMode endp

off_100054D0 dd offset loc_1000548C ; jump table for switch statement
dd offset loc_10005481
dd offset loc_10005497
dd offset loc_100054A2
; Exported entry 176. SetSwpTime


; Attributes: bp-based frame

; int __cdecl SetSwpTime(int, double)
public SetSwpTime
SetSwpTime proc near

var_C= dword ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     [ebp+var_8], 0FFFFh
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0A8h]
mov     [ebp+var_4], ecx
mov     edx, [ebp+arg_0]
push    edx
call    TestFuncStatusAndPtr
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_10005519
mov     ecx, [ebp+arg_0]
push    ecx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005597

loc_10005519:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+22h]
cmp     eax, 2
jz      short loc_1000552D
mov     [ebp+var_8], 0FFFCh
jmp     short loc_10005593

loc_1000552D:
fld     ds:dbl_100160F8
fcomp   [ebp+arg_4]
fnstsw  ax
test    ah, 41h
jz      short loc_1000558D
fld     [ebp+arg_4]
fcomp   ds:dbl_10016110
fnstsw  ax
test    ah, 41h
jz      short loc_1000558D
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+var_4]
imul    edx, [ecx+3Ch]
add     edx, [ebp+var_4]
mov     [ebp+var_C], edx
fild    [ebp+var_C]
fcomp   [ebp+arg_4]
fnstsw  ax
test    ah, 1
jz      short loc_1000558D
mov     eax, [ebp+arg_0]
mov     ecx, dword ptr [ebp+arg_4]
mov     [eax+30h], ecx
mov     edx, dword ptr [ebp+arg_4+4]
mov     [eax+34h], edx
mov     [ebp+var_8], 0
mov     eax, [ebp+arg_0]
push    eax
call    sub_10001B13
add     esp, 4
jmp     short loc_10005593

loc_1000558D:
mov     [ebp+var_8], 0FFFDh

loc_10005593:
mov     ax, [ebp+var_8]

loc_10005597:
mov     esp, ebp
pop     ebp
retn
SetSwpTime endp

; Exported entry 118. RdSwpTime


; Attributes: bp-based frame

public RdSwpTime
RdSwpTime proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100055C7
cmp     [ebp+arg_4], 0
jz      short loc_100055C7
mov     edx, [ebp+arg_4]
mov     dword ptr [edx], 0
mov     dword ptr [edx+4], 0BFF00000h

loc_100055C7:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_4]
mov     eax, [ecx+30h]
mov     [edx], eax
mov     ecx, [ecx+34h]
mov     [edx+4], ecx
pop     ebp
retn
RdSwpTime endp

; Exported entry 150. SetDwellTime


; Attributes: bp-based frame

public SetDwellTime
SetDwellTime proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005613
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005669

loc_10005613:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+22h]
cmp     ecx, 1
jz      short loc_10005627
mov     [ebp+var_4], 0FFFFh
jmp     short loc_10005665

loc_10005627:
cmp     [ebp+arg_4], 0
jl      short loc_1000565F
cmp     [ebp+arg_4], 77359400h
jg      short loc_1000565F
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_4]
mov     [edx+24h], eax
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_0]
mov     eax, [edx+24h]
mov     [ecx+28h], eax
mov     [ebp+var_4], 0
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10001B13
add     esp, 4
jmp     short loc_10005665

loc_1000565F:
mov     [ebp+var_4], 0FFFDh

loc_10005665:
mov     ax, [ebp+var_4]

loc_10005669:
mov     esp, ebp
pop     ebp
retn
SetDwellTime endp

; Exported entry  88. RdDwellTime


; Attributes: bp-based frame

public RdDwellTime
RdDwellTime proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005688
or      eax, 0FFFFFFFFh
jmp     short loc_1000569C

loc_10005688:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+24h]

loc_1000569C:
pop     ebp
retn
RdDwellTime endp

; Exported entry  72. OverRideSetTime


; Attributes: bp-based frame

public OverRideSetTime
OverRideSetTime proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100056C9
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005720

loc_100056C9:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+22h]
cmp     ecx, 3
jz      short loc_100056DD
mov     [ebp+var_4], 0FFFCh
jmp     short loc_1000571C

loc_100056DD:
cmp     [ebp+arg_4], 0
jl      short loc_10005716
cmp     [ebp+arg_4], 77359400h
jg      short loc_10005716
mov     edx, [ebp+arg_4]
imul    edx, -1
mov     eax, [ebp+arg_0]
mov     [eax+28h], edx
mov     ecx, [ebp+arg_0]
mov     dword ptr [ecx+24h], 0
mov     [ebp+var_4], 0
mov     edx, [ebp+arg_0]
push    edx
call    sub_10001B13
add     esp, 4
jmp     short loc_1000571C

loc_10005716:
mov     [ebp+var_4], 0FFFDh

loc_1000571C:
mov     ax, [ebp+var_4]

loc_10005720:
mov     esp, ebp
pop     ebp
retn
OverRideSetTime endp

; Exported entry 115. RdSettleTime


; Attributes: bp-based frame

public RdSettleTime
RdSettleTime proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000573F
or      eax, 0FFFFFFFFh
jmp     short loc_1000575C

loc_1000573F:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ecx, [eax+28h]
push    ecx
call    sub_1000D563
add     esp, 4

loc_1000575C:
pop     ebp
retn
RdSettleTime endp

; Exported entry 170. SetRBW


; Attributes: bp-based frame

public SetRBW
SetRBW proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005789
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100057E3

loc_10005789:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+4Ah]
cmp     ecx, 1
jnz     short loc_1000579D
mov     [ebp+var_4], 0FFFCh
jmp     short loc_100057DF

loc_1000579D:
movsx   edx, [ebp+arg_4]
test    edx, edx
jl      short loc_100057D9
movsx   eax, [ebp+arg_4]
cmp     eax, 4
jg      short loc_100057D9
mov     ecx, [ebp+arg_0]
mov     dx, [ebp+arg_4]
mov     [ecx+48h], dx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    sub_10001718
add     esp, 4
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10001B13
add     esp, 4
jmp     short loc_100057DF

loc_100057D9:
mov     [ebp+var_4], 0FFFDh

loc_100057DF:
mov     ax, [ebp+var_4]

loc_100057E3:
mov     esp, ebp
pop     ebp
retn
SetRBW endp

; Exported entry 110. RdRBW


; Attributes: bp-based frame

public RdRBW
RdRBW proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005803
or      ax, 0FFFFh
jmp     short loc_10005818

loc_10005803:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+48h]

loc_10005818:
pop     ebp
retn
RdRBW endp

; Exported entry 171. SetRBWmode


; Attributes: bp-based frame

public SetRBWmode
SetRBWmode proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005845
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005898

loc_10005845:
movsx   eax, [ebp+arg_4]
test    eax, eax
jnz     short loc_10005858
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+4Ah], 0
jmp     short loc_10005894

loc_10005858:
movsx   edx, [ebp+arg_4]
cmp     edx, 1
jz      short loc_10005867
mov     [ebp+var_4], 1

loc_10005867:
mov     eax, [ebp+arg_0]
mov     word ptr [eax+4Ah], 1
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10001D01
add     esp, 4
mov     edx, [ebp+arg_0]
push    edx
call    sub_10001718
add     esp, 4
mov     eax, [ebp+arg_0]
push    eax
call    sub_10001B13
add     esp, 4

loc_10005894:
mov     ax, [ebp+var_4]

loc_10005898:
mov     esp, ebp
pop     ebp
retn
SetRBWmode endp

; Exported entry 111. RdRBWmode


; Attributes: bp-based frame

public RdRBWmode
RdRBWmode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100058B8
or      ax, 0FFFFh
jmp     short loc_100058CD

loc_100058B8:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+4Ah]

loc_100058CD:
pop     ebp
retn
RdRBWmode endp

; Exported entry 181. SetVBW


; Attributes: bp-based frame

public SetVBW
SetVBW proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100058F8
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_4], ax
jmp     short loc_10005942

loc_100058F8:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+4Eh]
cmp     ecx, 1
jnz     short loc_1000590C
mov     [ebp+var_4], 0FFFCh
jmp     short loc_10005942

loc_1000590C:
movsx   edx, [ebp+arg_4]
test    edx, edx
jl      short loc_1000591D
movsx   eax, [ebp+arg_4]
cmp     eax, 7
jle     short loc_10005925

loc_1000591D:
mov     [ebp+var_4], 0FFFDh
jmp     short loc_10005942

loc_10005925:
mov     ecx, [ebp+arg_0]
mov     dx, [ebp+arg_4]
mov     [ecx+4Ch], dx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    sub_10001B13
add     esp, 4

loc_10005942:
mov     ax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
SetVBW endp

; Exported entry 123. RdVBW


; Attributes: bp-based frame

public RdVBW
RdVBW proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000596E
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005983

loc_1000596E:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ecx, [ebp+arg_0]
mov     ax, [ecx+4Ch]

loc_10005983:
pop     ebp
retn
RdVBW endp

; Exported entry 182. SetVBWmode


; Attributes: bp-based frame

public SetVBWmode
SetVBWmode proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100059B0
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100059EA

loc_100059B0:
movsx   eax, [ebp+arg_4]
test    eax, eax
jnz     short loc_100059C3
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+4Eh], 0
jmp     short loc_100059E6

loc_100059C3:
movsx   edx, [ebp+arg_4]
cmp     edx, 1
jnz     short loc_100059D7
mov     eax, [ebp+arg_0]
mov     word ptr [eax+4Eh], 1
jmp     short loc_100059E6

loc_100059D7:
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+4Eh], 1
mov     [ebp+var_4], 1

loc_100059E6:
mov     ax, [ebp+var_4]

loc_100059EA:
mov     esp, ebp
pop     ebp
retn
SetVBWmode endp

; Exported entry 124. RdVBWmode


; Attributes: bp-based frame

public RdVBWmode
RdVBWmode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005A0A
or      ax, 0FFFFh
jmp     short loc_10005A1F

loc_10005A0A:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+4Eh]

loc_10005A1F:
pop     ebp
retn
RdVBWmode endp

; Exported entry 156. SetFiltRatio


; Attributes: bp-based frame

; int __cdecl SetFiltRatio(int, double)
public SetFiltRatio
SetFiltRatio proc near

var_64= word ptr -64h
var_60= word ptr -60h
var_5C= qword ptr -5Ch
var_54= dword ptr -54h
var_50= dword ptr -50h
var_4C= dword ptr -4Ch
var_48= dword ptr -48h
var_44= dword ptr -44h
var_40= dword ptr -40h
var_3C= dword ptr -3Ch
var_38= dword ptr -38h
var_34= dword ptr -34h
var_30= dword ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 64h
mov     [ebp+var_64], 0FFFDh
mov     [ebp+var_4], 0Bh
mov     dword ptr [ebp+var_5C], 0
mov     dword ptr [ebp+var_5C+4], 40C38800h
mov     [ebp+var_54], 0
mov     [ebp+var_50], 408F4000h
mov     [ebp+var_4C], 0
mov     [ebp+var_48], 40590000h
mov     [ebp+var_44], 0
mov     [ebp+var_40], 40240000h
mov     [ebp+var_3C], 0
mov     [ebp+var_38], 3FF00000h
mov     [ebp+var_34], 9999999Ah
mov     [ebp+var_30], 3FB99999h
mov     [ebp+var_2C], 47AE147Bh
mov     [ebp+var_28], 3F847AE1h
mov     [ebp+var_24], 0D2F1A9FCh
mov     [ebp+var_20], 3F50624Dh
mov     [ebp+var_1C], 0EB1C432Dh
mov     [ebp+var_18], 3F1A36E2h
mov     [ebp+var_14], 88E368F1h
mov     [ebp+var_10], 3EE4F8B5h
mov     [ebp+var_C], 0A0B5ED8Dh
mov     [ebp+var_8], 3EB0C6F7h
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005AEF
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005B41

loc_10005AEF:
mov     [ebp+var_64], 0FFFDh
mov     [ebp+var_60], 0
jmp     short loc_10005B09

loc_10005AFD:
mov     ax, [ebp+var_60]
add     ax, 1
mov     [ebp+var_60], ax

loc_10005B09:
movsx   ecx, [ebp+var_60]
cmp     ecx, [ebp+var_4]
jge     short loc_10005B3D
movsx   edx, [ebp+var_60]
fld     [ebp+arg_4]
fcomp   [ebp+edx*8+var_5C]
fnstsw  ax
test    ah, 40h
jz      short loc_10005B3B
mov     eax, [ebp+arg_0]
mov     ecx, dword ptr [ebp+arg_4]
mov     [eax+58h], ecx
mov     edx, dword ptr [ebp+arg_4+4]
mov     [eax+5Ch], edx
mov     [ebp+var_64], 0
jmp     short loc_10005B3D

loc_10005B3B:
jmp     short loc_10005AFD

loc_10005B3D:
mov     ax, [ebp+var_64]

loc_10005B41:
mov     esp, ebp
pop     ebp
retn
SetFiltRatio endp

; Exported entry  93. RdFiltRatio


; Attributes: bp-based frame

public RdFiltRatio
RdFiltRatio proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005B5D
jmp     short loc_10005B90

loc_10005B5D:
cmp     [ebp+arg_4], 0
jnz     short loc_10005B71
push    0FFFFFFFDh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_10005B71:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_4]
mov     eax, [ecx+58h]
mov     [edx], eax
mov     ecx, [ecx+5Ch]
mov     [edx+4], ecx

loc_10005B90:
pop     ebp
retn
RdFiltRatio endp

; Exported entry 147. SetDetectCode


; Attributes: bp-based frame

public SetDetectCode
SetDetectCode proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005BB6
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005BC7

loc_10005BB6:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+80h], cx
xor     ax, ax

loc_10005BC7:
pop     ebp
retn
SetDetectCode endp

; Exported entry 149. SetDetectLog


; Attributes: bp-based frame

public SetDetectLog
SetDetectLog proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005BEE
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005C4E

loc_10005BEE:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
or      ecx, 2
or      ecx, 4
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
and     ecx, 0FFFFFFDFh
and     ecx, 0FFFFFFF7h
and     ecx, 0FFFFFFFEh
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
mov     cx, [eax+62h]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetRefLevel
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10005C4B
mov     ax, 0FFF1h
jmp     short loc_10005C4E

loc_10005C4B:
xor     ax, ax

loc_10005C4E:
mov     esp, ebp
pop     ebp
retn
SetDetectLog endp

; Exported entry 148. SetDetectLin


; Attributes: bp-based frame

public SetDetectLin
SetDetectLin proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005C77
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005CD7

loc_10005C77:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
or      ecx, 20h
or      ecx, 4
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
and     ecx, 0FFFFFFFDh
and     ecx, 0FFFFFFF7h
and     ecx, 0FFFFFFFEh
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
mov     cx, [eax+62h]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetRefLevel
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10005CD4
mov     ax, 0FFF1h
jmp     short loc_10005CD7

loc_10005CD4:
xor     ax, ax

loc_10005CD7:
mov     esp, ebp
pop     ebp
retn
SetDetectLin endp

; Exported entry 146. SetDetect3IF


; Attributes: bp-based frame

public SetDetect3IF
SetDetect3IF proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005D00
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005D60

loc_10005D00:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
or      ecx, 8
or      ecx, 1
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
and     ecx, 0FFFFFFFDh
and     ecx, 0FFFFFFDFh
and     ecx, 0FFFFFFFBh
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
mov     eax, [ebp+arg_0]
mov     cx, [eax+62h]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetRefLevel
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10005D5D
mov     ax, 0FFF1h
jmp     short loc_10005D60

loc_10005D5D:
xor     ax, ax

loc_10005D60:
mov     esp, ebp
pop     ebp
retn
SetDetect3IF endp

; Exported entry  86. RdDetect


; Attributes: bp-based frame

public RdDetect
RdDetect proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005D8F
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005DE6

loc_10005D8F:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
and     ecx, 2
test    ecx, ecx
jle     short loc_10005DA6
mov     [ebp+var_4], 2

loc_10005DA6:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+80h]
and     eax, 20h
test    eax, eax
jle     short loc_10005DBD
mov     [ebp+var_4], 20h

loc_10005DBD:
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+80h]
and     edx, 8
test    edx, edx
jle     short loc_10005DD4
mov     [ebp+var_4], 8

loc_10005DD4:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_10005DE6:
mov     esp, ebp
pop     ebp
retn
RdDetect endp

; Exported entry  87. RdDetectCode


; Attributes: bp-based frame

public RdDetectCode
RdDetectCode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005E05
xor     ax, ax
jmp     short loc_10005E1D

loc_10005E05:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+80h]

loc_10005E1D:
pop     ebp
retn
RdDetectCode endp

; Exported entry 174. SetSweepCode


; Attributes: bp-based frame

public SetSweepCode
SetSweepCode proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005E4A
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005E93

loc_10005E4A:
movsx   eax, [ebp+arg_4]
cmp     eax, 10h
jl      short loc_10005E5B
mov     [ebp+var_4], 0FFFDh
jmp     short loc_10005E61

loc_10005E5B:
mov     [ebp+var_4], 0

loc_10005E61:
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jnz     short loc_10005E8F
mov     edx, [ebp+arg_0]
mov     ax, [ebp+arg_4]
mov     [edx+82h], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10001718
add     esp, 4
mov     edx, [ebp+arg_0]
push    edx
call    sub_10001B13
add     esp, 4

loc_10005E8F:
mov     ax, [ebp+var_4]

loc_10005E93:
mov     esp, ebp
pop     ebp
retn
SetSweepCode endp

; Exported entry 116. RdSweepCode


; Attributes: bp-based frame

public RdSweepCode
RdSweepCode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005EB3
or      ax, 0FFFFh
jmp     short loc_10005ECB

loc_10005EB3:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+82h]

loc_10005ECB:
pop     ebp
retn
RdSweepCode endp

; Exported entry   4. CheckForFreqpts


; Attributes: bp-based frame

public CheckForFreqpts
CheckForFreqpts proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005EEF
xor     ax, ax
jmp     short loc_10005F4F

loc_10005EEF:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+82h]
and     eax, 8
test    eax, eax
jnz     short loc_10005F08
mov     [ebp+var_4], 0
jmp     short loc_10005F4B

loc_10005F08:
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+40h]
test    edx, edx
jnz     short loc_10005F1B
mov     [ebp+var_4], 0
jmp     short loc_10005F4B

loc_10005F1B:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+82h]
and     ecx, 2
test    ecx, ecx
jnz     short loc_10005F3D
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+82h]
and     eax, 4
test    eax, eax
jz      short loc_10005F45

loc_10005F3D:
mov     [ebp+var_4], 1
jmp     short loc_10005F4B

loc_10005F45:
mov     [ebp+var_4], 0

loc_10005F4B:
mov     ax, [ebp+var_4]

loc_10005F4F:
mov     esp, ebp
pop     ebp
retn
CheckForFreqpts endp

; Exported entry   5. CheckForMinMax


; Attributes: bp-based frame

public CheckForMinMax
CheckForMinMax proc near

var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005F81
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10005FC5

loc_10005F81:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+82h]
and     ecx, 6
mov     [ebp+var_4], ecx
cmp     [ebp+var_4], 0
jnz     short loc_10005F9F
mov     [ebp+var_8], 0
jmp     short loc_10005FC1

loc_10005F9F:
cmp     [ebp+var_4], 6
jnz     short loc_10005FAD
mov     [ebp+var_8], 2
jmp     short loc_10005FC1

loc_10005FAD:
cmp     [ebp+var_4], 0
jle     short loc_10005FBB
mov     [ebp+var_8], 1
jmp     short loc_10005FC1

loc_10005FBB:
mov     [ebp+var_8], 0FFFFh

loc_10005FC1:
mov     ax, [ebp+var_8]

loc_10005FC5:
mov     esp, ebp
pop     ebp
retn
CheckForMinMax endp

; Exported entry 143. SetCellMode


; Attributes: bp-based frame

public SetCellMode
SetCellMode proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10005FF4
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006045

loc_10005FF4:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+40h], cx
movsx   edx, [ebp+arg_4]
test    edx, edx
jnz     short loc_10006012
mov     eax, [ebp+arg_0]
mov     word ptr [eax+40h], 0
jmp     short loc_10006035

loc_10006012:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 1
jnz     short loc_10006026
mov     edx, [ebp+arg_0]
mov     word ptr [edx+40h], 1
jmp     short loc_10006035

loc_10006026:
mov     eax, [ebp+arg_0]
mov     word ptr [eax+40h], 1
mov     [ebp+var_4], 0FFFFh

loc_10006035:
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10001718
add     esp, 4
mov     ax, [ebp+var_4]

loc_10006045:
mov     esp, ebp
pop     ebp
retn
SetCellMode endp

; Exported entry  80. RdCellMode


; Attributes: bp-based frame

public RdCellMode
RdCellMode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006065
or      ax, 0FFFFh
jmp     short loc_10006080

loc_10006065:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
movsx   eax, word ptr [eax+40h]
neg     eax
sbb     eax, eax
neg     eax

loc_10006080:
pop     ebp
retn
RdCellMode endp

; Exported entry 142. SetAutoCell


; Attributes: bp-based frame

public SetAutoCell
SetAutoCell proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100060AD
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100060E7

loc_100060AD:
movsx   eax, [ebp+arg_4]
test    eax, eax
jnz     short loc_100060C0
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+42h], 0
jmp     short loc_100060E3

loc_100060C0:
movsx   edx, [ebp+arg_4]
cmp     edx, 1
jnz     short loc_100060D4
mov     eax, [ebp+arg_0]
mov     word ptr [eax+42h], 1
jmp     short loc_100060E3

loc_100060D4:
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+42h], 1
mov     [ebp+var_4], 0FFFFh

loc_100060E3:
mov     ax, [ebp+var_4]

loc_100060E7:
mov     esp, ebp
pop     ebp
retn
SetAutoCell endp

; Exported entry  79. RdAutoCell


; Attributes: bp-based frame

public RdAutoCell
RdAutoCell proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006107
or      ax, 0FFFFh
jmp     short loc_1000611C

loc_10006107:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+42h]

loc_1000611C:
pop     ebp
retn
RdAutoCell endp

; Exported entry 166. SetNumCells


; Attributes: bp-based frame

public SetNumCells
SetNumCells proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006149
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006182

loc_10006149:
cmp     [ebp+arg_4], 1
jl      short loc_10006178
cmp     [ebp+arg_4], 0FFFFh
jg      short loc_10006178
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+84h], ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10001718
add     esp, 4
mov     [ebp+var_4], 0
jmp     short loc_1000617E

loc_10006178:
mov     [ebp+var_4], 0FFFDh

loc_1000617E:
mov     ax, [ebp+var_4]

loc_10006182:
mov     esp, ebp
pop     ebp
retn
SetNumCells endp

; Exported entry 105. RdNumCells


; Attributes: bp-based frame

public RdNumCells
RdNumCells proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100061A1
or      eax, 0FFFFFFFFh
jmp     short loc_100061B8

loc_100061A1:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+84h]

loc_100061B8:
pop     ebp
retn
RdNumCells endp

; Exported entry 141. SetAttenuatr


; Attributes: bp-based frame

public SetAttenuatr
SetAttenuatr proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
push    esi
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100061E9
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000629D

loc_100061E9:
mov     eax, [ebp+arg_0]
push    eax
call    RdDetect
add     esp, 4
movsx   ecx, ax
cmp     ecx, 2
jz      short loc_10006208
mov     [ebp+var_4], 0FFF8h
jmp     loc_10006299

loc_10006208:
mov     edx, [ebp+arg_0]
push    edx
call    RdMinAttLimit
add     esp, 4
movsx   eax, ax
movsx   ecx, [ebp+arg_4]
cmp     eax, ecx
jg      short loc_10006293
movsx   esi, [ebp+arg_4]
mov     edx, [ebp+arg_0]
push    edx
call    RdMaxAttLimit
add     esp, 4
movsx   eax, ax
cmp     esi, eax
jg      short loc_10006293
mov     ecx, [ebp+arg_0]
mov     dx, [ebp+arg_4]
mov     [ecx+60h], dx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+60h]
sub     ecx, 28h
mov     edx, [ebp+arg_0]
mov     [edx+62h], cx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+64h]
test    ecx, ecx
jz      short loc_1000627D
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+66h]
test    eax, eax
jz      short loc_1000627D
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_0]
mov     ax, [ecx+62h]
sub     ax, [edx+68h]
mov     ecx, [ebp+arg_0]
mov     [ecx+62h], ax

loc_1000627D:
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_0]
mov     cx, [eax+62h]
mov     [edx+6Ah], cx
mov     [ebp+var_4], 0
jmp     short loc_10006299

loc_10006293:
mov     [ebp+var_4], 0FFFDh

loc_10006299:
mov     ax, [ebp+var_4]

loc_1000629D:
pop     esi
mov     esp, ebp
pop     ebp
retn
SetAttenuatr endp

; Exported entry  78. RdAttenuatr


; Attributes: bp-based frame

public RdAttenuatr
RdAttenuatr proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100062BE
or      ax, 0FFFFh
jmp     short loc_100062D3

loc_100062BE:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+60h]

loc_100062D3:
pop     ebp
retn
RdAttenuatr endp

; Exported entry 103. RdMinAttLimit


; Attributes: bp-based frame

public RdMinAttLimit
RdMinAttLimit proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100062FA
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000635A

loc_100062FA:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+2]
mov     [ebp+var_4], ecx
cmp     [ebp+var_4], 300h
jg      short loc_1000632A
cmp     [ebp+var_4], 300h
jz      short loc_10006335
cmp     [ebp+var_4], 100h
jz      short loc_10006335
cmp     [ebp+var_4], 200h
jz      short loc_10006335
jmp     short loc_10006348

loc_1000632A:
cmp     [ebp+var_4], 400h
jz      short loc_10006335
jmp     short loc_10006348

loc_10006335:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
xor     ax, ax
jmp     short loc_1000635A

loc_10006348:
push    0FFFFFFF3h
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
or      ax, 0FFFFh

loc_1000635A:
mov     esp, ebp
pop     ebp
retn
RdMinAttLimit endp

; Exported entry 101. RdMaxAttLimit


; Attributes: bp-based frame

public RdMaxAttLimit
RdMaxAttLimit proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000637B
or      ax, 0FFFFh
jmp     short loc_100063E2

loc_1000637B:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+2]
mov     [ebp+var_4], ecx
cmp     [ebp+var_4], 300h
jg      short loc_100063B9
cmp     [ebp+var_4], 300h
jz      short loc_100063CA
cmp     [ebp+var_4], 100h
jz      short loc_100063C4
cmp     [ebp+var_4], 200h
jz      short loc_100063C4
jmp     short loc_100063D0

loc_100063B9:
cmp     [ebp+var_4], 400h
jz      short loc_100063C4
jmp     short loc_100063D0

loc_100063C4:
mov     ax, 3Ch
jmp     short loc_100063E2

loc_100063CA:
mov     ax, 46h
jmp     short loc_100063E2

loc_100063D0:
push    0FFFFFFF3h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
or      ax, 0FFFFh

loc_100063E2:
mov     esp, ebp
pop     ebp
retn
RdMaxAttLimit endp

; Exported entry 172. SetRefLevel


; Attributes: bp-based frame

public SetRefLevel
SetRefLevel proc near

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
push    esi
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006417
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10006646

loc_10006417:
mov     eax, [ebp+arg_0]
mov     cx, [ebp+arg_4]
mov     [eax+62h], cx
mov     edx, [ebp+arg_0]
push    edx
call    RdDetect
add     esp, 4
movsx   eax, ax
cmp     eax, 20h
jnz     loc_10006560
movsx   esi, [ebp+arg_4]
mov     ecx, [ebp+arg_0]
push    ecx
call    RdMaxAttLimit
add     esp, 4
movsx   edx, ax
sub     edx, 28h
cmp     esi, edx
jle     short loc_10006472
mov     eax, [ebp+arg_0]
push    eax
call    RdMaxAttLimit
add     esp, 4
movsx   ecx, ax
sub     ecx, 28h
mov     [ebp+arg_4], cx
mov     [ebp+var_4], 1
jmp     short loc_100064AE

loc_10006472:
movsx   edx, [ebp+arg_4]
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+64h]
neg     ecx
sbb     ecx, ecx
and     ecx, 0Ah
mov     eax, 0FFFFFFBAh
sub     eax, ecx
cmp     edx, eax
jge     short loc_100064AE
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+64h]
neg     edx
sbb     edx, edx
and     edx, 0Ah
mov     eax, 0FFFFFFBAh
sub     eax, edx
mov     [ebp+arg_4], ax
mov     [ebp+var_4], 1

loc_100064AE:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 0FFFFFFBAh
jge     short loc_100064CB
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+64h]
test    eax, eax
jz      short loc_100064CB
mov     [ebp+var_8], 1
jmp     short loc_100064D2

loc_100064CB:
mov     [ebp+var_8], 0

loc_100064D2:
mov     ecx, [ebp+arg_0]
mov     dx, word ptr [ebp+var_8]
mov     [ecx+66h], dx
movsx   esi, [ebp+arg_4]
mov     eax, [ebp+arg_0]
push    eax
call    RdMaxAttLimit
add     esp, 4
movsx   ecx, ax
sub     ecx, 46h
cmp     esi, ecx
jle     short loc_1000650F
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+80h]
and     al, 0BFh
mov     ecx, [ebp+arg_0]
mov     [ecx+80h], ax
jmp     short loc_10006525

loc_1000650F:
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+80h]
or      al, 40h
mov     ecx, [ebp+arg_0]
mov     [ecx+80h], ax

loc_10006525:
movsx   esi, [ebp+arg_4]
add     esi, 46h
mov     edx, [ebp+arg_0]
push    edx
call    RdLinearAttn
add     esp, 4
movsx   eax, ax
neg     eax
sbb     eax, eax
and     eax, 1Eh
sub     esi, eax
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+66h]
neg     edx
sbb     edx, edx
and     edx, 0Ah
add     esi, edx
mov     eax, [ebp+arg_0]
mov     [eax+60h], si
jmp     loc_10006637

loc_10006560:
movsx   esi, [ebp+arg_4]
mov     ecx, [ebp+arg_0]
push    ecx
call    RdMaxAttLimit
add     esp, 4
movsx   edx, ax
sub     edx, 28h
cmp     esi, edx
jle     short loc_10006598
mov     eax, [ebp+arg_0]
push    eax
call    RdMaxAttLimit
add     esp, 4
movsx   ecx, ax
sub     ecx, 28h
mov     [ebp+arg_4], cx
mov     [ebp+var_4], 1
jmp     short loc_100065D4

loc_10006598:
movsx   edx, [ebp+arg_4]
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+64h]
neg     ecx
sbb     ecx, ecx
and     ecx, 0Ah
mov     eax, 0FFFFFFD8h
sub     eax, ecx
cmp     edx, eax
jge     short loc_100065D4
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+64h]
neg     edx
sbb     edx, edx
and     edx, 0Ah
mov     eax, 0FFFFFFD8h
sub     eax, edx
mov     [ebp+arg_4], ax
mov     [ebp+var_4], 1

loc_100065D4:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 0FFFFFFD8h
jge     short loc_100065F1
mov     edx, [ebp+arg_0]
movsx   eax, word ptr [edx+64h]
test    eax, eax
jz      short loc_100065F1
mov     [ebp+var_C], 1
jmp     short loc_100065F8

loc_100065F1:
mov     [ebp+var_C], 0

loc_100065F8:
mov     ecx, [ebp+arg_0]
mov     dx, word ptr [ebp+var_C]
mov     [ecx+66h], dx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+80h]
or      ecx, 40h
mov     edx, [ebp+arg_0]
mov     [edx+80h], cx
movsx   eax, [ebp+arg_4]
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+66h]
neg     edx
sbb     edx, edx
and     edx, 0Ah
lea     eax, [eax+edx+28h]
mov     ecx, [ebp+arg_0]
mov     [ecx+60h], ax

loc_10006637:
mov     edx, [ebp+arg_0]
mov     ax, [ebp+arg_4]
mov     [edx+6Ah], ax
mov     ax, [ebp+var_4]

loc_10006646:
pop     esi
mov     esp, ebp
pop     ebp
retn
SetRefLevel endp

; Exported entry 112. RdRefLevel


; Attributes: bp-based frame

public RdRefLevel
RdRefLevel proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006667
mov     ax, 8000h
jmp     short loc_1000667C

loc_10006667:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+62h]

loc_1000667C:
pop     ebp
retn
RdRefLevel endp

; Exported entry 163. SetLinRefLevel


; Attributes: bp-based frame

public SetLinRefLevel
SetLinRefLevel proc near

arg_0= dword ptr  8
arg_4= qword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100066A2
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100066DD

loc_100066A2:
mov     eax, [ebp+arg_0]
push    eax
call    RdDetect
add     esp, 4
movsx   ecx, ax
cmp     ecx, 20h
jz      short loc_100066BC
mov     ax, 0FFF8h
jmp     short loc_100066DD

loc_100066BC:
mov     edx, dword ptr [ebp+arg_4+4]
push    edx
mov     eax, dword ptr [ebp+arg_4]
push    eax             ; double
mov     ecx, [ebp+arg_0]
push    ecx             ; int
call    FindEquivDbmRef
add     esp, 0Ch
push    eax
mov     edx, [ebp+arg_0]
push    edx
call    SetRefLevel
add     esp, 8

loc_100066DD:
pop     ebp
retn
SetLinRefLevel endp

; Exported entry  98. RdLinRefLevel


; Attributes: bp-based frame

public RdLinRefLevel
RdLinRefLevel proc near

dbm= qword ptr -14h
var_C= dword ptr -0Ch
var_8= qword ptr -8
a1= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     dword ptr [ebp+var_8], 0
mov     dword ptr [ebp+var_8+4], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000670E
fld     ds:dbl_100160F8
jmp     short loc_10006741

loc_1000670E:
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+62h]
mov     [ebp+var_C], eax
fild    [ebp+var_C]
sub     esp, 8
fstp    [esp+14h+dbm]   ; dbm
mov     ecx, [ebp+a1]
push    ecx             ; a1
call    GetnVForDbm
add     esp, 0Ch
fstp    [ebp+var_8]
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
fld     [ebp+var_8]

loc_10006741:
mov     esp, ebp
pop     ebp
retn
RdLinRefLevel endp

; Exported entry 184. SetZSamplCnt


; Attributes: bp-based frame

public SetZSamplCnt
SetZSamplCnt proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006770
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000679D

loc_10006770:
cmp     [ebp+arg_4], 0
jl      short loc_10006793
cmp     [ebp+arg_4], 5F5E100h
jg      short loc_10006793
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+98h], ecx
mov     [ebp+var_4], 0
jmp     short loc_10006799

loc_10006793:
mov     [ebp+var_4], 0FFFDh

loc_10006799:
mov     ax, [ebp+var_4]

loc_1000679D:
mov     esp, ebp
pop     ebp
retn
SetZSamplCnt endp

; Exported entry 126. RdZSamplCnt


; Attributes: bp-based frame

public RdZSamplCnt
RdZSamplCnt proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100067BC
or      eax, 0FFFFFFFFh
jmp     short loc_100067D3

loc_100067BC:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+98h]

loc_100067D3:
pop     ebp
retn
RdZSamplCnt endp

; Exported entry 186. SetZSamplRate


; Attributes: bp-based frame

public SetZSamplRate
SetZSamplRate proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006800
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000684E

loc_10006800:
cmp     [ebp+arg_4], 132h
jnb     short loc_10006818
mov     [ebp+arg_4], 132h
mov     [ebp+var_4], 0FFFDh
jmp     short loc_10006836

loc_10006818:
cmp     [ebp+arg_4], 0F4240h
jbe     short loc_10006830
mov     [ebp+arg_4], 0F4240h
mov     [ebp+var_4], 0FFFDh
jmp     short loc_10006836

loc_10006830:
mov     [ebp+var_4], 0

loc_10006836:
mov     eax, 989680h
xor     edx, edx
div     [ebp+arg_4]
mov     ecx, [ebp+arg_0]
mov     [ecx+9Ch], ax
mov     ax, [ebp+var_4]

loc_1000684E:
mov     esp, ebp
pop     ebp
retn
SetZSamplRate endp

; Exported entry 185. SetZSamplDvdr


; Attributes: bp-based frame

public SetZSamplDvdr
SetZSamplDvdr proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000687D
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100068D0

loc_1000687D:
mov     eax, [ebp+arg_4]
and     eax, 0FFFFh
cmp     eax, 0Ah
jge     short loc_1000689C
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+9Ch], 0Ah
mov     ax, 0FFFDh
jmp     short loc_100068D0

loc_1000689C:
mov     edx, [ebp+arg_4]
and     edx, 0FFFFh
cmp     edx, 7FFFh
jle     short loc_100068BF
mov     eax, [ebp+arg_0]
mov     word ptr [eax+9Ch], 7FFFh
mov     ax, 0FFFDh
jmp     short loc_100068D0

loc_100068BF:
mov     ecx, [ebp+arg_0]
mov     dx, word ptr [ebp+arg_4]
mov     [ecx+9Ch], dx
xor     ax, ax

loc_100068D0:
mov     esp, ebp
pop     ebp
retn
SetZSamplDvdr endp

; Exported entry 128. RdZSamplRate


; Attributes: bp-based frame

public RdZSamplRate
RdZSamplRate proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100068EF
or      eax, 0FFFFFFFFh
jmp     short loc_10006911

loc_100068EF:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
xor     ecx, ecx
mov     cx, [eax+9Ch]
mov     eax, 989680h
cdq
idiv    ecx

loc_10006911:
pop     ebp
retn
RdZSamplRate endp

; Exported entry 127. RdZSamplDvdr


; Attributes: bp-based frame

public RdZSamplDvdr
RdZSamplDvdr proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000692F
or      ax, 0FFFFh
jmp     short loc_10006947

loc_1000692F:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+9Ch]

loc_10006947:
pop     ebp
retn
RdZSamplDvdr endp

; Exported entry 158. SetHopTabCnt


; Attributes: bp-based frame

public SetHopTabCnt
SetHopTabCnt proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006974
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100069A1

loc_10006974:
cmp     [ebp+arg_4], 0
jl      short loc_10006997
cmp     [ebp+arg_4], 400h
jg      short loc_10006997
mov     eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     [eax+0ACh], ecx
mov     [ebp+var_4], 0
jmp     short loc_1000699D

loc_10006997:
mov     [ebp+var_4], 0FFFDh

loc_1000699D:
mov     ax, [ebp+var_4]

loc_100069A1:
mov     esp, ebp
pop     ebp
retn
SetHopTabCnt endp

; Exported entry  94. RdHopTabCnt


; Attributes: bp-based frame

public RdHopTabCnt
RdHopTabCnt proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100069C0
or      eax, 0FFFFFFFFh
jmp     short loc_100069D7

loc_100069C0:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+0ACh]

loc_100069D7:
pop     ebp
retn
RdHopTabCnt endp

; Exported entry 179. SetTrigMode


; Attributes: bp-based frame

public SetTrigMode
SetTrigMode proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006A04
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006A56

loc_10006A04:
movsx   eax, [ebp+arg_4]
test    eax, eax
jl      short loc_10006A4C
movsx   ecx, [ebp+arg_4]
cmp     ecx, 6
jg      short loc_10006A4C
mov     edx, [ebp+arg_0]
mov     ax, [ebp+arg_4]
mov     [edx+6Ch], ax
mov     [ebp+var_4], 0
movsx   ecx, [ebp+arg_8]
test    ecx, ecx
jz      short loc_10006A36
movsx   edx, [ebp+arg_4]
test    edx, edx
jnz     short loc_10006A41

loc_10006A36:
mov     eax, [ebp+arg_0]
mov     word ptr [eax+6Eh], 0
jmp     short loc_10006A4A

loc_10006A41:
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+6Eh], 1

loc_10006A4A:
jmp     short loc_10006A52

loc_10006A4C:
mov     [ebp+var_4], 0FFFDh

loc_10006A52:
mov     ax, [ebp+var_4]

loc_10006A56:
mov     esp, ebp
pop     ebp
retn
SetTrigMode endp

; Exported entry 121. RdTrigMode


; Attributes: bp-based frame

public RdTrigMode
RdTrigMode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006A76
or      ax, 0FFFFh
jmp     short loc_10006A8B

loc_10006A76:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+6Ch]

loc_10006A8B:
pop     ebp
retn
RdTrigMode endp

; Exported entry 180. SetTrigThrsh


; Attributes: bp-based frame

public SetTrigThrsh
SetTrigThrsh proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006AB8
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006AE7

loc_10006AB8:
movsx   eax, [ebp+arg_4]
cmp     eax, 0FFFFFF88h
jl      short loc_10006ADD
movsx   ecx, [ebp+arg_4]
cmp     ecx, 14h
jg      short loc_10006ADD
mov     edx, [ebp+arg_0]
mov     ax, [ebp+arg_4]
mov     [edx+74h], ax
mov     [ebp+var_4], 0
jmp     short loc_10006AE3

loc_10006ADD:
mov     [ebp+var_4], 0FFFDh

loc_10006AE3:
mov     ax, [ebp+var_4]

loc_10006AE7:
mov     esp, ebp
pop     ebp
retn
SetTrigThrsh endp

; Exported entry 122. RdTrigThrsh


; Attributes: bp-based frame

public RdTrigThrsh
RdTrigThrsh proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006B07
mov     ax, 8000h
jmp     short loc_10006B1C

loc_10006B07:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+74h]

loc_10006B1C:
pop     ebp
retn
RdTrigThrsh endp

; Exported entry 155. SetExternRef


; Attributes: bp-based frame

public SetExternRef
SetExternRef proc near

var_4= word ptr -4
var_2= word ptr -2
arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006B43
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006BA6

loc_10006B43:
movsx   eax, [ebp+arg_4]
test    eax, eax
jnz     short loc_10006B59
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+0B8h], 0
jmp     short loc_10006B65

loc_10006B59:
mov     edx, [ebp+arg_0]
mov     word ptr [edx+0B8h], 1

loc_10006B65:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+0B0h]
xor     edx, edx
cmp     ecx, 32h
setnz   dl
mov     [ebp+var_4], dx
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+0B8h]
neg     ecx
sbb     ecx, ecx
neg     ecx
mov     [ebp+var_2], cx
lea     edx, [ebp+var_4]
push    edx
push    2
push    0Bh
mov     eax, [ebp+arg_0]
push    eax
call    SendCommand
add     esp, 10h
xor     ax, ax

loc_10006BA6:
mov     esp, ebp
pop     ebp
retn
SetExternRef endp

; Exported entry  92. RdExternRef


; Attributes: bp-based frame

public RdExternRef
RdExternRef proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006BC6
or      ax, 0FFFFh
jmp     short loc_10006BDE

loc_10006BC6:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+0B8h]

loc_10006BDE:
pop     ebp
retn
RdExternRef endp

; Exported entry 161. SetIntrCode


; Attributes: bp-based frame

public SetIntrCode
SetIntrCode proc near

var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_8], 0FFFFh
mov     [ebp+var_4], 0
movsx   eax, [ebp+arg_4]
and     eax, 0FFh
mov     [ebp+var_4], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    TestFuncStatusAndPtr
add     esp, 4
movsx   edx, ax
test    edx, edx
jz      short loc_10006C23
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10006CC9

loc_10006C23:
movsx   ecx, [ebp+var_4]
cmp     ecx, 1
jnz     short loc_10006C76
mov     edx, [ebp+arg_0]
mov     ax, [ebp+arg_4]
mov     [edx+88h], ax
movsx   ecx, [ebp+arg_8]
cmp     ecx, 1
jl      short loc_10006C6E
movsx   edx, [ebp+arg_8]
cmp     edx, 0FFh
jg      short loc_10006C6E
movsx   eax, [ebp+arg_8]
shl     eax, 8
movsx   ecx, [ebp+var_4]
or      eax, ecx
mov     edx, [ebp+arg_0]
mov     [edx+88h], ax
mov     [ebp+var_8], 0
jmp     short loc_10006C74

loc_10006C6E:
mov     [ebp+var_8], 0FFFDh

loc_10006C74:
jmp     short loc_10006CA3

loc_10006C76:
movsx   eax, [ebp+var_4]
test    eax, eax
jl      short loc_10006C9D
movsx   ecx, [ebp+var_4]
cmp     ecx, 5
jg      short loc_10006C9D
mov     edx, [ebp+arg_0]
mov     ax, [ebp+var_4]
mov     [edx+88h], ax
mov     [ebp+var_8], 0
jmp     short loc_10006CA3

loc_10006C9D:
mov     [ebp+var_8], 0FFFDh

loc_10006CA3:
movsx   ecx, [ebp+var_8]
test    ecx, ecx
jnz     short loc_10006CC5
mov     edx, [ebp+arg_0]
push    edx
call    CommInterrupts
add     esp, 4
movsx   eax, ax
cmp     eax, 41h
jz      short loc_10006CC5
mov     [ebp+var_8], 0FFFEh

loc_10006CC5:
mov     ax, [ebp+var_8]

loc_10006CC9:
mov     esp, ebp
pop     ebp
retn
SetIntrCode endp

; Exported entry  96. RdIntrCode


; Attributes: bp-based frame

public RdIntrCode
RdIntrCode proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006CE9
or      ax, 0FFFFh
jmp     short loc_10006D01

loc_10006CE9:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+88h]

loc_10006D01:
pop     ebp
retn
RdIntrCode endp

; Exported entry  61. IsCalibrated


; Attributes: bp-based frame

public IsCalibrated
IsCalibrated proc near

var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
push    esi
mov     [ebp+var_8], 1
mov     eax, [ebp+arg_0]
mov     ecx, [eax+28h]
push    ecx
call    sub_1000D563
add     esp, 4
mov     [ebp+var_4], eax
mov     edx, [ebp+arg_0]
push    edx
call    TestFuncStatusAndPtr
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_10006D3D
xor     ax, ax
jmp     loc_10006DC9

loc_10006D3D:
mov     ecx, [ebp+arg_0]
cmp     dword ptr [ecx+28h], 0
jz      short loc_10006D89
mov     edx, [ebp+arg_0]
cmp     dword ptr [edx+24h], 0
jnz     short loc_10006D89
mov     eax, [ebp+arg_0]
push    eax
call    RdRBW
add     esp, 4
push    eax
call    DefltSetTimeRBW
add     esp, 4
cmp     [ebp+var_4], eax
jl      short loc_10006D83
mov     ecx, [ebp+arg_0]
push    ecx
call    RdVBW
add     esp, 4
push    eax
call    DefltSetTimeVBW
add     esp, 4
cmp     [ebp+var_4], eax
jge     short loc_10006D89

loc_10006D83:
mov     [ebp+var_8], 0

loc_10006D89:
mov     esi, [ebp+arg_0]
mov     edx, [ebp+arg_0]
push    edx
call    RdRBW
add     esp, 4
push    eax
call    RBWFreqFromCode
add     esp, 4
fdiv    ds:dbl_10016118
fcomp   qword ptr [esi+18h]
fnstsw  ax
test    ah, 1
jz      short loc_10006DB7
mov     [ebp+var_8], 0

loc_10006DB7:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_8]

loc_10006DC9:
pop     esi
mov     esp, ebp
pop     ebp
retn
IsCalibrated endp

; Exported entry  64. IsValidStep


; Attributes: bp-based frame

public IsValidStep
IsValidStep proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
push    esi
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006DEC
or      ax, 0FFFFh
jmp     short loc_10006E20

loc_10006DEC:
mov     esi, [ebp+arg_0]
mov     edx, [ebp+arg_0]
mov     ax, [edx+48h]
push    eax
call    GetRBWwide
add     esp, 4
cdq
mov     ecx, 3
idiv    ecx
mov     [ebp+var_4], eax
fild    [ebp+var_4]
fcomp   qword ptr [esi+18h]
fnstsw  ax
test    ah, 1
jz      short loc_10006E1C
xor     ax, ax
jmp     short loc_10006E20

loc_10006E1C:
mov     ax, 1

loc_10006E20:
pop     esi
mov     esp, ebp
pop     ebp
retn
IsValidStep endp

; Exported entry  62. IsSweeping


; Attributes: bp-based frame

public IsSweeping
IsSweeping proc near

var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006E43
xor     ax, ax
jmp     short loc_10006E73

loc_10006E43:
mov     edx, [ebp+arg_0]
mov     ax, [edx+4]
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
and     ecx, 80h
test    ecx, ecx
jz      short loc_10006E69
movsx   edx, [ebp+var_4]
and     dl, 7Fh
mov     [ebp+var_8], dx
jmp     short loc_10006E6F

loc_10006E69:
mov     [ebp+var_8], 0

loc_10006E6F:
mov     ax, [ebp+var_8]

loc_10006E73:
mov     esp, ebp
pop     ebp
retn
IsSweeping endp

; Exported entry 137. Recouple


; Attributes: bp-based frame

public Recouple
Recouple proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006EA2
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006ECA

loc_10006EA2:
mov     eax, [ebp+arg_0]
mov     word ptr [eax+20h], 1
mov     ecx, [ebp+arg_0]
mov     word ptr [ecx+22h], 1
mov     edx, [ebp+arg_0]
mov     word ptr [edx+4Ah], 1
mov     eax, [ebp+arg_0]
mov     word ptr [eax+4Eh], 1
mov     ax, [ebp+var_4]

loc_10006ECA:
mov     esp, ebp
pop     ebp
retn
Recouple endp

; Exported entry 168. SetPortNum


; Attributes: bp-based frame

public SetPortNum
SetPortNum proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006EFC
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10006FA6

loc_10006EFC:
mov     eax, [ebp+arg_4]
and     eax, 0FFFFh
cmp     eax, 100h
jl      short loc_10006F4C
mov     ecx, [ebp+arg_4]
and     ecx, 0FFFFh
cmp     ecx, 170h
jg      short loc_10006F4C
mov     edx, [ebp+arg_4]
and     edx, 0FFFFh
and     edx, 8000000Fh
jns     short loc_10006F32
dec     edx
or      edx, 0FFFFFFF0h
inc     edx

loc_10006F32:
test    edx, edx
jnz     short loc_10006F4C
mov     eax, [ebp+arg_0]
mov     cx, word ptr [ebp+arg_4]
mov     [eax+1D8h], cx
mov     [ebp+var_4], 0
jmp     short loc_10006FA2

loc_10006F4C:
mov     edx, [ebp+arg_4]
and     edx, 0FFFFh
cmp     edx, 300h
jl      short loc_10006F9C
mov     eax, [ebp+arg_4]
and     eax, 0FFFFh
cmp     eax, 370h
jg      short loc_10006F9C
mov     ecx, [ebp+arg_4]
and     ecx, 0FFFFh
and     ecx, 8000000Fh
jns     short loc_10006F82
dec     ecx
or      ecx, 0FFFFFFF0h
inc     ecx

loc_10006F82:
test    ecx, ecx
jnz     short loc_10006F9C
mov     edx, [ebp+arg_0]
mov     ax, word ptr [ebp+arg_4]
mov     [edx+1D8h], ax
mov     [ebp+var_4], 0
jmp     short loc_10006FA2

loc_10006F9C:
mov     [ebp+var_4], 0FFFDh

loc_10006FA2:
mov     ax, [ebp+var_4]

loc_10006FA6:
mov     esp, ebp
pop     ebp
retn
SetPortNum endp

; Exported entry 165. SetLogAddr


; Attributes: bp-based frame

public SetLogAddr
SetLogAddr proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10006FCE
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10006FFA

loc_10006FCE:
movsx   eax, [ebp+arg_4]
cmp     eax, 1
jl      short loc_10006FE3
movsx   ecx, [ebp+arg_4]
cmp     ecx, 0FEh
jle     short loc_10006FE9

loc_10006FE3:
mov     ax, 0FFFDh
jmp     short loc_10006FFA

loc_10006FE9:
mov     edx, [ebp+arg_0]
mov     ax, [ebp+arg_4]
mov     [edx+1DCh], ax
xor     ax, ax

loc_10006FFA:
pop     ebp
retn
SetLogAddr endp

; Exported entry 108. RdPortNum


; Attributes: bp-based frame

public RdPortNum
RdPortNum proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007018
or      ax, 0FFFFh
jmp     short loc_10007030

loc_10007018:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+1D8h]

loc_10007030:
pop     ebp
retn
RdPortNum endp

; Exported entry 100. RdLogAddr


; Attributes: bp-based frame

public RdLogAddr
RdLogAddr proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000704E
or      ax, 0FFFFh
jmp     short loc_10007066

loc_1000704E:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+1DCh]

loc_10007066:
pop     ebp
retn
RdLogAddr endp

; Exported entry 162. SetIrqNum


; Attributes: bp-based frame

public SetIrqNum
SetIrqNum proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007093
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100070F7

loc_10007093:
mov     eax, [ebp+arg_4]
and     eax, 0FFFFh
cmp     eax, 5
jz      short loc_100070C9
mov     ecx, [ebp+arg_4]
and     ecx, 0FFFFh
cmp     ecx, 0Ah
jz      short loc_100070C9
mov     edx, [ebp+arg_4]
and     edx, 0FFFFh
cmp     edx, 0Bh
jz      short loc_100070C9
mov     eax, [ebp+arg_4]
and     eax, 0FFFFh
cmp     eax, 0Ch
jnz     short loc_100070ED

loc_100070C9:
mov     ecx, [ebp+arg_0]
mov     dx, word ptr [ebp+arg_4]
mov     [ecx+1DAh], dx
mov     [ebp+var_4], 0
push    2
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_100070F3

loc_100070ED:
mov     [ebp+var_4], 0FFFDh

loc_100070F3:
mov     ax, [ebp+var_4]

loc_100070F7:
mov     esp, ebp
pop     ebp
retn
SetIrqNum endp

; Exported entry  97. RdIrqNum


; Attributes: bp-based frame

public RdIrqNum
RdIrqNum proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007116
xor     ax, ax
jmp     short loc_1000712E

loc_10007116:
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+1DAh]

loc_1000712E:
pop     ebp
retn
RdIrqNum endp

push    ebp
mov     ebp, esp
push    ecx
push    esi
mov     dword ptr [ebp-4], 0
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007157
or      eax, 0FFFFFFFFh
jmp     loc_100071EA

loc_10007157:
push    0
mov     edx, [ebp+8]
push    edx
call    SetFuncStatusCode
add     esp, 8
cmp     dword ptr [ebp+0Ch], 0
jl      short loc_1000717C
mov     eax, [ebp+8]
push    eax
call    RdNumSwpPts
add     esp, 4
cmp     [ebp+0Ch], eax
jle     short loc_10007193

loc_1000717C:
push    0FFFFFFFDh
mov     ecx, [ebp+8]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     dword ptr [ebp-4], 0FFFFFFFFh
jmp     short loc_100071E7

loc_10007193:
mov     edx, [ebp+8]
push    edx
call    sub_10004FCF
add     esp, 4
mov     esi, [ebp+0Ch]
imul    esi, eax
mov     eax, [ebp+8]
push    eax
call    sub_100085F3
add     esp, 4
add     esi, eax
mov     [ebp-4], esi
fild    dword ptr [ebp-4]
sub     esp, 8
fstp    qword ptr [esp]
mov     ecx, [ebp+8]
push    ecx
call    FreqInRange
add     esp, 0Ch
movsx   edx, ax
test    edx, edx
jnz     short loc_100071E7
push    0FFFFFFFFh
mov     eax, [ebp+8]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     dword ptr [ebp-4], 0FFFFFFFFh

loc_100071E7:
mov     eax, [ebp-4]

loc_100071EA:
pop     esi
mov     esp, ebp
pop     ebp
retn
push    ebp
mov     ebp, esp
push    ecx
mov     dword ptr [ebp-4], 0FFFFFFFFh
push    0
mov     eax, [ebp+8]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ecx, [ebp+8]
push    ecx
call    TestFuncStatusAndPtr
add     esp, 4
movsx   edx, ax
test    edx, edx
jz      short loc_10007223
or      eax, 0FFFFFFFFh
jmp     loc_100072BD

loc_10007223:
cmp     dword ptr [ebp+0Ch], 0
jl      short loc_1000723A
mov     eax, [ebp+8]
push    eax
call    RdNumSwpPts
add     esp, 4
cmp     [ebp+0Ch], eax
jle     short loc_10007251

loc_1000723A:
mov     dword ptr [ebp-4], 0FFFFFFFFh
push    0FFFFFFFFh
mov     ecx, [ebp+8]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_100072BA

loc_10007251:
movsx   edx, word ptr [ebp+10h]
cmp     edx, 2
jnz     short loc_1000726E
cmp     dword ptr [ebp+14h], 0
jz      short loc_1000726E
mov     eax, [ebp+0Ch]
mov     ecx, [ebp+14h]
mov     edx, [ecx+eax*4]
mov     [ebp-4], edx
jmp     short loc_10007289

loc_1000726E:
movsx   eax, word ptr [ebp+10h]
cmp     eax, 4
jnz     short loc_10007289
cmp     dword ptr [ebp+18h], 0
jz      short loc_10007289
mov     ecx, [ebp+0Ch]
mov     edx, [ebp+18h]
mov     eax, [edx+ecx*4]
mov     [ebp-4], eax

loc_10007289:
fild    dword ptr [ebp-4]
sub     esp, 8
fstp    qword ptr [esp]
mov     ecx, [ebp+8]
push    ecx
call    FreqInRange
add     esp, 0Ch
movsx   edx, ax
test    edx, edx
jnz     short loc_100072BA
push    0FFFFFFFFh
mov     eax, [ebp+8]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     dword ptr [ebp-4], 0FFFFFFFFh

loc_100072BA:
mov     eax, [ebp-4]

loc_100072BD:
mov     esp, ebp
pop     ebp
retn
; Exported entry  24. FindHighPeak


; Attributes: bp-based frame

public FindHighPeak
FindHighPeak proc near

var_C= word ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
cmp     [ebp+arg_0], 0
jz      short loc_100072D3
cmp     [ebp+arg_4], 0
jg      short loc_100072D8

loc_100072D3:
or      eax, 0FFFFFFFFh
jmp     short loc_10007332

loc_100072D8:
mov     [ebp+var_8], 0
mov     eax, [ebp+var_8]
mov     ecx, [ebp+arg_0]
mov     dx, [ecx+eax*2]
mov     [ebp+var_C], dx
mov     [ebp+var_4], 1
jmp     short loc_100072FF

loc_100072F6:
mov     eax, [ebp+var_4]
add     eax, 1
mov     [ebp+var_4], eax

loc_100072FF:
mov     ecx, [ebp+var_4]
cmp     ecx, [ebp+arg_4]
jge     short loc_1000732F
mov     edx, [ebp+var_4]
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+edx*2]
movsx   edx, [ebp+var_C]
cmp     ecx, edx
jl      short loc_1000732D
mov     eax, [ebp+var_4]
mov     ecx, [ebp+arg_0]
mov     dx, [ecx+eax*2]
mov     [ebp+var_C], dx
mov     eax, [ebp+var_4]
mov     [ebp+var_8], eax

loc_1000732D:
jmp     short loc_100072F6

loc_1000732F:
mov     eax, [ebp+var_8]

loc_10007332:
mov     esp, ebp
pop     ebp
retn
FindHighPeak endp

; Exported entry  26. FindNextPeak


; Attributes: bp-based frame

public FindNextPeak
FindNextPeak proc near

var_C= dword ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= word ptr  14h
arg_10= word ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     [ebp+var_4], 0
mov     eax, [ebp+arg_4]
sub     eax, 1
mov     [ebp+var_C], eax
cmp     [ebp+arg_0], 0
jz      short loc_10007366
cmp     [ebp+arg_4], 0
jle     short loc_10007366
cmp     [ebp+arg_8], 0
jl      short loc_10007366
mov     ecx, [ebp+arg_8]
cmp     ecx, [ebp+arg_4]
jl      short loc_1000736E

loc_10007366:
or      eax, 0FFFFFFFFh
jmp     loc_100074B3

loc_1000736E:
movsx   edx, [ebp+arg_C]
test    edx, edx
jnz     loc_1000740F
mov     eax, [ebp+arg_8]
sub     eax, 1
mov     [ebp+var_4], eax
jmp     short loc_1000738E

loc_10007385:
mov     ecx, [ebp+var_4]
sub     ecx, 1
mov     [ebp+var_4], ecx

loc_1000738E:
cmp     [ebp+var_4], 0
jle     short loc_100073DE
mov     edx, [ebp+var_4]
mov     eax, [ebp+arg_0]
mov     cx, [eax+edx*2]
mov     [ebp+var_8], cx
movsx   edx, [ebp+var_8]
movsx   eax, [ebp+arg_10]
cmp     edx, eax
jl      short loc_100073DC
movsx   ecx, [ebp+var_8]
mov     edx, [ebp+var_4]
mov     eax, [ebp+arg_0]
movsx   edx, word ptr [eax+edx*2-2]
cmp     ecx, edx
jl      short loc_100073DC
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+var_4]
mov     edx, [ebp+arg_0]
movsx   ecx, word ptr [edx+ecx*2+2]
cmp     eax, ecx
jl      short loc_100073DC
mov     eax, [ebp+var_4]
jmp     loc_100074B3

loc_100073DC:
jmp     short loc_10007385

loc_100073DE:
mov     edx, [ebp+arg_0]
mov     ax, [edx]
mov     [ebp+var_8], ax
movsx   ecx, [ebp+var_8]
movsx   edx, [ebp+arg_10]
cmp     ecx, edx
jle     short loc_1000740A
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+2]
cmp     eax, edx
jl      short loc_1000740A
xor     eax, eax
jmp     loc_100074B3

loc_1000740A:
jmp     loc_100074B0

loc_1000740F:
mov     eax, [ebp+arg_8]
add     eax, 1
mov     [ebp+var_4], eax
jmp     short loc_10007423

loc_1000741A:
mov     ecx, [ebp+var_4]
add     ecx, 1
mov     [ebp+var_4], ecx

loc_10007423:
mov     edx, [ebp+var_4]
cmp     edx, [ebp+var_C]
jge     short loc_1000747E
mov     eax, [ebp+var_4]
mov     ecx, [ebp+arg_0]
mov     dx, [ecx+eax*2]
mov     [ebp+var_8], dx
movsx   eax, [ebp+var_8]
movsx   ecx, [ebp+arg_10]
cmp     eax, ecx
jl      short loc_1000747C
mov     edx, [ebp+var_4]
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+edx*2]
mov     edx, [ebp+var_4]
mov     eax, [ebp+arg_0]
movsx   edx, word ptr [eax+edx*2-2]
cmp     ecx, edx
jl      short loc_1000747C
mov     eax, [ebp+var_4]
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+eax*2]
mov     eax, [ebp+var_4]
mov     ecx, [ebp+arg_0]
movsx   eax, word ptr [ecx+eax*2+2]
cmp     edx, eax
jl      short loc_1000747C
mov     eax, [ebp+var_4]
jmp     short loc_100074B3

loc_1000747C:
jmp     short loc_1000741A

loc_1000747E:
mov     ecx, [ebp+var_C]
mov     edx, [ebp+arg_0]
mov     ax, [edx+ecx*2]
mov     [ebp+var_8], ax
movsx   ecx, [ebp+var_8]
movsx   edx, [ebp+arg_10]
cmp     ecx, edx
jle     short loc_100074B0
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+var_C]
mov     edx, [ebp+arg_0]
movsx   ecx, word ptr [edx+ecx*2-2]
cmp     eax, ecx
jl      short loc_100074B0
mov     eax, [ebp+var_C]
jmp     short loc_100074B3

loc_100074B0:
or      eax, 0FFFFFFFFh

loc_100074B3:
mov     esp, ebp
pop     ebp
retn
FindNextPeak endp

; Exported entry  46. GetTraceData


; Attributes: bp-based frame

public GetTraceData
GetTraceData proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+arg_8], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100074E3
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000752C

loc_100074E3:
mov     eax, [ebp+arg_C]
mov     ecx, [eax]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetSwpIdx
add     esp, 8
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    GetAmplData
add     esp, 8
mov     [ebp+var_4], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdSwpIdx
add     esp, 4
mov     ecx, [ebp+arg_C]
mov     [ecx], eax
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_1000752C:
mov     esp, ebp
pop     ebp
retn
GetTraceData endp

; Exported entry  29. GetAmplData


; Attributes: bp-based frame

public GetAmplData
GetAmplData proc near

var_2C= dword ptr -2Ch
var_28= word ptr -28h
var_24= word ptr -24h
var_20= dword ptr -20h
var_1C= word ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= word ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 2Ch
mov     [ebp+var_14], 1
mov     [ebp+var_8], 0
mov     [ebp+var_28], 0
mov     [ebp+var_1C], 0
mov     [ebp+var_C], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007579
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10007770

loc_10007579:
mov     eax, [ebp+arg_0]
push    eax
call    IsSweeping
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000759F
push    0FFFFFFF2h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007770

loc_1000759F:
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
test    ecx, ecx
jge     short loc_100075C0
mov     ax, [ebp+var_24]
jmp     loc_10007770

loc_100075C0:
mov     edx, [ebp+arg_0]
push    edx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_18], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
test    ecx, ecx
jge     short loc_100075F0
mov     ax, [ebp+var_24]
jmp     loc_10007770

loc_100075F0:
mov     edx, [ebp+arg_0]
push    edx
call    RdNumDataPts
add     esp, 4
mov     [ebp+var_10], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
test    ecx, ecx
jge     short loc_10007620
mov     ax, [ebp+var_24]
jmp     loc_10007770

loc_10007620:
mov     edx, [ebp+var_18]
cmp     edx, [ebp+var_10]
jnz     short loc_1000763B
push    4
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007770

loc_1000763B:
mov     ecx, [ebp+var_18]
cmp     ecx, [ebp+var_10]
jle     short loc_10007656
push    0FFFFFFFEh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007770

loc_10007656:
mov     eax, [ebp+var_18]
mov     ecx, [ebp+arg_4]
lea     edx, [ecx+eax*2]
mov     [ebp+var_2C], edx
lea     eax, [ebp+var_1C]
push    eax
lea     ecx, [ebp+var_20]
push    ecx
mov     edx, [ebp+var_14]
push    edx
mov     eax, [ebp+var_10]
sub     eax, [ebp+var_18]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100040C9
add     esp, 14h
movsx   edx, ax
test    edx, edx
jz      short loc_10007691
or      ax, 0FFFFh
jmp     loc_10007770

loc_10007691:
cmp     [ebp+var_20], 0
jnz     short loc_1000769F
xor     ax, ax
jmp     loc_10007770

loc_1000769F:
mov     [ebp+var_4], 0
jmp     short loc_100076B1

loc_100076A8:
mov     eax, [ebp+var_4]
add     eax, 1
mov     [ebp+var_4], eax

loc_100076B1:
mov     ecx, [ebp+var_4]
cmp     ecx, [ebp+var_20]
jge     short loc_10007725
mov     [ebp+var_8], 0
jmp     short loc_100076CD

loc_100076C1:
mov     dx, [ebp+var_8]
add     dx, 1
mov     [ebp+var_8], dx

loc_100076CD:
movsx   eax, [ebp+var_8]
cmp     eax, 3
jge     short loc_1000770C
mov     cx, [ebp+var_1C]
mov     [ebp+var_C], cx
lea     edx, [ebp+var_C]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     ecx, [ebp+var_4]
mov     edx, [ebp+var_2C]
mov     [edx+ecx*2], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000770A
jmp     short loc_1000770C

loc_1000770A:
jmp     short loc_100076C1

loc_1000770C:
movsx   ecx, [ebp+var_8]
cmp     ecx, 3
jnz     short loc_1000771B
or      ax, 0FFFFh
jmp     short loc_10007770

loc_1000771B:
mov     dx, [ebp+var_C]
mov     [ebp+var_1C], dx
jmp     short loc_100076A8

loc_10007725:
mov     ax, [ebp+var_1C]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10003BB8
add     esp, 8
mov     [ebp+var_28], ax
movsx   edx, [ebp+var_28]
test    edx, edx
jz      short loc_10007748
or      ax, 0FFFFh
jmp     short loc_10007770

loc_10007748:
mov     eax, [ebp+var_18]
add     eax, [ebp+var_20]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_28], ax
movsx   edx, [ebp+var_28]
test    edx, edx
jz      short loc_1000776D
or      ax, 0FFFFh
jmp     short loc_10007770

loc_1000776D:
xor     ax, ax

loc_10007770:
mov     esp, ebp
pop     ebp
retn
GetAmplData endp



; Attributes: bp-based frame

sub_10007774 proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+arg_C], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100077A0
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100077ED

loc_100077A0:
mov     eax, [ebp+arg_10]
mov     ecx, [eax]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetSwpIdx
add     esp, 8
mov     eax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    GetMinMaxAmpl
add     esp, 0Ch
mov     [ebp+var_4], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdSwpIdx
add     esp, 4
mov     ecx, [ebp+arg_10]
mov     [ecx], eax
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_100077ED:
mov     esp, ebp
pop     ebp
retn
sub_10007774 endp

; Exported entry  41. GetMinMaxAmpl


; Attributes: bp-based frame

public GetMinMaxAmpl
GetMinMaxAmpl proc near

var_34= dword ptr -34h
var_30= dword ptr -30h
var_2C= word ptr -2Ch
var_28= word ptr -28h
var_24= word ptr -24h
var_20= dword ptr -20h
var_1C= word ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= word ptr -0Ch
var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 34h
mov     [ebp+var_14], 2
mov     [ebp+var_8], 0
mov     [ebp+var_28], 0
mov     [ebp+var_1C], 0
mov     [ebp+var_C], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000783A
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10007AE4

loc_1000783A:
mov     eax, [ebp+arg_0]
push    eax
call    IsSweeping
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_10007860
push    0FFFFFFF2h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007AE4

loc_10007860:
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
test    ecx, ecx
jge     short loc_10007881
mov     ax, [ebp+var_24]
jmp     loc_10007AE4

loc_10007881:
mov     edx, [ebp+arg_0]
push    edx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_18], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
test    ecx, ecx
jge     short loc_100078B1
mov     ax, [ebp+var_24]
jmp     loc_10007AE4

loc_100078B1:
mov     edx, [ebp+arg_0]
push    edx
call    RdNumDataPts
add     esp, 4
mov     [ebp+var_10], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_24]
test    ecx, ecx
jge     short loc_100078E1
mov     ax, [ebp+var_24]
jmp     loc_10007AE4

loc_100078E1:
mov     edx, [ebp+var_18]
cmp     edx, [ebp+var_10]
jnz     short loc_100078FC
push    4
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007AE4

loc_100078FC:
mov     ecx, [ebp+var_18]
cmp     ecx, [ebp+var_10]
jle     short loc_10007917
push    0FFFFFFFEh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007AE4

loc_10007917:
mov     eax, [ebp+var_18]
mov     ecx, [ebp+arg_4]
lea     edx, [ecx+eax*2]
mov     [ebp+var_30], edx
mov     eax, [ebp+var_18]
mov     ecx, [ebp+arg_8]
lea     edx, [ecx+eax*2]
mov     [ebp+var_34], edx
lea     eax, [ebp+var_1C]
push    eax
lea     ecx, [ebp+var_20]
push    ecx
mov     edx, [ebp+var_14]
push    edx
mov     eax, [ebp+var_10]
sub     eax, [ebp+var_18]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100040C9
add     esp, 14h
movsx   edx, ax
test    edx, edx
jz      short loc_1000795E
or      ax, 0FFFFh
jmp     loc_10007AE4

loc_1000795E:
cmp     [ebp+var_20], 0
jnz     short loc_1000796C
xor     ax, ax
jmp     loc_10007AE4

loc_1000796C:
mov     [ebp+var_4], 0
jmp     short loc_10007980

loc_10007974:
mov     ax, [ebp+var_4]
add     ax, 1
mov     [ebp+var_4], ax

loc_10007980:
movsx   ecx, [ebp+var_4]
cmp     ecx, [ebp+var_20]
jge     loc_10007AA3
mov     dx, [ebp+var_1C]
mov     [ebp+var_C], dx
mov     [ebp+var_8], 0
jmp     short loc_100079A9

loc_1000799D:
mov     ax, [ebp+var_8]
add     ax, 1
mov     [ebp+var_8], ax

loc_100079A9:
movsx   ecx, [ebp+var_8]
cmp     ecx, 3
jge     short loc_100079E2
mov     dx, [ebp+var_1C]
mov     [ebp+var_C], dx
lea     eax, [ebp+var_C]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100039D0
add     esp, 8
mov     [ebp+var_2C], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_100079E0
jmp     short loc_100079E2

loc_100079E0:
jmp     short loc_1000799D

loc_100079E2:
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_100079F7
jmp     loc_10007AA3

loc_100079F7:
mov     cx, [ebp+var_C]
mov     [ebp+var_1C], cx
movsx   edx, [ebp+var_4]
mov     eax, [ebp+var_30]
mov     cx, [ebp+var_2C]
mov     [eax+edx*2], cx
mov     [ebp+var_8], 0
jmp     short loc_10007A22

loc_10007A16:
mov     dx, [ebp+var_8]
add     dx, 1
mov     [ebp+var_8], dx

loc_10007A22:
movsx   eax, [ebp+var_8]
cmp     eax, 3
jge     short loc_10007A5B
mov     cx, [ebp+var_1C]
mov     [ebp+var_C], cx
lea     edx, [ebp+var_C]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     [ebp+var_2C], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_10007A59
jmp     short loc_10007A5B

loc_10007A59:
jmp     short loc_10007A16

loc_10007A5B:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10007A6D
jmp     short loc_10007AA3

loc_10007A6D:
mov     ax, [ebp+var_C]
mov     [ebp+var_1C], ax
movsx   ecx, [ebp+var_4]
mov     edx, [ebp+var_34]
mov     ax, [ebp+var_2C]
mov     [edx+ecx*2], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10007A96
jmp     short loc_10007AA3

loc_10007A96:
mov     dx, [ebp+var_C]
mov     [ebp+var_1C], dx
jmp     loc_10007974

loc_10007AA3:
mov     ax, [ebp+var_1C]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10003BB8
add     esp, 8
mov     [ebp+var_28], ax
movsx   edx, [ebp+var_28]
test    edx, edx
jnz     short loc_10007AE0
mov     eax, [ebp+var_18]
add     eax, [ebp+var_20]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    SetSwpIdx
add     esp, 8
movsx   edx, ax
test    edx, edx
jz      short loc_10007AE0
or      ax, 0FFFFh
jmp     short loc_10007AE4

loc_10007AE0:
mov     ax, [ebp+var_28]

loc_10007AE4:
mov     esp, ebp
pop     ebp
retn
GetMinMaxAmpl endp



; Attributes: bp-based frame

sub_10007AE8 proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+arg_C], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007B14
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10007B61

loc_10007B14:
mov     eax, [ebp+arg_10]
mov     ecx, [eax]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetSwpIdx
add     esp, 8
mov     eax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10007B65
add     esp, 0Ch
mov     [ebp+var_4], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdSwpIdx
add     esp, 4
mov     ecx, [ebp+arg_10]
mov     [ecx], eax
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_10007B61:
mov     esp, ebp
pop     ebp
retn
sub_10007AE8 endp



; Attributes: bp-based frame

sub_10007B65 proc near

var_3C= dword ptr -3Ch
var_38= dword ptr -38h
var_34= word ptr -34h
var_30= word ptr -30h
var_2C= word ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= word ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= word ptr -10h
var_C= word ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 3Ch
mov     [ebp+var_18], 3
mov     [ebp+var_C], 0
mov     [ebp+var_30], 0
mov     [ebp+var_10], 0
mov     [ebp+var_20], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007BAE
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10007F03

loc_10007BAE:
mov     eax, [ebp+arg_0]
push    eax
call    IsSweeping
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_10007BD4
push    0FFFFFFF2h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007F03

loc_10007BD4:
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_2C], ax
movsx   ecx, [ebp+var_2C]
test    ecx, ecx
jge     short loc_10007BF5
mov     ax, [ebp+var_2C]
jmp     loc_10007F03

loc_10007BF5:
mov     edx, [ebp+arg_0]
push    edx
call    RdMaxFreqLimit
add     esp, 4
fcomp   ds:dbl_10016100
fnstsw  ax
test    ah, 40h
jz      short loc_10007C17
mov     ax, 0FFFEh
jmp     loc_10007F03

loc_10007C17:
mov     eax, [ebp+arg_0]
push    eax
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_1C], eax
mov     ecx, [ebp+arg_0]
push    ecx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_2C], ax
movsx   edx, [ebp+var_2C]
test    edx, edx
jge     short loc_10007C47
mov     ax, [ebp+var_2C]
jmp     loc_10007F03

loc_10007C47:
mov     eax, [ebp+arg_0]
push    eax
call    RdNumSwpPts
add     esp, 4
mov     [ebp+var_14], eax
mov     ecx, [ebp+arg_0]
push    ecx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_2C], ax
movsx   edx, [ebp+var_2C]
test    edx, edx
jge     short loc_10007C77
mov     ax, [ebp+var_2C]
jmp     loc_10007F03

loc_10007C77:
mov     eax, [ebp+var_1C]
cmp     eax, [ebp+var_14]
jnz     short loc_10007C92
push    4
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007F03

loc_10007C92:
mov     edx, [ebp+var_1C]
cmp     edx, [ebp+var_14]
jle     short loc_10007CAD
push    0FFFFFFFEh
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10007F03

loc_10007CAD:
mov     ecx, [ebp+var_1C]
mov     edx, [ebp+arg_4]
lea     eax, [edx+ecx*2]
mov     [ebp+var_3C], eax
mov     ecx, [ebp+var_1C]
mov     edx, [ebp+arg_8]
lea     eax, [edx+ecx*4]
mov     [ebp+var_28], eax
mov     ecx, [ebp+var_1C]
cmp     ecx, [ebp+var_14]
jl      short loc_10007CD6
mov     ax, 0FFFEh
jmp     loc_10007F03

loc_10007CD6:
lea     edx, [ebp+var_20]
push    edx
lea     eax, [ebp+var_24]
push    eax
mov     ecx, [ebp+var_18]
push    ecx
mov     edx, [ebp+var_14]
sub     edx, [ebp+var_1C]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100040C9
add     esp, 14h
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007D05
mov     ax, 0FFFEh
jmp     loc_10007F03

loc_10007D05:
cmp     [ebp+var_24], 0
jnz     short loc_10007D13
xor     ax, ax
jmp     loc_10007F03

loc_10007D13:
mov     dx, [ebp+var_20]
mov     [ebp+var_10], dx
mov     [ebp+var_8], 0
jmp     short loc_10007D2D

loc_10007D24:
mov     eax, [ebp+var_8]
add     eax, 1
mov     [ebp+var_8], eax

loc_10007D2D:
mov     ecx, [ebp+var_8]
cmp     ecx, [ebp+var_24]
jge     loc_10007EBD
mov     [ebp+var_C], 0
jmp     short loc_10007D4D

loc_10007D41:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_10007D4D:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_10007D86
mov     cx, [ebp+var_20]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     [ebp+var_34], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_10007D84
jmp     short loc_10007D86

loc_10007D84:
jmp     short loc_10007D41

loc_10007D86:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10007D9B
jmp     loc_10007EBD

loc_10007D9B:
mov     ax, [ebp+var_10]
mov     [ebp+var_20], ax
mov     ecx, [ebp+var_8]
mov     edx, [ebp+var_3C]
mov     ax, [ebp+var_34]
mov     [edx+ecx*2], ax
mov     [ebp+var_C], 0
jmp     short loc_10007DC5

loc_10007DB9:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_10007DC5:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_10007DFE
mov     ax, [ebp+var_20]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     [ebp+var_34], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_10007DFC
jmp     short loc_10007DFE

loc_10007DFC:
jmp     short loc_10007DB9

loc_10007DFE:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10007E13
jmp     loc_10007EBD

loc_10007E13:
mov     dx, [ebp+var_10]
mov     [ebp+var_20], dx
mov     ax, [ebp+var_34]
mov     word ptr [ebp+var_38], ax
mov     [ebp+var_C], 0
jmp     short loc_10007E37

loc_10007E2B:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_10007E37:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_10007E70
mov     ax, [ebp+var_20]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     [ebp+var_34], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_10007E6E
jmp     short loc_10007E70

loc_10007E6E:
jmp     short loc_10007E2B

loc_10007E70:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10007E82
jmp     short loc_10007EBD

loc_10007E82:
mov     dx, [ebp+var_10]
mov     [ebp+var_20], dx
mov     ax, [ebp+var_34]
mov     word ptr [ebp+var_4], ax
mov     ecx, [ebp+var_38]
and     ecx, 0FFFFh
and     ecx, 0FFFFh
mov     edx, [ebp+var_4]
and     edx, 0FFFFh
shl     edx, 10h
add     ecx, edx
mov     eax, [ebp+var_8]
mov     edx, [ebp+var_28]
mov     [edx+eax*4], ecx
jmp     loc_10007D24

loc_10007EBD:
mov     ax, [ebp+var_10]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10003BB8
add     esp, 8
mov     [ebp+var_30], ax
movsx   edx, [ebp+var_30]
test    edx, edx
jnz     short loc_10007EF1
mov     eax, [ebp+var_1C]
add     eax, [ebp+var_24]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_30], ax

loc_10007EF1:
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_30]

loc_10007F03:
mov     esp, ebp
pop     ebp
retn
sub_10007B65 endp



; Attributes: bp-based frame

sub_10007F07 proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h
arg_14= dword ptr  1Ch
arg_18= dword ptr  20h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+arg_14], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007F33
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10007F88

loc_10007F33:
mov     eax, [ebp+arg_18]
mov     ecx, [eax]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetSwpIdx
add     esp, 8
mov     eax, [ebp+arg_10]
push    eax
mov     ecx, [ebp+arg_C]
push    ecx
mov     edx, [ebp+arg_8]
push    edx
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10007F8C
add     esp, 14h
mov     [ebp+var_4], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdSwpIdx
add     esp, 4
mov     ecx, [ebp+arg_18]
mov     [ecx], eax
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_10007F88:
mov     esp, ebp
pop     ebp
retn
sub_10007F07 endp



; Attributes: bp-based frame

sub_10007F8C proc near

var_44= dword ptr -44h
var_40= dword ptr -40h
var_3C= dword ptr -3Ch
var_38= dword ptr -38h
var_34= word ptr -34h
var_30= dword ptr -30h
var_2C= word ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= word ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= word ptr -10h
var_C= word ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 44h
mov     [ebp+var_18], 6
mov     [ebp+var_C], 0
mov     [ebp+var_34], 0
mov     [ebp+var_10], 0
mov     [ebp+var_20], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10007FD5
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10008474

loc_10007FD5:
mov     eax, [ebp+arg_0]
push    eax
call    IsSweeping
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_10007FFB
push    0FFFFFFF2h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10008474

loc_10007FFB:
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_2C], ax
movsx   ecx, [ebp+var_2C]
test    ecx, ecx
jge     short loc_1000801C
mov     ax, [ebp+var_2C]
jmp     loc_10008474

loc_1000801C:
mov     edx, [ebp+arg_0]
push    edx
call    RdMaxFreqLimit
add     esp, 4
fcomp   ds:dbl_10016100
fnstsw  ax
test    ah, 40h
jz      short loc_1000803E
mov     ax, 0FFFEh
jmp     loc_10008474

loc_1000803E:
mov     eax, [ebp+arg_0]
push    eax
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_1C], eax
mov     ecx, [ebp+arg_0]
push    ecx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_2C], ax
movsx   edx, [ebp+var_2C]
test    edx, edx
jge     short loc_1000806E
mov     ax, [ebp+var_2C]
jmp     loc_10008474

loc_1000806E:
mov     eax, [ebp+arg_0]
push    eax
call    RdNumSwpPts
add     esp, 4
mov     [ebp+var_14], eax
mov     ecx, [ebp+arg_0]
push    ecx
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_2C], ax
movsx   edx, [ebp+var_2C]
test    edx, edx
jge     short loc_1000809E
mov     ax, [ebp+var_2C]
jmp     loc_10008474

loc_1000809E:
mov     eax, [ebp+var_1C]
cmp     eax, [ebp+var_14]
jnz     short loc_100080B9
push    4
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10008474

loc_100080B9:
mov     edx, [ebp+var_1C]
cmp     edx, [ebp+var_14]
jle     short loc_100080D4
push    0FFFFFFFEh
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_10008474

loc_100080D4:
mov     ecx, [ebp+var_1C]
mov     edx, [ebp+arg_4]
lea     eax, [edx+ecx*2]
mov     [ebp+var_40], eax
mov     ecx, [ebp+var_1C]
mov     edx, [ebp+arg_8]
lea     eax, [edx+ecx*2]
mov     [ebp+var_44], eax
mov     ecx, [ebp+var_1C]
mov     edx, [ebp+arg_C]
lea     eax, [edx+ecx*4]
mov     [ebp+var_28], eax
mov     ecx, [ebp+var_1C]
mov     edx, [ebp+arg_10]
lea     eax, [edx+ecx*4]
mov     [ebp+var_30], eax
lea     ecx, [ebp+var_20]
push    ecx
lea     edx, [ebp+var_24]
push    edx
mov     eax, [ebp+var_18]
push    eax
mov     ecx, [ebp+var_14]
sub     ecx, [ebp+var_1C]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100040C9
add     esp, 14h
movsx   eax, ax
test    eax, eax
jz      short loc_10008133
mov     ax, 0FFFEh
jmp     loc_10008474

loc_10008133:
cmp     [ebp+var_24], 0
jnz     short loc_10008141
xor     ax, ax
jmp     loc_10008474

loc_10008141:
mov     cx, [ebp+var_20]
mov     [ebp+var_10], cx
mov     [ebp+var_8], 0
jmp     short loc_1000815B

loc_10008152:
mov     edx, [ebp+var_8]
add     edx, 1
mov     [ebp+var_8], edx

loc_1000815B:
mov     eax, [ebp+var_8]
cmp     eax, [ebp+var_24]
jge     loc_10008462
mov     [ebp+var_C], 0
jmp     short loc_1000817B

loc_1000816F:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_1000817B:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_100081B4
mov     ax, [ebp+var_20]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_100081B2
jmp     short loc_100081B4

loc_100081B2:
jmp     short loc_1000816F

loc_100081B4:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_100081C9
jmp     loc_10008462

loc_100081C9:
mov     dx, [ebp+var_10]
mov     [ebp+var_20], dx
mov     eax, [ebp+var_8]
mov     ecx, [ebp+var_40]
mov     dx, word ptr [ebp+var_38]
mov     [ecx+eax*2], dx
mov     [ebp+var_C], 0
jmp     short loc_100081F3

loc_100081E7:
mov     ax, [ebp+var_C]
add     ax, 1
mov     [ebp+var_C], ax

loc_100081F3:
movsx   ecx, [ebp+var_C]
cmp     ecx, 3
jge     short loc_1000822C
mov     dx, [ebp+var_20]
mov     [ebp+var_10], dx
lea     eax, [ebp+var_10]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000822A
jmp     short loc_1000822C

loc_1000822A:
jmp     short loc_100081E7

loc_1000822C:
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10008241
jmp     loc_10008462

loc_10008241:
mov     cx, [ebp+var_10]
mov     [ebp+var_20], cx
mov     edx, [ebp+var_38]
and     edx, 0FFFFh
mov     [ebp+var_3C], edx
mov     [ebp+var_C], 0
jmp     short loc_10008269

loc_1000825D:
mov     ax, [ebp+var_C]
add     ax, 1
mov     [ebp+var_C], ax

loc_10008269:
movsx   ecx, [ebp+var_C]
cmp     ecx, 3
jge     short loc_100082A2
mov     dx, [ebp+var_20]
mov     [ebp+var_10], dx
lea     eax, [ebp+var_10]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_100082A0
jmp     short loc_100082A2

loc_100082A0:
jmp     short loc_1000825D

loc_100082A2:
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_100082B7
jmp     loc_10008462

loc_100082B7:
mov     cx, [ebp+var_10]
mov     [ebp+var_20], cx
mov     edx, [ebp+var_38]
and     edx, 0FFFFh
mov     [ebp+var_4], edx
mov     eax, [ebp+var_3C]
and     eax, 0FFFFh
mov     ecx, [ebp+var_4]
shl     ecx, 10h
add     eax, ecx
mov     edx, [ebp+var_8]
mov     ecx, [ebp+var_28]
mov     [ecx+edx*4], eax
mov     [ebp+var_C], 0
jmp     short loc_100082F8

loc_100082EC:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_100082F8:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_10008331
mov     cx, [ebp+var_20]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000832F
jmp     short loc_10008331

loc_1000832F:
jmp     short loc_100082EC

loc_10008331:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10008346
jmp     loc_10008462

loc_10008346:
mov     ax, [ebp+var_10]
mov     [ebp+var_20], ax
mov     ecx, [ebp+var_8]
mov     edx, [ebp+var_44]
mov     ax, word ptr [ebp+var_38]
mov     [edx+ecx*2], ax
mov     [ebp+var_C], 0
jmp     short loc_10008370

loc_10008364:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_10008370:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_100083A9
mov     ax, [ebp+var_20]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_100083A7
jmp     short loc_100083A9

loc_100083A7:
jmp     short loc_10008364

loc_100083A9:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_100083BE
jmp     loc_10008462

loc_100083BE:
mov     dx, [ebp+var_10]
mov     [ebp+var_20], dx
mov     eax, [ebp+var_38]
and     eax, 0FFFFh
mov     [ebp+var_3C], eax
mov     [ebp+var_C], 0
jmp     short loc_100083E5

loc_100083D9:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_100083E5:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_1000841E
mov     ax, [ebp+var_20]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000841C
jmp     short loc_1000841E

loc_1000841C:
jmp     short loc_100083D9

loc_1000841E:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_10008430
jmp     short loc_10008462

loc_10008430:
mov     dx, [ebp+var_10]
mov     [ebp+var_20], dx
mov     eax, [ebp+var_38]
and     eax, 0FFFFh
mov     [ebp+var_4], eax
mov     ecx, [ebp+var_3C]
and     ecx, 0FFFFh
mov     edx, [ebp+var_4]
shl     edx, 10h
add     ecx, edx
mov     eax, [ebp+var_8]
mov     edx, [ebp+var_30]
mov     [edx+eax*4], ecx
jmp     loc_10008152

loc_10008462:
push    2
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_34]

loc_10008474:
mov     esp, ebp
pop     ebp
retn
sub_10007F8C endp

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100084A0
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_10008578

loc_100084A0:
mov     eax, [ebp+8]
push    eax
call    CheckForMinMax
add     esp, 4
movsx   ecx, ax
cmp     ecx, 2
jz      short loc_10008514
mov     edx, [ebp+8]
push    edx
call    CheckForFreqpts
add     esp, 4
movsx   eax, ax
cmp     eax, 1
jnz     short loc_100084F2
mov     ecx, [ebp+20h]
push    ecx
mov     edx, [ebp+1Ch]
push    edx
mov     eax, [ebp+18h]
push    eax
mov     ecx, [ebp+14h]
push    ecx
mov     edx, [ebp+10h]
push    edx
mov     eax, [ebp+0Ch]
push    eax
mov     ecx, [ebp+8]
push    ecx
call    sub_10007F07
add     esp, 1Ch
mov     [ebp-4], ax
jmp     short loc_10008512

loc_100084F2:
mov     edx, [ebp+20h]
push    edx
mov     eax, [ebp+1Ch]
push    eax
mov     ecx, [ebp+10h]
push    ecx
mov     edx, [ebp+0Ch]
push    edx
mov     eax, [ebp+8]
push    eax
call    sub_10007774
add     esp, 14h
mov     [ebp-4], ax

loc_10008512:
jmp     short loc_10008566

loc_10008514:
mov     ecx, [ebp+8]
push    ecx
call    CheckForFreqpts
add     esp, 4
movsx   edx, ax
cmp     edx, 1
jnz     short loc_1000854A
mov     eax, [ebp+20h]
push    eax
mov     ecx, [ebp+1Ch]
push    ecx
mov     edx, [ebp+14h]
push    edx
mov     eax, [ebp+0Ch]
push    eax
mov     ecx, [ebp+8]
push    ecx
call    sub_10007AE8
add     esp, 14h
mov     [ebp-4], ax
jmp     short loc_10008566

loc_1000854A:
mov     edx, [ebp+20h]
push    edx
mov     eax, [ebp+1Ch]
push    eax
mov     ecx, [ebp+0Ch]
push    ecx
mov     edx, [ebp+8]
push    edx
call    GetTraceData
add     esp, 10h
mov     [ebp-4], ax

loc_10008566:
push    2
mov     eax, [ebp+8]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp-4]

loc_10008578:
mov     esp, ebp
pop     ebp
retn
; Exported entry  91. RdErrorStatus


; Attributes: bp-based frame

public RdErrorStatus
RdErrorStatus proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 4
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100085AB
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
movsx   eax, ax
jmp     short loc_100085BA

loc_100085AB:
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0C0h]
mov     [ebp+var_4], ecx
mov     eax, [ebp+var_4]

loc_100085BA:
mov     esp, ebp
pop     ebp
retn
RdErrorStatus endp

; Exported entry  39. GetErrorStatus


; Attributes: bp-based frame

public GetErrorStatus
GetErrorStatus proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100085E5
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
movsx   eax, ax
jmp     short loc_100085F1

loc_100085E5:
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4

loc_100085F1:
pop     ebp
retn
GetErrorStatus endp



; Attributes: bp-based frame

sub_100085F3 proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000860E
or      eax, 0FFFFFFFFh
jmp     short loc_10008627

loc_1000860E:
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+8]
call    sub_1000D53C

loc_10008627:
pop     ebp
retn
sub_100085F3 endp

push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008644
or      eax, 0FFFFFFFFh
jmp     short loc_1000865D

loc_10008644:
push    2
mov     edx, [ebp+8]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+8]
fld     qword ptr [eax+10h]
call    sub_1000D53C

loc_1000865D:
pop     ebp
retn
; Exported entry  90. RdEngineModel


; Attributes: bp-based frame

public RdEngineModel
RdEngineModel proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000867A
xor     ax, ax
jmp     short loc_1000868F

loc_1000867A:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     ax, [eax+2]

loc_1000868F:
pop     ebp
retn
RdEngineModel endp

; Exported entry 152. SetEngineModel


; Attributes: bp-based frame

public SetEngineModel
SetEngineModel proc near

arg_0= dword ptr  8
arg_4= word ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100086B5
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100086F7

loc_100086B5:
movsx   eax, [ebp+arg_4]
cmp     eax, 100h
jz      short loc_100086E3
movsx   ecx, [ebp+arg_4]
cmp     ecx, 200h
jz      short loc_100086E3
movsx   edx, [ebp+arg_4]
cmp     edx, 300h
jz      short loc_100086E3
movsx   eax, [ebp+arg_4]
cmp     eax, 400h
jnz     short loc_100086F3

loc_100086E3:
mov     ecx, [ebp+arg_0]
mov     dx, [ebp+arg_4]
mov     [ecx+2], dx
xor     ax, ax
jmp     short loc_100086F7

loc_100086F3:
mov     ax, 0FFFDh

loc_100086F7:
pop     ebp
retn
SetEngineModel endp

push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008714
or      eax, 0FFFFFFFFh
jmp     short loc_1000872D

loc_10008714:
push    2
mov     edx, [ebp+8]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+8]
fld     qword ptr [eax+78h]
call    sub_1000D53C

loc_1000872D:
pop     ebp
retn
; Exported entry 129. RdZspanFreq


; Attributes: bp-based frame

public RdZspanFreq
RdZspanFreq proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000874A
or      eax, 0FFFFFFFFh
jmp     short loc_10008766

loc_1000874A:
push    2
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+90h]
call    sub_1000D53C

loc_10008766:
pop     ebp
retn
RdZspanFreq endp

; Exported entry 102. RdMaxFreqLimit


; Attributes: bp-based frame

public RdMaxFreqLimit
RdMaxFreqLimit proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008787
fld     ds:dbl_10016100
jmp     short loc_10008804

loc_10008787:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
push    eax
call    RdEngineModel
add     esp, 4
movsx   ecx, ax
mov     [ebp+var_4], ecx
cmp     [ebp+var_4], 300h
jg      short loc_100087CD
cmp     [ebp+var_4], 300h
jz      short loc_100087E0
cmp     [ebp+var_4], 100h
jz      short loc_100087D8
cmp     [ebp+var_4], 200h
jz      short loc_100087D8
jmp     short loc_100087F0

loc_100087CD:
cmp     [ebp+var_4], 400h
jz      short loc_100087E8
jmp     short loc_100087F0

loc_100087D8:
fld     ds:dbl_10016130
jmp     short loc_10008804

loc_100087E0:
fld     ds:dbl_10016128
jmp     short loc_10008804

loc_100087E8:
fld     ds:dbl_10016120
jmp     short loc_10008804

loc_100087F0:
push    0FFFFFFF3h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
fld     ds:dbl_10016100

loc_10008804:
mov     esp, ebp
pop     ebp
retn
RdMaxFreqLimit endp

; Exported entry 104. RdMinFreqLimit


; Attributes: bp-based frame

public RdMinFreqLimit
RdMinFreqLimit proc near

model= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008838
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
movsx   eax, ax
mov     [ebp+var_4], eax
fild    [ebp+var_4]
jmp     short loc_100088A5

loc_10008838:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdEngineModel
add     esp, 4
movsx   edx, ax
mov     [ebp+model], edx
cmp     [ebp+model], 300h
jg      short loc_10008870
cmp     [ebp+model], 300h
jz      short loc_1000887B
cmp     [ebp+model], 100h
jz      short loc_1000887B
cmp     [ebp+model], 200h
jz      short loc_1000887B
jmp     short loc_10008891

loc_10008870:
cmp     [ebp+model], 400h
jz      short loc_1000887B
jmp     short loc_10008891

loc_1000887B:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
fld     ds:dbl_10016138
jmp     short loc_100088A5

loc_10008891:
push    0FFFFFFF3h
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     ds:dbl_10016100

loc_100088A5:
mov     esp, ebp
pop     ebp
retn
RdMinFreqLimit endp

push    ebp
mov     ebp, esp
push    ecx
mov     word ptr [ebp-4], 0FFFFh
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100088D4
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000894F

loc_100088D4:
fild    dword ptr [ebp+0Ch]
sub     esp, 8
fstp    qword ptr [esp]
mov     eax, [ebp+8]
push    eax
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008937
fild    dword ptr [ebp+0Ch]
mov     edx, [ebp+8]
fstp    qword ptr [edx+8]
mov     eax, [ebp+8]
mov     ecx, [ebp+8]
fld     qword ptr [eax+8]
fcomp   qword ptr [ecx+10h]
fnstsw  ax
test    ah, 41h
jnz     short loc_10008914
mov     word ptr [ebp-4], 3
jmp     short loc_10008935

loc_10008914:
mov     edx, [ebp+8]
push    edx
call    sub_10001718
add     esp, 4
movsx   eax, ax
test    eax, eax
jnz     short loc_1000892F
mov     word ptr [ebp-4], 0
jmp     short loc_10008935

loc_1000892F:
mov     word ptr [ebp-4], 0FFFAh

loc_10008935:
jmp     short loc_1000893D

loc_10008937:
mov     word ptr [ebp-4], 0FFFDh

loc_1000893D:
push    2
mov     ecx, [ebp+8]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp-4]

loc_1000894F:
mov     esp, ebp
pop     ebp
retn
push    ebp
mov     ebp, esp
push    ecx
mov     word ptr [ebp-4], 0FFFFh
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000897E
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_100089F9

loc_1000897E:
fild    dword ptr [ebp+0Ch]
sub     esp, 8
fstp    qword ptr [esp]
mov     eax, [ebp+8]
push    eax
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100089E1
fild    dword ptr [ebp+0Ch]
mov     edx, [ebp+8]
fstp    qword ptr [edx+10h]
mov     eax, [ebp+8]
mov     ecx, [ebp+8]
fld     qword ptr [eax+8]
fcomp   qword ptr [ecx+10h]
fnstsw  ax
test    ah, 41h
jnz     short loc_100089BE
mov     word ptr [ebp-4], 3
jmp     short loc_100089DF

loc_100089BE:
mov     edx, [ebp+8]
push    edx
call    sub_10001718
add     esp, 4
movsx   eax, ax
test    eax, eax
jnz     short loc_100089D9
mov     word ptr [ebp-4], 0
jmp     short loc_100089DF

loc_100089D9:
mov     word ptr [ebp-4], 0FFFAh

loc_100089DF:
jmp     short loc_100089E7

loc_100089E1:
mov     word ptr [ebp-4], 0FFFDh

loc_100089E7:
push    2
mov     ecx, [ebp+8]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp-4]

loc_100089F9:
mov     esp, ebp
pop     ebp
retn
; Exported entry  27. FreqInRange


; Attributes: bp-based frame

; int __cdecl FreqInRange(int a1, double freq)
public FreqInRange
FreqInRange proc near

var_14= dword ptr -14h
fmax= qword ptr -10h
fmin= qword ptr -8
a1= dword ptr  8
freq= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 14h
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008A1C
or      ax, 0FFFFh
jmp     short loc_10008A76

loc_10008A1C:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+a1]
push    eax
call    RdMinFreqLimit
add     esp, 4
fstp    [ebp+fmin]
mov     ecx, [ebp+a1]
push    ecx
call    RdMaxFreqLimit
add     esp, 4
fstp    [ebp+fmax]
fld     [ebp+freq]
fcomp   [ebp+fmin]
fnstsw  ax
test    ah, 1
jnz     short loc_10008A6B
fld     [ebp+freq]
fcomp   [ebp+fmax]
fnstsw  ax
test    ah, 41h
jz      short loc_10008A6B
mov     [ebp+var_14], 1
jmp     short loc_10008A72

loc_10008A6B:
mov     [ebp+var_14], 0

loc_10008A72:
mov     ax, word ptr [ebp+var_14]

loc_10008A76:
mov     esp, ebp
pop     ebp
retn
FreqInRange endp

push    ebp
mov     ebp, esp
push    ecx
mov     word ptr [ebp-4], 0FFFFh
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008AA5
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10008AED

loc_10008AA5:
fild    dword ptr [ebp+0Ch]
sub     esp, 8
fstp    qword ptr [esp]
mov     eax, [ebp+8]
push    eax
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008AD5
mov     edx, [ebp+8]
fild    dword ptr [ebp+0Ch]
fstp    qword ptr [edx+90h]
mov     word ptr [ebp-4], 0
jmp     short loc_10008ADB

loc_10008AD5:
mov     word ptr [ebp-4], 0FFFDh

loc_10008ADB:
push    2
mov     eax, [ebp+8]
push    eax
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp-4]

loc_10008AED:
mov     esp, ebp
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008B15
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10008B43

loc_10008B15:
fild    dword ptr [ebp+0Ch]
sub     esp, 8
fstp    qword ptr [esp]
mov     eax, [ebp+8]
push    eax
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_10008B37
mov     ax, 0FFFDh
jmp     short loc_10008B43

loc_10008B37:
fild    dword ptr [ebp+0Ch]
mov     edx, [ebp+8]
fstp    qword ptr [edx+78h]
xor     ax, ax

loc_10008B43:
pop     ebp
retn
push    ebp
mov     ebp, esp
sub     esp, 38h
mov     dword ptr [ebp-14h], 0
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008B6D
or      eax, 0FFFFFFFFh
jmp     loc_10008C6C

loc_10008B6D:
cmp     dword ptr [ebp+0Ch], 0
jnz     short loc_10008B7B
or      eax, 0FFFFFFFFh
jmp     loc_10008C6C

loc_10008B7B:
mov     edx, [ebp+8]
mov     eax, [edx+0A4h]
mov     [ebp-0Ch], eax
mov     ecx, [ebp+8]
mov     edx, [ecx+8]
mov     [ebp-24h], edx
mov     eax, [ecx+0Ch]
mov     [ebp-20h], eax
mov     ecx, [ebp+8]
mov     edx, [ecx+18h]
mov     [ebp-2Ch], edx
mov     eax, [ecx+1Ch]
mov     [ebp-28h], eax
fild    dword ptr [ebp+10h]
mov     ecx, [ebp-0Ch]
sub     ecx, 1
mov     [ebp-38h], ecx
fild    dword ptr [ebp-38h]
fmul    qword ptr [ebp-2Ch]
fadd    qword ptr [ebp-24h]
fcompp
fnstsw  ax
test    ah, 41h
jz      short loc_10008BCE
mov     eax, [ebp-0Ch]
sub     eax, 1
jmp     loc_10008C6C

loc_10008BCE:
fild    dword ptr [ebp+10h]
fcomp   qword ptr [ebp-24h]
fnstsw  ax
test    ah, 41h
jz      short loc_10008BE2
xor     eax, eax
jmp     loc_10008C6C

loc_10008BE2:
fild    dword ptr [ebp+10h]
fsubr   qword ptr [ebp-24h]
sub     esp, 8
fstp    qword ptr [esp]
call    sub_1000D83E
add     esp, 8
fstp    qword ptr [ebp-8]
mov     dword ptr [ebp-14h], 0
mov     dword ptr [ebp-10h], 1
jmp     short loc_10008C12

loc_10008C09:
mov     edx, [ebp-10h]
add     edx, 1
mov     [ebp-10h], edx

loc_10008C12:
mov     eax, [ebp-10h]
cmp     eax, [ebp-0Ch]
jge     short loc_10008C5B
fild    dword ptr [ebp-10h]
fmul    qword ptr [ebp-2Ch]
fadd    qword ptr [ebp-24h]
fstp    qword ptr [ebp-1Ch]
fild    dword ptr [ebp+10h]
fsubr   qword ptr [ebp-1Ch]
sub     esp, 8
fstp    qword ptr [esp]
call    sub_1000D83E
add     esp, 8
fst     qword ptr [ebp-34h]
fcomp   qword ptr [ebp-8]
fnstsw  ax
test    ah, 41h
jz      short loc_10008C59
mov     ecx, [ebp-34h]
mov     [ebp-8], ecx
mov     edx, [ebp-30h]
mov     [ebp-4], edx
mov     eax, [ebp-10h]
mov     [ebp-14h], eax

loc_10008C59:
jmp     short loc_10008C09

loc_10008C5B:
push    2
mov     ecx, [ebp+8]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp-14h]

loc_10008C6C:
mov     esp, ebp
pop     ebp
retn
; Exported entry  82. RdCommHandle


; Attributes: bp-based frame

public RdCommHandle
RdCommHandle proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008C8A
xor     eax, eax
jmp     short loc_10008C93

loc_10008C8A:
mov     edx, [ebp+arg_0]
mov     eax, [edx+1E0h]

loc_10008C93:
pop     ebp
retn
RdCommHandle endp

; Exported entry  83. RdCommInitString


; Attributes: bp-based frame

public RdCommInitString
RdCommInitString proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008CB1
or      ax, 0FFFFh
jmp     short loc_10008CD6

loc_10008CB1:
cmp     [ebp+arg_4], 0
jnz     short loc_10008CBD
or      ax, 0FFFFh
jmp     short loc_10008CD6

loc_10008CBD:
mov     edx, [ebp+arg_0]
add     edx, 252h
push    edx
mov     eax, [ebp+arg_4]
push    eax
call    sub_1000D570
add     esp, 8
xor     ax, ax

loc_10008CD6:
pop     ebp
retn
RdCommInitString endp

; Exported entry  84. RdCommNumber


; Attributes: bp-based frame

public RdCommNumber
RdCommNumber proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008CF4
or      ax, 0FFFFh
jmp     short loc_10008CFE

loc_10008CF4:
mov     edx, [ebp+arg_0]
mov     ax, [edx+214h]

loc_10008CFE:
pop     ebp
retn
RdCommNumber endp

; Exported entry 144. SetCommHandle


; Attributes: bp-based frame

public SetCommHandle
SetCommHandle proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008D1C
or      ax, 0FFFFh
jmp     short loc_10008D37

loc_10008D1C:
cmp     [ebp+arg_4], 0
jnz     short loc_10008D28
or      ax, 0FFFFh
jmp     short loc_10008D37

loc_10008D28:
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_4]
mov     [edx+1E0h], eax
xor     ax, ax

loc_10008D37:
pop     ebp
retn
SetCommHandle endp

push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008D55
or      ax, 0FFFFh
jmp     short loc_10008D66

loc_10008D55:
mov     edx, [ebp+8]
mov     ax, [ebp+0Ch]
mov     [edx+214h], ax
xor     ax, ax

loc_10008D66:
pop     ebp
retn
; Exported entry 114. RdSessionString


; Attributes: bp-based frame

public RdSessionString
RdSessionString proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008D8C
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10008DBB

loc_10008D8C:
cmp     [ebp+arg_4], 0
jnz     short loc_10008DA2
push    0FFFFFFFDh
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_10008DBB

loc_10008DA2:
mov     ecx, [ebp+arg_0]
add     ecx, 0D2h
push    ecx
mov     edx, [ebp+arg_4]
push    edx
call    sub_1000D570
add     esp, 8
xor     ax, ax

loc_10008DBB:
pop     ebp
retn
RdSessionString endp

push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008DD9
or      ax, 0FFFFh
jmp     short loc_10008DFE

loc_10008DD9:
cmp     dword ptr [ebp+0Ch], 0
jnz     short loc_10008DE5
or      ax, 0FFFFh
jmp     short loc_10008DFE

loc_10008DE5:
mov     edx, [ebp+8]
add     edx, 220h
push    edx
mov     eax, [ebp+0Ch]
push    eax
call    sub_1000D570
add     esp, 8
xor     ax, ax

loc_10008DFE:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008E1C
or      ax, 0FFFFh
jmp     short loc_10008E26

loc_10008E1C:
mov     edx, [ebp+8]
mov     ax, [edx+21Ch]

loc_10008E26:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008E44
or      ax, 0FFFFh
jmp     short loc_10008E55

loc_10008E44:
mov     edx, [ebp+8]
mov     ax, [ebp+0Ch]
mov     [edx+21Ch], ax
xor     ax, ax

loc_10008E55:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008E73
or      ax, 0FFFFh
jmp     short loc_10008E7D

loc_10008E73:
mov     edx, [ebp+8]
mov     ax, [edx+284h]

loc_10008E7D:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008EA3
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10008EBF

loc_10008EA3:
mov     eax, [ebp+8]
mov     cx, [ebp+0Ch]
mov     [eax+284h], cx
push    0
mov     edx, [ebp+8]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_10008EBF:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008EDD
or      ax, 0FFFFh
jmp     short loc_10008EEE

loc_10008EDD:
mov     edx, [ebp+8]
mov     ax, [ebp+0Ch]
mov     [edx+21Eh], ax
xor     ax, ax

loc_10008EEE:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008F0C
or      ax, 0FFFFh
jmp     short loc_10008F48

loc_10008F0C:
cmp     dword ptr [ebp+0Ch], 0
jnz     short loc_10008F18
or      ax, 0FFFFh
jmp     short loc_10008F48

loc_10008F18:
mov     edx, [ebp+0Ch]
push    edx
call    sub_1000D900
add     esp, 4
cmp     eax, 32h
jb      short loc_10008F2F
or      ax, 0FFFFh
jmp     short loc_10008F48

loc_10008F2F:
mov     eax, [ebp+0Ch]
push    eax
mov     ecx, [ebp+8]
add     ecx, 220h
push    ecx
call    sub_1000D570
add     esp, 8
xor     ax, ax

loc_10008F48:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008F66
or      ax, 0FFFFh
jmp     short loc_10008FA2

loc_10008F66:
cmp     dword ptr [ebp+0Ch], 0
jnz     short loc_10008F72
or      ax, 0FFFFh
jmp     short loc_10008FA2

loc_10008F72:
mov     edx, [ebp+0Ch]
push    edx
call    sub_1000D900
add     esp, 4
cmp     eax, 50h
jb      short loc_10008F89
or      ax, 0FFFFh
jmp     short loc_10008FA2

loc_10008F89:
mov     eax, [ebp+0Ch]
push    eax
mov     ecx, [ebp+8]
add     ecx, 252h
push    ecx
call    sub_1000D570
add     esp, 8
xor     ax, ax

loc_10008FA2:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008FC0
or      ax, 0FFFFh
jmp     short loc_10008FCA

loc_10008FC0:
mov     edx, [ebp+8]
mov     ax, [edx+21Eh]

loc_10008FCA:
pop     ebp
retn


; Attributes: bp-based frame

sub_10008FCC proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10008FE8
or      ax, 0FFFFh
jmp     short loc_10008FF2

loc_10008FE8:
mov     edx, [ebp+arg_0]
mov     ax, [edx+21Ah]

loc_10008FF2:
pop     ebp
retn
sub_10008FCC endp



; Attributes: bp-based frame

sub_10008FF4 proc near
push    ebp
mov     ebp, esp
movsx   eax, word_10018290
cmp     eax, 0FFFFFFFFh
jnz     short loc_10009033
mov     word_10018290, 0
jmp     short loc_10009020

loc_1000900E:
mov     cx, word_10018290
add     cx, 1
mov     word_10018290, cx

loc_10009020:
movsx   edx, word_10018290
cmp     dword_10018228[edx*4], 0FFFFFFFFh
jz      short loc_10009033
jmp     short loc_1000900E

loc_10009033:
mov     ax, word_10018290
pop     ebp
retn
sub_10008FF4 endp



; Attributes: bp-based frame

sub_1000903B proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10009058
or      ax, 0FFFFh
jmp     short loc_1000908A

loc_10009058:
mov     edx, [ebp+arg_0]
push    edx
call    RdInterfaceType
add     esp, 4
movsx   eax, ax
mov     [ebp+var_4], eax
cmp     [ebp+var_4], 3
jz      short loc_10009078
cmp     [ebp+var_4], 6
jz      short loc_1000907F
jmp     short loc_10009086

loc_10009078:
call    sub_10008FF4
jmp     short loc_1000908A

loc_1000907F:
call    sub_1000908E
jmp     short loc_1000908A

loc_10009086:
or      ax, 0FFFFh

loc_1000908A:
mov     esp, ebp
pop     ebp
retn
sub_1000903B endp



; Attributes: bp-based frame

sub_1000908E proc near
push    ebp
mov     ebp, esp
movsx   eax, word_10018292
cmp     eax, 0FFFFFFFFh
jnz     short loc_100090CD
mov     word_10018292, 0
jmp     short loc_100090BA

loc_100090A8:
mov     cx, word_10018292
add     cx, 1
mov     word_10018292, cx

loc_100090BA:
movsx   edx, word_10018292
cmp     dword ptr byte_10018240[edx*4], 0FFFFFFFFh
jz      short loc_100090CD
jmp     short loc_100090A8

loc_100090CD:
mov     ax, word_10018292
pop     ebp
retn
sub_1000908E endp



; Attributes: bp-based frame

sub_100090D5 proc near

var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
cmp     [ebp+arg_0], 0
jge     short loc_100090E7
or      ax, 0FFFFh
jmp     short loc_1000912C

loc_100090E7:
mov     [ebp+var_8], 0
call    sub_1000908E
mov     [ebp+var_4], ax
jmp     short loc_10009104

loc_100090F8:
mov     ax, [ebp+var_8]
add     ax, 1
mov     [ebp+var_8], ax

loc_10009104:
movsx   ecx, [ebp+var_8]
movsx   edx, [ebp+var_4]
cmp     ecx, edx
jge     short loc_10009128
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+arg_0]
cmp     ecx, dword ptr byte_10018240[eax*4]
jnz     short loc_10009126
mov     ax, [ebp+var_8]
jmp     short loc_1000912C

loc_10009126:
jmp     short loc_100090F8

loc_10009128:
or      ax, 0FFFFh

loc_1000912C:
mov     esp, ebp
pop     ebp
retn
sub_100090D5 endp



; Attributes: bp-based frame

sub_10009130 proc near

var_8= word ptr -8
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
cmp     [ebp+arg_0], 0
jge     short loc_10009142
or      ax, 0FFFFh
jmp     short loc_10009187

loc_10009142:
mov     [ebp+var_8], 0
call    sub_10008FF4
mov     [ebp+var_4], ax
jmp     short loc_1000915F

loc_10009153:
mov     ax, [ebp+var_8]
add     ax, 1
mov     [ebp+var_8], ax

loc_1000915F:
movsx   ecx, [ebp+var_8]
movsx   edx, [ebp+var_4]
cmp     ecx, edx
jge     short loc_10009183
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+arg_0]
cmp     ecx, dword_10018228[eax*4]
jnz     short loc_10009181
mov     ax, [ebp+var_8]
jmp     short loc_10009187

loc_10009181:
jmp     short loc_10009153

loc_10009183:
or      ax, 0FFFFh

loc_10009187:
mov     esp, ebp
pop     ebp
retn
sub_10009130 endp

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100091A7
or      eax, 0FFFFFFFFh
jmp     short loc_100091E8

loc_100091A7:
mov     edx, [ebp+8]
push    edx
call    RdInterfaceType
add     esp, 4
movsx   eax, ax
mov     [ebp-4], eax
cmp     dword ptr [ebp-4], 3
jz      short loc_100091C7
cmp     dword ptr [ebp-4], 6
jz      short loc_100091D6
jmp     short loc_100091E5

loc_100091C7:
mov     cx, [ebp+0Ch]
push    ecx
call    sub_100091EC
add     esp, 4
jmp     short loc_100091E8

loc_100091D6:
mov     dx, [ebp+0Ch]
push    edx
call    sub_10009213
add     esp, 4
jmp     short loc_100091E8

loc_100091E5:
or      eax, 0FFFFFFFFh

loc_100091E8:
mov     esp, ebp
pop     ebp
retn


; Attributes: bp-based frame

sub_100091EC proc near

arg_0= word ptr  8

push    ebp
mov     ebp, esp
push    esi
movsx   esi, [ebp+arg_0]
call    sub_10008FF4
movsx   eax, ax
cmp     esi, eax
jl      short loc_10009205
or      eax, 0FFFFFFFFh
jmp     short loc_10009210

loc_10009205:
movsx   ecx, [ebp+arg_0]
mov     eax, dword_10018228[ecx*4]

loc_10009210:
pop     esi
pop     ebp
retn
sub_100091EC endp



; Attributes: bp-based frame

sub_10009213 proc near

arg_0= word ptr  8

push    ebp
mov     ebp, esp
push    esi
movsx   esi, [ebp+arg_0]
call    sub_1000908E
movsx   eax, ax
cmp     esi, eax
jl      short loc_1000922C
or      eax, 0FFFFFFFFh
jmp     short loc_10009237

loc_1000922C:
movsx   ecx, [ebp+arg_0]
mov     eax, dword ptr byte_10018240[ecx*4]

loc_10009237:
pop     esi
pop     ebp
retn
sub_10009213 endp

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10009257
or      ax, 0FFFFh
jmp     short loc_10009297

loc_10009257:
mov     edx, [ebp+8]
push    edx
call    RdInterfaceType
add     esp, 4
movsx   eax, ax
mov     [ebp-4], eax
cmp     dword ptr [ebp-4], 3
jz      short loc_10009277
cmp     dword ptr [ebp-4], 6
jz      short loc_10009285
jmp     short loc_10009293

loc_10009277:
mov     ecx, [ebp+0Ch]
push    ecx
call    sub_10009130
add     esp, 4
jmp     short loc_10009297

loc_10009285:
mov     edx, [ebp+0Ch]
push    edx
call    sub_100090D5
add     esp, 4
jmp     short loc_10009297

loc_10009293:
or      ax, 0FFFFh

loc_10009297:
mov     esp, ebp
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100092B7
or      ax, 0FFFFh
jmp     short loc_100092C8

loc_100092B7:
mov     edx, [ebp+8]
mov     ax, [ebp+0Ch]
mov     [edx+216h], ax
xor     ax, ax

loc_100092C8:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100092E6
or      ax, 0FFFFh
jmp     short loc_100092F7

loc_100092E6:
mov     edx, [ebp+8]
mov     ax, [ebp+0Ch]
mov     [edx+218h], ax
xor     ax, ax

loc_100092F7:
pop     ebp
retn
push    ebp
mov     ebp, esp
push    esi
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000931E
mov     edx, [ebp+8]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_10009354

loc_1000931E:
movsx   eax, word ptr [ebp+0Ch]
test    eax, eax
jl      short loc_1000933D
movsx   esi, word ptr [ebp+0Ch]
mov     ecx, [ebp+8]
push    ecx
call    sub_1000903B
add     esp, 4
movsx   edx, ax
cmp     esi, edx
jl      short loc_10009343

loc_1000933D:
mov     ax, 0FFFDh
jmp     short loc_10009354

loc_10009343:
mov     eax, [ebp+8]
mov     cx, [ebp+0Ch]
mov     [eax+21Ah], cx
xor     ax, ax

loc_10009354:
pop     esi
pop     ebp
retn


; Attributes: bp-based frame

sub_10009357 proc near

var_8= dword ptr -8
var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10009375
or      eax, 0FFFFFFFFh
jmp     short loc_100093D3

loc_10009375:
mov     edx, [ebp+arg_0]
push    edx
call    sub_10008FCC
add     esp, 4
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10009392
or      eax, 0FFFFFFFFh
jmp     short loc_100093D3

loc_10009392:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdInterfaceType
add     esp, 4
movsx   edx, ax
mov     [ebp+var_8], edx
cmp     [ebp+var_8], 3
jz      short loc_100093B2
cmp     [ebp+var_8], 6
jz      short loc_100093C1
jmp     short loc_100093D0

loc_100093B2:
mov     ax, [ebp+var_4]
push    eax
call    sub_100091EC
add     esp, 4
jmp     short loc_100093D3

loc_100093C1:
mov     cx, [ebp+var_4]
push    ecx
call    sub_10009213
add     esp, 4
jmp     short loc_100093D3

loc_100093D0:
or      eax, 0FFFFFFFFh

loc_100093D3:
mov     esp, ebp
pop     ebp
retn
sub_10009357 endp

push    ebp
mov     ebp, esp
mov     ax, 0FFEFh
pop     ebp
retn
; Exported entry 183. SetZCellSize


; Attributes: bp-based frame

public SetZCellSize
SetZCellSize proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_100093FC
mov     ax, 0FFF6h
jmp     short loc_1000941A

loc_100093FC:
cmp     [ebp+arg_4], 5F5E100h
jbe     short loc_1000940B
mov     ax, 0FFFDh
jmp     short loc_1000941A

loc_1000940B:
mov     edx, [ebp+arg_0]
mov     eax, [ebp+arg_4]
mov     [edx+0BCh], eax
xor     ax, ax

loc_1000941A:
pop     ebp
retn
SetZCellSize endp

; Exported entry 125. RdZCellSize


; Attributes: bp-based frame

public RdZCellSize
RdZCellSize proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_10009437
or      eax, 0FFFFFFFFh
jmp     short loc_1000944E

loc_10009437:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
mov     eax, [eax+0BCh]

loc_1000944E:
pop     ebp
retn
RdZCellSize endp

; Exported entry  54. InitDataCapZspan


; Attributes: bp-based frame

; int __cdecl InitDataCapZspan(int, __int16, __int16, double, int)
public InitDataCapZspan
InitDataCapZspan proc near

var_4= word ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= dword ptr  1Ch

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
cmp     [ebp+a1], 0
jnz     short loc_10009469
mov     ax, 0FFF6h
jmp     loc_1000973E

loc_10009469:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000948D
mov     ax, 0FFFDh
jmp     loc_1000973E

loc_1000948D:
cmp     [ebp+arg_14], 0
jl      short loc_1000949C
cmp     [ebp+arg_14], 5F5E100h
jle     short loc_100094A5

loc_1000949C:
mov     ax, 0FFFDh
jmp     loc_1000973E

loc_100094A5:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetAutoCell
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100094C8
or      ax, 0FFFFh
jmp     loc_1000973E

loc_100094C8:
push    0
mov     eax, [ebp+a1]
push    eax
call    SetCellMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_100094EB
or      ax, 0FFFFh
jmp     loc_1000973E

loc_100094EB:
push    1
mov     edx, [ebp+a1]
push    edx
call    SwpTimeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000950E
or      ax, 0FFFFh
jmp     loc_1000973E

loc_1000950E:
push    1
mov     ecx, [ebp+a1]
push    ecx
call    StepSizeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009531
or      ax, 0FFFFh
jmp     loc_1000973E

loc_10009531:
movsx   eax, [ebp+arg_4]
cmp     eax, 5
jnz     short loc_1000955F
push    1
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_1000955D
or      ax, 0FFFFh
jmp     loc_1000973E

loc_1000955D:
jmp     short loc_100095BA

loc_1000955F:
push    0
mov     eax, [ebp+a1]
push    eax
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009582
or      ax, 0FFFFh
jmp     loc_1000973E

loc_10009582:
mov     dx, [ebp+arg_4]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_100095BA
movsx   edx, [ebp+var_4]
cmp     edx, 0FFFFFFFDh
jnz     short loc_100095B1
mov     ax, [ebp+var_4]
jmp     loc_1000973E

loc_100095B1:
or      ax, 0FFFFh
jmp     loc_1000973E

loc_100095BA:
movsx   eax, [ebp+arg_8]
cmp     eax, 8
jnz     short loc_100095E8
push    1
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100095E6
or      ax, 0FFFFh
jmp     loc_1000973E

loc_100095E6:
jmp     short loc_10009643

loc_100095E8:
push    0
mov     eax, [ebp+a1]
push    eax
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000960B
or      ax, 0FFFFh
jmp     loc_1000973E

loc_1000960B:
mov     dx, [ebp+arg_8]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetVBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009643
movsx   edx, [ebp+var_4]
cmp     edx, 0FFFFFFFDh
jnz     short loc_1000963A
mov     ax, [ebp+var_4]
jmp     loc_1000973E

loc_1000963A:
or      ax, 0FFFFh
jmp     loc_1000973E

loc_10009643:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; double
mov     edx, [ebp+a1]
push    edx             ; int
call    ConfigZspanFreq
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000966C
or      ax, 0FFFFh
jmp     loc_1000973E

loc_1000966C:
mov     ecx, [ebp+arg_14]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetZSamplCnt
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009691
or      ax, 0FFFFh
jmp     loc_1000973E

loc_10009691:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100096B4
or      ax, 0FFFFh
jmp     loc_1000973E

loc_100096B4:
xor     eax, eax
mov     ax, ds:word_10016140
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetZSamplRate
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100096DB
or      ax, 0FFFFh
jmp     short loc_1000973E

loc_100096DB:
mov     eax, [ebp+a1]
push    eax
call    SetDetectLog
add     esp, 4
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_100096F9
or      ax, 0FFFFh
jmp     short loc_1000973E

loc_100096F9:
push    1
mov     edx, [ebp+a1]
push    edx
call    SetSweepCode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009719
or      ax, 0FFFFh
jmp     short loc_1000973E

loc_10009719:
push    1
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetTrigMode
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_1000973B
or      ax, 0FFFFh
jmp     short loc_1000973E

loc_1000973B:
xor     ax, ax

loc_1000973E:
mov     esp, ebp
pop     ebp
retn
InitDataCapZspan endp

; Exported entry  53. InitDataCapSweep


; Attributes: bp-based frame

; int __cdecl InitDataCapSweep(int, __int16, __int16, double, double, int)
public InitDataCapSweep
InitDataCapSweep proc near

var_4= word ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= qword ptr  1Ch
arg_1C= dword ptr  24h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
cmp     [ebp+a1], 0
jnz     short loc_1000975B
mov     ax, 0FFF6h
jmp     loc_10009A3E

loc_1000975B:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000977F
mov     ax, 0FFFDh
jmp     loc_10009A3E

loc_1000977F:
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_100097A3
mov     ax, 0FFFDh
jmp     loc_10009A3E

loc_100097A3:
cmp     [ebp+arg_1C], 1
jl      short loc_100097B2
cmp     [ebp+arg_1C], 3B9ACA00h
jle     short loc_100097BB

loc_100097B2:
mov     ax, 0FFFDh
jmp     loc_10009A3E

loc_100097BB:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetAutoCell
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_100097DE
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_100097DE:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetCellMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009801
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009801:
push    1
mov     eax, [ebp+a1]
push    eax
call    StepSizeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009824
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009824:
push    1
mov     edx, [ebp+a1]
push    edx
call    SwpTimeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009847
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009847:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 5
jnz     short loc_10009875
push    1
mov     edx, [ebp+a1]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009873
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009873:
jmp     short loc_100098D0

loc_10009875:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009898
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009898:
mov     ax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetRBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100098D0
movsx   eax, [ebp+var_4]
cmp     eax, 0FFFFFFFDh
jnz     short loc_100098C7
mov     ax, [ebp+var_4]
jmp     loc_10009A3E

loc_100098C7:
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_100098D0:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 8
jnz     short loc_100098FE
push    1
mov     edx, [ebp+a1]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_100098FC
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_100098FC:
jmp     short loc_10009959

loc_100098FE:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009921
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009921:
mov     ax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetVBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009959
movsx   eax, [ebp+var_4]
cmp     eax, 0FFFFFFFDh
jnz     short loc_10009950
mov     ax, [ebp+var_4]
jmp     loc_10009A3E

loc_10009950:
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009959:
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStartFreq
add     esp, 0Ch
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStopFreq
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009996
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_10009996:
mov     edx, [ebp+arg_1C]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetDefltPts
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_100099BB
or      ax, 0FFFFh
jmp     loc_10009A3E

loc_100099BB:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_100099DB
or      ax, 0FFFFh
jmp     short loc_10009A3E

loc_100099DB:
mov     ecx, [ebp+a1]
push    ecx
call    SetDetectLog
add     esp, 4
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_100099F9
or      ax, 0FFFFh
jmp     short loc_10009A3E

loc_100099F9:
push    1
mov     eax, [ebp+a1]
push    eax
call    SetSweepCode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009A19
or      ax, 0FFFFh
jmp     short loc_10009A3E

loc_10009A19:
push    1
push    0
mov     edx, [ebp+a1]
push    edx
call    SetTrigMode
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009A3B
or      ax, 0FFFFh
jmp     short loc_10009A3E

loc_10009A3B:
xor     ax, ax

loc_10009A3E:
mov     esp, ebp
pop     ebp
retn
InitDataCapSweep endp

; Exported entry  58. InitGuiZspan


; Attributes: bp-based frame

; int __cdecl InitGuiZspan(int, __int16, __int16, double, __int16, int)
public InitGuiZspan
InitGuiZspan proc near

var_4= word ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= word ptr  1Ch
arg_18= dword ptr  20h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
cmp     [ebp+a1], 0
jnz     short loc_10009A5B
mov     ax, 0FFF6h
jmp     loc_10009D7D

loc_10009A5B:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_10009A7F
mov     ax, 0FFFDh
jmp     loc_10009D7D

loc_10009A7F:
cmp     [ebp+arg_18], 1
jl      short loc_10009A8E
cmp     [ebp+arg_18], 0FFFFh
jle     short loc_10009A97

loc_10009A8E:
mov     ax, 0FFFDh
jmp     loc_10009D7D

loc_10009A97:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetAutoCell
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009ABA
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009ABA:
push    1
mov     eax, [ebp+a1]
push    eax
call    SetCellMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009ADD
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009ADD:
push    1
mov     edx, [ebp+a1]
push    edx
call    SwpTimeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009B00
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009B00:
push    1
mov     ecx, [ebp+a1]
push    ecx
call    StepSizeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009B23
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009B23:
movsx   eax, [ebp+arg_4]
cmp     eax, 5
jnz     short loc_10009B51
push    1
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009B4F
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009B4F:
jmp     short loc_10009BAC

loc_10009B51:
push    0
mov     eax, [ebp+a1]
push    eax
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009B74
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009B74:
mov     dx, [ebp+arg_4]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009BAC
movsx   edx, [ebp+var_4]
cmp     edx, 0FFFFFFFDh
jnz     short loc_10009BA3
mov     ax, [ebp+var_4]
jmp     loc_10009D7D

loc_10009BA3:
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009BAC:
movsx   eax, [ebp+arg_8]
cmp     eax, 8
jnz     short loc_10009BDA
push    1
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009BD8
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009BD8:
jmp     short loc_10009C35

loc_10009BDA:
push    0
mov     eax, [ebp+a1]
push    eax
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009BFD
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009BFD:
mov     dx, [ebp+arg_8]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetVBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009C35
movsx   edx, [ebp+var_4]
cmp     edx, 0FFFFFFFDh
jnz     short loc_10009C2C
mov     ax, [ebp+var_4]
jmp     loc_10009D7D

loc_10009C2C:
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009C35:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; double
mov     edx, [ebp+a1]
push    edx             ; int
call    ConfigZspanFreq
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009C5E
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009C5E:
mov     cx, [ebp+arg_14]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetRefLevel
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jge     short loc_10009C84
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009C84:
mov     ecx, [ebp+arg_18]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetNumCells
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009CA9
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009CA9:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009CCC
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009CCC:
mov     eax, ds:dword_10016144
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetZSamplCnt
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009CF3
or      ax, 0FFFFh
jmp     loc_10009D7D

loc_10009CF3:
xor     eax, eax
mov     ax, ds:word_10016140
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetZSamplRate
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009D1A
or      ax, 0FFFFh
jmp     short loc_10009D7D

loc_10009D1A:
mov     eax, [ebp+a1]
push    eax
call    SetDetectLog
add     esp, 4
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009D38
or      ax, 0FFFFh
jmp     short loc_10009D7D

loc_10009D38:
push    5
mov     edx, [ebp+a1]
push    edx
call    SetSweepCode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009D58
or      ax, 0FFFFh
jmp     short loc_10009D7D

loc_10009D58:
push    1
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetTrigMode
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009D7A
or      ax, 0FFFFh
jmp     short loc_10009D7D

loc_10009D7A:
xor     ax, ax

loc_10009D7D:
mov     esp, ebp
pop     ebp
retn
InitGuiZspan endp

; Exported entry  57. InitGuiSweep


; Attributes: bp-based frame

; int __cdecl InitGuiSweep(int, __int16, __int16, double, double, __int16, int)
public InitGuiSweep
InitGuiSweep proc near

var_4= word ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= qword ptr  1Ch
arg_1C= word ptr  24h
arg_20= dword ptr  28h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
cmp     [ebp+a1], 0
jnz     short loc_10009D9A
mov     ax, 0FFF6h
jmp     loc_1000A0CC

loc_10009D9A:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_10009DBE
mov     ax, 0FFFDh
jmp     loc_1000A0CC

loc_10009DBE:
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_10009DE2
mov     ax, 0FFFDh
jmp     loc_1000A0CC

loc_10009DE2:
cmp     [ebp+arg_20], 1
jl      short loc_10009DF1
cmp     [ebp+arg_20], 0FFFFh
jle     short loc_10009DFA

loc_10009DF1:
mov     ax, 0FFFDh
jmp     loc_1000A0CC

loc_10009DFA:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetAutoCell
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009E1D
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009E1D:
push    1
mov     ecx, [ebp+a1]
push    ecx
call    SetCellMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009E40
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009E40:
push    1
mov     eax, [ebp+a1]
push    eax
call    StepSizeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009E63
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009E63:
push    1
mov     edx, [ebp+a1]
push    edx
call    SwpTimeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009E86
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009E86:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 5
jnz     short loc_10009EB4
push    1
mov     edx, [ebp+a1]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009EB2
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009EB2:
jmp     short loc_10009F0F

loc_10009EB4:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009ED7
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009ED7:
mov     ax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetRBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009F0F
movsx   eax, [ebp+var_4]
cmp     eax, 0FFFFFFFDh
jnz     short loc_10009F06
mov     ax, [ebp+var_4]
jmp     loc_1000A0CC

loc_10009F06:
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009F0F:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 8
jnz     short loc_10009F3D
push    1
mov     edx, [ebp+a1]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_10009F3B
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009F3B:
jmp     short loc_10009F98

loc_10009F3D:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009F60
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009F60:
mov     ax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetVBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_10009F98
movsx   eax, [ebp+var_4]
cmp     eax, 0FFFFFFFDh
jnz     short loc_10009F8F
mov     ax, [ebp+var_4]
jmp     loc_1000A0CC

loc_10009F8F:
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009F98:
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStartFreq
add     esp, 0Ch
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStopFreq
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_10009FD5
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009FD5:
mov     dx, [ebp+arg_1C]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRefLevel
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jge     short loc_10009FFB
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_10009FFB:
mov     edx, [ebp+arg_20]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetNumCells
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A020
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_1000A020:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetSwpIdx
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A043
or      ax, 0FFFFh
jmp     loc_1000A0CC

loc_1000A043:
movsx   ecx, ds:word_10016148
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetDefltPts
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A069
or      ax, 0FFFFh
jmp     short loc_1000A0CC

loc_1000A069:
mov     ecx, [ebp+a1]
push    ecx
call    SetDetectLog
add     esp, 4
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_1000A087
or      ax, 0FFFFh
jmp     short loc_1000A0CC

loc_1000A087:
push    5
mov     eax, [ebp+a1]
push    eax
call    SetSweepCode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A0A7
or      ax, 0FFFFh
jmp     short loc_1000A0CC

loc_1000A0A7:
push    1
push    0
mov     edx, [ebp+a1]
push    edx
call    SetTrigMode
add     esp, 0Ch
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A0C9
or      ax, 0FFFFh
jmp     short loc_1000A0CC

loc_1000A0C9:
xor     ax, ax

loc_1000A0CC:
mov     esp, ebp
pop     ebp
retn
InitGuiSweep endp

; Exported entry  56. InitFreqHop


; Attributes: bp-based frame

public InitFreqHop
InitFreqHop proc near

var_4= word ptr -4
arg_0= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
arg_C= word ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0FFFFh
cmp     [ebp+arg_0], 0
jnz     short loc_1000A0E9
mov     ax, 0FFF6h
jmp     loc_1000A31C

loc_1000A0E9:
cmp     [ebp+arg_10], 0
jge     short loc_1000A101
cmp     [ebp+arg_10], 400h
jle     short loc_1000A101
mov     ax, 0FFFDh
jmp     loc_1000A31C

loc_1000A101:
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetAutoCell
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A124
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A124:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetCellMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A147
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A147:
push    1
mov     ecx, [ebp+arg_0]
push    ecx
call    SwpTimeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   edx, [ebp+var_4]
test    edx, edx
jz      short loc_1000A16A
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A16A:
push    1
mov     eax, [ebp+arg_0]
push    eax
call    StepSizeMode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A18D
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A18D:
movsx   edx, [ebp+arg_4]
cmp     edx, 5
jnz     short loc_1000A1BB
push    1
mov     eax, [ebp+arg_0]
push    eax
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A1B9
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A1B9:
jmp     short loc_1000A216

loc_1000A1BB:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A1DE
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A1DE:
mov     cx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetRBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A216
movsx   ecx, [ebp+var_4]
cmp     ecx, 0FFFFFFFDh
jnz     short loc_1000A20D
mov     ax, [ebp+var_4]
jmp     loc_1000A31C

loc_1000A20D:
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A216:
movsx   edx, [ebp+arg_8]
cmp     edx, 8
jnz     short loc_1000A244
push    1
mov     eax, [ebp+arg_0]
push    eax
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A242
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A242:
jmp     short loc_1000A2B6

loc_1000A244:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A267
or      ax, 0FFFFh
jmp     loc_1000A31C

loc_1000A267:
mov     cx, [ebp+arg_8]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetVBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A2B6
mov     cx, [ebp+arg_4]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetRBW
add     esp, 8
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A2B6
movsx   ecx, [ebp+var_4]
cmp     ecx, 0FFFFFFFDh
jnz     short loc_1000A2B0
mov     ax, [ebp+var_4]
jmp     short loc_1000A31C

loc_1000A2B0:
or      ax, 0FFFFh
jmp     short loc_1000A31C

loc_1000A2B6:
mov     dx, [ebp+arg_C]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetRefLevel
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jge     short loc_1000A2D9
or      ax, 0FFFFh
jmp     short loc_1000A31C

loc_1000A2D9:
mov     edx, [ebp+arg_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetHopTabCnt
add     esp, 8
mov     [ebp+var_4], ax
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jz      short loc_1000A2FB
or      ax, 0FFFFh
jmp     short loc_1000A31C

loc_1000A2FB:
mov     edx, [ebp+arg_0]
push    edx
call    SetDetectLog
add     esp, 4
mov     [ebp+var_4], ax
movsx   eax, [ebp+var_4]
test    eax, eax
jz      short loc_1000A319
or      ax, 0FFFFh
jmp     short loc_1000A31C

loc_1000A319:
xor     ax, ax

loc_1000A31C:
mov     esp, ebp
pop     ebp
retn
InitFreqHop endp

; Exported entry  68. MeasureAmplWithFreq


; Attributes: bp-based frame

; int __cdecl MeasureAmplWithFreq(int, __int16, __int16, double, double, __int16, int, __int16, __int16, int, int)
public MeasureAmplWithFreq
MeasureAmplWithFreq proc near

var_20= dword ptr -20h
lpMem= dword ptr -1Ch
var_18= dword ptr -18h
var_14= word ptr -14h
var_10= word ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= qword ptr  1Ch
arg_1C= word ptr  24h
arg_20= dword ptr  28h
arg_24= word ptr  2Ch
arg_28= word ptr  30h
arg_2C= dword ptr  34h
arg_30= dword ptr  38h

push    ebp
mov     ebp, esp
sub     esp, 20h
mov     [ebp+var_4], 0
mov     [ebp+var_10], 0
cmp     [ebp+arg_30], 0
jz      short loc_1000A33E
cmp     [ebp+arg_2C], 0
jnz     short loc_1000A347

loc_1000A33E:
mov     ax, 0FFFDh
jmp     loc_1000A743

loc_1000A347:
fld     [ebp+freq]
fcomp   [ebp+arg_14]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000A35D
mov     ax, 0FFFBh
jmp     loc_1000A743

loc_1000A35D:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000A381
mov     ax, 0FFFDh
jmp     loc_1000A743

loc_1000A381:
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000A3A5
mov     ax, 0FFFDh
jmp     loc_1000A743

loc_1000A3A5:
movsx   edx, [ebp+arg_24]
cmp     edx, 2
jz      short loc_1000A3C0
movsx   eax, [ebp+arg_24]
cmp     eax, 4
jz      short loc_1000A3C0
mov     ax, 0FFFDh
jmp     loc_1000A743

loc_1000A3C0:
movsx   ecx, [ebp+arg_28]
test    ecx, ecx
jz      short loc_1000A3E3
movsx   edx, [ebp+arg_28]
cmp     edx, 1
jz      short loc_1000A3E3
movsx   eax, [ebp+arg_28]
cmp     eax, 2
jz      short loc_1000A3E3
mov     ax, 0FFFDh
jmp     loc_1000A743

loc_1000A3E3:
movsx   ecx, [ebp+arg_24]
or      ecx, 9
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetSweepCode
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000A40C
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A40C:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 5
jnz     short loc_1000A43A
push    1
mov     edx, [ebp+a1]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000A438
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A438:
jmp     short loc_1000A495

loc_1000A43A:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A45D
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A45D:
mov     ax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetRBW
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A495
movsx   eax, [ebp+var_14]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000A48C
mov     ax, [ebp+var_14]
jmp     loc_1000A743

loc_1000A48C:
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A495:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 8
jnz     short loc_1000A4C3
push    1
mov     edx, [ebp+a1]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000A4C1
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A4C1:
jmp     short loc_1000A51E

loc_1000A4C3:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A4E6
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A4E6:
mov     ax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetVBW
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A51E
movsx   eax, [ebp+var_14]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000A515
mov     ax, [ebp+var_14]
jmp     loc_1000A743

loc_1000A515:
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A51E:
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStartFreq
add     esp, 0Ch
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStopFreq
add     esp, 0Ch
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jz      short loc_1000A55B
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A55B:
mov     dx, [ebp+arg_1C]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRefLevel
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jge     short loc_1000A581
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A581:
mov     edx, [ebp+arg_20]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetNumCells
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jz      short loc_1000A5B8
movsx   edx, [ebp+var_14]
cmp     edx, 0FFFFFFFDh
jnz     short loc_1000A5AF
mov     ax, [ebp+var_14]
jmp     loc_1000A743

loc_1000A5AF:
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A5B8:
mov     eax, [ebp+a1]
push    eax
call    RdNumSwpPts
add     esp, 4
mov     [ebp+var_18], eax
mov     ecx, [ebp+var_18]
lea     edx, [ecx+ecx+2]
push    edx
call    sub_1000DA64
add     esp, 4
mov     [ebp+lpMem], eax
cmp     [ebp+lpMem], 0
jnz     short loc_1000A5E9
or      ax, 0FFFFh
jmp     loc_1000A743

loc_1000A5E9:
push    0
mov     eax, [ebp+a1]
push    eax
call    BreakSweep
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
cmp     ecx, 41h
jz      short loc_1000A60F
mov     [ebp+var_10], 0FFFFh
jmp     loc_1000A733

loc_1000A60F:
mov     edx, [ebp+a1]
push    edx
call    StartSweep
add     esp, 4
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
cmp     eax, 41h
jz      short loc_1000A633
mov     [ebp+var_10], 0FFFFh
jmp     loc_1000A733

loc_1000A633:
mov     ecx, [ebp+arg_30]
push    ecx
mov     edx, [ebp+lpMem]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetAmplWithFreqExt
add     esp, 0Ch
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jz      short loc_1000A65B
mov     [ebp+var_10], 0FFFFh
jmp     short loc_1000A672

loc_1000A65B:
mov     edx, [ebp+a1]
push    edx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_8], eax
mov     eax, [ebp+var_8]
cmp     eax, [ebp+var_18]
jl      short loc_1000A633

loc_1000A672:
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jz      short loc_1000A67F
jmp     loc_1000A733

loc_1000A67F:
mov     [ebp+var_C], 0
jmp     short loc_1000A691

loc_1000A688:
mov     edx, [ebp+var_C]
add     edx, 1
mov     [ebp+var_C], edx

loc_1000A691:
mov     eax, [ebp+var_C]
cmp     eax, [ebp+var_18]
jge     loc_1000A727
movsx   ecx, [ebp+arg_28]
mov     [ebp+var_20], ecx
cmp     [ebp+var_20], 0
jz      short loc_1000A6B8
cmp     [ebp+var_20], 1
jz      short loc_1000A6DA
cmp     [ebp+var_20], 2
jz      short loc_1000A702
jmp     short loc_1000A722

loc_1000A6B8:
mov     edx, [ebp+var_C]
mov     eax, [ebp+lpMem]
mov     cx, [eax+edx*2]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetDbmForAmpl
add     esp, 8
mov     eax, [ebp+var_C]
mov     ecx, [ebp+arg_2C]
fstp    qword ptr [ecx+eax*8]
jmp     short loc_1000A722

loc_1000A6DA:
mov     edx, [ebp+var_C]
mov     eax, [ebp+lpMem]
mov     cx, [eax+edx*2]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetnVForAmpl
add     esp, 8
fdiv    ds:dbl_10016150
mov     eax, [ebp+var_C]
mov     ecx, [ebp+arg_2C]
fstp    qword ptr [ecx+eax*8]
jmp     short loc_1000A722

loc_1000A702:
mov     edx, [ebp+var_C]
mov     eax, [ebp+lpMem]
mov     cx, [eax+edx*2]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetnVForAmpl
add     esp, 8
mov     eax, [ebp+var_C]
mov     ecx, [ebp+arg_2C]
fstp    qword ptr [ecx+eax*8]

loc_1000A722:
jmp     loc_1000A688

loc_1000A727:
movsx   edx, [ebp+var_4]
test    edx, edx
jnz     loc_1000A5B8

loc_1000A733:
mov     eax, [ebp+lpMem]
push    eax             ; lpMem
call    sub_1000D97B
add     esp, 4
mov     ax, [ebp+var_10]

loc_1000A743:
mov     esp, ebp
pop     ebp
retn
MeasureAmplWithFreq endp

; Exported entry  67. MeasureAmplData


; Attributes: bp-based frame

; int __cdecl MeasureAmplData(int, __int16, __int16, double, double, __int16, int, __int16, __int16, int)
public MeasureAmplData
MeasureAmplData proc near

var_20= dword ptr -20h
lpMem= dword ptr -1Ch
var_18= dword ptr -18h
var_14= word ptr -14h
var_10= word ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= qword ptr  1Ch
arg_1C= word ptr  24h
arg_20= dword ptr  28h
arg_24= word ptr  2Ch
arg_28= word ptr  30h
arg_2C= dword ptr  34h

push    ebp
mov     ebp, esp
sub     esp, 20h
mov     [ebp+var_4], 0
mov     [ebp+var_10], 0
cmp     [ebp+arg_2C], 0
jnz     short loc_1000A768
mov     ax, 0FFFDh
jmp     loc_1000AB60

loc_1000A768:
fld     [ebp+freq]
fcomp   [ebp+arg_14]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000A77E
mov     ax, 0FFFBh
jmp     loc_1000AB60

loc_1000A77E:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000A7A2
mov     ax, 0FFFDh
jmp     loc_1000AB60

loc_1000A7A2:
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000A7C6
mov     ax, 0FFFDh
jmp     loc_1000AB60

loc_1000A7C6:
movsx   edx, [ebp+arg_24]
cmp     edx, 2
jz      short loc_1000A7E1
movsx   eax, [ebp+arg_24]
cmp     eax, 4
jz      short loc_1000A7E1
mov     ax, 0FFFDh
jmp     loc_1000AB60

loc_1000A7E1:
movsx   ecx, [ebp+arg_28]
test    ecx, ecx
jz      short loc_1000A804
movsx   edx, [ebp+arg_28]
cmp     edx, 1
jz      short loc_1000A804
movsx   eax, [ebp+arg_28]
cmp     eax, 2
jz      short loc_1000A804
mov     ax, 0FFFDh
jmp     loc_1000AB60

loc_1000A804:
movsx   ecx, [ebp+arg_24]
or      ecx, 1
push    ecx
mov     edx, [ebp+a1]
push    edx
call    SetSweepCode
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000A82D
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A82D:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 5
jnz     short loc_1000A85B
push    1
mov     edx, [ebp+a1]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000A859
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A859:
jmp     short loc_1000A8B6

loc_1000A85B:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A87E
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A87E:
mov     ax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetRBW
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A8B6
movsx   eax, [ebp+var_14]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000A8AD
mov     ax, [ebp+var_14]
jmp     loc_1000AB60

loc_1000A8AD:
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A8B6:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 8
jnz     short loc_1000A8E4
push    1
mov     edx, [ebp+a1]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000A8E2
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A8E2:
jmp     short loc_1000A93F

loc_1000A8E4:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A907
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A907:
mov     ax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetVBW
add     esp, 8
mov     [ebp+var_14], ax
movsx   edx, [ebp+var_14]
test    edx, edx
jz      short loc_1000A93F
movsx   eax, [ebp+var_14]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000A936
mov     ax, [ebp+var_14]
jmp     loc_1000AB60

loc_1000A936:
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A93F:
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStartFreq
add     esp, 0Ch
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStopFreq
add     esp, 0Ch
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jz      short loc_1000A97C
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A97C:
mov     dx, [ebp+arg_1C]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRefLevel
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jge     short loc_1000A9A2
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A9A2:
mov     edx, [ebp+arg_20]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetNumCells
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jz      short loc_1000A9D9
movsx   edx, [ebp+var_14]
cmp     edx, 0FFFFFFFDh
jnz     short loc_1000A9D0
mov     ax, [ebp+var_14]
jmp     loc_1000AB60

loc_1000A9D0:
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000A9D9:
mov     eax, [ebp+a1]
push    eax
call    RdNumSwpPts
add     esp, 4
mov     [ebp+var_18], eax
mov     ecx, [ebp+var_18]
lea     edx, [ecx+ecx+2]
push    edx
call    sub_1000DA64
add     esp, 4
mov     [ebp+lpMem], eax
cmp     [ebp+lpMem], 0
jnz     short loc_1000AA0A
or      ax, 0FFFFh
jmp     loc_1000AB60

loc_1000AA0A:
push    0
mov     eax, [ebp+a1]
push    eax
call    BreakSweep
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
cmp     ecx, 41h
jz      short loc_1000AA30
mov     [ebp+var_10], 0FFFFh
jmp     loc_1000AB50

loc_1000AA30:
mov     edx, [ebp+a1]
push    edx
call    StartSweep
add     esp, 4
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
cmp     eax, 41h
jz      short loc_1000AA54
mov     [ebp+var_10], 0FFFFh
jmp     loc_1000AB50

loc_1000AA54:
mov     ecx, [ebp+lpMem]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetAmplData
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000AA78
mov     [ebp+var_10], 0FFFFh
jmp     short loc_1000AA8F

loc_1000AA78:
mov     ecx, [ebp+a1]
push    ecx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_8], eax
mov     edx, [ebp+var_8]
cmp     edx, [ebp+var_18]
jl      short loc_1000AA54

loc_1000AA8F:
movsx   eax, [ebp+var_14]
test    eax, eax
jz      short loc_1000AA9C
jmp     loc_1000AB50

loc_1000AA9C:
mov     [ebp+var_C], 0
jmp     short loc_1000AAAE

loc_1000AAA5:
mov     ecx, [ebp+var_C]
add     ecx, 1
mov     [ebp+var_C], ecx

loc_1000AAAE:
mov     edx, [ebp+var_C]
cmp     edx, [ebp+var_18]
jge     loc_1000AB44
movsx   eax, [ebp+arg_28]
mov     [ebp+var_20], eax
cmp     [ebp+var_20], 0
jz      short loc_1000AAD5
cmp     [ebp+var_20], 1
jz      short loc_1000AAF7
cmp     [ebp+var_20], 2
jz      short loc_1000AB1F
jmp     short loc_1000AB3F

loc_1000AAD5:
mov     ecx, [ebp+var_C]
mov     edx, [ebp+lpMem]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetDbmForAmpl
add     esp, 8
mov     edx, [ebp+var_C]
mov     eax, [ebp+arg_2C]
fstp    qword ptr [eax+edx*8]
jmp     short loc_1000AB3F

loc_1000AAF7:
mov     ecx, [ebp+var_C]
mov     edx, [ebp+lpMem]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetnVForAmpl
add     esp, 8
fdiv    ds:dbl_10016150
mov     edx, [ebp+var_C]
mov     eax, [ebp+arg_2C]
fstp    qword ptr [eax+edx*8]
jmp     short loc_1000AB3F

loc_1000AB1F:
mov     ecx, [ebp+var_C]
mov     edx, [ebp+lpMem]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetnVForAmpl
add     esp, 8
mov     edx, [ebp+var_C]
mov     eax, [ebp+arg_2C]
fstp    qword ptr [eax+edx*8]

loc_1000AB3F:
jmp     loc_1000AAA5

loc_1000AB44:
movsx   ecx, [ebp+var_4]
test    ecx, ecx
jnz     loc_1000A9D9

loc_1000AB50:
mov     edx, [ebp+lpMem]
push    edx             ; lpMem
call    sub_1000D97B
add     esp, 4
mov     ax, [ebp+var_10]

loc_1000AB60:
mov     esp, ebp
pop     ebp
retn
MeasureAmplData endp

; Exported entry  70. MeasureMinMaxAmplWithFreq


; Attributes: bp-based frame

; int __cdecl MeasureMinMaxAmplWithFreq(int, __int16, __int16, double, double, __int16, int, __int16, int, int, int, int)
public MeasureMinMaxAmplWithFreq
MeasureMinMaxAmplWithFreq proc near

var_24= dword ptr -24h
lpMem= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= word ptr -18h
var_14= word ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= qword ptr  1Ch
arg_1C= word ptr  24h
arg_20= dword ptr  28h
arg_24= word ptr  2Ch
arg_28= dword ptr  30h
arg_2C= dword ptr  34h
arg_30= dword ptr  38h
arg_34= dword ptr  3Ch

push    ebp
mov     ebp, esp
sub     esp, 24h
mov     [ebp+var_8], 0
mov     [ebp+var_14], 0
cmp     [ebp+arg_30], 0
jz      short loc_1000AB8E
cmp     [ebp+arg_28], 0
jz      short loc_1000AB8E
cmp     [ebp+arg_34], 0
jz      short loc_1000AB8E
cmp     [ebp+arg_2C], 0
jnz     short loc_1000AB97

loc_1000AB8E:
mov     ax, 0FFFDh
jmp     loc_1000B00F

loc_1000AB97:
fld     [ebp+freq]
fcomp   [ebp+arg_14]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000ABAD
mov     ax, 0FFFBh
jmp     loc_1000B00F

loc_1000ABAD:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000ABD1
mov     ax, 0FFFDh
jmp     loc_1000B00F

loc_1000ABD1:
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000ABF5
mov     ax, 0FFFDh
jmp     loc_1000B00F

loc_1000ABF5:
movsx   edx, [ebp+arg_24]
test    edx, edx
jz      short loc_1000AC18
movsx   eax, [ebp+arg_24]
cmp     eax, 1
jz      short loc_1000AC18
movsx   ecx, [ebp+arg_24]
cmp     ecx, 2
jz      short loc_1000AC18
mov     ax, 0FFFDh
jmp     loc_1000B00F

loc_1000AC18:
push    0Fh
mov     edx, [ebp+a1]
push    edx
call    SetSweepCode
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000AC3B
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AC3B:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 5
jnz     short loc_1000AC69
push    1
mov     edx, [ebp+a1]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000AC67
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AC67:
jmp     short loc_1000ACC4

loc_1000AC69:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000AC8C
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AC8C:
mov     ax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetRBW
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000ACC4
movsx   eax, [ebp+var_18]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000ACBB
mov     ax, [ebp+var_18]
jmp     loc_1000B00F

loc_1000ACBB:
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000ACC4:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 8
jnz     short loc_1000ACF2
push    1
mov     edx, [ebp+a1]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000ACF0
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000ACF0:
jmp     short loc_1000AD4D

loc_1000ACF2:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000AD15
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AD15:
mov     ax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetVBW
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000AD4D
movsx   eax, [ebp+var_18]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000AD44
mov     ax, [ebp+var_18]
jmp     loc_1000B00F

loc_1000AD44:
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AD4D:
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStartFreq
add     esp, 0Ch
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStopFreq
add     esp, 0Ch
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
test    ecx, ecx
jz      short loc_1000AD8A
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AD8A:
mov     dx, [ebp+arg_1C]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRefLevel
add     esp, 8
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
test    ecx, ecx
jge     short loc_1000ADB0
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000ADB0:
mov     edx, [ebp+arg_20]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetNumCells
add     esp, 8
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
test    ecx, ecx
jz      short loc_1000ADE7
movsx   edx, [ebp+var_18]
cmp     edx, 0FFFFFFFDh
jnz     short loc_1000ADDE
mov     ax, [ebp+var_18]
jmp     loc_1000B00F

loc_1000ADDE:
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000ADE7:
mov     eax, [ebp+a1]
push    eax
call    RdNumSwpPts
add     esp, 4
mov     [ebp+var_1C], eax
mov     ecx, [ebp+var_1C]
lea     edx, [ecx+ecx+2]
push    edx
call    sub_1000DA64
add     esp, 4
mov     [ebp+lpMem], eax
mov     eax, [ebp+var_1C]
lea     ecx, [eax+eax+2]
push    ecx
call    sub_1000DA64
add     esp, 4
mov     [ebp+var_4], eax
cmp     [ebp+lpMem], 0
jz      short loc_1000AE28
cmp     [ebp+var_4], 0
jnz     short loc_1000AE31

loc_1000AE28:
or      ax, 0FFFFh
jmp     loc_1000B00F

loc_1000AE31:
push    0
mov     edx, [ebp+a1]
push    edx
call    BreakSweep
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
cmp     eax, 41h
jz      short loc_1000AE57
mov     [ebp+var_14], 0FFFFh
jmp     loc_1000AFF3

loc_1000AE57:
mov     ecx, [ebp+a1]
push    ecx
call    StartSweep
add     esp, 4
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
cmp     edx, 41h
jz      short loc_1000AE7B
mov     [ebp+var_14], 0FFFFh
jmp     loc_1000AFF3

loc_1000AE7B:
mov     eax, [ebp+arg_34]
push    eax
mov     ecx, [ebp+arg_30]
push    ecx
mov     edx, [ebp+var_4]
push    edx
mov     eax, [ebp+lpMem]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetMinMaxAmplWithFreqExt
add     esp, 14h
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000AEAB
mov     [ebp+var_14], 0FFFFh
jmp     short loc_1000AEC2

loc_1000AEAB:
mov     eax, [ebp+a1]
push    eax
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_C], eax
mov     ecx, [ebp+var_C]
cmp     ecx, [ebp+var_1C]
jl      short loc_1000AE7B

loc_1000AEC2:
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000AECF
jmp     loc_1000AFF3

loc_1000AECF:
mov     [ebp+var_10], 0
jmp     short loc_1000AEE1

loc_1000AED8:
mov     eax, [ebp+var_10]
add     eax, 1
mov     [ebp+var_10], eax

loc_1000AEE1:
mov     ecx, [ebp+var_10]
cmp     ecx, [ebp+var_1C]
jge     loc_1000AFE7
movsx   edx, [ebp+arg_24]
mov     [ebp+var_24], edx
cmp     [ebp+var_24], 0
jz      short loc_1000AF0F
cmp     [ebp+var_24], 1
jz      short loc_1000AF54
cmp     [ebp+var_24], 2
jz      loc_1000AFA2
jmp     loc_1000AFE2

loc_1000AF0F:
mov     eax, [ebp+var_10]
mov     ecx, [ebp+lpMem]
mov     dx, [ecx+eax*2]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetDbmForAmpl
add     esp, 8
mov     ecx, [ebp+var_10]
mov     edx, [ebp+arg_28]
fstp    qword ptr [edx+ecx*8]
mov     eax, [ebp+var_10]
mov     ecx, [ebp+var_4]
mov     dx, [ecx+eax*2]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetDbmForAmpl
add     esp, 8
mov     ecx, [ebp+var_10]
mov     edx, [ebp+arg_2C]
fstp    qword ptr [edx+ecx*8]
jmp     loc_1000AFE2

loc_1000AF54:
mov     eax, [ebp+var_10]
mov     ecx, [ebp+lpMem]
mov     dx, [ecx+eax*2]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetnVForAmpl
add     esp, 8
fdiv    ds:dbl_10016150
mov     ecx, [ebp+var_10]
mov     edx, [ebp+arg_28]
fstp    qword ptr [edx+ecx*8]
mov     eax, [ebp+var_10]
mov     ecx, [ebp+var_4]
mov     dx, [ecx+eax*2]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetnVForAmpl
add     esp, 8
fdiv    ds:dbl_10016150
mov     ecx, [ebp+var_10]
mov     edx, [ebp+arg_2C]
fstp    qword ptr [edx+ecx*8]
jmp     short loc_1000AFE2

loc_1000AFA2:
mov     eax, [ebp+var_10]
mov     ecx, [ebp+lpMem]
mov     dx, [ecx+eax*2]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetnVForAmpl
add     esp, 8
mov     ecx, [ebp+var_10]
mov     edx, [ebp+arg_28]
fstp    qword ptr [edx+ecx*8]
mov     eax, [ebp+var_10]
mov     ecx, [ebp+var_4]
mov     dx, [ecx+eax*2]
push    edx
mov     eax, [ebp+a1]
push    eax
call    GetnVForAmpl
add     esp, 8
mov     ecx, [ebp+var_10]
mov     edx, [ebp+arg_2C]
fstp    qword ptr [edx+ecx*8]

loc_1000AFE2:
jmp     loc_1000AED8

loc_1000AFE7:
movsx   eax, [ebp+var_8]
test    eax, eax
jnz     loc_1000ADE7

loc_1000AFF3:
mov     ecx, [ebp+lpMem]
push    ecx             ; lpMem
call    sub_1000D97B
add     esp, 4
mov     edx, [ebp+var_4]
push    edx             ; lpMem
call    sub_1000D97B
add     esp, 4
mov     ax, [ebp+var_14]

loc_1000B00F:
mov     esp, ebp
pop     ebp
retn
MeasureMinMaxAmplWithFreq endp

; Exported entry  69. MeasureMinMaxAmpl


; Attributes: bp-based frame

; int __cdecl MeasureMinMaxAmpl(int, __int16, __int16, double, double, __int16, int, __int16, int, int)
public MeasureMinMaxAmpl
MeasureMinMaxAmpl proc near

var_24= dword ptr -24h
lpMem= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= word ptr -18h
var_14= word ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
a1= dword ptr  8
arg_4= word ptr  0Ch
arg_8= word ptr  10h
freq= qword ptr  14h
arg_14= qword ptr  1Ch
arg_1C= word ptr  24h
arg_20= dword ptr  28h
arg_24= word ptr  2Ch
arg_28= dword ptr  30h
arg_2C= dword ptr  34h

push    ebp
mov     ebp, esp
sub     esp, 24h
mov     [ebp+var_8], 0
mov     [ebp+var_14], 0
cmp     [ebp+arg_28], 0
jz      short loc_1000B031
cmp     [ebp+arg_2C], 0
jnz     short loc_1000B03A

loc_1000B031:
mov     ax, 0FFFDh
jmp     loc_1000B4AA

loc_1000B03A:
fld     [ebp+freq]
fcomp   [ebp+arg_14]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000B050
mov     ax, 0FFFBh
jmp     loc_1000B4AA

loc_1000B050:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000B074
mov     ax, 0FFFDh
jmp     loc_1000B4AA

loc_1000B074:
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000B098
mov     ax, 0FFFDh
jmp     loc_1000B4AA

loc_1000B098:
movsx   edx, [ebp+arg_24]
test    edx, edx
jz      short loc_1000B0BB
movsx   eax, [ebp+arg_24]
cmp     eax, 1
jz      short loc_1000B0BB
movsx   ecx, [ebp+arg_24]
cmp     ecx, 2
jz      short loc_1000B0BB
mov     ax, 0FFFDh
jmp     loc_1000B4AA

loc_1000B0BB:
push    7
mov     edx, [ebp+a1]
push    edx
call    SetSweepCode
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000B0DE
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B0DE:
movsx   ecx, [ebp+arg_4]
cmp     ecx, 5
jnz     short loc_1000B10C
push    1
mov     edx, [ebp+a1]
push    edx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000B10A
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B10A:
jmp     short loc_1000B167

loc_1000B10C:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetRBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000B12F
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B12F:
mov     ax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetRBW
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000B167
movsx   eax, [ebp+var_18]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000B15E
mov     ax, [ebp+var_18]
jmp     loc_1000B4AA

loc_1000B15E:
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B167:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 8
jnz     short loc_1000B195
push    1
mov     edx, [ebp+a1]
push    edx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000B193
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B193:
jmp     short loc_1000B1F0

loc_1000B195:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetVBWmode
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000B1B8
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B1B8:
mov     ax, [ebp+arg_8]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    SetVBW
add     esp, 8
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
test    edx, edx
jz      short loc_1000B1F0
movsx   eax, [ebp+var_18]
cmp     eax, 0FFFFFFFDh
jnz     short loc_1000B1E7
mov     ax, [ebp+var_18]
jmp     loc_1000B4AA

loc_1000B1E7:
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B1F0:
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStartFreq
add     esp, 0Ch
mov     ecx, dword ptr [ebp+arg_14+4]
push    ecx
mov     edx, dword ptr [ebp+arg_14]
push    edx             ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    ConfigStopFreq
add     esp, 0Ch
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
test    ecx, ecx
jz      short loc_1000B22D
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B22D:
mov     dx, [ebp+arg_1C]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetRefLevel
add     esp, 8
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
test    ecx, ecx
jge     short loc_1000B253
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B253:
mov     edx, [ebp+arg_20]
push    edx
mov     eax, [ebp+a1]
push    eax
call    SetNumCells
add     esp, 8
mov     [ebp+var_18], ax
movsx   ecx, [ebp+var_18]
test    ecx, ecx
jz      short loc_1000B28A
movsx   edx, [ebp+var_18]
cmp     edx, 0FFFFFFFDh
jnz     short loc_1000B281
mov     ax, [ebp+var_18]
jmp     loc_1000B4AA

loc_1000B281:
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B28A:
mov     eax, [ebp+a1]
push    eax
call    RdNumSwpPts
add     esp, 4
mov     [ebp+var_1C], eax
mov     ecx, [ebp+var_1C]
lea     edx, [ecx+ecx+2]
push    edx
call    sub_1000DA64
add     esp, 4
mov     [ebp+lpMem], eax
mov     eax, [ebp+var_1C]
lea     ecx, [eax+eax+2]
push    ecx
call    sub_1000DA64
add     esp, 4
mov     [ebp+var_4], eax
cmp     [ebp+lpMem], 0
jz      short loc_1000B2CB
cmp     [ebp+var_4], 0
jnz     short loc_1000B2D4

loc_1000B2CB:
or      ax, 0FFFFh
jmp     loc_1000B4AA

loc_1000B2D4:
push    0
mov     edx, [ebp+a1]
push    edx
call    BreakSweep
add     esp, 8
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
cmp     eax, 41h
jz      short loc_1000B2FA
mov     [ebp+var_14], 0FFFFh
jmp     loc_1000B48E

loc_1000B2FA:
mov     ecx, [ebp+a1]
push    ecx
call    StartSweep
add     esp, 4
mov     [ebp+var_18], ax
movsx   edx, [ebp+var_18]
cmp     edx, 41h
jz      short loc_1000B31E
mov     [ebp+var_14], 0FFFFh
jmp     loc_1000B48E

loc_1000B31E:
mov     eax, [ebp+var_4]
push    eax
mov     ecx, [ebp+lpMem]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetMinMaxAmpl
add     esp, 0Ch
mov     [ebp+var_18], ax
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000B346
mov     [ebp+var_14], 0FFFFh
jmp     short loc_1000B35D

loc_1000B346:
mov     ecx, [ebp+a1]
push    ecx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_C], eax
mov     edx, [ebp+var_C]
cmp     edx, [ebp+var_1C]
jl      short loc_1000B31E

loc_1000B35D:
movsx   eax, [ebp+var_18]
test    eax, eax
jz      short loc_1000B36A
jmp     loc_1000B48E

loc_1000B36A:
mov     [ebp+var_10], 0
jmp     short loc_1000B37C

loc_1000B373:
mov     ecx, [ebp+var_10]
add     ecx, 1
mov     [ebp+var_10], ecx

loc_1000B37C:
mov     edx, [ebp+var_10]
cmp     edx, [ebp+var_1C]
jge     loc_1000B482
movsx   eax, [ebp+arg_24]
mov     [ebp+var_24], eax
cmp     [ebp+var_24], 0
jz      short loc_1000B3AA
cmp     [ebp+var_24], 1
jz      short loc_1000B3EF
cmp     [ebp+var_24], 2
jz      loc_1000B43D
jmp     loc_1000B47D

loc_1000B3AA:
mov     ecx, [ebp+var_10]
mov     edx, [ebp+lpMem]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetDbmForAmpl
add     esp, 8
mov     edx, [ebp+var_10]
mov     eax, [ebp+arg_28]
fstp    qword ptr [eax+edx*8]
mov     ecx, [ebp+var_10]
mov     edx, [ebp+var_4]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetDbmForAmpl
add     esp, 8
mov     edx, [ebp+var_10]
mov     eax, [ebp+arg_2C]
fstp    qword ptr [eax+edx*8]
jmp     loc_1000B47D

loc_1000B3EF:
mov     ecx, [ebp+var_10]
mov     edx, [ebp+lpMem]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetnVForAmpl
add     esp, 8
fdiv    ds:dbl_10016150
mov     edx, [ebp+var_10]
mov     eax, [ebp+arg_28]
fstp    qword ptr [eax+edx*8]
mov     ecx, [ebp+var_10]
mov     edx, [ebp+var_4]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetnVForAmpl
add     esp, 8
fdiv    ds:dbl_10016150
mov     edx, [ebp+var_10]
mov     eax, [ebp+arg_2C]
fstp    qword ptr [eax+edx*8]
jmp     short loc_1000B47D

loc_1000B43D:
mov     ecx, [ebp+var_10]
mov     edx, [ebp+lpMem]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetnVForAmpl
add     esp, 8
mov     edx, [ebp+var_10]
mov     eax, [ebp+arg_28]
fstp    qword ptr [eax+edx*8]
mov     ecx, [ebp+var_10]
mov     edx, [ebp+var_4]
mov     ax, [edx+ecx*2]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    GetnVForAmpl
add     esp, 8
mov     edx, [ebp+var_10]
mov     eax, [ebp+arg_2C]
fstp    qword ptr [eax+edx*8]

loc_1000B47D:
jmp     loc_1000B373

loc_1000B482:
movsx   ecx, [ebp+var_8]
test    ecx, ecx
jnz     loc_1000B28A

loc_1000B48E:
mov     edx, [ebp+lpMem]
push    edx             ; lpMem
call    sub_1000D97B
add     esp, 4
mov     eax, [ebp+var_4]
push    eax             ; lpMem
call    sub_1000D97B
add     esp, 4
mov     ax, [ebp+var_14]

loc_1000B4AA:
mov     esp, ebp
pop     ebp
retn
MeasureMinMaxAmpl endp

align 10h
; Exported entry  76. RBWCodeFromFreq


; Attributes: bp-based frame

; int __cdecl RBWCodeFromFreq(double)
public RBWCodeFromFreq
RBWCodeFromFreq proc near

var_8= word ptr -8
var_4= word ptr -4
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_8], 0FFFDh
mov     [ebp+var_4], 0
jmp     short loc_1000B4D0

loc_1000B4C4:
mov     ax, [ebp+var_4]
add     ax, 1
mov     [ebp+var_4], ax

loc_1000B4D0:
movsx   ecx, [ebp+var_4]
cmp     ecx, 4
jg      short loc_1000B4FA
movsx   edx, [ebp+var_4]
fld     [ebp+arg_0]
fcomp   dbl_10018298[edx*8]
fnstsw  ax
test    ah, 40h
jz      short loc_1000B4F8
mov     ax, [ebp+var_4]
mov     [ebp+var_8], ax
jmp     short loc_1000B4FA

loc_1000B4F8:
jmp     short loc_1000B4C4

loc_1000B4FA:
mov     ax, [ebp+var_8]
mov     esp, ebp
pop     ebp
retn
RBWCodeFromFreq endp

; Exported entry 195. VBWCodeFromFreq


; Attributes: bp-based frame

; int __cdecl VBWCodeFromFreq(double)
public VBWCodeFromFreq
VBWCodeFromFreq proc near

var_8= word ptr -8
var_4= word ptr -4
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_8], 0FFFDh
mov     [ebp+var_4], 1
jmp     short loc_1000B522

loc_1000B516:
mov     ax, [ebp+var_4]
add     ax, 1
mov     [ebp+var_4], ax

loc_1000B522:
movsx   ecx, [ebp+var_4]
cmp     ecx, 7
jg      short loc_1000B54C
movsx   edx, [ebp+var_4]
fld     [ebp+arg_0]
fcomp   dbl_100182C0[edx*8]
fnstsw  ax
test    ah, 40h
jz      short loc_1000B54A
mov     ax, [ebp+var_4]
mov     [ebp+var_8], ax
jmp     short loc_1000B54C

loc_1000B54A:
jmp     short loc_1000B516

loc_1000B54C:
mov     ax, [ebp+var_8]
mov     esp, ebp
pop     ebp
retn
VBWCodeFromFreq endp

; Exported entry  77. RBWFreqFromCode


; Attributes: bp-based frame

public RBWFreqFromCode
RBWFreqFromCode proc near

code= word ptr  8

push    ebp
mov     ebp, esp
movsx   eax, [ebp+code]
test    eax, eax
jl      short loc_1000B568
movsx   ecx, [ebp+code]
cmp     ecx, 4
jle     short loc_1000B570

loc_1000B568:
fld     ds:dbl_10016158
jmp     short loc_1000B57B

loc_1000B570:
movsx   edx, [ebp+code]
fld     dbl_10018298[edx*8]

loc_1000B57B:
pop     ebp
retn
RBWFreqFromCode endp

; Exported entry 196. VBWFreqFromCode


; Attributes: bp-based frame

public VBWFreqFromCode
VBWFreqFromCode proc near

code= word ptr  8

push    ebp
mov     ebp, esp
movsx   eax, [ebp+code]
test    eax, eax
jl      short loc_1000B591
movsx   ecx, [ebp+code]
cmp     ecx, 7
jle     short loc_1000B599

loc_1000B591:
fld     ds:dbl_10016158
jmp     short loc_1000B5A4

loc_1000B599:
movsx   edx, [ebp+code]
fld     dbl_100182C0[edx*8]

loc_1000B5A4:
pop     ebp
retn
VBWFreqFromCode endp

; Exported entry  66. LoadHopTableExt


; Attributes: bp-based frame

public LoadHopTableExt
LoadHopTableExt proc near

var_14= word ptr -14h
var_10= word ptr -10h
var_C= word ptr -0Ch
var_A= word ptr -0Ah
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 14h
mov     [ebp+var_10], 0
mov     [ebp+var_14], 0
mov     [ebp+var_4], 400h
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000B5E2
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000B740

loc_1000B5E2:
push    5
mov     eax, [ebp+a1]
push    eax
call    sub_10003AED
add     esp, 8
mov     [ebp+var_14], ax
movsx   ecx, [ebp+var_14]
test    ecx, ecx
jnz     short loc_1000B60F
mov     edx, [ebp+a1]
push    edx
call    CheckSWStatus
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_1000B618

loc_1000B60F:
mov     ax, 0FFFEh
jmp     loc_1000B740

loc_1000B618:
mov     cx, word ptr [ebp+arg_4]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    sub_10003AED
add     esp, 8
mov     [ebp+var_14], ax
movsx   eax, [ebp+var_14]
test    eax, eax
jnz     short loc_1000B648
mov     ecx, [ebp+a1]
push    ecx
call    CheckSWStatus
add     esp, 4
movsx   edx, ax
test    edx, edx
jz      short loc_1000B651

loc_1000B648:
mov     ax, 0FFFEh
jmp     loc_1000B740

loc_1000B651:
mov     [ebp+var_10], 0
jmp     short loc_1000B665

loc_1000B659:
mov     ax, [ebp+var_10]
add     ax, 1
mov     [ebp+var_10], ax

loc_1000B665:
movsx   ecx, [ebp+var_10]
cmp     ecx, [ebp+arg_4]
jge     short loc_1000B6D0
movsx   edx, [ebp+var_10]
mov     eax, [ebp+arg_8]
mov     ecx, [eax+edx*8+4]
push    ecx
mov     edx, [eax+edx*8]
push    edx             ; value
mov     eax, [ebp+a1]
push    eax             ; a1
call    sub_10002DF9
add     esp, 0Ch
mov     [ebp+var_8], eax
mov     ecx, [ebp+var_8]
and     ecx, 0FFFFh
mov     [ebp+var_C], cx
mov     edx, [ebp+var_8]
shr     edx, 10h
mov     [ebp+var_A], dx
mov     ax, [ebp+var_C]
push    eax
mov     ecx, [ebp+a1]
push    ecx
call    sub_10003AED
add     esp, 8
mov     [ebp+var_14], ax
mov     dx, [ebp+var_A]
push    edx
mov     eax, [ebp+a1]
push    eax
call    sub_10003AED
add     esp, 8
mov     [ebp+var_14], ax
jmp     short loc_1000B659

loc_1000B6D0:
push    3
mov     ecx, [ebp+a1]
push    ecx
call    sub_10003AED
add     esp, 8
mov     [ebp+var_14], ax
mov     [ebp+var_10], 0
jmp     short loc_1000B6F6

loc_1000B6EA:
mov     dx, [ebp+var_10]
add     dx, 1
mov     [ebp+var_10], dx

loc_1000B6F6:
movsx   eax, [ebp+var_10]
movsx   ecx, [ebp+var_4]
cmp     eax, ecx
jge     short loc_1000B72B
mov     edx, [ebp+a1]
push    edx
call    CheckSWStatus
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_1000B717
jmp     short loc_1000B72B

loc_1000B717:
push    3
mov     ecx, [ebp+a1]
push    ecx
call    sub_10003AED
add     esp, 8
mov     [ebp+var_14], ax
jmp     short loc_1000B6EA

loc_1000B72B:
movsx   edx, [ebp+var_10]
movsx   eax, [ebp+var_4]
cmp     edx, eax
jnz     short loc_1000B73D
mov     ax, 0FFFEh
jmp     short loc_1000B740

loc_1000B73D:
xor     ax, ax

loc_1000B740:
mov     esp, ebp
pop     ebp
retn
LoadHopTableExt endp

; Exported entry  14. ConfigStartFreq


; Attributes: bp-based frame

; int __cdecl ConfigStartFreq(int, double)
public ConfigStartFreq
ConfigStartFreq proc near

a1= dword ptr  8
freq= qword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000B772
push    0FFFFFFFDh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B7D5

loc_1000B772:
mov     edx, [ebp+a1]
mov     eax, dword ptr [ebp+freq]
mov     [edx+8], eax
mov     ecx, dword ptr [ebp+freq+4]
mov     [edx+0Ch], ecx
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
fld     qword ptr [edx+8]
fcomp   qword ptr [eax+10h]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000B7A4
push    3
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B7D5

loc_1000B7A4:
mov     edx, [ebp+a1]
push    edx
call    sub_10001718
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_1000B7C7
push    0FFFFFFFAh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B7D5

loc_1000B7C7:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_1000B7D5:
pop     ebp
retn
ConfigStartFreq endp

; Exported entry  15. ConfigStepSize


; Attributes: bp-based frame

; int __cdecl ConfigStepSize(int, double)
public ConfigStepSize
ConfigStepSize proc near

var_8= qword ptr -8
arg_0= dword ptr  8
arg_4= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000B801
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000B882

loc_1000B801:
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+20h]
cmp     ecx, 1
jnz     short loc_1000B81D
push    0FFFFFFFCh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B882

loc_1000B81D:
fld     [ebp+arg_4]
fcomp   ds:dbl_100160F8
fnstsw  ax
test    ah, 41h
jnz     short loc_1000B855
mov     eax, [ebp+arg_0]
push    eax
call    RdMaxFreqLimit
fstp    [ebp+var_8]
add     esp, 4
mov     ecx, [ebp+arg_0]
push    ecx
call    RdMinFreqLimit
add     esp, 4
fsubr   [ebp+var_8]
fcomp   [ebp+arg_4]
fnstsw  ax
test    ah, 1
jz      short loc_1000B865

loc_1000B855:
push    0FFFFFFFDh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B882

loc_1000B865:
mov     eax, [ebp+arg_0]
mov     ecx, dword ptr [ebp+arg_4]
mov     [eax+18h], ecx
mov     edx, dword ptr [ebp+arg_4+4]
mov     [eax+1Ch], edx
push    0
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8

loc_1000B882:
mov     esp, ebp
pop     ebp
retn
ConfigStepSize endp

; Exported entry  16. ConfigStopFreq


; Attributes: bp-based frame

; int __cdecl ConfigStopFreq(int, double)
public ConfigStopFreq
ConfigStopFreq proc near

a1= dword ptr  8
freq= qword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000B8B4
push    0FFFFFFFDh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B917

loc_1000B8B4:
mov     edx, [ebp+a1]
mov     eax, dword ptr [ebp+freq]
mov     [edx+10h], eax
mov     ecx, dword ptr [ebp+freq+4]
mov     [edx+14h], ecx
mov     edx, [ebp+a1]
mov     eax, [ebp+a1]
fld     qword ptr [edx+8]
fcomp   qword ptr [eax+10h]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000B8E6
push    3
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B917

loc_1000B8E6:
mov     edx, [ebp+a1]
push    edx
call    sub_10001718
add     esp, 4
movsx   eax, ax
test    eax, eax
jz      short loc_1000B909
push    0FFFFFFFAh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B917

loc_1000B909:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_1000B917:
pop     ebp
retn
ConfigStopFreq endp

; Exported entry  17. ConfigTrigFreq


; Attributes: bp-based frame

; int __cdecl ConfigTrigFreq(int, double)
public ConfigTrigFreq
ConfigTrigFreq proc near

a1= dword ptr  8
freq= qword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000B93D
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000B985

loc_1000B93D:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000B968
push    0FFFFFFFDh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B985

loc_1000B968:
mov     edx, [ebp+a1]
mov     eax, dword ptr [ebp+freq]
mov     [edx+78h], eax
mov     ecx, dword ptr [ebp+freq+4]
mov     [edx+7Ch], ecx
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_1000B985:
pop     ebp
retn
ConfigTrigFreq endp

; Exported entry  18. ConfigZspanFreq


; Attributes: bp-based frame

; int __cdecl ConfigZspanFreq(int, double)
public ConfigZspanFreq
ConfigZspanFreq proc near

a1= dword ptr  8
freq= qword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000B9AB
mov     edx, [ebp+a1]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     short loc_1000B9F9

loc_1000B9AB:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000B9D6
push    0FFFFFFFDh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
jmp     short loc_1000B9F9

loc_1000B9D6:
mov     edx, [ebp+a1]
mov     eax, dword ptr [ebp+freq]
mov     [edx+90h], eax
mov     ecx, dword ptr [ebp+freq+4]
mov     [edx+94h], ecx
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8

loc_1000B9F9:
pop     ebp
retn
ConfigZspanFreq endp

; Exported entry  25. FindIdxForSwpFreq


; Attributes: bp-based frame

; int __cdecl FindIdxForSwpFreq(int, int, double)
public FindIdxForSwpFreq
FindIdxForSwpFreq proc near

var_40= qword ptr -40h
var_38= dword ptr -38h
var_34= qword ptr -34h
var_2C= qword ptr -2Ch
var_24= qword ptr -24h
var_1C= qword ptr -1Ch
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= qword ptr -8
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= qword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 38h
mov     [ebp+var_14], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000BA2F
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
movsx   eax, ax
jmp     loc_1000BB18

loc_1000BA2F:
cmp     [ebp+arg_4], 0
jnz     short loc_1000BA3D
or      eax, 0FFFFFFFFh
jmp     loc_1000BB18

loc_1000BA3D:
mov     eax, [ebp+arg_0]
mov     ecx, [eax+0A4h]
mov     [ebp+var_C], ecx
mov     edx, [ebp+arg_0]
mov     eax, [edx+8]
mov     dword ptr [ebp+var_24], eax
mov     ecx, [edx+0Ch]
mov     dword ptr [ebp+var_24+4], ecx
mov     edx, [ebp+arg_0]
mov     eax, [edx+18h]
mov     dword ptr [ebp+var_2C], eax
mov     ecx, [edx+1Ch]
mov     dword ptr [ebp+var_2C+4], ecx
mov     edx, [ebp+var_C]
sub     edx, 1
mov     [ebp+var_38], edx
fild    [ebp+var_38]
fmul    [ebp+var_2C]
fadd    [ebp+var_24]
fcomp   [ebp+arg_8]
fnstsw  ax
test    ah, 41h
jz      short loc_1000BA8E
mov     eax, [ebp+var_C]
sub     eax, 1
jmp     loc_1000BB18

loc_1000BA8E:
fld     [ebp+arg_8]
fcomp   [ebp+var_24]
fnstsw  ax
test    ah, 41h
jz      short loc_1000BA9F
xor     eax, eax
jmp     short loc_1000BB18

loc_1000BA9F:
fld     [ebp+var_24]
fsub    [ebp+arg_8]
sub     esp, 8
fstp    [esp+40h+var_40]
call    sub_1000D83E
add     esp, 8
fstp    [ebp+var_8]
mov     [ebp+var_14], 0
mov     [ebp+var_10], 1
jmp     short loc_1000BACF

loc_1000BAC6:
mov     eax, [ebp+var_10]
add     eax, 1
mov     [ebp+var_10], eax

loc_1000BACF:
mov     ecx, [ebp+var_10]
cmp     ecx, [ebp+var_C]
jge     short loc_1000BB15
fild    [ebp+var_10]
fmul    [ebp+var_2C]
fadd    [ebp+var_24]
fst     [ebp+var_1C]
fsub    [ebp+arg_8]
sub     esp, 8
fstp    [esp+40h+var_40]
call    sub_1000D83E
add     esp, 8
fst     [ebp+var_34]
fcomp   [ebp+var_8]
fnstsw  ax
test    ah, 41h
jz      short loc_1000BB13
mov     edx, dword ptr [ebp+var_34]
mov     dword ptr [ebp+var_8], edx
mov     eax, dword ptr [ebp+var_34+4]
mov     dword ptr [ebp+var_8+4], eax
mov     ecx, [ebp+var_10]
mov     [ebp+var_14], ecx

loc_1000BB13:
jmp     short loc_1000BAC6

loc_1000BB15:
mov     eax, [ebp+var_14]

loc_1000BB18:
mov     esp, ebp
pop     ebp
retn
FindIdxForSwpFreq endp

; Exported entry  32. GetAmplWithFreqExt


; Attributes: bp-based frame

public GetAmplWithFreqExt
GetAmplWithFreqExt proc near

var_40= dword ptr -40h
var_3C= dword ptr -3Ch
var_38= dword ptr -38h
var_34= word ptr -34h
var_30= word ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= word ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= word ptr -10h
var_C= word ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 40h
mov     [ebp+var_18], 3
mov     [ebp+var_C], 0
mov     [ebp+var_30], 0
mov     [ebp+var_10], 0
mov     [ebp+var_24], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000BB65
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000BE96

loc_1000BB65:
mov     eax, [ebp+arg_0]
push    eax
call    IsSweeping
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000BB8B
push    0FFFFFFF2h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_1000BE96

loc_1000BB8B:
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_34], ax
movsx   ecx, [ebp+var_34]
test    ecx, ecx
jge     short loc_1000BBAC
mov     ax, [ebp+var_34]
jmp     loc_1000BE96

loc_1000BBAC:
mov     edx, [ebp+arg_0]
push    edx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_20], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_34], ax
movsx   ecx, [ebp+var_34]
test    ecx, ecx
jge     short loc_1000BBDC
mov     ax, [ebp+var_34]
jmp     loc_1000BE96

loc_1000BBDC:
mov     edx, [ebp+arg_0]
push    edx
call    RdNumDataPts
add     esp, 4
mov     [ebp+var_14], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_34], ax
movsx   ecx, [ebp+var_34]
test    ecx, ecx
jge     short loc_1000BC0C
mov     ax, [ebp+var_34]
jmp     loc_1000BE96

loc_1000BC0C:
mov     edx, [ebp+var_20]
cmp     edx, [ebp+var_14]
jnz     short loc_1000BC27
push    4
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_1000BE96

loc_1000BC27:
mov     ecx, [ebp+var_20]
cmp     ecx, [ebp+var_14]
jle     short loc_1000BC42
push    0FFFFFFFEh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_1000BE96

loc_1000BC42:
mov     eax, [ebp+var_20]
mov     ecx, [ebp+arg_4]
lea     edx, [ecx+eax*2]
mov     [ebp+var_40], edx
mov     eax, [ebp+var_20]
mov     ecx, [ebp+arg_8]
lea     edx, [ecx+eax*8]
mov     [ebp+var_2C], edx
lea     eax, [ebp+var_24]
push    eax
lea     ecx, [ebp+var_28]
push    ecx
mov     edx, [ebp+var_18]
push    edx
mov     eax, [ebp+var_14]
sub     eax, [ebp+var_20]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100040C9
add     esp, 14h
movsx   edx, ax
test    edx, edx
jz      short loc_1000BC89
mov     ax, 0FFFEh
jmp     loc_1000BE96

loc_1000BC89:
cmp     [ebp+var_28], 0
jnz     short loc_1000BC97
xor     ax, ax
jmp     loc_1000BE96

loc_1000BC97:
mov     ax, [ebp+var_24]
mov     [ebp+var_10], ax
mov     [ebp+var_8], 0
jmp     short loc_1000BCB3

loc_1000BCA7:
mov     cx, [ebp+var_8]
add     cx, 1
mov     [ebp+var_8], cx

loc_1000BCB3:
movsx   edx, [ebp+var_8]
cmp     edx, [ebp+var_28]
jge     loc_1000BE55
mov     [ebp+var_C], 0
jmp     short loc_1000BCD4

loc_1000BCC8:
mov     ax, [ebp+var_C]
add     ax, 1
mov     [ebp+var_C], ax

loc_1000BCD4:
movsx   ecx, [ebp+var_C]
cmp     ecx, 3
jge     short loc_1000BD0D
mov     dx, [ebp+var_24]
mov     [ebp+var_10], dx
lea     eax, [ebp+var_10]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000BD0B
jmp     short loc_1000BD0D

loc_1000BD0B:
jmp     short loc_1000BCC8

loc_1000BD0D:
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000BD22
jmp     loc_1000BE55

loc_1000BD22:
mov     cx, [ebp+var_10]
mov     [ebp+var_24], cx
movsx   edx, [ebp+var_8]
mov     eax, [ebp+var_40]
mov     cx, word ptr [ebp+var_38]
mov     [eax+edx*2], cx
mov     [ebp+var_C], 0
jmp     short loc_1000BD4D

loc_1000BD41:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_1000BD4D:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_1000BD86
mov     cx, [ebp+var_24]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000BD84
jmp     short loc_1000BD86

loc_1000BD84:
jmp     short loc_1000BD41

loc_1000BD86:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000BD9B
jmp     loc_1000BE55

loc_1000BD9B:
mov     ax, [ebp+var_10]
mov     [ebp+var_24], ax
mov     ecx, [ebp+var_38]
and     ecx, 0FFFFh
mov     [ebp+var_3C], ecx
mov     [ebp+var_C], 0
jmp     short loc_1000BDC3

loc_1000BDB7:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_1000BDC3:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_1000BDFC
mov     cx, [ebp+var_24]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_38], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000BDFA
jmp     short loc_1000BDFC

loc_1000BDFA:
jmp     short loc_1000BDB7

loc_1000BDFC:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000BE0E
jmp     short loc_1000BE55

loc_1000BE0E:
mov     ax, [ebp+var_10]
mov     [ebp+var_24], ax
mov     ecx, [ebp+var_38]
and     ecx, 0FFFFh
mov     [ebp+var_4], ecx
mov     edx, [ebp+var_3C]
and     edx, 0FFFFh
mov     eax, [ebp+var_4]
shl     eax, 10h
add     edx, eax
mov     [ebp+var_1C], edx
mov     ecx, [ebp+var_1C]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10002EA6
add     esp, 8
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+var_2C]
fstp    qword ptr [ecx+eax*8]
jmp     loc_1000BCA7

loc_1000BE55:
mov     dx, [ebp+var_24]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_10003BB8
add     esp, 8
mov     [ebp+var_30], ax
movsx   ecx, [ebp+var_30]
test    ecx, ecx
jnz     short loc_1000BE92
mov     edx, [ebp+var_20]
add     edx, [ebp+var_28]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    SetSwpIdx
add     esp, 8
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000BE92
or      ax, 0FFFFh
jmp     short loc_1000BE96

loc_1000BE92:
mov     ax, [ebp+var_30]

loc_1000BE96:
mov     esp, ebp
pop     ebp
retn
GetAmplWithFreqExt endp

; Exported entry  42. GetMinMaxAmplWithFreqExt


; Attributes: bp-based frame

public GetMinMaxAmplWithFreqExt
GetMinMaxAmplWithFreqExt proc near

var_48= dword ptr -48h
var_44= dword ptr -44h
var_40= dword ptr -40h
var_3C= dword ptr -3Ch
var_38= word ptr -38h
var_34= dword ptr -34h
var_30= word ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= word ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= word ptr -10h
var_C= word ptr -0Ch
var_8= word ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 48h
mov     [ebp+var_18], 6
mov     [ebp+var_C], 0
mov     [ebp+var_38], 0
mov     [ebp+var_24], 0
mov     [ebp+var_10], 0
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000BEE3
mov     edx, [ebp+arg_0]
push    edx
call    GetFuncStatusCode
add     esp, 4
jmp     loc_1000C3BD

loc_1000BEE3:
mov     eax, [ebp+arg_0]
push    eax
call    IsSweeping
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000BF09
push    0FFFFFFF2h
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_1000C3BD

loc_1000BF09:
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_30], ax
movsx   ecx, [ebp+var_30]
test    ecx, ecx
jge     short loc_1000BF2A
mov     ax, [ebp+var_30]
jmp     loc_1000C3BD

loc_1000BF2A:
mov     edx, [ebp+arg_0]
push    edx
call    RdSwpIdx
add     esp, 4
mov     [ebp+var_20], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_30], ax
movsx   ecx, [ebp+var_30]
test    ecx, ecx
jge     short loc_1000BF5A
mov     ax, [ebp+var_30]
jmp     loc_1000C3BD

loc_1000BF5A:
mov     edx, [ebp+arg_0]
push    edx
call    RdNumDataPts
add     esp, 4
mov     [ebp+var_14], eax
mov     eax, [ebp+arg_0]
push    eax
call    GetFuncStatusCode
add     esp, 4
mov     [ebp+var_30], ax
movsx   ecx, [ebp+var_30]
test    ecx, ecx
jge     short loc_1000BF8A
mov     ax, [ebp+var_30]
jmp     loc_1000C3BD

loc_1000BF8A:
mov     edx, [ebp+var_20]
cmp     edx, [ebp+var_14]
jnz     short loc_1000BFA5
push    4
mov     eax, [ebp+arg_0]
push    eax
call    SetFuncStatusCode
add     esp, 8
jmp     loc_1000C3BD

loc_1000BFA5:
mov     ecx, [ebp+var_20]
cmp     ecx, [ebp+var_14]
jle     short loc_1000BFC0
push    0FFFFFFFEh
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
jmp     loc_1000C3BD

loc_1000BFC0:
mov     eax, [ebp+var_20]
mov     ecx, [ebp+arg_4]
lea     edx, [ecx+eax*2]
mov     [ebp+var_44], edx
mov     eax, [ebp+var_20]
mov     ecx, [ebp+arg_8]
lea     edx, [ecx+eax*2]
mov     [ebp+var_48], edx
mov     eax, [ebp+var_20]
mov     ecx, [ebp+arg_C]
lea     edx, [ecx+eax*8]
mov     [ebp+var_2C], edx
mov     eax, [ebp+var_20]
mov     ecx, [ebp+arg_10]
lea     edx, [ecx+eax*8]
mov     [ebp+var_34], edx
lea     eax, [ebp+var_24]
push    eax
lea     ecx, [ebp+var_28]
push    ecx
mov     edx, [ebp+var_18]
push    edx
mov     eax, [ebp+var_14]
sub     eax, [ebp+var_20]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100040C9
add     esp, 14h
movsx   edx, ax
test    edx, edx
jz      short loc_1000C01F
mov     ax, 0FFFEh
jmp     loc_1000C3BD

loc_1000C01F:
cmp     [ebp+var_28], 0
jnz     short loc_1000C02D
xor     ax, ax
jmp     loc_1000C3BD

loc_1000C02D:
mov     ax, [ebp+var_24]
mov     [ebp+var_10], ax
mov     [ebp+var_8], 0
jmp     short loc_1000C049

loc_1000C03D:
mov     cx, [ebp+var_8]
add     cx, 1
mov     [ebp+var_8], cx

loc_1000C049:
movsx   edx, [ebp+var_8]
cmp     edx, [ebp+var_28]
jge     loc_1000C37C
mov     [ebp+var_C], 0
jmp     short loc_1000C06A

loc_1000C05E:
mov     ax, [ebp+var_C]
add     ax, 1
mov     [ebp+var_C], ax

loc_1000C06A:
movsx   ecx, [ebp+var_C]
cmp     ecx, 3
jge     short loc_1000C0A3
mov     dx, [ebp+var_24]
mov     [ebp+var_10], dx
lea     eax, [ebp+var_10]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_3C], ax
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000C0A1
jmp     short loc_1000C0A3

loc_1000C0A1:
jmp     short loc_1000C05E

loc_1000C0A3:
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000C0B8
jmp     loc_1000C37C

loc_1000C0B8:
mov     cx, [ebp+var_10]
mov     [ebp+var_24], cx
movsx   edx, [ebp+var_8]
mov     eax, [ebp+var_44]
mov     cx, word ptr [ebp+var_3C]
mov     [eax+edx*2], cx
mov     [ebp+var_C], 0
jmp     short loc_1000C0E3

loc_1000C0D7:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_1000C0E3:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_1000C11C
mov     cx, [ebp+var_24]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_3C], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000C11A
jmp     short loc_1000C11C

loc_1000C11A:
jmp     short loc_1000C0D7

loc_1000C11C:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000C131
jmp     loc_1000C37C

loc_1000C131:
mov     ax, [ebp+var_10]
mov     [ebp+var_24], ax
mov     ecx, [ebp+var_3C]
and     ecx, 0FFFFh
mov     [ebp+var_40], ecx
mov     [ebp+var_C], 0
jmp     short loc_1000C159

loc_1000C14D:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_1000C159:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_1000C192
mov     cx, [ebp+var_24]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_3C], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000C190
jmp     short loc_1000C192

loc_1000C190:
jmp     short loc_1000C14D

loc_1000C192:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000C1A7
jmp     loc_1000C37C

loc_1000C1A7:
mov     ax, [ebp+var_10]
mov     [ebp+var_24], ax
mov     ecx, [ebp+var_3C]
and     ecx, 0FFFFh
mov     [ebp+var_4], ecx
mov     edx, [ebp+var_40]
and     edx, 0FFFFh
mov     eax, [ebp+var_4]
shl     eax, 10h
add     edx, eax
mov     [ebp+var_1C], edx
mov     ecx, [ebp+var_1C]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10002EA6
add     esp, 8
movsx   eax, [ebp+var_8]
mov     ecx, [ebp+var_2C]
fstp    qword ptr [ecx+eax*8]
mov     [ebp+var_C], 0
jmp     short loc_1000C1FD

loc_1000C1F1:
mov     dx, [ebp+var_C]
add     dx, 1
mov     [ebp+var_C], dx

loc_1000C1FD:
movsx   eax, [ebp+var_C]
cmp     eax, 3
jge     short loc_1000C236
mov     cx, [ebp+var_24]
mov     [ebp+var_10], cx
lea     edx, [ebp+var_10]
push    edx
mov     eax, [ebp+arg_0]
push    eax
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_3C], ax
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000C234
jmp     short loc_1000C236

loc_1000C234:
jmp     short loc_1000C1F1

loc_1000C236:
mov     edx, [ebp+arg_0]
push    edx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000C24B
jmp     loc_1000C37C

loc_1000C24B:
mov     ax, [ebp+var_10]
mov     [ebp+var_24], ax
movsx   ecx, [ebp+var_8]
mov     edx, [ebp+var_48]
mov     ax, word ptr [ebp+var_3C]
mov     [edx+ecx*2], ax
mov     [ebp+var_C], 0
jmp     short loc_1000C276

loc_1000C26A:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_1000C276:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_1000C2AF
mov     ax, [ebp+var_24]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_3C], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000C2AD
jmp     short loc_1000C2AF

loc_1000C2AD:
jmp     short loc_1000C26A

loc_1000C2AF:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000C2C4
jmp     loc_1000C37C

loc_1000C2C4:
mov     dx, [ebp+var_10]
mov     [ebp+var_24], dx
mov     eax, [ebp+var_3C]
and     eax, 0FFFFh
mov     [ebp+var_40], eax
mov     [ebp+var_C], 0
jmp     short loc_1000C2EB

loc_1000C2DF:
mov     cx, [ebp+var_C]
add     cx, 1
mov     [ebp+var_C], cx

loc_1000C2EB:
movsx   edx, [ebp+var_C]
cmp     edx, 3
jge     short loc_1000C324
mov     ax, [ebp+var_24]
mov     [ebp+var_10], ax
lea     ecx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_100039D0
add     esp, 8
mov     word ptr [ebp+var_3C], ax
mov     eax, [ebp+arg_0]
push    eax
call    RdErrorStatus
add     esp, 4
test    eax, eax
jnz     short loc_1000C322
jmp     short loc_1000C324

loc_1000C322:
jmp     short loc_1000C2DF

loc_1000C324:
mov     ecx, [ebp+arg_0]
push    ecx
call    RdErrorStatus
add     esp, 4
test    eax, eax
jz      short loc_1000C336
jmp     short loc_1000C37C

loc_1000C336:
mov     dx, [ebp+var_10]
mov     [ebp+var_24], dx
mov     eax, [ebp+var_3C]
and     eax, 0FFFFh
mov     [ebp+var_4], eax
mov     ecx, [ebp+var_40]
and     ecx, 0FFFFh
mov     edx, [ebp+var_4]
shl     edx, 10h
add     ecx, edx
mov     [ebp+var_1C], ecx
mov     eax, [ebp+var_1C]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_10002EA6
add     esp, 8
movsx   edx, [ebp+var_8]
mov     eax, [ebp+var_34]
fstp    qword ptr [eax+edx*8]
jmp     loc_1000C03D

loc_1000C37C:
mov     cx, [ebp+var_10]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    sub_10003BB8
add     esp, 8
mov     [ebp+var_38], ax
movsx   eax, [ebp+var_38]
test    eax, eax
jnz     short loc_1000C3B9
mov     ecx, [ebp+var_20]
add     ecx, [ebp+var_28]
push    ecx
mov     edx, [ebp+arg_0]
push    edx
call    SetSwpIdx
add     esp, 8
movsx   eax, ax
test    eax, eax
jz      short loc_1000C3B9
or      ax, 0FFFFh
jmp     short loc_1000C3BD

loc_1000C3B9:
mov     ax, [ebp+var_38]

loc_1000C3BD:
mov     esp, ebp
pop     ebp
retn
GetMinMaxAmplWithFreqExt endp

; Exported entry 130. ReadCellPtFreq


; Attributes: bp-based frame

public ReadCellPtFreq
ReadCellPtFreq proc near

freq= qword ptr -8
a1= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= word ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
sub     esp, 8
mov     dword ptr [ebp+freq], 0
mov     dword ptr [ebp+freq+4], 0BFF00000h
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C3F3
fld     ds:dbl_10016100
jmp     loc_1000C4B1

loc_1000C3F3:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
cmp     [ebp+arg_4], 0
jl      short loc_1000C418
mov     eax, [ebp+a1]
push    eax
call    RdNumSwpPts
add     esp, 4
cmp     [ebp+arg_4], eax
jle     short loc_1000C431

loc_1000C418:
push    0FFFFFFFDh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     ds:dbl_10016100
jmp     loc_1000C4B1

loc_1000C431:
movsx   edx, [ebp+arg_8]
cmp     edx, 2
jnz     short loc_1000C455
cmp     [ebp+arg_C], 0
jz      short loc_1000C455
mov     eax, [ebp+arg_4]
mov     ecx, [ebp+arg_C]
mov     edx, [ecx+eax*8]
mov     dword ptr [ebp+freq], edx
mov     eax, [ecx+eax*8+4]
mov     dword ptr [ebp+freq+4], eax
jmp     short loc_1000C477

loc_1000C455:
movsx   ecx, [ebp+arg_8]
cmp     ecx, 4
jnz     short loc_1000C477
cmp     [ebp+arg_10], 0
jz      short loc_1000C477
mov     edx, [ebp+arg_4]
mov     eax, [ebp+arg_10]
mov     ecx, [eax+edx*8]
mov     dword ptr [ebp+freq], ecx
mov     edx, [eax+edx*8+4]
mov     dword ptr [ebp+freq+4], edx

loc_1000C477:
mov     eax, dword ptr [ebp+freq+4]
push    eax
mov     ecx, dword ptr [ebp+freq]
push    ecx             ; freq
mov     edx, [ebp+a1]
push    edx             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   eax, ax
test    eax, eax
jnz     short loc_1000C4AE
mov     dword ptr [ebp+freq], 0
mov     dword ptr [ebp+freq+4], 0BFF00000h
push    0FFFFFFFFh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8

loc_1000C4AE:
fld     [ebp+freq]

loc_1000C4B1:
mov     esp, ebp
pop     ebp
retn
ReadCellPtFreq endp

; Exported entry 131. ReadStartFreq


; Attributes: bp-based frame

public ReadStartFreq
ReadStartFreq proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C4D3
fld     ds:dbl_10016100
jmp     short loc_1000C4E7

loc_1000C4D3:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+8]

loc_1000C4E7:
pop     ebp
retn
ReadStartFreq endp

; Exported entry 132. ReadStepSize


; Attributes: bp-based frame

public ReadStepSize
ReadStepSize proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C507
fld     ds:dbl_10016100
jmp     short loc_1000C51B

loc_1000C507:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+18h]

loc_1000C51B:
pop     ebp
retn
ReadStepSize endp

; Exported entry 133. ReadStopFreq


; Attributes: bp-based frame

public ReadStopFreq
ReadStopFreq proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C53B
fld     ds:dbl_10016100
jmp     short loc_1000C54F

loc_1000C53B:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+10h]

loc_1000C54F:
pop     ebp
retn
ReadStopFreq endp

; Exported entry 134. ReadSwpPtFreq


; Attributes: bp-based frame

public ReadSwpPtFreq
ReadSwpPtFreq proc near

var_18= qword ptr -18h
var_10= qword ptr -10h
freq= qword ptr -8
a1= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 18h
mov     dword ptr [ebp+freq], 0
mov     dword ptr [ebp+freq+4], 0
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C583
fld     ds:dbl_10016100
jmp     loc_1000C61C

loc_1000C583:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
cmp     [ebp+arg_4], 0
jl      short loc_1000C5A8
mov     eax, [ebp+a1]
push    eax
call    RdNumSwpPts
add     esp, 4
cmp     [ebp+arg_4], eax
jle     short loc_1000C5BE

loc_1000C5A8:
push    0FFFFFFFDh
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     ds:dbl_10016100
jmp     short loc_1000C61C

loc_1000C5BE:
fild    [ebp+arg_4]
fstp    [ebp+var_10]
mov     edx, [ebp+a1]
push    edx
call    ReadStepSize
add     esp, 4
fmul    [ebp+var_10]
fstp    [ebp+var_18]
mov     eax, [ebp+a1]
push    eax
call    ReadStartFreq
add     esp, 4
fadd    [ebp+var_18]
fstp    [ebp+freq]
mov     ecx, dword ptr [ebp+freq+4]
push    ecx
mov     edx, dword ptr [ebp+freq]
push    edx             ; freq
mov     eax, [ebp+a1]
push    eax             ; a1
call    FreqInRange
add     esp, 0Ch
movsx   ecx, ax
test    ecx, ecx
jnz     short loc_1000C619
push    0FFFFFFFFh
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
fld     ds:dbl_10016100
jmp     short loc_1000C61C

loc_1000C619:
fld     [ebp+freq]

loc_1000C61C:
mov     esp, ebp
pop     ebp
retn
ReadSwpPtFreq endp

; Exported entry 135. ReadTrigFreq


; Attributes: bp-based frame

public ReadTrigFreq
ReadTrigFreq proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C63E
fld     ds:dbl_10016100
jmp     short loc_1000C652

loc_1000C63E:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+78h]

loc_1000C652:
pop     ebp
retn
ReadTrigFreq endp

; Exported entry 136. ReadZspanFreq


; Attributes: bp-based frame

public ReadZspanFreq
ReadZspanFreq proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C672
fld     ds:dbl_10016100
jmp     short loc_1000C689

loc_1000C672:
push    0
mov     edx, [ebp+arg_0]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     eax, [ebp+arg_0]
fld     qword ptr [eax+90h]

loc_1000C689:
pop     ebp
retn
ReadZspanFreq endp

align 10h
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C6AC
or      ax, 0FFFFh
jmp     short loc_1000C6BC

loc_1000C6AC:
mov     edx, [ebp+8]
mov     dword ptr [edx+1E0h], 0
xor     ax, ax

loc_1000C6BC:
pop     ebp
retn
push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C6DA
or      ax, 0FFFFh
jmp     short loc_1000C6E4

loc_1000C6DA:
mov     edx, [ebp+8]
mov     ax, [edx+216h]

loc_1000C6E4:
pop     ebp
retn
; Exported entry  81. RdCommDelay


; Attributes: bp-based frame

public RdCommDelay
RdCommDelay proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    esi
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C701
xor     eax, eax
jmp     short loc_1000C727

loc_1000C701:
mov     edx, [ebp+arg_0]
push    edx
call    RdTimeoutWait
add     esp, 4
mov     esi, eax
mov     eax, [ebp+arg_0]
push    eax
call    sub_10009357
add     esp, 4
mov     ecx, eax
mov     eax, 3D0900h
cdq
idiv    ecx
add     eax, esi

loc_1000C727:
pop     esi
pop     ebp
retn
RdCommDelay endp

push    ebp
mov     ebp, esp
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000C746
or      ax, 0FFFFh
jmp     short loc_1000C750

loc_1000C746:
mov     edx, [ebp+8]
mov     ax, [edx+218h]

loc_1000C750:
pop     ebp
retn
align 10h
; Exported entry   2. CalcRBWCode


; Attributes: bp-based frame

public CalcRBWCode
CalcRBWCode proc near

var_1C= word ptr -1Ch
var_18= word ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 1Ch
mov     [ebp+var_1C], 0FFFFh
mov     [ebp+var_14], 12Ch
mov     [ebp+var_10], 0BB8h
mov     [ebp+var_C], 7530h
mov     [ebp+var_8], 493E0h
mov     [ebp+var_4], 2DC6C0h
mov     [ebp+var_18], 0
jmp     short loc_1000C7A3

loc_1000C797:
mov     ax, [ebp+var_18]
add     ax, 1
mov     [ebp+var_18], ax

loc_1000C7A3:
movsx   ecx, [ebp+var_18]
cmp     ecx, 4
jg      short loc_1000C7C5
movsx   edx, [ebp+var_18]
mov     eax, [ebp+arg_0]
cmp     eax, [ebp+edx*4+var_14]
jnz     short loc_1000C7C3
mov     cx, [ebp+var_18]
mov     [ebp+var_1C], cx
jmp     short loc_1000C7C5

loc_1000C7C3:
jmp     short loc_1000C797

loc_1000C7C5:
mov     ax, [ebp+var_1C]
mov     esp, ebp
pop     ebp
retn
CalcRBWCode endp

; Exported entry   3. CalcVBWCode


; Attributes: bp-based frame

public CalcVBWCode
CalcVBWCode proc near

var_28= word ptr -28h
var_24= word ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 28h
mov     [ebp+var_28], 0FFFFh
mov     [ebp+var_20], 0
mov     [ebp+var_1C], 3
mov     [ebp+var_18], 1Eh
mov     [ebp+var_14], 12Ch
mov     [ebp+var_10], 0BB8h
mov     [ebp+var_C], 7530h
mov     [ebp+var_8], 493E0h
mov     [ebp+var_4], 2DC6C0h
mov     [ebp+var_24], 1
jmp     short loc_1000C825

loc_1000C819:
mov     ax, [ebp+var_24]
add     ax, 1
mov     [ebp+var_24], ax

loc_1000C825:
movsx   ecx, [ebp+var_24]
cmp     ecx, 7
jg      short loc_1000C847
movsx   edx, [ebp+var_24]
mov     eax, [ebp+arg_0]
cmp     eax, [ebp+edx*4+var_20]
jnz     short loc_1000C845
mov     cx, [ebp+var_24]
mov     [ebp+var_28], cx
jmp     short loc_1000C847

loc_1000C845:
jmp     short loc_1000C819

loc_1000C847:
mov     edx, [ebp+arg_0]
cmp     edx, [ebp+var_1C]
jge     short loc_1000C855
mov     [ebp+var_28], 0

loc_1000C855:
mov     eax, [ebp+arg_0]
cmp     eax, [ebp+var_4]
jle     short loc_1000C863
mov     [ebp+var_28], 7

loc_1000C863:
mov     ax, [ebp+var_28]
mov     esp, ebp
pop     ebp
retn
CalcVBWCode endp

; Exported entry  19. Copy9052Struct


; Attributes: bp-based frame

public Copy9052Struct
Copy9052Struct proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
cmp     [ebp+arg_0], 0
jz      short loc_1000C894
cmp     [ebp+arg_4], 0
jz      short loc_1000C894
push    2E0h
mov     eax, [ebp+arg_4]
push    eax
mov     ecx, [ebp+arg_0]
push    ecx
call    sub_1000DBA0
add     esp, 0Ch
xor     ax, ax
jmp     short loc_1000C898

loc_1000C894:
or      ax, 0FFFFh

loc_1000C898:
pop     ebp
retn
Copy9052Struct endp

; Exported entry  20. DefltSetTimeRBW


; Attributes: bp-based frame

public DefltSetTimeRBW
DefltSetTimeRBW proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
movsx   eax, [ebp+arg_0]
mov     [ebp+var_8], eax
cmp     [ebp+var_8], 4  ; switch 5 cases
ja      short loc_1000C8E4 ; jumptable 1000C8B0 default case
mov     ecx, [ebp+var_8]
jmp     ds:off_1000C8F2[ecx*4] ; switch jump

loc_1000C8B7:           ; jumptable 1000C8B0 case 0
mov     [ebp+var_4], 1770h
jmp     short loc_1000C8EB

loc_1000C8C0:           ; jumptable 1000C8B0 case 1
mov     [ebp+var_4], 258h
jmp     short loc_1000C8EB

loc_1000C8C9:           ; jumptable 1000C8B0 case 2
mov     [ebp+var_4], 3Ch
jmp     short loc_1000C8EB

loc_1000C8D2:           ; jumptable 1000C8B0 case 3
mov     [ebp+var_4], 6
jmp     short loc_1000C8EB

loc_1000C8DB:           ; jumptable 1000C8B0 case 4
mov     [ebp+var_4], 1
jmp     short loc_1000C8EB

loc_1000C8E4:           ; jumptable 1000C8B0 default case
mov     [ebp+var_4], 0FFFFFFFFh

loc_1000C8EB:
mov     eax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
DefltSetTimeRBW endp

off_1000C8F2 dd offset loc_1000C8B7 ; jump table for switch statement
dd offset loc_1000C8C0
dd offset loc_1000C8C9
dd offset loc_1000C8D2
dd offset loc_1000C8DB
; Exported entry  21. DefltSetTimeVBW


; Attributes: bp-based frame

public DefltSetTimeVBW
DefltSetTimeVBW proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  8

push    ebp
mov     ebp, esp
sub     esp, 8
movsx   eax, [ebp+arg_0]
mov     [ebp+var_8], eax
cmp     [ebp+var_8], 7  ; switch 8 cases
ja      short loc_1000C96B ; jumptable 1000C91C default case
mov     ecx, [ebp+var_8]
jmp     ds:off_1000C979[ecx*4] ; switch jump

loc_1000C923:           ; jumptable 1000C91C case 0
mov     [ebp+var_4], 0
jmp     short loc_1000C972

loc_1000C92C:           ; jumptable 1000C91C case 1
mov     [ebp+var_4], 3D090h
jmp     short loc_1000C972

loc_1000C935:           ; jumptable 1000C91C case 2
mov     [ebp+var_4], 61A8h
jmp     short loc_1000C972

loc_1000C93E:           ; jumptable 1000C91C case 3
mov     [ebp+var_4], 9C4h
jmp     short loc_1000C972

loc_1000C947:           ; jumptable 1000C91C case 4
mov     [ebp+var_4], 0FAh
jmp     short loc_1000C972

loc_1000C950:           ; jumptable 1000C91C case 5
mov     [ebp+var_4], 19h
jmp     short loc_1000C972

loc_1000C959:           ; jumptable 1000C91C case 6
mov     [ebp+var_4], 3
jmp     short loc_1000C972

loc_1000C962:           ; jumptable 1000C91C case 7
mov     [ebp+var_4], 1
jmp     short loc_1000C972

loc_1000C96B:           ; jumptable 1000C91C default case
mov     [ebp+var_4], 0FFFFFFFFh

loc_1000C972:
mov     eax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
DefltSetTimeVBW endp

off_1000C979 dd offset loc_1000C923 ; jump table for switch statement
dd offset loc_1000C92C
dd offset loc_1000C935
dd offset loc_1000C93E
dd offset loc_1000C947
dd offset loc_1000C950
dd offset loc_1000C959
dd offset loc_1000C962
; Exported entry  45. GetRatioForCode


; Attributes: bp-based frame

public GetRatioForCode
GetRatioForCode proc near

var_60= word ptr -60h
var_5C= dword ptr -5Ch
var_58= dword ptr -58h
var_54= dword ptr -54h
var_50= dword ptr -50h
var_4C= dword ptr -4Ch
var_48= dword ptr -48h
var_44= dword ptr -44h
var_40= dword ptr -40h
var_3C= dword ptr -3Ch
var_38= dword ptr -38h
var_34= dword ptr -34h
var_30= dword ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= word ptr -4
arg_0= word ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 60h
mov     [ebp+var_5C], 0
mov     [ebp+var_58], 40C38800h
mov     [ebp+var_54], 0
mov     [ebp+var_50], 408F4000h
mov     [ebp+var_4C], 0
mov     [ebp+var_48], 40590000h
mov     [ebp+var_44], 0
mov     [ebp+var_40], 40240000h
mov     [ebp+var_3C], 0
mov     [ebp+var_38], 3FF00000h
mov     [ebp+var_34], 9999999Ah
mov     [ebp+var_30], 3FB99999h
mov     [ebp+var_2C], 47AE147Bh
mov     [ebp+var_28], 3F847AE1h
mov     [ebp+var_24], 0D2F1A9FCh
mov     [ebp+var_20], 3F50624Dh
mov     [ebp+var_1C], 0EB1C432Dh
mov     [ebp+var_18], 3F1A36E2h
mov     [ebp+var_14], 88E368F1h
mov     [ebp+var_10], 3EE4F8B5h
mov     [ebp+var_C], 0A0B5ED8Dh
mov     [ebp+var_8], 3EB0C6F7h
mov     [ebp+var_60], 0FFFDh
mov     [ebp+var_4], 0Bh
movsx   eax, [ebp+arg_0]
test    eax, eax
jl      short loc_1000CA76
movsx   ecx, [ebp+arg_0]
movsx   edx, [ebp+var_4]
sub     edx, 1
cmp     ecx, edx
jge     short loc_1000CA76
movsx   eax, [ebp+arg_0]
mov     ecx, [ebp+arg_4]
mov     edx, [ebp+eax*8+var_5C]
mov     [ecx], edx
mov     eax, [ebp+eax*8+var_58]
mov     [ecx+4], eax
mov     [ebp+var_60], 0

loc_1000CA76:
mov     ax, [ebp+var_60]
mov     esp, ebp
pop     ebp
retn
GetRatioForCode endp

; Exported entry  35. GetCodeForRatio


; Attributes: bp-based frame

; int __cdecl GetCodeForRatio(double)
public GetCodeForRatio
GetCodeForRatio proc near

var_64= word ptr -64h
var_60= qword ptr -60h
var_58= dword ptr -58h
var_54= dword ptr -54h
var_50= dword ptr -50h
var_4C= dword ptr -4Ch
var_48= dword ptr -48h
var_44= dword ptr -44h
var_40= dword ptr -40h
var_3C= dword ptr -3Ch
var_38= dword ptr -38h
var_34= dword ptr -34h
var_30= dword ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= word ptr -8
var_4= word ptr -4
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 64h
mov     dword ptr [ebp+var_60], 0
mov     dword ptr [ebp+var_60+4], 40C38800h
mov     [ebp+var_58], 0
mov     [ebp+var_54], 408F4000h
mov     [ebp+var_50], 0
mov     [ebp+var_4C], 40590000h
mov     [ebp+var_48], 0
mov     [ebp+var_44], 40240000h
mov     [ebp+var_40], 0
mov     [ebp+var_3C], 3FF00000h
mov     [ebp+var_38], 9999999Ah
mov     [ebp+var_34], 3FB99999h
mov     [ebp+var_30], 47AE147Bh
mov     [ebp+var_2C], 3F847AE1h
mov     [ebp+var_28], 0D2F1A9FCh
mov     [ebp+var_24], 3F50624Dh
mov     [ebp+var_20], 0EB1C432Dh
mov     [ebp+var_1C], 3F1A36E2h
mov     [ebp+var_18], 88E368F1h
mov     [ebp+var_14], 3EE4F8B5h
mov     [ebp+var_10], 0A0B5ED8Dh
mov     [ebp+var_C], 3EB0C6F7h
mov     [ebp+var_64], 0FFFDh
mov     [ebp+var_8], 0Bh
movsx   eax, [ebp+var_8]
fld     [ebp+arg_0]
fcomp   qword ptr [ebp+eax*8-68h]
fnstsw  ax
test    ah, 1
jnz     short loc_1000CB49
fld     [ebp+arg_0]
fcomp   [ebp+var_60]
fnstsw  ax
test    ah, 41h
jnz     short loc_1000CB4F

loc_1000CB49:
mov     ax, [ebp+var_64]
jmp     short loc_1000CB8F

loc_1000CB4F:
mov     [ebp+var_4], 0
jmp     short loc_1000CB63

loc_1000CB57:
mov     cx, [ebp+var_4]
add     cx, 1
mov     [ebp+var_4], cx

loc_1000CB63:
movsx   edx, [ebp+var_4]
movsx   eax, [ebp+var_8]
cmp     edx, eax
jge     short loc_1000CB8B
movsx   ecx, [ebp+var_4]
fld     [ebp+ecx*8+var_60]
fcomp   [ebp+arg_0]
fnstsw  ax
test    ah, 40h
jz      short loc_1000CB89
mov     dx, [ebp+var_4]
mov     [ebp+var_64], dx

loc_1000CB89:
jmp     short loc_1000CB57

loc_1000CB8B:
mov     ax, [ebp+var_64]

loc_1000CB8F:
mov     esp, ebp
pop     ebp
retn
GetCodeForRatio endp

; Exported entry  43. GetRBWString


; Attributes: bp-based frame

public GetRBWString
GetRBWString proc near

var_8= dword ptr -8
var_4= word ptr -4
arg_0= word ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_4], 0FFFEh
cmp     [ebp+arg_4], 0
jnz     short loc_1000CBAE
mov     ax, [ebp+var_4]
jmp     loc_1000CC61

loc_1000CBAE:
movsx   eax, [ebp+arg_0]
mov     [ebp+var_8], eax
cmp     [ebp+var_8], 4  ; switch 5 cases
ja      loc_1000CC46    ; jumptable 1000CBC2 default case
mov     ecx, [ebp+var_8]
jmp     ds:off_1000CC65[ecx*4] ; switch jump

loc_1000CBC9:           ; jumptable 1000CBC2 case 0
push    offset a300Hz
mov     edx, [ebp+arg_4]
push    edx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CC5D

loc_1000CBE2:           ; jumptable 1000CBC2 case 1
push    offset a3Khz
mov     eax, [ebp+arg_4]
push    eax
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CC5D

loc_1000CBFB:           ; jumptable 1000CBC2 case 2
push    offset a30Khz
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CC5D

loc_1000CC14:           ; jumptable 1000CBC2 case 3
push    offset a300Khz
mov     edx, [ebp+arg_4]
push    edx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CC5D

loc_1000CC2D:           ; jumptable 1000CBC2 case 4
push    offset a3Mhz
mov     eax, [ebp+arg_4]
push    eax
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CC5D

loc_1000CC46:           ; jumptable 1000CBC2 default case
mov     [ebp+var_4], 0FFFDh
push    offset asc_10018328 ; "     "
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_1000D570
add     esp, 8

loc_1000CC5D:
mov     ax, [ebp+var_4]

loc_1000CC61:
mov     esp, ebp
pop     ebp
retn
GetRBWString endp

off_1000CC65 dd offset loc_1000CBC9 ; jump table for switch statement
dd offset loc_1000CBE2
dd offset loc_1000CBFB
dd offset loc_1000CC14
dd offset loc_1000CC2D
; Exported entry  47. GetVBWString


; Attributes: bp-based frame

public GetVBWString
GetVBWString proc near

var_8= dword ptr -8
var_4= word ptr -4
arg_0= word ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     [ebp+var_4], 0FFFEh
cmp     [ebp+arg_4], 0
jnz     short loc_1000CC94
mov     ax, [ebp+var_4]
jmp     loc_1000CD9B

loc_1000CC94:
movsx   eax, [ebp+arg_0]
mov     [ebp+var_8], eax
cmp     [ebp+var_8], 7  ; switch 8 cases
ja      loc_1000CD80    ; jumptable 1000CCA8 default case
mov     ecx, [ebp+var_8]
jmp     ds:off_1000CD9F[ecx*4] ; switch jump

loc_1000CCAF:           ; jumptable 1000CCA8 case 0
push    offset aNone
mov     edx, [ebp+arg_4]
push    edx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     loc_1000CD97

loc_1000CCCB:           ; jumptable 1000CCA8 case 1
push    offset a3Hz
mov     eax, [ebp+arg_4]
push    eax
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     loc_1000CD97

loc_1000CCE7:           ; jumptable 1000CCA8 case 2
push    offset a30Hz
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     loc_1000CD97

loc_1000CD03:           ; jumptable 1000CCA8 case 3
push    offset a300Hz_0
mov     edx, [ebp+arg_4]
push    edx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CD97

loc_1000CD1C:           ; jumptable 1000CCA8 case 4
push    offset a3Khz_0
mov     eax, [ebp+arg_4]
push    eax
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CD97

loc_1000CD35:           ; jumptable 1000CCA8 case 5
push    offset a30Khz_0
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CD97

loc_1000CD4E:           ; jumptable 1000CCA8 case 6
push    offset a300Khz_0
mov     edx, [ebp+arg_4]
push    edx
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CD97

loc_1000CD67:           ; jumptable 1000CCA8 case 7
push    offset a3Mhz_0
mov     eax, [ebp+arg_4]
push    eax
call    sub_1000D570
add     esp, 8
mov     [ebp+var_4], 0
jmp     short loc_1000CD97

loc_1000CD80:           ; jumptable 1000CCA8 default case
mov     [ebp+var_4], 0FFFDh
push    offset asc_10018370 ; "     "
mov     ecx, [ebp+arg_4]
push    ecx
call    sub_1000D570
add     esp, 8

loc_1000CD97:
mov     ax, [ebp+var_4]

loc_1000CD9B:
mov     esp, ebp
pop     ebp
retn
GetVBWString endp

off_1000CD9F dd offset loc_1000CCAF ; jump table for switch statement
dd offset loc_1000CCCB
dd offset loc_1000CCE7
dd offset loc_1000CD03
dd offset loc_1000CD1C
dd offset loc_1000CD35
dd offset loc_1000CD4E
dd offset loc_1000CD67
; Exported entry  22. DelayOps


; Attributes: bp-based frame

; int __cdecl DelayOps(double)
public DelayOps
DelayOps proc near

var_10= dword ptr -10h
var_C= qword ptr -0Ch
var_4= dword ptr -4
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 10h
fld     [ebp+arg_0]
fmul    ds:dbl_10016150
fstp    [ebp+var_C]
call    IeTimer
mov     [ebp+var_4], eax

loc_1000CDD9:
mov     eax, [ebp+var_4]
push    eax
call    IeTimerFrom
add     esp, 4
mov     [ebp+var_10], eax
fild    [ebp+var_10]
fcomp   [ebp+var_C]
fnstsw  ax
test    ah, 1
jz      short loc_1000CE18
cmp     [ebp+var_10], 3E8h
jle     short loc_1000CE16
fld     [ebp+var_C]
fsub    ds:dbl_10016150
fstp    [ebp+var_C]
mov     ecx, [ebp+var_4]
add     ecx, 3E8h
mov     [ebp+var_4], ecx

loc_1000CE16:
jmp     short loc_1000CDD9

loc_1000CE18:
mov     esp, ebp
pop     ebp
retn
DelayOps endp

push    ebp
mov     ebp, esp
cmp     dword_1001B414, 0
jz      short loc_1000CE2A
jmp     short loc_1000CE34

loc_1000CE2A:
mov     dword_1001B414, 1

loc_1000CE34:
pop     ebp
retn
push    ebp
mov     ebp, esp
cmp     dword_1001B414, 0
jnz     short loc_1000CE44
jmp     short loc_1000CE4E

loc_1000CE44:
mov     dword_1001B414, 0

loc_1000CE4E:
pop     ebp
retn


; Attributes: bp-based frame

sub_1000CE50 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_4]
add     eax, 52825B9h
sub     eax, [ebp+arg_0]
cdq
mov     ecx, 52825B9h
idiv    ecx
mov     eax, edx
pop     ebp
retn
sub_1000CE50 endp

; Exported entry  52. IeTimerFrom


; Attributes: bp-based frame

public IeTimerFrom
IeTimerFrom proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
call    IeTimer
push    eax
mov     eax, [ebp+arg_0]
push    eax
call    sub_1000CE50
add     esp, 8
pop     ebp
retn
IeTimerFrom endp

; Exported entry  51. IeTimer


; Attributes: bp-based frame

public IeTimer
IeTimer proc near

var_4= dword ptr -4

push    ebp
mov     ebp, esp
push    ecx
mov     [ebp+var_4], 0
push    1               ; uPeriod
call    ds:timeBeginPeriod
call    ds:timeGetTime
mov     [ebp+var_4], eax
push    1               ; uPeriod
call    ds:timeEndPeriod
mov     eax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
IeTimer endp

; Exported entry  36. GetDbmForAmpl


; Attributes: bp-based frame

public GetDbmForAmpl
GetDbmForAmpl proc near

volts= qword ptr -20h
var_18= dword ptr -18h
var_14= qword ptr -14h
var_C= dword ptr -0Ch
var_8= qword ptr -8
a1= dword ptr  8
ampl= word ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 18h
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000CECD
fld     ds:dbl_10016168
jmp     short loc_1000CF3F

loc_1000CECD:
mov     edx, [ebp+a1]
movsx   eax, [edx+S.detect_code]
and     eax, 20h
test    eax, eax
jz      short loc_1000CF00
mov     cx, [ebp+ampl]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetnVForAmpl
fstp    [esp+20h+volts] ; volts
mov     eax, [ebp+a1]
push    eax             ; a1
call    GetDbmForVoltage
add     esp, 0Ch
fstp    [ebp+var_8]
jmp     short loc_1000CF2E

loc_1000CF00:
movsx   ecx, [ebp+ampl]
mov     [ebp+var_C], ecx
fild    [ebp+var_C]
fdiv    ds:dbl_10016160
fstp    [ebp+var_14]
mov     edx, [ebp+a1]
push    edx
call    sub_1000CF43
add     esp, 4
movsx   eax, ax
mov     [ebp+var_18], eax
fild    [ebp+var_18]
fadd    [ebp+var_14]
fstp    [ebp+var_8]

loc_1000CF2E:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     [ebp+var_8]

loc_1000CF3F:
mov     esp, ebp
pop     ebp
retn
GetDbmForAmpl endp



; Attributes: bp-based frame

sub_1000CF43 proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000CF60
or      ax, 0FFFFh
jmp     short loc_1000CFA2

loc_1000CF60:
mov     edx, [ebp+arg_0]
mov     ax, [edx+60h]
mov     [ebp+var_4], ax
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+64h]
test    edx, edx
jz      short loc_1000CF90
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+66h]
test    ecx, ecx
jz      short loc_1000CF90
mov     edx, [ebp+arg_0]
mov     ax, [ebp+var_4]
sub     ax, [edx+68h]
mov     [ebp+var_4], ax

loc_1000CF90:
push    0
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_1000CFA2:
mov     esp, ebp
pop     ebp
retn
sub_1000CF43 endp

; Exported entry  48. GetnVForAmpl


; Attributes: bp-based frame

public GetnVForAmpl
GetnVForAmpl proc near

dbm= qword ptr -20h
var_18= dword ptr -18h
var_14= qword ptr -14h
var_C= dword ptr -0Ch
var_8= qword ptr -8
a1= dword ptr  8
ampl= word ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 18h
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000CFCA
fld     ds:dbl_10016100
jmp     loc_1000D057

loc_1000CFCA:
mov     edx, [ebp+a1]
movsx   eax, [edx+S.detect_code]
and     eax, 20h
test    eax, eax
jle     short loc_1000D026
movsx   ecx, [ebp+ampl]
mov     [ebp+var_C], ecx
fild    [ebp+var_C]
fmul    ds:dbl_10016178
fstp    [ebp+var_14]
mov     edx, [ebp+a1]
push    edx
call    sub_1000D05B
add     esp, 4
movsx   eax, ax
mov     [ebp+var_18], eax
fild    [ebp+var_18]
fdiv    ds:dbl_10016170
sub     esp, 8
fstp    [esp+20h+dbm]
push    40240000h
push    0
call    sub_1000DEF9
add     esp, 10h
fmul    [ebp+var_14]
fstp    [ebp+var_8]
jmp     short loc_1000D046

loc_1000D026:
mov     cx, [ebp+ampl]
push    ecx
mov     edx, [ebp+a1]
push    edx
call    GetDbmForAmpl
fstp    [esp+20h+dbm]   ; dbm
mov     eax, [ebp+a1]
push    eax             ; a1
call    GetnVForDbm
add     esp, 0Ch
fstp    [ebp+var_8]

loc_1000D046:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     [ebp+var_8]

loc_1000D057:
mov     esp, ebp
pop     ebp
retn
GetnVForAmpl endp



; Attributes: bp-based frame

sub_1000D05B proc near

var_4= word ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     eax, [ebp+arg_0]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D078
or      ax, 0FFFFh
jmp     short loc_1000D0D7

loc_1000D078:
mov     edx, [ebp+arg_0]
mov     ax, [edx+60h]
mov     [ebp+var_4], ax
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+80h]
and     edx, 40h
test    edx, edx
jnz     short loc_1000D0A0
mov     ax, [ebp+var_4]
add     ax, 1Eh
mov     [ebp+var_4], ax

loc_1000D0A0:
mov     ecx, [ebp+arg_0]
movsx   edx, word ptr [ecx+64h]
test    edx, edx
jz      short loc_1000D0C5
mov     eax, [ebp+arg_0]
movsx   ecx, word ptr [eax+66h]
test    ecx, ecx
jz      short loc_1000D0C5
mov     edx, [ebp+arg_0]
mov     ax, [ebp+var_4]
sub     ax, [edx+68h]
mov     [ebp+var_4], ax

loc_1000D0C5:
push    0
mov     ecx, [ebp+arg_0]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_1000D0D7:
mov     esp, ebp
pop     ebp
retn
sub_1000D05B endp

; Exported entry  30. GetAmplForDbm


; Attributes: bp-based frame

; int __cdecl GetAmplForDbm(int, double)
public GetAmplForDbm
GetAmplForDbm proc near

var_10= qword ptr -10h
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8
dbm= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D0FA
or      ax, 0FFFFh
jmp     short loc_1000D16D

loc_1000D0FA:
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+80h]
and     eax, 20h
test    eax, eax
jz      short loc_1000D134
mov     ecx, dword ptr [ebp+dbm+4]
push    ecx
mov     edx, dword ptr [ebp+dbm]
push    edx             ; dbm
mov     eax, [ebp+a1]
push    eax             ; a1
call    GetnVForDbm
add     esp, 4
fstp    [esp+10h+var_10] ; double
mov     ecx, [ebp+a1]
push    ecx             ; int
call    GetAmplFornV
add     esp, 0Ch
mov     [ebp+var_4], ax
jmp     short loc_1000D15B

loc_1000D134:
mov     edx, [ebp+a1]
push    edx
call    sub_1000CF43
add     esp, 4
movsx   eax, ax
mov     [ebp+var_8], eax
fild    [ebp+var_8]
fsubr   [ebp+dbm]
fmul    ds:dbl_10016160
call    sub_1000D53C
mov     [ebp+var_4], ax

loc_1000D15B:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_1000D16D:
mov     esp, ebp
pop     ebp
retn
GetAmplForDbm endp

; Exported entry  31. GetAmplFornV


; Attributes: bp-based frame

; int __cdecl GetAmplFornV(int, double)
public GetAmplFornV
GetAmplFornV proc near

var_10= qword ptr -10h
var_8= dword ptr -8
var_4= word ptr -4
a1= dword ptr  8
volts= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D193
or      ax, 0FFFFh
jmp     loc_1000D221

loc_1000D193:
mov     edx, [ebp+a1]
movsx   eax, word ptr [edx+80h]
and     eax, 20h
test    eax, eax
jz      short loc_1000D1E8
mov     ecx, [ebp+a1]
push    ecx
call    sub_1000D05B
add     esp, 4
movsx   edx, ax
mov     [ebp+var_8], edx
fild    [ebp+var_8]
fdiv    ds:dbl_10016170
fadd    ds:dbl_100160F0
sub     esp, 8
fstp    [esp+10h+var_10]
push    40240000h
push    0
call    sub_1000DEF9
add     esp, 10h
fdivr   [ebp+volts]
call    sub_1000D53C
mov     [ebp+var_4], ax
jmp     short loc_1000D20F

loc_1000D1E8:
mov     eax, dword ptr [ebp+volts+4]
push    eax
mov     ecx, dword ptr [ebp+volts]
push    ecx             ; volts
mov     edx, [ebp+a1]
push    edx             ; a1
call    GetDbmForVoltage
add     esp, 4
fstp    [esp+10h+var_10] ; double
mov     eax, [ebp+a1]
push    eax             ; int
call    GetAmplForDbm
add     esp, 0Ch
mov     [ebp+var_4], ax

loc_1000D20F:
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_1000D221:
mov     esp, ebp
pop     ebp
retn
GetAmplFornV endp

; Exported entry  37. GetDbmForVoltage


; Attributes: bp-based frame

; int __cdecl GetDbmForVoltage(int a1, double volts)
public GetDbmForVoltage
GetDbmForVoltage proc near

var_1C= qword ptr -1Ch
v3= dword ptr -14h
var_10= qword ptr -10h
v2= qword ptr -8
a1= dword ptr  8
volts= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 14h
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D246
fld     ds:dbl_10016100
jmp     short loc_1000D2AD

loc_1000D246:
fld     [ebp+volts]
fcomp   ds:dbl_100160F8
fnstsw  ax
test    ah, 41h
jz      short loc_1000D25E
fld     ds:dbl_10016168
jmp     short loc_1000D2AD

loc_1000D25E:
fld     [ebp+volts]
fdiv    ds:dbl_10016188
fst     [ebp+v2]
fmul    [ebp+v2]
mov     edx, [ebp+a1]
movsx   eax, [edx+S.impedance]
mov     [ebp+v3], eax
fild    [ebp+v3]
fmul    ds:dbl_10016180
fdivp   st(1), st
sub     esp, 8
fstp    [esp+1Ch+var_1C]
call    sub_1000E114
add     esp, 8
fmul    ds:dbl_10016178
fstp    [ebp+var_10]
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     [ebp+var_10]

loc_1000D2AD:
mov     esp, ebp
pop     ebp
retn
GetDbmForVoltage endp

; Exported entry  49. GetnVForDbm


; Attributes: bp-based frame

; int __cdecl GetnVForDbm(int a1, double dbm)
public GetnVForDbm
GetnVForDbm proc near

v5= qword ptr -24h
v4= qword ptr -1Ch
var_14= dword ptr -14h
var_10= qword ptr -10h
var_8= qword ptr -8
a1= dword ptr  8
dbm= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 1Ch
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D2D2
fld     ds:dbl_10016100
jmp     short loc_1000D337

loc_1000D2D2:
mov     edx, [ebp+a1]
movsx   eax, [edx+S.impedance]
mov     [ebp+var_14], eax
fild    [ebp+var_14]
fdiv    ds:dbl_10016150
fstp    [ebp+v4]
fld     [ebp+dbm]
fdiv    ds:dbl_10016178
sub     esp, 8
fstp    [esp+24h+v5]
push    40240000h
push    0
call    sub_1000DEF9
add     esp, 10h
fmul    [ebp+v4]
sub     esp, 8
fstp    [esp+24h+v5]
call    sub_1000E1E4
add     esp, 8
fst     [ebp+var_8]
fmul    ds:dbl_10016188
fstp    [ebp+var_10]
push    0
mov     ecx, [ebp+a1]
push    ecx
call    SetFuncStatusCode
add     esp, 8
fld     [ebp+var_10]

loc_1000D337:
mov     esp, ebp
pop     ebp
retn
GetnVForDbm endp

; Exported entry  23. FindEquivDbmRef


; Attributes: bp-based frame

; int __cdecl FindEquivDbmRef(int, double)
public FindEquivDbmRef
FindEquivDbmRef proc near

var_C= qword ptr -0Ch
var_4= word ptr -4
a1= dword ptr  8
volts= qword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     eax, [ebp+a1]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D35A
mov     ax, 0FC18h
jmp     short loc_1000D3B0

loc_1000D35A:
mov     edx, dword ptr [ebp+volts+4]
push    edx
mov     eax, dword ptr [ebp+volts]
push    eax             ; volts
mov     ecx, [ebp+a1]
push    ecx             ; a1
call    GetDbmForVoltage
add     esp, 0Ch
fst     [ebp+var_C]
fcomp   ds:dbl_100160F8
fnstsw  ax
test    ah, 1
jnz     short loc_1000D392
fld     [ebp+var_C]
fadd    ds:dbl_10016190
call    sub_1000D53C
mov     [ebp+var_4], ax
jmp     short loc_1000D39E

loc_1000D392:
fld     [ebp+var_C]
call    sub_1000D53C
mov     [ebp+var_4], ax

loc_1000D39E:
push    0
mov     edx, [ebp+a1]
push    edx
call    SetFuncStatusCode
add     esp, 8
mov     ax, [ebp+var_4]

loc_1000D3B0:
mov     esp, ebp
pop     ebp
retn
FindEquivDbmRef endp

; Exported entry  44. GetRBWwide


; Attributes: bp-based frame

public GetRBWwide
GetRBWwide proc near

var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= word ptr  8

push    ebp
mov     ebp, esp
sub     esp, 18h
mov     [ebp+var_18], 12Ch
mov     [ebp+var_14], 0BB8h
mov     [ebp+var_10], 7530h
mov     [ebp+var_C], 493E0h
mov     [ebp+var_8], 2DC6C0h
movsx   eax, [ebp+arg_0]
test    eax, eax
jl      short loc_1000D3FB
movsx   ecx, [ebp+arg_0]
cmp     ecx, 4
jg      short loc_1000D3FB
movsx   edx, [ebp+arg_0]
mov     eax, [ebp+edx*4+var_18]
mov     [ebp+var_4], eax
jmp     short loc_1000D402

loc_1000D3FB:
mov     [ebp+var_4], 0FFFFFFFDh

loc_1000D402:
mov     eax, [ebp+var_4]
mov     esp, ebp
pop     ebp
retn
GetRBWwide endp

push    ebp
mov     ebp, esp
sub     esp, 24h
mov     dword ptr [ebp-24h], 0
mov     dword ptr [ebp-20h], 3
mov     dword ptr [ebp-1Ch], 1Eh
mov     dword ptr [ebp-18h], 12Ch
mov     dword ptr [ebp-14h], 0BB8h
mov     dword ptr [ebp-10h], 7530h
mov     dword ptr [ebp-0Ch], 493E0h
mov     dword ptr [ebp-8], 2DC6C0h
movsx   eax, word ptr [ebp+8]
test    eax, eax
jl      short loc_1000D465
movsx   ecx, word ptr [ebp+8]
cmp     ecx, 7
jg      short loc_1000D465
movsx   edx, word ptr [ebp+8]
mov     eax, [ebp+edx*4-24h]
mov     [ebp-4], eax
jmp     short loc_1000D46C

loc_1000D465:
mov     dword ptr [ebp-4], 0FFFFFFFFh

loc_1000D46C:
mov     eax, [ebp-4]
mov     esp, ebp
pop     ebp
retn
push    ebp
mov     ebp, esp
sub     esp, 8
mov     eax, [ebp+8]
push    eax
call    TestFuncStatusAndPtr
add     esp, 4
movsx   ecx, ax
test    ecx, ecx
jz      short loc_1000D48E
jmp     short loc_1000D4B7

loc_1000D48E:
mov     edx, [ebp+8]
push    edx
call    CheckSWStatus
add     esp, 4
mov     [ebp-8], ax
mov     eax, [ebp+8]
push    eax
call    CheckHWStatus
add     esp, 4
movsx   ecx, ax
and     ecx, 0F00h
mov     [ebp-4], cx

loc_1000D4B7:
mov     esp, ebp
pop     ebp
retn
; Exported entry  60. InitTimeoutLoop


; Attributes: bp-based frame

public InitTimeoutLoop
InitTimeoutLoop proc near
push    ebp
mov     ebp, esp
call    IeTimer
mov     dword_1001B410, eax
pop     ebp
retn
InitTimeoutLoop endp

; Exported entry 194. TestTimeoutDone


; Attributes: bp-based frame

public TestTimeoutDone
TestTimeoutDone proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, dword_1001B410
push    eax
call    IeTimerFrom
add     esp, 4
cmp     eax, [ebp+arg_0]
jle     short loc_1000D4E6
mov     ax, 1
jmp     short loc_1000D4E9

loc_1000D4E6:
xor     ax, ax

loc_1000D4E9:
pop     ebp
retn
TestTimeoutDone endp




sub_1000D4EB proc near
call    sub_1000D503
call    sub_1000E483
mov     dword_1001B41C, eax
call    sub_1000E433
fnclex
retn
sub_1000D4EB endp

; [00000001 BYTES: COLLAPSED FUNCTION nullsub_1. PRESS CTRL-NUMPAD+ TO EXPAND]



sub_1000D503 proc near
mov     eax, offset sub_1000E85C
mov     off_100183C0, offset loc_1000E506
mov     off_100183BC, eax
mov     off_100183C4, offset sub_1000E56C
mov     off_100183C8, offset sub_1000E4AC
mov     off_100183CC, offset loc_1000E554
mov     off_100183D0, eax
retn
sub_1000D503 endp

align 4


; Attributes: bp-based frame

sub_1000D53C proc near

var_C= qword ptr -0Ch
var_4= word ptr -4
var_2= word ptr -2

push    ebp
mov     ebp, esp
add     esp, 0FFFFFFF4h
fstcw   [ebp+var_2]
wait
mov     ax, [ebp+var_2]
or      ah, 0Ch
mov     [ebp+var_4], ax
fldcw   [ebp+var_4]
fistp   [ebp+var_C]
fldcw   [ebp+var_2]
mov     eax, dword ptr [ebp+var_C]
mov     edx, dword ptr [ebp+var_C+4]
leave
retn
sub_1000D53C endp




sub_1000D563 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
test    eax, eax
jge     short locret_1000D56D
neg     eax

locret_1000D56D:
retn
sub_1000D563 endp

align 10h



sub_1000D570 proc near

arg_0= dword ptr  4

push    edi
mov     edi, [esp+4+arg_0]
jmp     short loc_1000D5E1
sub_1000D570 endp

align 10h



sub_1000D580 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     ecx, [esp+arg_0]
push    edi
test    ecx, 3
jz      short loc_1000D59C

loc_1000D58D:
mov     al, [ecx]
inc     ecx
test    al, al
jz      short loc_1000D5CF
test    ecx, 3
jnz     short loc_1000D58D

loc_1000D59C:
mov     eax, [ecx]
mov     edx, 7EFEFEFFh
add     edx, eax
xor     eax, 0FFFFFFFFh
xor     eax, edx
add     ecx, 4
test    eax, 81010100h
jz      short loc_1000D59C
mov     eax, [ecx-4]
test    al, al
jz      short loc_1000D5DE
test    ah, ah
jz      short loc_1000D5D9
test    eax, 0FF0000h
jz      short loc_1000D5D4
test    eax, 0FF000000h
jz      short loc_1000D5CF
jmp     short loc_1000D59C

loc_1000D5CF:
lea     edi, [ecx-1]
jmp     short loc_1000D5E1

loc_1000D5D4:
lea     edi, [ecx-2]
jmp     short loc_1000D5E1

loc_1000D5D9:
lea     edi, [ecx-3]
jmp     short loc_1000D5E1

loc_1000D5DE:
lea     edi, [ecx-4]

loc_1000D5E1:
mov     ecx, [esp+4+arg_4]
test    ecx, 3
jz      short loc_1000D606

loc_1000D5ED:
mov     dl, [ecx]
inc     ecx
test    dl, dl
jz      short loc_1000D658
mov     [edi], dl
inc     edi
test    ecx, 3
jnz     short loc_1000D5ED
jmp     short loc_1000D606

loc_1000D601:
mov     [edi], edx
add     edi, 4

loc_1000D606:
mov     edx, 7EFEFEFFh
mov     eax, [ecx]
add     edx, eax
xor     eax, 0FFFFFFFFh
xor     eax, edx
mov     edx, [ecx]
add     ecx, 4
test    eax, 81010100h
jz      short loc_1000D601
test    dl, dl
jz      short loc_1000D658
test    dh, dh
jz      short loc_1000D64F
test    edx, 0FF0000h
jz      short loc_1000D642
test    edx, 0FF000000h
jz      short loc_1000D63A
jmp     short loc_1000D601

loc_1000D63A:
mov     [edi], edx
mov     eax, [esp+4+arg_0]
pop     edi
retn

loc_1000D642:
mov     [edi], dx
mov     eax, [esp+4+arg_0]
mov     byte ptr [edi+2], 0
pop     edi
retn

loc_1000D64F:
mov     [edi], dx
mov     eax, [esp+4+arg_0]
pop     edi
retn

loc_1000D658:
mov     [edi], dl
mov     eax, [esp+4+arg_0]
pop     edi
retn
sub_1000D580 endp




sub_1000D660 proc near

arg_0= dword ptr  4

push    ebx
push    ebp
push    esi
push    edi
mov     edi, [esp+10h+arg_0]

loc_1000D668:
cmp     dword_100185E0, 1
jle     short loc_1000D680
movzx   eax, byte ptr [edi]
push    8               ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_1000D68F

loc_1000D680:
movzx   eax, byte ptr [edi]
mov     ecx, off_100183D4
mov     al, [ecx+eax*2]
and     eax, 8

loc_1000D68F:
test    eax, eax
jz      short loc_1000D696
inc     edi
jmp     short loc_1000D668

loc_1000D696:
movzx   esi, byte ptr [edi]
inc     edi
cmp     esi, 2Dh
mov     ebp, esi
jz      short loc_1000D6A6
cmp     esi, 2Bh
jnz     short loc_1000D6AA

loc_1000D6A6:
movzx   esi, byte ptr [edi]
inc     edi

loc_1000D6AA:
xor     ebx, ebx

loc_1000D6AC:
cmp     dword_100185E0, 1
jle     short loc_1000D6C1
push    4               ; int
push    esi             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_1000D6CC

loc_1000D6C1:
mov     eax, off_100183D4
mov     al, [eax+esi*2]
and     eax, 4

loc_1000D6CC:
test    eax, eax
jz      short loc_1000D6DD
lea     eax, [ebx+ebx*4]
lea     ebx, [esi+eax*2-30h]
movzx   esi, byte ptr [edi]
inc     edi
jmp     short loc_1000D6AC

loc_1000D6DD:
cmp     ebp, 2Dh
mov     eax, ebx
jnz     short loc_1000D6E6
neg     eax

loc_1000D6E6:
pop     edi
pop     esi
pop     ebp
pop     ebx
retn
sub_1000D660 endp




sub_1000D6EB proc near

arg_0= dword ptr  4

push    [esp+arg_0]
call    sub_1000D660
pop     ecx
retn
sub_1000D6EB endp

align 10h


; Attributes: bp-based frame

sub_1000D700 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    edi
push    esi
push    ebx
mov     ecx, [ebp+arg_8]
jecxz   short loc_1000D731
mov     ebx, ecx
mov     edi, [ebp+arg_0]
mov     esi, edi
xor     eax, eax
repne scasb
neg     ecx
add     ecx, ebx
mov     edi, esi
mov     esi, [ebp+arg_4]
repe cmpsb
mov     al, [esi-1]
xor     ecx, ecx
cmp     al, [edi-1]
ja      short loc_1000D72F
jz      short loc_1000D731
dec     ecx
dec     ecx

loc_1000D72F:
not     ecx

loc_1000D731:
mov     eax, ecx
pop     ebx
pop     esi
pop     edi
leave
retn
sub_1000D700 endp

align 10h



sub_1000D740 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

mov     ecx, [esp+arg_8]
push    edi
test    ecx, ecx
jz      short loc_1000D7C3
push    esi
push    ebx
mov     ebx, ecx
mov     esi, [esp+0Ch+arg_4]
test    esi, 3
mov     edi, [esp+0Ch+arg_0]
jnz     short loc_1000D764
shr     ecx, 2
jnz     short loc_1000D7D1
jmp     short loc_1000D785

loc_1000D764:
mov     al, [esi]
inc     esi
mov     [edi], al
inc     edi
dec     ecx
jz      short loc_1000D792
test    al, al
jz      short loc_1000D79A
test    esi, 3
jnz     short loc_1000D764
mov     ebx, ecx
shr     ecx, 2
jnz     short loc_1000D7D1

loc_1000D780:
and     ebx, 3
jz      short loc_1000D792

loc_1000D785:
mov     al, [esi]
inc     esi
mov     [edi], al
inc     edi
test    al, al
jz      short loc_1000D7BE
dec     ebx
jnz     short loc_1000D785

loc_1000D792:
mov     eax, [esp+0Ch+arg_0]
pop     ebx
pop     esi
pop     edi
retn

loc_1000D79A:
test    edi, 3
jz      short loc_1000D7B4

loc_1000D7A2:
mov     [edi], al
inc     edi
dec     ecx
jz      loc_1000D836
test    edi, 3
jnz     short loc_1000D7A2

loc_1000D7B4:
mov     ebx, ecx
shr     ecx, 2
jnz     short loc_1000D827

loc_1000D7BB:
mov     [edi], al
inc     edi

loc_1000D7BE:
dec     ebx
jnz     short loc_1000D7BB
pop     ebx
pop     esi

loc_1000D7C3:
mov     eax, [esp+4+arg_0]
pop     edi
retn

loc_1000D7C9:
mov     [edi], edx
add     edi, 4
dec     ecx
jz      short loc_1000D780

loc_1000D7D1:
mov     edx, 7EFEFEFFh
mov     eax, [esi]
add     edx, eax
xor     eax, 0FFFFFFFFh
xor     eax, edx
mov     edx, [esi]
add     esi, 4
test    eax, 81010100h
jz      short loc_1000D7C9
test    dl, dl
jz      short loc_1000D81B
test    dh, dh
jz      short loc_1000D811
test    edx, 0FF0000h
jz      short loc_1000D807
test    edx, 0FF000000h
jnz     short loc_1000D7C9
mov     [edi], edx
jmp     short loc_1000D81F

loc_1000D807:
and     edx, 0FFFFh
mov     [edi], edx
jmp     short loc_1000D81F

loc_1000D811:
and     edx, 0FFh
mov     [edi], edx
jmp     short loc_1000D81F

loc_1000D81B:
xor     edx, edx
mov     [edi], edx

loc_1000D81F:
add     edi, 4
xor     eax, eax
dec     ecx
jz      short loc_1000D831

loc_1000D827:
xor     eax, eax

loc_1000D829:
mov     [edi], eax
add     edi, 4
dec     ecx
jnz     short loc_1000D829

loc_1000D831:
and     ebx, 3
jnz     short loc_1000D7BB

loc_1000D836:
mov     eax, [esp+0Ch+arg_0]
pop     ebx
pop     esi
pop     edi
retn
sub_1000D740 endp



; Attributes: bp-based frame

sub_1000D83E proc near

var_24= dword ptr -24h
var_18= qword ptr -18h
var_8= qword ptr -8
arg_0= dword ptr  8
arg_6= dword ptr  0Eh

push    ebp
mov     ebp, esp
push    ecx
push    ecx
push    esi
mov     esi, 0FFFFh
push    edi
push    esi
push    133Fh
call    sub_1000F19D
mov     edi, eax
mov     eax, [ebp+arg_6]
and     ax, 7FF0h
pop     ecx
cmp     ax, 7FF0h
pop     ecx
jnz     short loc_1000D8D2
fld     qword ptr [ebp+8]
push    ecx
push    ecx
fstp    [esp+18h+var_18]
call    sub_1000F065
pop     ecx
dec     eax
pop     ecx
jz      short loc_1000D8C4
dec     eax
jz      short loc_1000D8B4
fld     qword ptr [ebp+8]
dec     eax
push    edi             ; int
jz      short loc_1000D8A3
fadd    ds:dbl_100160F0
push    ecx             ; int
push    ecx
fstp    qword ptr [esp] ; int
fld     qword ptr [ebp+8]
push    ecx             ; int
push    ecx
fstp    qword ptr [esp+24h+var_24] ; int
push    15h             ; int
push    8               ; dwExceptionCode
call    sub_1000E9D8
add     esp, 1Ch
jmp     short loc_1000D8EF

loc_1000D8A3:
push    ecx
push    ecx
fstp    qword ptr [esp] ; double
push    15h             ; int
call    sub_1000E984
add     esp, 10h
jmp     short loc_1000D8EF

loc_1000D8B4:
push    esi
push    edi
call    sub_1000F19D
fld     qword ptr [ebp+8]
pop     ecx
fchs
pop     ecx
jmp     short loc_1000D8EF

loc_1000D8C4:
push    esi
push    edi
call    sub_1000F19D
fld     qword ptr [ebp+8]
pop     ecx
pop     ecx
jmp     short loc_1000D8EF

loc_1000D8D2:
mov     eax, [ebp+0Ch]
push    esi
and     eax, 7FFFFFFFh
push    edi
mov     dword ptr [ebp+var_8+4], eax
mov     eax, [ebp+arg_0]
mov     dword ptr [ebp+var_8], eax
call    sub_1000F19D
fld     [ebp+var_8]
pop     ecx
pop     ecx

loc_1000D8EF:
pop     edi
pop     esi
leave
retn
sub_1000D83E endp

align 10h



sub_1000D900 proc near

arg_0= dword ptr  4

mov     ecx, [esp+arg_0]
test    ecx, 3
jz      short loc_1000D920

loc_1000D90C:
mov     al, [ecx]
inc     ecx
test    al, al
jz      short loc_1000D953
test    ecx, 3
jnz     short loc_1000D90C
add     eax, 0

loc_1000D920:
mov     eax, [ecx]
mov     edx, 7EFEFEFFh
add     edx, eax
xor     eax, 0FFFFFFFFh
xor     eax, edx
add     ecx, 4
test    eax, 81010100h
jz      short loc_1000D920
mov     eax, [ecx-4]
test    al, al
jz      short loc_1000D971
test    ah, ah
jz      short loc_1000D967
test    eax, 0FF0000h
jz      short loc_1000D95D
test    eax, 0FF000000h
jz      short loc_1000D953
jmp     short loc_1000D920

loc_1000D953:
lea     eax, [ecx-1]
mov     ecx, [esp+arg_0]
sub     eax, ecx
retn

loc_1000D95D:
lea     eax, [ecx-2]
mov     ecx, [esp+arg_0]
sub     eax, ecx
retn

loc_1000D967:
lea     eax, [ecx-3]
mov     ecx, [esp+arg_0]
sub     eax, ecx
retn

loc_1000D971:
lea     eax, [ecx-4]
mov     ecx, [esp+arg_0]
sub     eax, ecx
retn
sub_1000D900 endp



; Attributes: bp-based frame

; int __cdecl sub_1000D97B(LPVOID lpMem)
sub_1000D97B proc near

var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
ms_exc= CPPEH_RECORD ptr -18h
lpMem= dword ptr  8

push    ebp
mov     ebp, esp
push    0FFFFFFFFh
push    offset stru_10016198
push    offset sub_10010508
mov     eax, large fs:0
push    eax
mov     large fs:0, esp
sub     esp, 18h
push    ebx
push    esi
push    edi
mov     esi, [ebp+lpMem]
test    esi, esi
jz      loc_1000DA55
mov     eax, dword_1001BB14
cmp     eax, 3
jnz     short loc_1000D9EE
push    9
call    sub_1001039A
pop     ecx
and     [ebp+ms_exc.registration.TryLevel], 0
push    esi
call    sub_1000F4D8
pop     ecx
mov     [ebp+var_1C], eax
test    eax, eax
jz      short loc_1000D9D6
push    esi
push    eax
call    sub_1000F503
pop     ecx
pop     ecx

loc_1000D9D6:
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
call    loc_1000D9E5

loc_1000D9DF:
cmp     [ebp+var_1C], 0
jmp     short loc_1000DA36

loc_1000D9E5:
push    9
call    sub_100103FB
pop     ecx
retn

loc_1000D9EE:
cmp     eax, 2
jnz     short loc_1000DA46
push    9
call    sub_1001039A
pop     ecx
mov     [ebp+ms_exc.registration.TryLevel], 1
lea     eax, [ebp+var_20]
push    eax
lea     eax, [ebp+var_28]
push    eax
push    esi
call    sub_1000FF3D
add     esp, 0Ch
mov     [ebp+var_24], eax
test    eax, eax
jz      short loc_1000DA29
push    eax
push    [ebp+var_20]
push    [ebp+var_28]
call    sub_1000FF94
add     esp, 0Ch

loc_1000DA29:
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
call    loc_1000DA3D

loc_1000DA32:
cmp     [ebp+var_24], 0

loc_1000DA36:
jnz     short loc_1000DA55
push    [ebp+lpMem]
jmp     short loc_1000DA47

loc_1000DA3D:
push    9
call    sub_100103FB
pop     ecx
retn

loc_1000DA46:           ; lpMem
push    esi

loc_1000DA47:           ; dwFlags
push    0
push    hHeap           ; hHeap
call    ds:HeapFree

loc_1000DA55:
mov     ecx, [ebp+ms_exc.registration.Next]
mov     large fs:0, ecx
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000D97B endp




sub_1000DA64 proc near

arg_0= dword ptr  4

push    dword_1001B498
push    [esp+4+arg_0]
call    sub_1000DA76
pop     ecx
pop     ecx
retn
sub_1000DA64 endp




sub_1000DA76 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

cmp     [esp+arg_0], 0FFFFFFE0h
ja      short loc_1000DA9F

loc_1000DA7D:
push    [esp+arg_0]
call    sub_1000DAA2
test    eax, eax
pop     ecx
jnz     short locret_1000DAA1
cmp     [esp+arg_4], eax
jz      short locret_1000DAA1
push    [esp+arg_0]
call    sub_100105E0
test    eax, eax
pop     ecx
jnz     short loc_1000DA7D

loc_1000DA9F:
xor     eax, eax

locret_1000DAA1:
retn
sub_1000DA76 endp



; Attributes: bp-based frame

sub_1000DAA2 proc near

var_1C= dword ptr -1Ch
ms_exc= CPPEH_RECORD ptr -18h
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    0FFFFFFFFh
push    offset stru_100161B0
push    offset sub_10010508
mov     eax, large fs:0
push    eax
mov     large fs:0, esp
sub     esp, 0Ch
push    ebx
push    esi
push    edi
mov     eax, dword_1001BB14
cmp     eax, 3
jnz     short loc_1000DB12
mov     esi, [ebp+arg_0]
cmp     esi, dword_1001BB0C
ja      loc_1000DB71
push    9
call    sub_1001039A
pop     ecx
and     [ebp+ms_exc.registration.TryLevel], 0
push    esi
call    sub_1000F82C
pop     ecx
mov     [ebp+var_1C], eax
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
call    loc_1000DB09

loc_1000DAFD:
mov     eax, [ebp+var_1C]
test    eax, eax
jz      short loc_1000DB71
jmp     loc_1000DB8F

loc_1000DB09:
push    9
call    sub_100103FB
pop     ecx
retn

loc_1000DB12:
cmp     eax, 2
jnz     short loc_1000DB71
mov     eax, [ebp+arg_0]
test    eax, eax
jz      short loc_1000DB26
lea     esi, [eax+0Fh]
and     esi, 0FFFFFFF0h
jmp     short loc_1000DB29

loc_1000DB26:
push    10h
pop     esi

loc_1000DB29:
mov     [ebp+arg_0], esi
cmp     esi, dword_1001A734
ja      short loc_1000DB62
push    9
call    sub_1001039A
pop     ecx
mov     [ebp+ms_exc.registration.TryLevel], 1
mov     eax, esi
shr     eax, 4
push    eax
call    sub_1000FFD9
pop     ecx
mov     [ebp+var_1C], eax
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
call    loc_1000DB68

loc_1000DB5B:
mov     eax, [ebp+var_1C]
test    eax, eax
jnz     short loc_1000DB8F

loc_1000DB62:
push    esi
jmp     short loc_1000DB81

loc_1000DB65:
mov     esi, [ebp+arg_0]

loc_1000DB68:
push    9
call    sub_100103FB
pop     ecx
retn

loc_1000DB71:
mov     eax, [ebp+arg_0]
test    eax, eax
jnz     short loc_1000DB7B
push    1
pop     eax

loc_1000DB7B:
add     eax, 0Fh
and     al, 0F0h
push    eax             ; dwBytes

loc_1000DB81:           ; dwFlags
push    0
push    hHeap           ; hHeap
call    ds:HeapAlloc

loc_1000DB8F:
mov     ecx, [ebp+ms_exc.registration.Next]
mov     large fs:0, ecx
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000DAA2 endp

align 10h


; Attributes: bp-based frame

sub_1000DBA0 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    edi
push    esi
mov     esi, [ebp+arg_4]
mov     ecx, [ebp+arg_8]
mov     edi, [ebp+arg_0]
mov     eax, ecx
mov     edx, ecx
add     eax, esi
cmp     edi, esi
jbe     short loc_1000DBC0
cmp     edi, eax
jb      loc_1000DD38

loc_1000DBC0:
test    edi, 3
jnz     short loc_1000DBDC
shr     ecx, 2
and     edx, 3
cmp     ecx, 8          ; switch 8 cases
jb      short loc_1000DBFC
rep movsd               ; jumptable 1000DBFC default case
jmp     ds:off_1000DCE8[edx*4]

loc_1000DBDC:
mov     eax, edi
mov     edx, 3
sub     ecx, 4
jb      short loc_1000DBF4
and     eax, 3
add     ecx, eax
jmp     dword ptr ds:(loc_1000DBFC+4)[eax*4]

loc_1000DBF4:
jmp     dword ptr ds:loc_1000DCF8[ecx*4]
align 4

loc_1000DBFC:           ; switch jump
jmp     ds:off_1000DC7C[ecx*4]
align 4
dd offset loc_1000DC10
dd offset loc_1000DC3C
dd offset loc_1000DC60

loc_1000DC10:
and     edx, ecx
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
mov     [edi+1], al
mov     al, [esi+2]
shr     ecx, 2
mov     [edi+2], al
add     esi, 3
add     edi, 3
cmp     ecx, 8
jb      short loc_1000DBFC
rep movsd
jmp     ds:off_1000DCE8[edx*4]
align 4

loc_1000DC3C:
and     edx, ecx
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
shr     ecx, 2
mov     [edi+1], al
add     esi, 2
add     edi, 2
cmp     ecx, 8
jb      short loc_1000DBFC
rep movsd
jmp     ds:off_1000DCE8[edx*4]
align 10h

loc_1000DC60:
and     edx, ecx
mov     al, [esi]
mov     [edi], al
inc     esi
shr     ecx, 2
inc     edi
cmp     ecx, 8
jb      short loc_1000DBFC
rep movsd
jmp     ds:off_1000DCE8[edx*4]
align 4
off_1000DC7C dd offset loc_1000DCDF ; jump table for switch statement
dd offset loc_1000DCCC
dd offset loc_1000DCC4
dd offset loc_1000DCBC
dd offset loc_1000DCB4
dd offset loc_1000DCAC
dd offset loc_1000DCA4
dd offset loc_1000DC9C

loc_1000DC9C:           ; jumptable 1000DBFC case 7
mov     eax, [esi+ecx*4-1Ch]
mov     [edi+ecx*4-1Ch], eax

loc_1000DCA4:           ; jumptable 1000DBFC case 6
mov     eax, [esi+ecx*4-18h]
mov     [edi+ecx*4-18h], eax

loc_1000DCAC:           ; jumptable 1000DBFC case 5
mov     eax, [esi+ecx*4-14h]
mov     [edi+ecx*4-14h], eax

loc_1000DCB4:           ; jumptable 1000DBFC case 4
mov     eax, [esi+ecx*4-10h]
mov     [edi+ecx*4-10h], eax

loc_1000DCBC:           ; jumptable 1000DBFC case 3
mov     eax, [esi+ecx*4-0Ch]
mov     [edi+ecx*4-0Ch], eax

loc_1000DCC4:           ; jumptable 1000DBFC case 2
mov     eax, [esi+ecx*4-8]
mov     [edi+ecx*4-8], eax

loc_1000DCCC:           ; jumptable 1000DBFC case 1
mov     eax, [esi+ecx*4-4]
mov     [edi+ecx*4-4], eax
lea     eax, ds:0[ecx*4]
add     esi, eax
add     edi, eax

loc_1000DCDF:           ; jumptable 1000DBFC case 0
jmp     ds:off_1000DCE8[edx*4]
align 4
off_1000DCE8 dd offset loc_1000DCF8
dd offset loc_1000DD00
dd offset loc_1000DD0C
dd offset loc_1000DD20

loc_1000DCF8:
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 10h

loc_1000DD00:
mov     al, [esi]
mov     [edi], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_1000DD0C:
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
mov     [edi+1], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 10h

loc_1000DD20:
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
mov     [edi+1], al
mov     al, [esi+2]
mov     [edi+2], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_1000DD38:
lea     esi, [ecx+esi-4]
lea     edi, [ecx+edi-4]
test    edi, 3
jnz     short loc_1000DD6C
shr     ecx, 2
and     edx, 3
cmp     ecx, 8
jb      short loc_1000DD60
std
rep movsd
cld
jmp     ds:off_1000DE80[edx*4] ; jumptable 1000DD84 case 0
align 10h

loc_1000DD60:
neg     ecx
jmp     ds:off_1000DE30[ecx*4]
align 4

loc_1000DD6C:
mov     eax, edi
mov     edx, 3
cmp     ecx, 4          ; switch 4 cases
jb      short loc_1000DD84
and     eax, 3          ; jumptable 1000DD84 default case
sub     ecx, eax
jmp     dword ptr ds:(loc_1000DD84+4)[eax*4]

loc_1000DD84:           ; switch jump
jmp     ds:off_1000DE80[ecx*4]
align 4
dd offset loc_1000DD98
dd offset loc_1000DDB8
dd offset loc_1000DDE0

loc_1000DD98:
mov     al, [esi+3]
and     edx, ecx
mov     [edi+3], al
dec     esi
shr     ecx, 2
dec     edi
cmp     ecx, 8
jb      short loc_1000DD60
std
rep movsd
cld
jmp     ds:off_1000DE80[edx*4] ; jumptable 1000DD84 case 0
align 4

loc_1000DDB8:
mov     al, [esi+3]
and     edx, ecx
mov     [edi+3], al
mov     al, [esi+2]
shr     ecx, 2
mov     [edi+2], al
sub     esi, 2
sub     edi, 2
cmp     ecx, 8
jb      short loc_1000DD60
std
rep movsd
cld
jmp     ds:off_1000DE80[edx*4] ; jumptable 1000DD84 case 0
align 10h

loc_1000DDE0:
mov     al, [esi+3]
and     edx, ecx
mov     [edi+3], al
mov     al, [esi+2]
mov     [edi+2], al
mov     al, [esi+1]
shr     ecx, 2
mov     [edi+1], al
sub     esi, 3
sub     edi, 3
cmp     ecx, 8
jb      loc_1000DD60
std
rep movsd
cld
jmp     ds:off_1000DE80[edx*4] ; jumptable 1000DD84 case 0
align 4
dd offset loc_1000DE34
dd offset loc_1000DE3C
dd offset loc_1000DE44
dd offset loc_1000DE4C
dd offset loc_1000DE54
dd offset loc_1000DE5C
dd offset loc_1000DE64
off_1000DE30 dd offset loc_1000DE77

loc_1000DE34:
mov     eax, [esi+ecx*4+1Ch]
mov     [edi+ecx*4+1Ch], eax

loc_1000DE3C:
mov     eax, [esi+ecx*4+18h]
mov     [edi+ecx*4+18h], eax

loc_1000DE44:
mov     eax, [esi+ecx*4+14h]
mov     [edi+ecx*4+14h], eax

loc_1000DE4C:
mov     eax, [esi+ecx*4+10h]
mov     [edi+ecx*4+10h], eax

loc_1000DE54:
mov     eax, [esi+ecx*4+0Ch]
mov     [edi+ecx*4+0Ch], eax

loc_1000DE5C:
mov     eax, [esi+ecx*4+8]
mov     [edi+ecx*4+8], eax

loc_1000DE64:
mov     eax, [esi+ecx*4+4]
mov     [edi+ecx*4+4], eax
lea     eax, ds:0[ecx*4]
add     esi, eax
add     edi, eax

loc_1000DE77:           ; jumptable 1000DD84 case 0
jmp     ds:off_1000DE80[edx*4]
align 10h
off_1000DE80 dd offset loc_1000DE90 ; jump table for switch statement
dd offset loc_1000DE98  ; jumptable 1000DD84 case 1
dd offset loc_1000DEA8  ; jumptable 1000DD84 case 2
dd offset loc_1000DEBC  ; jumptable 1000DD84 case 3

loc_1000DE90:           ; jumptable 1000DD84 case 0
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_1000DE98:           ; jumptable 1000DD84 case 1
mov     al, [esi+3]
mov     [edi+3], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_1000DEA8:           ; jumptable 1000DD84 case 2
mov     al, [esi+3]
mov     [edi+3], al
mov     al, [esi+2]
mov     [edi+2], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_1000DEBC:           ; jumptable 1000DD84 case 3
mov     al, [esi+3]
mov     [edi+3], al
mov     al, [esi+2]
mov     [edi+2], al
mov     al, [esi+1]
mov     [edi+1], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
sub_1000DBA0 endp

align 10h
sub     esp, 10h
fxch    st(1)
fstp    qword ptr [esp]
fst     qword ptr [esp+8]
mov     eax, [esp+0Ch]
call    loc_1000DF02
add     esp, 10h
retn



sub_1000DEF9 proc near

var_8C= qword ptr -8Ch
var_84= qword ptr -84h
var_4= word ptr -4
arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch
arg_C= dword ptr  10h

; FUNCTION CHUNK AT 10010ADE SIZE 0000000D BYTES

lea     edx, [esp+arg_8]
call    sub_10010A85

loc_1000DF02:
mov     ecx, eax
push    eax
fstcw   [esp+4+var_4]
cmp     [esp+4+var_4], 27Fh
jz      short loc_1000DF16
call    sub_10010A55

loc_1000DF16:
and     ecx, 7FF00000h
lea     edx, [esp+4+arg_0]
cmp     ecx, 7FF00000h
jz      loc_1000DFC9
call    sub_10010A85
jz      loc_1000DFC5
test    eax, 7FF00000h
jz      loc_1000E038

loc_1000DF42:
mov     cl, byte ptr [esp+4+arg_4+3]
and     cl, 80h
jnz     loc_1000E0B0

loc_1000DF4F:
fyl2x
call    sub_10010A40
cmp     cl, 1
jnz     short loc_1000DF5D
fchs

loc_1000DF5D:
cmp     dword_1001B418, 0
jnz     loc_10010ADE
lea     ecx, byte_10018398
mov     edx, 1Dh
jmp     sub_10010B29

loc_1000DF7A:
cmp     dword_1001B418, 0
jnz     loc_10010ADE
lea     ecx, byte_10018398
mov     edx, 1Dh
call    sub_100109E0
pop     edx
retn

loc_1000DF99:
lea     edx, [esp+4+arg_0]
call    sub_10010A85
test    byte ptr [esp+4+arg_C+2], 8
jnz     short loc_1000DFAC
inc     ecx
jmp     short loc_1000DFDF

loc_1000DFAC:
faddp   st(1), st
mov     eax, 1
jmp     short loc_1000DF7A

loc_1000DFB5:
test    byte ptr [esp+4+arg_4+2], 8
jnz     short loc_1000DFAC

loc_1000DFBC:
faddp   st(1), st
mov     eax, 7
jmp     short loc_1000DF7A

loc_1000DFC5:
xor     ecx, ecx
jmp     short loc_1000DFDF

loc_1000DFC9:
xor     ecx, ecx
and     eax, 0FFFFFh
or      eax, [esp+4+arg_8]
jnz     short loc_1000DF99
lea     edx, [esp+4+arg_0]
call    sub_10010A85

loc_1000DFDF:
mov     eax, [esp+4+arg_4]
mov     edx, eax
and     eax, 7FF00000h
and     edx, 0FFFFFh
cmp     eax, 7FF00000h
jnz     short loc_1000DFFD
or      edx, [esp+4+arg_0]
jnz     short loc_1000DFB5

loc_1000DFFD:
test    ecx, ecx
jnz     short loc_1000DFBC
sub     esp, 74h
mov     ecx, esp
push    ecx             ; int
sub     esp, 10h
fstp    [esp+8Ch+var_8C] ; double
fstp    [esp+8Ch+var_84] ; double
fsave   byte ptr [ecx+8]
call    sub_10010BCC
add     esp, 10h
pop     ecx
frstor  byte ptr [ecx+8]
fld     qword ptr [ecx]
add     esp, 74h
test    eax, eax
jz      loc_10010ADE
mov     eax, 1
jmp     loc_1000DF7A

loc_1000E038:
mov     eax, [esp+4+arg_4]
and     eax, 0FFFFFh
or      eax, [esp+4+arg_0]
jnz     loc_1000DF42
fstp    st
mov     eax, [esp+4+arg_C]
test    eax, 7FF00000h
jz      short loc_1000E095
call    sub_1000E0D5
mov     ch, byte ptr [esp+4+arg_4+3]
shr     ch, 7
test    [esp+4+arg_C+3], 80h
jz      short loc_1000E084
fld     tbyte_1001A810
test    ch, cl
jz      short loc_1000E07A
fchs

loc_1000E07A:
mov     eax, 2
jmp     loc_1000DF7A

loc_1000E084:
fldz
test    ch, cl
jz      loc_10010ADE
fchs
jmp     loc_10010ADE

loc_1000E095:
fstp    st
and     eax, 0FFFFFh
or      eax, [esp+4+arg_8]
jnz     short loc_1000E0A9
fld1
jmp     loc_10010ADE

loc_1000E0A9:
fldz
jmp     loc_10010ADE

loc_1000E0B0:
fld     st(1)
call    sub_1000E0D5
fchs
test    cl, cl
jnz     loc_1000DF4F
fstp    st
fstp    st
fld     tbyte_1001A870
mov     eax, 1
jmp     loc_1000DF7A
sub_1000DEF9 endp




sub_1000E0D5 proc near
fld     st
frndint
fcomp   st(1)
mov     cl, 0
fstsw   ax
sahf
jnz     short loc_1000E0FA
fmul    dbl_10018390
inc     cl
fld     st
frndint
fcompp
fstsw   ax
sahf
jnz     short locret_1000E0F9
inc     cl

locret_1000E0F9:
retn

loc_1000E0FA:
fstp    st
retn
sub_1000E0D5 endp

align 10h
sub     esp, 8
fst     qword ptr [esp]
call    sub_10010AC8
call    loc_1000E11D
add     esp, 8
retn



sub_1000E114 proc near

var_4= word ptr -4
arg_0= dword ptr  4
arg_4= dword ptr  8

; FUNCTION CHUNK AT 10010ADE SIZE 0000000D BYTES
; FUNCTION CHUNK AT 10010AEB SIZE 0000002A BYTES

lea     edx, [esp+arg_0]
call    sub_10010A85

loc_1000E11D:
push    edx
fstcw   [esp+4+var_4]
jz      short loc_1000E167
mov     eax, [esp+4+arg_4]
cmp     [esp+4+var_4], 27Fh
jz      short loc_1000E136
fldcw   ds:word_100162F8

loc_1000E136:
test    eax, 7FF00000h
jz      short loc_1000E192
test    eax, 80000000h
jnz     short loc_1000E17C

loc_1000E144:
fldlg2
fxch    st(1)
fyl2x

loc_1000E14A:
cmp     dword_1001B418, 0
jnz     loc_10010ADE
lea     ecx, aLog10     ; "log10"
mov     edx, 1Bh
jmp     loc_10010AEB

loc_1000E167:
test    eax, 0FFFFFh
jnz     short loc_1000E18B
cmp     [esp+4+arg_0], 0
jnz     short loc_1000E18B
and     eax, 80000000h
jz      short loc_1000E14A

loc_1000E17C:
fstp    st
fld     tbyte_1001A870
mov     eax, 1
jmp     short loc_1000E1AD

loc_1000E18B:
call    sub_10010A6C
jmp     short loc_1000E1AD

loc_1000E192:
test    eax, 0FFFFFh
jnz     short loc_1000E144
cmp     [esp+4+arg_0], 0
jnz     short loc_1000E144
fstp    st
fld     tbyte_1001A81A
mov     eax, 2

loc_1000E1AD:
cmp     dword_1001B418, 0
jnz     loc_10010ADE
lea     ecx, aLog10     ; "log10"
mov     edx, 1Bh
call    sub_100109F7
pop     edx
retn
sub_1000E114 endp

align 10h
sub     esp, 8
fst     qword ptr [esp]
call    sub_10010AC8
call    loc_1000E1ED
add     esp, 8
retn



sub_1000E1E4 proc near

var_4= word ptr -4
arg_0= dword ptr  4
arg_4= dword ptr  8

; FUNCTION CHUNK AT 10010ADE SIZE 0000000D BYTES

lea     edx, [esp+arg_0]
call    sub_10010A85

loc_1000E1ED:
push    edx
fstcw   [esp+4+var_4]
mov     eax, [esp+4+arg_4]
jz      short loc_1000E249
cmp     [esp+4+var_4], 27Fh
jz      short loc_1000E205
call    sub_10010A55

loc_1000E205:
test    eax, 80000000h
jnz     short loc_1000E22B
fsqrt

loc_1000E20E:
cmp     dword_1001B418, 0
jnz     loc_10010ADE
mov     edx, 5
lea     ecx, aSqrt      ; "sqrt"
jmp     loc_10010AEB

loc_1000E22B:
test    eax, 7FF00000h
jnz     short loc_1000E25E
test    eax, 0FFFFFh
jnz     short loc_1000E25E
cmp     [esp+4+arg_0], 0
jnz     short loc_1000E25E
jmp     short loc_1000E20E

loc_1000E242:
call    sub_10010A6C
jmp     short loc_1000E26B

loc_1000E249:
test    eax, 0FFFFFh
jnz     short loc_1000E242
cmp     [esp+4+arg_0], 0
jnz     short loc_1000E242
and     eax, 80000000h
jz      short loc_1000E20E

loc_1000E25E:
fstp    st
fld     tbyte_1001A870
mov     eax, 1

loc_1000E26B:
cmp     dword_1001B418, 0
jnz     loc_10010ADE
mov     edx, 5
lea     ecx, aSqrt      ; "sqrt"
call    sub_100109F7
pop     edx
retn
sub_1000E1E4 endp




sub_1000E28A proc near

arg_4= dword ptr  8

mov     eax, [esp+arg_4]
cmp     eax, 1
jnz     loc_1000E31F
call    ds:GetVersion
push    1
mov     dword_1001B4A4, eax
call    sub_1000F38B
test    eax, eax
pop     ecx
jz      short loc_1000E2EA
mov     eax, dword_1001B4A4
xor     ecx, ecx
mov     cl, byte ptr dword_1001B4A4+1
and     eax, 0FFh
shr     dword_1001B4A4, 10h
mov     dword_1001B4AC, eax
mov     dword_1001B4B0, ecx
shl     eax, 8
add     eax, ecx
mov     dword_1001B4A8, eax
call    sub_10010E7F
test    eax, eax
jnz     short loc_1000E2EE
call    sub_1000F3E8

loc_1000E2EA:
xor     eax, eax
jmp     short locret_1000E360

loc_1000E2EE:
call    ds:GetCommandLineA
mov     dword_1001BB18, eax
call    sub_10011521
mov     dword_1001B424, eax
call    sub_1001100B
call    sub_100112D4
call    sub_1001121B
call    sub_10010D61
inc     dword_1001B420
jmp     short loc_1000E35D

loc_1000E31F:
xor     ecx, ecx
cmp     eax, ecx
jnz     short loc_1000E351
cmp     dword_1001B420, ecx
jle     short loc_1000E2EA
dec     dword_1001B420
cmp     dword_1001B4DC, ecx
jnz     short loc_1000E340
call    sub_10010D9F

loc_1000E340:
call    sub_100111C7
call    sub_10010ED3
call    sub_1000F3E8
jmp     short loc_1000E35D

loc_1000E351:
cmp     eax, 3
jnz     short loc_1000E35D
push    ecx             ; lpMem
call    sub_10010F6B
pop     ecx

loc_1000E35D:
push    1
pop     eax

locret_1000E360:
retn    0Ch
sub_1000E28A endp



; Attributes: bp-based frame

; BOOL __stdcall DllEntryPoint(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpReserved)
public DllEntryPoint
DllEntryPoint proc near

hinstDLL= dword ptr  8
fdwReason= dword ptr  0Ch
lpReserved= dword ptr  10h

push    ebp
mov     ebp, esp
push    ebx
mov     ebx, [ebp+hinstDLL]
push    esi
mov     esi, [ebp+fdwReason]
push    edi
mov     edi, [ebp+lpReserved]
test    esi, esi
jnz     short loc_1000E37F
cmp     dword_1001B420, 0
jmp     short loc_1000E3A5

loc_1000E37F:
cmp     esi, 1
jz      short loc_1000E389
cmp     esi, 2
jnz     short loc_1000E3AB

loc_1000E389:
mov     eax, dword_1001BB1C
test    eax, eax
jz      short loc_1000E39B
push    edi
push    esi
push    ebx
call    eax ; dword_1001BB1C
test    eax, eax
jz      short loc_1000E3A7

loc_1000E39B:
push    edi
push    esi
push    ebx
call    sub_1000E28A
test    eax, eax

loc_1000E3A5:
jnz     short loc_1000E3AB

loc_1000E3A7:
xor     eax, eax
jmp     short loc_1000E3F9

loc_1000E3AB:
push    edi
push    esi
push    ebx
call    sub_10011653
cmp     esi, 1
mov     [ebp+fdwReason], eax
jnz     short loc_1000E3C7
test    eax, eax
jnz     short loc_1000E3F6
push    edi
push    eax
push    ebx
call    sub_1000E28A

loc_1000E3C7:
test    esi, esi
jz      short loc_1000E3D0
cmp     esi, 3
jnz     short loc_1000E3F6

loc_1000E3D0:
push    edi
push    esi
push    ebx
call    sub_1000E28A
test    eax, eax
jnz     short loc_1000E3DF
and     [ebp+fdwReason], eax

loc_1000E3DF:
cmp     [ebp+fdwReason], 0
jz      short loc_1000E3F6
mov     eax, dword_1001BB1C
test    eax, eax
jz      short loc_1000E3F6
push    edi
push    esi
push    ebx
call    eax ; dword_1001BB1C
mov     [ebp+fdwReason], eax

loc_1000E3F6:
mov     eax, [ebp+fdwReason]

loc_1000E3F9:
pop     edi
pop     esi
pop     ebx
pop     ebp
retn    0Ch
DllEntryPoint endp




; int __cdecl sub_1000E400(DWORD NumberOfBytesWritten)
sub_1000E400 proc near

NumberOfBytesWritten= dword ptr  4

mov     eax, dword_1001B42C
cmp     eax, 1
jz      short loc_1000E417
test    eax, eax
jnz     short loc_1000E41C
cmp     dword_1001B430, 1
jnz     short loc_1000E41C

loc_1000E417:
call    sub_10011659

loc_1000E41C:           ; NumberOfBytesWritten
push    [esp+NumberOfBytesWritten]
call    sub_10011692
push    0FFh
call    off_100183B8
pop     ecx
pop     ecx
retn
sub_1000E400 endp




sub_1000E433 proc near
push    30000h
push    10000h
call    sub_1001181A
pop     ecx
pop     ecx
retn
sub_1000E433 endp



; Attributes: bp-based frame

sub_1000E445 proc near

var_18= qword ptr -18h
var_10= qword ptr -10h
var_8= qword ptr -8

push    ebp
mov     ebp, esp
sub     esp, 18h
fld     ds:dbl_100161D0
fstp    [ebp+var_8]
fld     ds:dbl_100161C8
fstp    [ebp+var_10]
fld     [ebp+var_10]
fdiv    [ebp+var_8]
fmul    [ebp+var_8]
fsubr   [ebp+var_10]
fstp    [ebp+var_18]
fld     [ebp+var_18]
fcomp   ds:dbl_100160F0
fnstsw  ax
sahf
jbe     short loc_1000E47F
push    1
pop     eax
leave
retn

loc_1000E47F:
xor     eax, eax
leave
retn
sub_1000E445 endp




sub_1000E483 proc near
push    offset ModuleName ; "KERNEL32"
call    ds:GetModuleHandleA
test    eax, eax
jz      short loc_1000E4A7
push    offset ProcName ; "IsProcessorFeaturePresent"
push    eax             ; hModule
call    ds:GetProcAddress
test    eax, eax
jz      short loc_1000E4A7
push    0
call    eax
retn

loc_1000E4A7:
jmp     sub_1000E445
sub_1000E483 endp




sub_1000E4AC proc near

arg_0= dword ptr  4

push    esi
mov     esi, [esp+4+arg_0]
movsx   eax, byte ptr [esi]
push    eax             ; SrcStr
call    sub_1001194B
cmp     eax, 65h
pop     ecx
jz      short loc_1000E4EC

loc_1000E4C0:
inc     esi
cmp     dword_100185E0, 1
jle     short loc_1000E4D9
movsx   eax, byte ptr [esi]
push    4               ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_1000E4E8

loc_1000E4D9:
movsx   eax, byte ptr [esi]
mov     ecx, off_100183D4
mov     al, [ecx+eax*2]
and     eax, 4

loc_1000E4E8:
test    eax, eax
jnz     short loc_1000E4C0

loc_1000E4EC:
mov     cl, byte_100185E4
mov     al, [esi]
mov     [esi], cl
inc     esi

loc_1000E4F7:
mov     cl, [esi]
mov     [esi], al
mov     al, cl
mov     cl, [esi]
inc     esi
test    cl, cl
jnz     short loc_1000E4F7
pop     esi
retn
sub_1000E4AC endp


loc_1000E506:
mov     eax, [esp+4]
mov     dl, byte_100185E4
mov     cl, [eax]
test    cl, cl
jz      short loc_1000E522

loc_1000E516:
cmp     cl, dl
jz      short loc_1000E522
mov     cl, [eax+1]
inc     eax
test    cl, cl
jnz     short loc_1000E516

loc_1000E522:
mov     cl, [eax]
inc     eax
test    cl, cl
jz      short locret_1000E553

loc_1000E529:
mov     cl, [eax]
test    cl, cl
jz      short loc_1000E53C
cmp     cl, 65h
jz      short loc_1000E53C
cmp     cl, 45h
jz      short loc_1000E53C
inc     eax
jmp     short loc_1000E529

loc_1000E53C:
mov     ecx, eax

loc_1000E53E:
dec     eax
cmp     byte ptr [eax], 30h
jz      short loc_1000E53E
cmp     [eax], dl
jnz     short loc_1000E549
dec     eax

loc_1000E549:
mov     dl, [ecx]
inc     eax
inc     ecx
test    dl, dl
mov     [eax], dl
jnz     short loc_1000E549

locret_1000E553:
retn

loc_1000E554:
mov     eax, [esp+4]
fld     qword ptr [eax]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jb      short loc_1000E569
push    1
pop     eax
retn

loc_1000E569:
xor     eax, eax
retn


; Attributes: bp-based frame

sub_1000E56C proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    ecx
push    ecx
cmp     [ebp+arg_0], 0
push    [ebp+arg_8]
jz      short loc_1000E595
lea     eax, [ebp+var_8]
push    eax
call    sub_10011E17
mov     eax, [ebp+arg_4]
pop     ecx
pop     ecx
mov     ecx, [ebp+var_8]
mov     [eax], ecx
mov     ecx, [ebp+var_4]
mov     [eax+4], ecx
leave
retn

loc_1000E595:
lea     eax, [ebp+arg_8]
push    eax
call    sub_10011E44
mov     eax, [ebp+arg_4]
pop     ecx
pop     ecx
mov     ecx, [ebp+arg_8]
mov     [eax], ecx
leave
retn
sub_1000E56C endp



; Attributes: bp-based frame

sub_1000E5AA proc near

var_3C= qword ptr -3Ch
var_28= byte ptr -28h
var_10= dword ptr -10h
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
sub     esp, 28h
lea     eax, [ebp+var_28]
push    esi
push    eax
lea     eax, [ebp+var_10]
push    eax
mov     eax, [ebp+arg_0]
push    ecx
push    ecx
fld     qword ptr [eax]
fstp    [esp+3Ch+var_3C]
call    sub_10011EE8
mov     esi, [ebp+arg_8]
lea     eax, [ebp+var_10]
push    eax
mov     edx, [ebp+arg_4]
lea     eax, [esi+1]
push    eax
xor     eax, eax
cmp     [ebp+var_10], 2Dh
setz    al
xor     ecx, ecx
test    esi, esi
setnle  cl
add     edx, eax
add     ecx, edx
push    ecx
call    sub_10011E71
lea     eax, [ebp+var_10]
push    0
push    eax
push    [ebp+arg_C]
push    esi
push    [ebp+arg_4]
call    sub_1000E60B
mov     eax, [ebp+arg_4]
add     esp, 30h
pop     esi
leave
retn
sub_1000E5AA endp



; Attributes: bp-based frame

sub_1000E60B proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= byte ptr  18h

push    ebp
mov     ebp, esp
push    ebx
xor     ebx, ebx
cmp     [ebp+arg_10], bl
push    esi
mov     esi, [ebp+arg_C]
push    edi
mov     edi, [ebp+arg_0]
jz      short loc_1000E639
xor     eax, eax
cmp     [ebp+arg_4], ebx
setnle  al
push    eax
xor     eax, eax
cmp     dword ptr [esi], 2Dh
setz    al
add     eax, edi
push    eax
call    sub_1000E8AD
pop     ecx
pop     ecx

loc_1000E639:
cmp     dword ptr [esi], 2Dh
mov     eax, edi
jnz     short loc_1000E646
mov     byte ptr [edi], 2Dh
lea     eax, [edi+1]

loc_1000E646:
cmp     [ebp+arg_4], ebx
jle     short loc_1000E65D
mov     dl, [eax+1]
lea     ecx, [eax+1]
mov     [eax], dl
mov     eax, ecx
mov     cl, byte_100185E4
mov     [eax], cl

loc_1000E65D:
xor     ecx, ecx
cmp     [ebp+arg_10], bl
push    offset aE000    ; "e+000"
setz    cl
add     ecx, eax
add     ecx, [ebp+arg_4]
push    ecx
call    sub_1000D570
cmp     [ebp+arg_8], ebx
pop     ecx
pop     ecx
mov     ecx, eax
jz      short loc_1000E681
mov     byte ptr [ecx], 45h

loc_1000E681:
mov     eax, [esi+0Ch]
inc     ecx
cmp     byte ptr [eax], 30h
jz      short loc_1000E6C6
mov     ebx, [esi+4]
dec     ebx
jns     short loc_1000E695
neg     ebx
mov     byte ptr [ecx], 2Dh

loc_1000E695:
inc     ecx
cmp     ebx, 64h
jl      short loc_1000E6AC
mov     eax, ebx
push    64h
cdq
pop     esi
idiv    esi
add     [ecx], al
mov     eax, ebx
cdq
idiv    esi
mov     ebx, edx

loc_1000E6AC:
inc     ecx
cmp     ebx, 0Ah
jl      short loc_1000E6C3
mov     eax, ebx
push    0Ah
cdq
pop     esi
idiv    esi
add     [ecx], al
mov     eax, ebx
cdq
idiv    esi
mov     ebx, edx

loc_1000E6C3:
add     [ecx+1], bl

loc_1000E6C6:
mov     eax, edi
pop     edi
pop     esi
pop     ebx
pop     ebp
retn
sub_1000E60B endp



; Attributes: bp-based frame

sub_1000E6CD proc near

var_3C= qword ptr -3Ch
var_28= byte ptr -28h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 28h
lea     eax, [ebp+var_28]
push    esi
push    eax
lea     eax, [ebp+var_10]
push    eax
mov     eax, [ebp+arg_0]
push    ecx
push    ecx
fld     qword ptr [eax]
fstp    [esp+3Ch+var_3C]
call    sub_10011EE8
mov     esi, [ebp+arg_8]
lea     eax, [ebp+var_10]
push    eax
mov     eax, [ebp+var_C]
add     eax, esi
push    eax
xor     eax, eax
cmp     [ebp+var_10], 2Dh
setz    al
add     eax, [ebp+arg_4]
push    eax
call    sub_10011E71
lea     eax, [ebp+var_10]
push    0
push    eax
push    esi
push    [ebp+arg_4]
call    sub_1000E722
mov     eax, [ebp+arg_4]
add     esp, 2Ch
pop     esi
leave
retn
sub_1000E6CD endp



; Attributes: bp-based frame

sub_1000E722 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= byte ptr  14h

push    ebp
mov     ebp, esp
push    ebx
push    esi
mov     esi, [ebp+arg_8]
mov     ebx, [ebp+arg_0]
push    edi
mov     eax, [esi+4]
dec     eax
cmp     [ebp+arg_C], 0
jz      short loc_1000E752
cmp     eax, [ebp+arg_4]
jnz     short loc_1000E752
xor     ecx, ecx
cmp     dword ptr [esi], 2Dh
setz    cl
add     ecx, eax
add     ecx, ebx
mov     eax, ecx
mov     byte ptr [eax], 30h
and     byte ptr [eax+1], 0

loc_1000E752:
cmp     dword ptr [esi], 2Dh
mov     edi, ebx
jnz     short loc_1000E75F
mov     byte ptr [ebx], 2Dh
lea     edi, [ebx+1]

loc_1000E75F:
mov     eax, [esi+4]
test    eax, eax
jg      short loc_1000E776
push    1
push    edi
call    sub_1000E8AD
pop     ecx
mov     byte ptr [edi], 30h
pop     ecx
inc     edi
jmp     short loc_1000E778

loc_1000E776:
add     edi, eax

loc_1000E778:
cmp     [ebp+arg_4], 0
jle     short loc_1000E7C2
push    1
push    edi
call    sub_1000E8AD
mov     al, byte_100185E4
pop     ecx
mov     [edi], al
mov     esi, [esi+4]
inc     edi
pop     ecx
test    esi, esi
jge     short loc_1000E7C2
cmp     [ebp+arg_C], 0
jz      short loc_1000E7A1
neg     esi
jmp     short loc_1000E7A8

loc_1000E7A1:
neg     esi
cmp     [ebp+arg_4], esi
jl      short loc_1000E7AB

loc_1000E7A8:
mov     [ebp+arg_4], esi

loc_1000E7AB:
push    [ebp+arg_4]
push    edi
call    sub_1000E8AD
push    [ebp+arg_4]
push    30h
push    edi
call    sub_10012000
add     esp, 14h

loc_1000E7C2:
pop     edi
mov     eax, ebx
pop     esi
pop     ebx
pop     ebp
retn
sub_1000E722 endp



; Attributes: bp-based frame

sub_1000E7C9 proc near

var_44= qword ptr -44h
var_28= byte ptr -28h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
sub     esp, 28h
push    ebx
push    esi
lea     eax, [ebp+var_28]
push    edi
push    eax
lea     eax, [ebp+var_10]
push    eax
mov     eax, [ebp+arg_0]
push    ecx
push    ecx
fld     qword ptr [eax]
fstp    [esp+44h+var_44]
call    sub_10011EE8
mov     eax, [ebp+var_C]
mov     ebx, [ebp+arg_8]
lea     esi, [eax-1]
xor     eax, eax
cmp     [ebp+var_10], 2Dh
setz    al
add     eax, [ebp+arg_4]
mov     edi, eax
lea     eax, [ebp+var_10]
push    eax
push    ebx
push    edi
call    sub_10011E71
mov     eax, [ebp+var_C]
add     esp, 1Ch
dec     eax
cmp     esi, eax
setl    cl
cmp     eax, 0FFFFFFFCh
jl      short loc_1000E842
cmp     eax, ebx
jge     short loc_1000E842
test    cl, cl
jz      short loc_1000E82E

loc_1000E824:
mov     al, [edi]
inc     edi
test    al, al
jnz     short loc_1000E824
and     [edi-2], al

loc_1000E82E:
lea     eax, [ebp+var_10]
push    1
push    eax
push    ebx
push    [ebp+arg_4]
call    sub_1000E722
add     esp, 10h
jmp     short loc_1000E857

loc_1000E842:
lea     eax, [ebp+var_10]
push    1
push    eax
push    [ebp+arg_C]
push    ebx
push    [ebp+arg_4]
call    sub_1000E60B
add     esp, 14h

loc_1000E857:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000E7C9 endp



; Attributes: bp-based frame

sub_1000E85C proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
cmp     [ebp+arg_8], 65h
jz      short loc_1000E897
cmp     [ebp+arg_8], 45h
jz      short loc_1000E897
cmp     [ebp+arg_8], 66h
jnz     short loc_1000E884
push    [ebp+arg_C]
push    [ebp+arg_4]
push    [ebp+arg_0]
call    sub_1000E6CD
add     esp, 0Ch
pop     ebp
retn

loc_1000E884:
push    [ebp+arg_10]
push    [ebp+arg_C]
push    [ebp+arg_4]
push    [ebp+arg_0]
call    sub_1000E7C9
jmp     short loc_1000E8A8

loc_1000E897:
push    [ebp+arg_10]
push    [ebp+arg_C]
push    [ebp+arg_4]
push    [ebp+arg_0]
call    sub_1000E5AA

loc_1000E8A8:
add     esp, 10h
pop     ebp
retn
sub_1000E85C endp




sub_1000E8AD proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    edi
mov     edi, [esp+4+arg_4]
test    edi, edi
jz      short loc_1000E8D0
push    esi
mov     esi, [esp+8+arg_0]
push    esi
call    sub_1000D900
inc     eax
push    eax
push    esi
add     esi, edi
push    esi
call    sub_10012060
add     esp, 10h
pop     esi

loc_1000E8D0:
pop     edi
retn
sub_1000E8AD endp



; Attributes: bp-based frame

; int __cdecl sub_1000E8D2(WORD CharType, int)
sub_1000E8D2 proc near

SrcStr= byte ptr -4
var_3= byte ptr -3
var_2= byte ptr -2
CharType= word ptr  8
arg_2= word ptr  0Ah
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     eax, dword ptr [ebp+CharType]
lea     ecx, [eax+1]
cmp     ecx, 100h
ja      short loc_1000E8F0
mov     ecx, off_100183D4
movzx   eax, word ptr [ecx+eax*2]
jmp     short loc_1000E942

loc_1000E8F0:
mov     ecx, eax
push    esi
mov     esi, off_100183D4
sar     ecx, 8
movzx   edx, cl
test    byte ptr [esi+edx*2+1], 80h
pop     esi
jz      short loc_1000E915
and     [ebp+var_2], 0
mov     [ebp+SrcStr], cl
mov     [ebp+var_3], al
push    2
jmp     short loc_1000E91E

loc_1000E915:
and     [ebp+var_3], 0
mov     [ebp+SrcStr], al
push    1

loc_1000E91E:
pop     eax
lea     ecx, [ebp+arg_2]
push    1               ; int
push    0               ; Locale
push    0               ; CodePage
push    ecx             ; lpCharType
push    eax             ; cchSrc
lea     eax, [ebp+SrcStr]
push    eax             ; lpSrcStr
push    1               ; dwInfoType
call    sub_1001239E
add     esp, 1Ch
test    eax, eax
jnz     short loc_1000E93E
leave
retn

loc_1000E93E:
movzx   eax, [ebp+arg_2]

loc_1000E942:
and     eax, [ebp+arg_4]
leave
retn
sub_1000E8D2 endp

align 10h
mov     eax, [esp+8]
mov     ecx, [esp+10h]
or      ecx, eax
mov     ecx, [esp+0Ch]
jnz     short loc_1000E969
mov     eax, [esp+4]
mul     ecx
retn    10h

loc_1000E969:
push    ebx
mul     ecx
mov     ebx, eax
mov     eax, [esp+8]
mul     dword ptr [esp+14h]
add     ebx, eax
mov     eax, [esp+8]
mul     ecx
add     edx, ebx
pop     ebx
retn    10h


; Attributes: bp-based frame

; int __cdecl sub_1000E984(int, double, int)
sub_1000E984 proc near

var_1C= dword ptr -1Ch
var_14= dword ptr -14h
var_C= qword ptr -0Ch
arg_0= dword ptr  8
arg_4= qword ptr  0Ch
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
cmp     dword_1001AAF8, 0
jnz     short loc_1000E9B9
push    [ebp+arg_C]     ; int
fld     [ebp+arg_4]
push    ecx
push    ecx
fstp    [esp+0Ch+var_C] ; double
push    ecx             ; int
push    ecx
fldz
fstp    qword ptr [esp+14h+var_14] ; int
fld     [ebp+arg_4]
push    ecx             ; int
push    ecx
fstp    qword ptr [esp+1Ch+var_1C] ; int
push    [ebp+arg_0]     ; int
push    1               ; int
call    sub_1000EF3A
add     esp, 24h
pop     ebp
retn

loc_1000E9B9:
call    sub_100124E7
push    0FFFFh
mov     dword ptr [eax], 21h
push    [ebp+arg_C]
call    sub_1000F19D
fld     [ebp+arg_4]
pop     ecx
pop     ecx
pop     ebp
retn
sub_1000E984 endp



; Attributes: bp-based frame

; int __cdecl sub_1000E9D8(DWORD dwExceptionCode, int, int, int, int, int, int)
sub_1000E9D8 proc near

var_74= dword ptr -74h
var_6C= dword ptr -6Ch
var_64= qword ptr -64h
var_5C= dword ptr -5Ch
Arguments= dword ptr -58h
var_20= dword ptr -20h
dwExceptionCode= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_10= dword ptr  18h
arg_18= dword ptr  20h

push    ebp
mov     ebp, esp
sub     esp, 58h
push    [ebp+arg_18]
lea     eax, [ebp+arg_10]
push    eax
push    [ebp+dwExceptionCode]
call    sub_1000ED23
add     esp, 0Ch
test    eax, eax
jnz     short loc_1000EA16
lea     eax, [ebp+arg_10]
and     [ebp+var_20], 0FFFFFFFEh
push    eax             ; int
lea     eax, [ebp+arg_8]
push    eax             ; int
lea     eax, [ebp+arg_18]
push    [ebp+arg_4]     ; int
push    [ebp+dwExceptionCode] ; dwExceptionCode
push    eax             ; int
lea     eax, [ebp+Arguments]
push    eax             ; Arguments
call    sub_1000EA70
add     esp, 18h

loc_1000EA16:
push    [ebp+dwExceptionCode]
call    sub_1000F00F
cmp     dword_1001AAF8, 0
pop     ecx
jnz     short loc_1000EA54
test    eax, eax
jz      short loc_1000EA54
push    [ebp+arg_18]    ; int
fld     qword ptr [ebp+arg_10]
push    ecx
push    ecx
fstp    [esp+64h+var_64] ; double
push    ecx             ; int
push    ecx
fldz
fstp    qword ptr [esp+6Ch+var_6C] ; int
fld     qword ptr [ebp+arg_8]
push    ecx             ; int
push    ecx
fstp    qword ptr [esp+74h+var_74] ; int
push    [ebp+arg_4]     ; int
push    eax             ; int
call    sub_1000EF3A
add     esp, 24h
leave
retn

loc_1000EA54:
push    eax
call    sub_1000EFC2
mov     [esp+5Ch+var_5C], 0FFFFh
push    [ebp+arg_18]
call    sub_1000F19D
fld     qword ptr [ebp+arg_10]
pop     ecx
pop     ecx
leave
retn
sub_1000E9D8 endp



; Attributes: bp-based frame

; int __cdecl sub_1000EA70(ULONG_PTR Arguments, int, DWORD dwExceptionCode, int, int, int)
sub_1000EA70 proc near

Arguments= dword ptr  8
arg_4= dword ptr  0Ch
dwExceptionCode= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h
arg_14= dword ptr  1Ch

push    ebp
mov     ebp, esp
mov     ecx, [ebp+Arguments]
xor     eax, eax
push    ebx
push    esi
mov     [ecx+4], eax
mov     ecx, [ebp+Arguments]
push    edi
push    1
mov     [ecx+8], eax
mov     ecx, [ebp+Arguments]
pop     ebx
mov     [ecx+0Ch], eax
mov     cl, byte ptr [ebp+dwExceptionCode]
test    cl, 10h
jz      short loc_1000EAA2
mov     eax, [ebp+Arguments]
mov     [ebp+dwExceptionCode], 0C000008Fh
or      [eax+4], ebx

loc_1000EAA2:
test    cl, 2
jz      short loc_1000EAB5
mov     eax, [ebp+Arguments]
mov     [ebp+dwExceptionCode], 0C0000093h
or      dword ptr [eax+4], 2

loc_1000EAB5:
test    bl, cl
jz      short loc_1000EAC7
mov     eax, [ebp+Arguments]
mov     [ebp+dwExceptionCode], 0C0000091h
or      dword ptr [eax+4], 4

loc_1000EAC7:
test    cl, 4
jz      short loc_1000EADA
mov     eax, [ebp+Arguments]
mov     [ebp+dwExceptionCode], 0C000008Eh
or      dword ptr [eax+4], 8

loc_1000EADA:
test    cl, 8
jz      short loc_1000EAED
mov     eax, [ebp+Arguments]
mov     [ebp+dwExceptionCode], 0C0000090h
or      dword ptr [eax+4], 10h

loc_1000EAED:
mov     esi, [ebp+arg_4]
mov     eax, [ebp+Arguments]
push    2
mov     ecx, [esi]
mov     edx, [eax+8]
not     ecx
and     ecx, ebx
and     edx, 0FFFFFFEFh
shl     ecx, 4
or      ecx, edx
pop     edi
mov     [eax+8], ecx
mov     ecx, [esi]
mov     eax, [ebp+Arguments]
not     ecx
mov     edx, [eax+8]
and     ecx, 4
shl     ecx, 1
and     edx, 0FFFFFFF7h
or      ecx, edx
mov     [eax+8], ecx
mov     ecx, [esi]
mov     eax, [ebp+Arguments]
not     ecx
mov     edx, [eax+8]
shr     ecx, 1
and     ecx, 4
and     edx, 0FFFFFFFBh
or      ecx, edx
mov     [eax+8], ecx
mov     ecx, [esi]
mov     eax, [ebp+Arguments]
not     ecx
mov     edx, [eax+8]
shr     ecx, 3
and     ecx, edi
and     edx, 0FFFFFFFDh
or      ecx, edx
mov     [eax+8], ecx
mov     ecx, [esi]
mov     eax, [ebp+Arguments]
not     ecx
mov     edx, [eax+8]
shr     ecx, 5
and     ecx, ebx
and     edx, 0FFFFFFFEh
or      ecx, edx
mov     [eax+8], ecx
call    sub_1000F180
test    bl, al
jz      short loc_1000EB76
mov     ecx, [ebp+Arguments]
or      dword ptr [ecx+0Ch], 10h

loc_1000EB76:
test    al, 4
jz      short loc_1000EB81
mov     ecx, [ebp+Arguments]
or      dword ptr [ecx+0Ch], 8

loc_1000EB81:
test    al, 8
jz      short loc_1000EB8C
mov     ecx, [ebp+Arguments]
or      dword ptr [ecx+0Ch], 4

loc_1000EB8C:
test    al, 10h
jz      short loc_1000EB96
mov     ecx, [ebp+Arguments]
or      [ecx+0Ch], edi

loc_1000EB96:
test    al, 20h
jz      short loc_1000EBA0
mov     eax, [ebp+Arguments]
or      [eax+0Ch], ebx

loc_1000EBA0:
mov     eax, [esi]
mov     ecx, 0C00h
and     eax, ecx
jz      short loc_1000EBDF
cmp     eax, 400h
jz      short loc_1000EBD1
cmp     eax, 800h
jz      short loc_1000EBC5
cmp     eax, ecx
jnz     short loc_1000EBE5
mov     eax, [ebp+Arguments]
or      dword ptr [eax], 3
jmp     short loc_1000EBE5

loc_1000EBC5:
mov     eax, [ebp+Arguments]
mov     ecx, [eax]
and     ecx, 0FFFFFFFEh
or      ecx, edi
jmp     short loc_1000EBDB

loc_1000EBD1:
mov     eax, [ebp+Arguments]
mov     ecx, [eax]
and     ecx, 0FFFFFFFDh
or      ecx, ebx

loc_1000EBDB:
mov     [eax], ecx
jmp     short loc_1000EBE5

loc_1000EBDF:
mov     eax, [ebp+Arguments]
and     dword ptr [eax], 0FFFFFFFCh

loc_1000EBE5:
mov     eax, [esi]
mov     ecx, 300h
and     eax, ecx
jz      short loc_1000EC10
cmp     eax, 200h
jz      short loc_1000EC03
cmp     eax, ecx
jnz     short loc_1000EC1D
mov     eax, [ebp+Arguments]
and     dword ptr [eax], 0FFFFFFE3h
jmp     short loc_1000EC1D

loc_1000EC03:
mov     eax, [ebp+Arguments]
mov     ecx, [eax]
and     ecx, 0FFFFFFE7h
or      ecx, 4
jmp     short loc_1000EC1B

loc_1000EC10:
mov     eax, [ebp+Arguments]
mov     ecx, [eax]
and     ecx, 0FFFFFFEBh
or      ecx, 8

loc_1000EC1B:
mov     [eax], ecx

loc_1000EC1D:
mov     eax, [ebp+Arguments]
mov     ecx, [ebp+arg_C]
and     ecx, 0FFFh
mov     edx, [eax]
shl     ecx, 5
and     edx, 0FFFE001Fh
or      ecx, edx
mov     [eax], ecx
mov     eax, [ebp+Arguments]
or      [eax+20h], ebx
mov     eax, [ebp+Arguments]
mov     ecx, [eax+20h]
and     ecx, 0FFFFFFE3h
or      ecx, edi
mov     [eax+20h], ecx
mov     eax, [ebp+arg_10]
fld     qword ptr [eax]
mov     eax, [ebp+Arguments]
fstp    qword ptr [eax+10h]
mov     eax, [ebp+Arguments]
or      [eax+50h], ebx
mov     eax, [ebp+Arguments]
mov     ecx, [eax+50h]
and     ecx, 0FFFFFFE3h
or      ecx, edi
mov     edi, [ebp+arg_14]
mov     [eax+50h], ecx
mov     eax, [ebp+Arguments]
fld     qword ptr [edi]
fstp    qword ptr [eax+40h]
call    sub_1000F18E
lea     eax, [ebp+Arguments]
push    eax             ; lpArguments
push    ebx             ; nNumberOfArguments
push    0               ; dwExceptionFlags
push    [ebp+dwExceptionCode] ; dwExceptionCode
call    ds:RaiseException
mov     eax, [ebp+Arguments]
test    byte ptr [eax+8], 10h
jz      short loc_1000EC97
and     dword ptr [esi], 0FFFFFFFEh

loc_1000EC97:
test    byte ptr [eax+8], 8
jz      short loc_1000ECA0
and     dword ptr [esi], 0FFFFFFFBh

loc_1000ECA0:
test    byte ptr [eax+8], 4
jz      short loc_1000ECA9
and     dword ptr [esi], 0FFFFFFF7h

loc_1000ECA9:
test    byte ptr [eax+8], 2
jz      short loc_1000ECB2
and     dword ptr [esi], 0FFFFFFEFh

loc_1000ECB2:
test    [eax+8], bl
jz      short loc_1000ECBA
and     dword ptr [esi], 0FFFFFFDFh

loc_1000ECBA:
mov     ecx, [eax]
mov     edx, 0FFFFF3FFh
and     ecx, 3
sub     ecx, 0
jz      short loc_1000ECEE
dec     ecx
jz      short loc_1000ECE2
dec     ecx
jz      short loc_1000ECD8
dec     ecx
jnz     short loc_1000ECF0
or      byte ptr [esi+1], 0Ch
jmp     short loc_1000ECF0

loc_1000ECD8:
mov     ecx, [esi]
and     ch, 0FBh
or      ch, 8
jmp     short loc_1000ECEA

loc_1000ECE2:
mov     ecx, [esi]
and     ch, 0F7h
or      ch, 4

loc_1000ECEA:
mov     [esi], ecx
jmp     short loc_1000ECF0

loc_1000ECEE:
and     [esi], edx

loc_1000ECF0:
mov     ecx, [eax]
shr     ecx, 2
and     ecx, 7
sub     ecx, 0
jz      short loc_1000ED10
dec     ecx
jz      short loc_1000ED07
dec     ecx
jnz     short loc_1000ED19
and     [esi], edx
jmp     short loc_1000ED19

loc_1000ED07:
mov     ecx, [esi]
and     ecx, edx
or      ch, 2
jmp     short loc_1000ED17

loc_1000ED10:
mov     ecx, [esi]
and     ecx, edx
or      ch, 3

loc_1000ED17:
mov     [esi], ecx

loc_1000ED19:
fld     qword ptr [eax+40h]
fstp    qword ptr [edi]
pop     edi
pop     esi
pop     ebx
pop     ebp
retn
sub_1000EA70 endp



; Attributes: bp-based frame

sub_1000ED23 proc near

var_24= qword ptr -24h
var_C= qword ptr -0Ch
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     eax, [ebp+arg_0]
push    ebx
push    edi
mov     edi, eax
and     edi, 1Fh
push    1
test    al, 8
pop     ebx
jz      short loc_1000ED4E
test    byte ptr [ebp+arg_8], bl
jz      short loc_1000ED4E
push    ebx
call    sub_1000F1C0
pop     ecx
and     edi, 0FFFFFFF7h
jmp     loc_1000EF18

loc_1000ED4E:
test    al, 4
jz      short loc_1000ED68
test    byte ptr [ebp+arg_8], 4
jz      short loc_1000ED68
push    4
call    sub_1000F1C0
pop     ecx
and     edi, 0FFFFFFFBh
jmp     loc_1000EF18

loc_1000ED68:
test    bl, al
jz      loc_1000EE42
test    byte ptr [ebp+arg_8], 8
jz      loc_1000EE42
push    8
call    sub_1000F1C0
pop     ecx
mov     eax, 0C00h
mov     ecx, [ebp+arg_8]
and     ecx, eax
jz      loc_1000EE1A
cmp     ecx, 400h
jz      short loc_1000EDF2
cmp     ecx, 800h
jz      short loc_1000EDCA
cmp     ecx, eax
jnz     loc_1000EE3A
mov     ecx, [ebp+arg_4]
fld     qword ptr [ecx]
fcomp   ds:dbl_100160F8
fld     dbl_100186D8
fnstsw  ax
sahf
ja      short loc_1000EDC2
fchs

loc_1000EDC2:
fstp    [ebp+var_C]
fld     [ebp+var_C]
jmp     short loc_1000EE38

loc_1000EDCA:
mov     ecx, [ebp+arg_4]
fld     qword ptr [ecx]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jbe     short loc_1000EDE2
fld     dbl_100186C8
jmp     short loc_1000EDEA

loc_1000EDE2:
fld     dbl_100186D8
fchs

loc_1000EDEA:
fstp    [ebp+var_C]
fld     [ebp+var_C]
jmp     short loc_1000EE38

loc_1000EDF2:
mov     ecx, [ebp+arg_4]
fld     qword ptr [ecx]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jbe     short loc_1000EE0A
fld     dbl_100186D8
jmp     short loc_1000EE12

loc_1000EE0A:
fld     dbl_100186C8
fchs

loc_1000EE12:
fstp    [ebp+var_C]
fld     [ebp+var_C]
jmp     short loc_1000EE38

loc_1000EE1A:
mov     ecx, [ebp+arg_4]
fld     qword ptr [ecx]
fcomp   ds:dbl_100160F8
fld     dbl_100186C8
fnstsw  ax
sahf
ja      short loc_1000EE32
fchs

loc_1000EE32:
fstp    [ebp+var_C]
fld     [ebp+var_C]

loc_1000EE38:
fstp    qword ptr [ecx]

loc_1000EE3A:
and     edi, 0FFFFFFFEh
jmp     loc_1000EF18

loc_1000EE42:
test    al, 2
jz      loc_1000EF18
test    byte ptr [ebp+arg_8], 10h
jz      loc_1000EF18
push    esi
xor     esi, esi
test    al, 10h
jz      short loc_1000EE5D
mov     esi, ebx

loc_1000EE5D:
mov     eax, [ebp+arg_4]
fld     qword ptr [eax]
fstp    [ebp+var_C]
fld     [ebp+var_C]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jz      loc_1000EF06
fld     [ebp+var_C]
lea     eax, [ebp+var_4]
push    eax             ; int
push    ecx
push    ecx
fstp    [esp+24h+var_24] ; double
call    sub_1000F0BF
mov     eax, [ebp+var_4]
add     esp, 0Ch
fstp    [ebp+var_C]
lea     ecx, [eax-600h]
cmp     ecx, 0FFFFFBCEh
jge     short loc_1000EEA8
fldz
mov     esi, ebx
fstp    [ebp+var_C]
jmp     short loc_1000EEFC

loc_1000EEA8:
fld     [ebp+var_C]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jnb     short loc_1000EEBA
mov     edx, ebx
jmp     short loc_1000EEBC

loc_1000EEBA:
xor     edx, edx

loc_1000EEBC:
mov     al, byte ptr [ebp+var_C+6]
and     eax, 0Fh
or      al, 10h
mov     word ptr [ebp+var_C+6], ax
mov     eax, 0FFFFFC03h
cmp     ecx, eax
jge     short loc_1000EEF0
sub     eax, ecx

loc_1000EED3:
test    byte ptr [ebp+var_C], bl
jz      short loc_1000EEDE
test    esi, esi
jnz     short loc_1000EEDE
mov     esi, ebx

loc_1000EEDE:
shr     dword ptr [ebp+var_C], 1
test    byte ptr [ebp+var_C+4], bl
jz      short loc_1000EEEA
or      byte ptr [ebp+var_C+3], 80h

loc_1000EEEA:
shr     dword ptr [ebp+var_C+4], 1
dec     eax
jnz     short loc_1000EED3

loc_1000EEF0:
test    edx, edx
jz      short loc_1000EEFC
fld     [ebp+var_C]
fchs
fstp    [ebp+var_C]

loc_1000EEFC:
fld     [ebp+var_C]
mov     eax, [ebp+arg_4]
fstp    qword ptr [eax]
jmp     short loc_1000EF08

loc_1000EF06:
mov     esi, ebx

loc_1000EF08:
test    esi, esi
pop     esi
jz      short loc_1000EF15
push    10h
call    sub_1000F1C0
pop     ecx

loc_1000EF15:
and     edi, 0FFFFFFFDh

loc_1000EF18:
test    byte ptr [ebp+arg_0], 10h
jz      short loc_1000EF2F
test    byte ptr [ebp+arg_8], 20h
jz      short loc_1000EF2F
push    20h
call    sub_1000F1C0
pop     ecx
and     edi, 0FFFFFFEFh

loc_1000EF2F:
xor     eax, eax
test    edi, edi
pop     edi
pop     ebx
setz    al
leave
retn
sub_1000ED23 endp



; Attributes: bp-based frame

; int __cdecl sub_1000EF3A(int, int, int, int, int, int, double, int)
sub_1000EF3A proc near

var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= qword ptr -8
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h
arg_14= dword ptr  1Ch
arg_18= qword ptr  20h
arg_20= dword ptr  28h

push    ebp
mov     ebp, esp
sub     esp, 20h
push    [ebp+arg_4]
call    sub_1000EFEA
test    eax, eax
pop     ecx
mov     [ebp+var_1C], eax
jz      short loc_1000EFA5
mov     eax, [ebp+arg_8]
push    esi
mov     [ebp+var_18], eax
mov     eax, [ebp+arg_C]
mov     [ebp+var_14], eax
mov     eax, [ebp+arg_10]
mov     esi, [ebp+arg_0]
mov     [ebp+var_10], eax
mov     eax, [ebp+arg_14]
push    0FFFFh
push    [ebp+arg_20]
mov     [ebp+var_C], eax
mov     eax, dword ptr [ebp+arg_18]
mov     [ebp+var_20], esi
mov     dword ptr [ebp+var_8], eax
mov     eax, dword ptr [ebp+arg_18+4]
mov     dword ptr [ebp+var_8+4], eax
call    sub_1000F19D
lea     eax, [ebp+var_20]
push    eax
call    sub_100124F0
add     esp, 0Ch
test    eax, eax
jnz     short loc_1000EF9F
push    esi
call    sub_1000EFC2
pop     ecx

loc_1000EF9F:
fld     [ebp+var_8]
pop     esi
leave
retn

loc_1000EFA5:
push    0FFFFh
push    [ebp+arg_20]
call    sub_1000F19D
push    [ebp+arg_0]
call    sub_1000EFC2
fld     [ebp+arg_18]
add     esp, 0Ch
leave
retn
sub_1000EF3A endp




sub_1000EFC2 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
cmp     eax, 1
jz      short loc_1000EFDE
jle     short locret_1000EFE9
cmp     eax, 3
jg      short locret_1000EFE9
call    sub_100124E7
mov     dword ptr [eax], 22h
retn

loc_1000EFDE:
call    sub_100124E7
mov     dword ptr [eax], 21h

locret_1000EFE9:
retn
sub_1000EFC2 endp




sub_1000EFEA proc near

arg_0= dword ptr  4

xor     ecx, ecx
mov     eax, offset unk_100185F0

loc_1000EFF1:
mov     edx, [eax]
cmp     edx, [esp+arg_0]
jz      short loc_1000F007
add     eax, 8
inc     ecx
cmp     eax, offset dbl_100186C8
jl      short loc_1000EFF1
xor     eax, eax
retn

loc_1000F007:
mov     eax, off_100185F4[ecx*8]
retn
sub_1000EFEA endp




sub_1000F00F proc near

arg_0= byte ptr  4

mov     al, [esp+arg_0]
test    al, 20h
jz      short loc_1000F01B
push    5
jmp     short loc_1000F031

loc_1000F01B:
test    al, 8
jz      short loc_1000F023
push    1
jmp     short loc_1000F031

loc_1000F023:
test    al, 4
jz      short loc_1000F02B
push    2
jmp     short loc_1000F031

loc_1000F02B:
test    al, 1
jz      short loc_1000F033
push    3

loc_1000F031:
pop     eax
retn

loc_1000F033:
movzx   eax, al
and     eax, 2
shl     eax, 1
retn
sub_1000F00F endp



; Attributes: bp-based frame

; int __cdecl sub_1000F03C(double, int)
sub_1000F03C proc near

var_8= qword ptr -8
arg_0= qword ptr  8
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    ecx
push    ecx
mov     eax, [ebp+arg_8]
mov     ecx, [ebp+0Eh]
fld     [ebp+arg_0]
add     eax, 3FEh
and     cx, 800Fh
fstp    [ebp+var_8]
shl     eax, 4
or      eax, ecx
mov     word ptr [ebp+var_8+6], ax
fld     [ebp+var_8]
leave
retn
sub_1000F03C endp



; Attributes: bp-based frame

sub_1000F065 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
xor     edx, edx
cmp     [ebp+arg_4], 7FF00000h
jnz     short loc_1000F07C
cmp     [ebp+arg_0], edx
jnz     short loc_1000F08E
push    1
jmp     short loc_1000F0B8

loc_1000F07C:
cmp     [ebp+arg_4], 0FFF00000h
jnz     short loc_1000F08E
cmp     [ebp+arg_0], edx
jnz     short loc_1000F08E
push    2
jmp     short loc_1000F0B8

loc_1000F08E:
mov     ecx, [ebp+arg_4+2]
mov     eax, 7FF8h
and     ecx, eax
cmp     cx, ax
jnz     short loc_1000F0A1
push    3
jmp     short loc_1000F0B8

loc_1000F0A1:
cmp     cx, 7FF0h
jnz     short loc_1000F0BB
test    [ebp+arg_4], 7FFFFh
jnz     short loc_1000F0B6
cmp     [ebp+arg_0], edx
jz      short loc_1000F0BB

loc_1000F0B6:
push    4

loc_1000F0B8:
pop     eax
pop     ebp
retn

loc_1000F0BB:
xor     eax, eax
pop     ebp
retn
sub_1000F065 endp



; Attributes: bp-based frame

; int __cdecl sub_1000F0BF(double, int)
sub_1000F0BF proc near

var_18= qword ptr -18h
var_8= qword ptr -8
arg_0= qword ptr  8
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    ecx
push    ecx
fld     [ebp+arg_0]
fcomp   ds:dbl_100160F8
push    esi
fnstsw  ax
sahf
jnz     short loc_1000F0DF
fldz
xor     esi, esi
fstp    [ebp+var_8]
jmp     loc_1000F175

loc_1000F0DF:
xor     ecx, ecx
test    word ptr [ebp+arg_0+6], 7FF0h
jnz     short loc_1000F14E
test    dword ptr [ebp+arg_0+4], 0FFFFFh
jnz     short loc_1000F0F7
cmp     dword ptr [ebp+arg_0], ecx
jz      short loc_1000F14E

loc_1000F0F7:
fld     [ebp+arg_0]
fcomp   ds:dbl_100160F8
mov     esi, 0FFFFFC03h
fnstsw  ax
sahf
jnb     short loc_1000F10F
push    1
pop     eax
jmp     short loc_1000F111

loc_1000F10F:
xor     eax, eax

loc_1000F111:
test    byte ptr [ebp+arg_0+6], 10h
jnz     short loc_1000F12A
shl     dword ptr [ebp+arg_0+4], 1
test    byte ptr [ebp+arg_0+3], 80h
jz      short loc_1000F124
or      dword ptr [ebp+arg_0+4], 1

loc_1000F124:
shl     dword ptr [ebp+arg_0], 1
dec     esi
jmp     short loc_1000F111

loc_1000F12A:
and     word ptr [ebp+arg_0+6], 0FFEFh
cmp     eax, ecx
jz      short loc_1000F138
or      byte ptr [ebp+arg_0+7], 80h

loc_1000F138:
fld     [ebp+arg_0]
push    ecx             ; int
push    ecx
push    ecx
fstp    [esp+18h+var_18] ; double
call    sub_1000F03C
fstp    [ebp+var_8]
add     esp, 0Ch
jmp     short loc_1000F175

loc_1000F14E:
fld     [ebp+arg_0]
push    ecx             ; int
push    ecx
push    ecx
fstp    [esp+18h+var_18] ; double
call    sub_1000F03C
mov     eax, dword ptr [ebp+arg_0+6]
add     esp, 0Ch
fstp    [ebp+var_8]
shr     eax, 4
and     ax, 7FFh
movsx   esi, ax
sub     esi, 3FEh

loc_1000F175:
mov     eax, [ebp+arg_8]
fld     [ebp+var_8]
mov     [eax], esi
pop     esi
leave
retn
sub_1000F0BF endp



; Attributes: bp-based frame

sub_1000F180 proc near

var_2= word ptr -2

push    ebp
mov     ebp, esp
push    ecx
fstsw   [ebp+var_2]
movsx   eax, [ebp+var_2]
leave
retn
sub_1000F180 endp



; Attributes: bp-based frame

sub_1000F18E proc near

var_2= word ptr -2

push    ebp
mov     ebp, esp
push    ecx
fnstsw  [ebp+var_2]
fnclex
movsx   eax, [ebp+var_2]
leave
retn
sub_1000F18E endp



; Attributes: bp-based frame

sub_1000F19D proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
fstcw   word ptr [ebp+var_4]
mov     eax, [ebp+arg_4]
mov     ecx, eax
and     eax, [ebp+arg_0]
not     ecx
and     ecx, [ebp+var_4]
or      ecx, eax
mov     [ebp+arg_4], ecx
fldcw   word ptr [ebp+arg_4]
movsx   eax, word ptr [ebp+var_4]
leave
retn
sub_1000F19D endp



; Attributes: bp-based frame

sub_1000F1C0 proc near

var_8= qword ptr -8
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
push    ecx
mov     cl, byte ptr [ebp+arg_0]
test    cl, 1
jz      short loc_1000F1D7
fld     tbyte_100186F0
fistp   [ebp+arg_0]
wait

loc_1000F1D7:
test    cl, 8
jz      short loc_1000F1EC
fstsw   ax
fld     tbyte_100186F0
fstp    [ebp+var_8]
wait
fstsw   ax

loc_1000F1EC:
test    cl, 10h
jz      short loc_1000F1FB
fld     tbyte_100186FC
fstp    [ebp+var_8]
wait

loc_1000F1FB:
test    cl, 4
jz      short loc_1000F209
fldz
fld1
fdivrp  st(1), st
fstp    st
wait

loc_1000F209:
test    cl, 20h
jz      short locret_1000F214
fldpi
fstp    [ebp+var_8]
wait

locret_1000F214:
leave
retn
sub_1000F1C0 endp




sub_1000F216 proc near

arg_0= dword ptr  4

push    esi
mov     esi, [esp+4+arg_0]
push    0               ; lpModuleName
and     dword ptr [esi], 0
call    ds:GetModuleHandleA
cmp     word ptr [eax], 5A4Dh
jnz     short loc_1000F241
mov     ecx, [eax+3Ch]
test    ecx, ecx
jz      short loc_1000F241
add     eax, ecx
mov     cl, [eax+1Ah]
mov     [esi], cl
mov     al, [eax+1Bh]
mov     [esi+1], al

loc_1000F241:
pop     esi
retn
sub_1000F216 endp



; Attributes: bp-based frame

sub_1000F243 proc near

Buffer= byte ptr -122Ch
Filename= byte ptr -19Ch
VersionInformation= _OSVERSIONINFOA ptr -98h
var_4= byte ptr -4

push    ebp
mov     ebp, esp
mov     eax, 122Ch
call    __alloca_probe
lea     eax, [ebp+VersionInformation]
push    ebx
push    eax             ; lpVersionInformation
mov     [ebp+VersionInformation.dwOSVersionInfoSize], 94h
call    ds:GetVersionExA
test    eax, eax
jz      short loc_1000F286
cmp     [ebp+VersionInformation.dwPlatformId], 2
jnz     short loc_1000F286
cmp     [ebp+VersionInformation.dwMajorVersion], 5
jb      short loc_1000F286
push    1
pop     eax
jmp     loc_1000F388

loc_1000F286:
lea     eax, [ebp+Buffer]
push    1090h           ; nSize
push    eax             ; lpBuffer
push    offset Name     ; "__MSVCRT_HEAP_SELECT"
call    ds:GetEnvironmentVariableA
test    eax, eax
jz      loc_1000F375
xor     ebx, ebx
lea     ecx, [ebp+Buffer]
cmp     [ebp+Buffer], bl
jz      short loc_1000F2C8

loc_1000F2B5:
mov     al, [ecx]
cmp     al, 61h
jl      short loc_1000F2C3
cmp     al, 7Ah
jg      short loc_1000F2C3
sub     al, 20h
mov     [ecx], al

loc_1000F2C3:
inc     ecx
cmp     [ecx], bl
jnz     short loc_1000F2B5

loc_1000F2C8:
lea     eax, [ebp+Buffer]
push    16h
push    eax
push    offset aGlobalHeapSele ; "__GLOBAL_HEAP_SELECTED"
call    sub_1000D700
add     esp, 0Ch
test    eax, eax
jnz     short loc_1000F2EA
lea     eax, [ebp+Buffer]
jmp     short loc_1000F333

loc_1000F2EA:
lea     eax, [ebp+Filename]
push    104h            ; nSize
push    eax             ; lpFilename
push    ebx             ; hModule
call    ds:GetModuleFileNameA
cmp     [ebp+Filename], bl
lea     ecx, [ebp+Filename]
jz      short loc_1000F31E

loc_1000F30B:
mov     al, [ecx]
cmp     al, 61h
jl      short loc_1000F319
cmp     al, 7Ah
jg      short loc_1000F319
sub     al, 20h
mov     [ecx], al

loc_1000F319:
inc     ecx
cmp     [ecx], bl
jnz     short loc_1000F30B

loc_1000F31E:
lea     eax, [ebp+Filename]
push    eax
lea     eax, [ebp+Buffer]
push    eax
call    sub_100127E0
pop     ecx
pop     ecx

loc_1000F333:
cmp     eax, ebx
jz      short loc_1000F375
push    2Ch
push    eax
call    sub_10012720
pop     ecx
cmp     eax, ebx
pop     ecx
jz      short loc_1000F375
inc     eax
mov     ecx, eax
cmp     [eax], bl
jz      short loc_1000F35A

loc_1000F34C:
cmp     byte ptr [ecx], 3Bh
jnz     short loc_1000F355
mov     [ecx], bl
jmp     short loc_1000F356

loc_1000F355:
inc     ecx

loc_1000F356:
cmp     [ecx], bl
jnz     short loc_1000F34C

loc_1000F35A:
push    0Ah
push    ebx
push    eax
call    sub_100124F3
add     esp, 0Ch
cmp     eax, 2
jz      short loc_1000F388
cmp     eax, 3
jz      short loc_1000F388
cmp     eax, 1
jz      short loc_1000F388

loc_1000F375:
lea     eax, [ebp+var_4]
push    eax
call    sub_1000F216
cmp     [ebp+var_4], 6
pop     ecx
sbb     eax, eax
add     eax, 3

loc_1000F388:
pop     ebx
leave
retn
sub_1000F243 endp




sub_1000F38B proc near

arg_0= dword ptr  4

xor     eax, eax
push    0               ; dwMaximumSize
cmp     [esp+4+arg_0], eax
push    1000h           ; dwInitialSize
setz    al
push    eax             ; flOptions
call    ds:HeapCreate
test    eax, eax
mov     hHeap, eax
jz      short loc_1000F3E1
call    sub_1000F243
cmp     eax, 3
mov     dword_1001BB14, eax
jnz     short loc_1000F3C7
push    3F8h
call    sub_1000F490
pop     ecx
jmp     short loc_1000F3D1

loc_1000F3C7:
cmp     eax, 2
jnz     short loc_1000F3E4
call    sub_1000FCE1

loc_1000F3D1:
test    eax, eax
jnz     short loc_1000F3E4
push    hHeap           ; hHeap
call    ds:HeapDestroy

loc_1000F3E1:
xor     eax, eax
retn

loc_1000F3E4:
push    1
pop     eax
retn
sub_1000F38B endp




sub_1000F3E8 proc near
mov     eax, dword_1001BB14
push    esi
cmp     eax, 3
push    edi
jnz     short loc_1000F45A
push    ebx
xor     ebx, ebx
cmp     dword_1001BB04, ebx
push    ebp
mov     ebp, ds:HeapFree
jle     short loc_1000F446
mov     eax, lpMem
mov     edi, ds:VirtualFree
lea     esi, [eax+0Ch]

loc_1000F414:           ; dwFreeType
push    4000h
push    100000h         ; dwSize
push    dword ptr [esi] ; lpAddress
call    edi ; VirtualFree
push    8000h           ; dwFreeType
push    0               ; dwSize
push    dword ptr [esi] ; lpAddress
call    edi ; VirtualFree
push    dword ptr [esi+4] ; lpMem
push    0               ; dwFlags
push    hHeap           ; hHeap
call    ebp ; HeapFree
add     esi, 14h
inc     ebx
cmp     ebx, dword_1001BB04
jl      short loc_1000F414

loc_1000F446:           ; lpMem
push    lpMem
push    0               ; dwFlags
push    hHeap           ; hHeap
call    ebp ; HeapFree
pop     ebp
pop     ebx
jmp     short loc_1000F481

loc_1000F45A:
cmp     eax, 2
jnz     short loc_1000F481
mov     edi, offset off_10018710
mov     esi, edi

loc_1000F466:
mov     eax, [esi+10h]
test    eax, eax
jz      short loc_1000F47B
push    8000h           ; dwFreeType
push    0               ; dwSize
push    eax             ; lpAddress
call    ds:VirtualFree

loc_1000F47B:
mov     esi, [esi]
cmp     esi, edi
jnz     short loc_1000F466

loc_1000F481:           ; hHeap
push    hHeap
call    ds:HeapDestroy
pop     edi
pop     esi
retn
sub_1000F3E8 endp




sub_1000F490 proc near

arg_0= dword ptr  4

push    140h            ; dwBytes
push    0               ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapAlloc
test    eax, eax
mov     lpMem, eax
jnz     short loc_1000F4AD
retn

loc_1000F4AD:
mov     ecx, [esp+arg_0]
and     dword_1001BB00, 0
and     dword_1001BB04, 0
push    1
mov     dword_1001BAFC, eax
mov     dword_1001BB0C, ecx
mov     dword_1001BAF4, 10h
pop     eax
retn
sub_1000F490 endp




sub_1000F4D8 proc near

arg_0= dword ptr  4

mov     eax, dword_1001BB04
lea     ecx, [eax+eax*4]
mov     eax, lpMem
lea     ecx, [eax+ecx*4]

loc_1000F4E8:
cmp     eax, ecx
jnb     short loc_1000F500
mov     edx, [esp+arg_0]
sub     edx, [eax+0Ch]
cmp     edx, 100000h
jb      short locret_1000F502
add     eax, 14h
jmp     short loc_1000F4E8

loc_1000F500:
xor     eax, eax

locret_1000F502:
retn
sub_1000F4D8 endp



; Attributes: bp-based frame

sub_1000F503 proc near

var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 10h
mov     ecx, [ebp+arg_0]
push    ebx
push    esi
mov     esi, [ebp+arg_4]
mov     eax, [ecx+10h]
push    edi
mov     edi, esi
add     esi, 0FFFFFFFCh
sub     edi, [ecx+0Ch]
shr     edi, 0Fh
mov     ecx, edi
imul    ecx, 204h
lea     ecx, [ecx+eax+144h]
mov     [ebp+var_10], ecx
mov     ecx, [esi]
dec     ecx
test    cl, 1
mov     [ebp+var_4], ecx
jnz     loc_1000F827
mov     edx, [ecx+esi]
lea     ebx, [ecx+esi]
mov     [ebp+var_C], edx
mov     edx, [esi-4]
mov     [ebp+var_8], edx
mov     edx, [ebp+var_C]
test    dl, 1
mov     [ebp+arg_4], ebx
jnz     short loc_1000F5D9
sar     edx, 4
dec     edx
cmp     edx, 3Fh
jbe     short loc_1000F567
push    3Fh
pop     edx

loc_1000F567:
mov     ecx, [ebx+4]
cmp     ecx, [ebx+8]
jnz     short loc_1000F5BB
cmp     edx, 20h
jnb     short loc_1000F592
mov     ebx, 80000000h
mov     ecx, edx
shr     ebx, cl
lea     ecx, [edx+eax+4]
not     ebx
and     [eax+edi*4+44h], ebx
dec     byte ptr [ecx]
jnz     short loc_1000F5B3
mov     ecx, [ebp+arg_0]
and     [ecx], ebx
jmp     short loc_1000F5B3

loc_1000F592:
lea     ecx, [edx-20h]
mov     ebx, 80000000h
shr     ebx, cl
lea     ecx, [edx+eax+4]
not     ebx
and     [eax+edi*4+0C4h], ebx
dec     byte ptr [ecx]
jnz     short loc_1000F5B3
mov     ecx, [ebp+arg_0]
and     [ecx+4], ebx

loc_1000F5B3:
mov     ecx, [ebp+var_4]
mov     ebx, [ebp+arg_4]
jmp     short loc_1000F5BE

loc_1000F5BB:
mov     ecx, [ebp+var_4]

loc_1000F5BE:
mov     edx, [ebx+8]
mov     ebx, [ebx+4]
add     ecx, [ebp+var_C]
mov     [edx+4], ebx
mov     edx, [ebp+arg_4]
mov     [ebp+var_4], ecx
mov     ebx, [edx+4]
mov     edx, [edx+8]
mov     [ebx+8], edx

loc_1000F5D9:
mov     edx, ecx
sar     edx, 4
dec     edx
cmp     edx, 3Fh
jbe     short loc_1000F5E7
push    3Fh
pop     edx

loc_1000F5E7:
mov     ebx, [ebp+var_8]
and     ebx, 1
mov     [ebp+var_C], ebx
jnz     loc_1000F68A
sub     esi, [ebp+var_8]
mov     ebx, [ebp+var_8]
sar     ebx, 4
push    3Fh
mov     [ebp+arg_4], esi
dec     ebx
pop     esi
cmp     ebx, esi
jbe     short loc_1000F60C
mov     ebx, esi

loc_1000F60C:
add     ecx, [ebp+var_8]
mov     edx, ecx
mov     [ebp+var_4], ecx
sar     edx, 4
dec     edx
cmp     edx, esi
jbe     short loc_1000F61E
mov     edx, esi

loc_1000F61E:
cmp     ebx, edx
jz      short loc_1000F685
mov     ecx, [ebp+arg_4]
mov     esi, [ecx+4]
cmp     esi, [ecx+8]
jnz     short loc_1000F66D
cmp     ebx, 20h
jnb     short loc_1000F64E
mov     esi, 80000000h
mov     ecx, ebx
shr     esi, cl
not     esi
and     [eax+edi*4+44h], esi
dec     byte ptr [ebx+eax+4]
jnz     short loc_1000F66D
mov     ecx, [ebp+arg_0]
and     [ecx], esi
jmp     short loc_1000F66D

loc_1000F64E:
lea     ecx, [ebx-20h]
mov     esi, 80000000h
shr     esi, cl
not     esi
and     [eax+edi*4+0C4h], esi
dec     byte ptr [ebx+eax+4]
jnz     short loc_1000F66D
mov     ecx, [ebp+arg_0]
and     [ecx+4], esi

loc_1000F66D:
mov     ecx, [ebp+arg_4]
mov     esi, [ecx+8]
mov     ecx, [ecx+4]
mov     [esi+4], ecx
mov     ecx, [ebp+arg_4]
mov     esi, [ecx+4]
mov     ecx, [ecx+8]
mov     [esi+8], ecx

loc_1000F685:
mov     esi, [ebp+arg_4]
jmp     short loc_1000F68D

loc_1000F68A:
mov     ebx, [ebp+arg_0]

loc_1000F68D:
cmp     [ebp+var_C], 0
jnz     short loc_1000F69B
cmp     ebx, edx
jz      loc_1000F71C

loc_1000F69B:
mov     ecx, [ebp+var_10]
mov     ebx, [ecx+edx*8+4]
lea     ecx, [ecx+edx*8]
mov     [esi+4], ebx
mov     [esi+8], ecx
mov     [ecx+4], esi
mov     ecx, [esi+4]
mov     [ecx+8], esi
mov     ecx, [esi+4]
cmp     ecx, [esi+8]
jnz     short loc_1000F71C
mov     cl, [edx+eax+4]
cmp     edx, 20h
mov     byte ptr [ebp+arg_4+3], cl
inc     cl
mov     [edx+eax+4], cl
jnb     short loc_1000F6F3
cmp     byte ptr [ebp+arg_4+3], 0
jnz     short loc_1000F6E2
mov     ebx, 80000000h
mov     ecx, edx
shr     ebx, cl
mov     ecx, [ebp+arg_0]
or      [ecx], ebx

loc_1000F6E2:
mov     ebx, 80000000h
mov     ecx, edx
shr     ebx, cl
lea     eax, [eax+edi*4+44h]
or      [eax], ebx
jmp     short loc_1000F71C

loc_1000F6F3:
cmp     byte ptr [ebp+arg_4+3], 0
jnz     short loc_1000F709
lea     ecx, [edx-20h]
mov     ebx, 80000000h
shr     ebx, cl
mov     ecx, [ebp+arg_0]
or      [ecx+4], ebx

loc_1000F709:
lea     ecx, [edx-20h]
mov     edx, 80000000h
shr     edx, cl
lea     eax, [eax+edi*4+0C4h]
or      [eax], edx

loc_1000F71C:
mov     eax, [ebp+var_4]
mov     [esi], eax
mov     [eax+esi-4], eax
mov     eax, [ebp+var_10]
dec     dword ptr [eax]
jnz     loc_1000F827
mov     eax, dword_1001BB00
test    eax, eax
jz      loc_1000F819
mov     ecx, dword_1001BAF8
mov     esi, ds:VirtualFree
shl     ecx, 0Fh
add     ecx, [eax+0Ch]
mov     ebx, 8000h
push    4000h           ; dwFreeType
push    ebx             ; dwSize
push    ecx             ; lpAddress
call    esi ; VirtualFree
mov     ecx, dword_1001BAF8
mov     eax, dword_1001BB00
mov     edx, 80000000h
shr     edx, cl
or      [eax+8], edx
mov     eax, dword_1001BB00
mov     ecx, dword_1001BAF8
mov     eax, [eax+10h]
and     dword ptr [eax+ecx*4+0C4h], 0
mov     eax, dword_1001BB00
mov     eax, [eax+10h]
dec     byte ptr [eax+43h]
mov     eax, dword_1001BB00
mov     ecx, [eax+10h]
cmp     byte ptr [ecx+43h], 0
jnz     short loc_1000F7AA
and     dword ptr [eax+4], 0FFFFFFFEh
mov     eax, dword_1001BB00

loc_1000F7AA:
cmp     dword ptr [eax+8], 0FFFFFFFFh
jnz     short loc_1000F819
push    ebx             ; dwFreeType
push    0               ; dwSize
push    dword ptr [eax+0Ch] ; lpAddress
call    esi ; VirtualFree
mov     eax, dword_1001BB00
push    dword ptr [eax+10h] ; lpMem
push    0               ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapFree
mov     eax, dword_1001BB04
mov     edx, lpMem
lea     eax, [eax+eax*4]
shl     eax, 2
mov     ecx, eax
mov     eax, dword_1001BB00
sub     ecx, eax
lea     ecx, [ecx+edx-14h]
push    ecx
lea     ecx, [eax+14h]
push    ecx
push    eax
call    sub_10012060
mov     eax, [ebp+arg_0]
add     esp, 0Ch
dec     dword_1001BB04
cmp     eax, dword_1001BB00
jbe     short loc_1000F80F
sub     [ebp+arg_0], 14h

loc_1000F80F:
mov     eax, lpMem
mov     dword_1001BAFC, eax

loc_1000F819:
mov     eax, [ebp+arg_0]
mov     dword_1001BAF8, edi
mov     dword_1001BB00, eax

loc_1000F827:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000F503 endp



; Attributes: bp-based frame

sub_1000F82C proc near

var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 14h
mov     eax, dword_1001BB04
mov     edx, lpMem
push    ebx
push    esi
lea     eax, [eax+eax*4]
push    edi
lea     edi, [edx+eax*4]
mov     eax, [ebp+arg_0]
mov     [ebp+var_4], edi
lea     ecx, [eax+17h]
and     ecx, 0FFFFFFF0h
mov     [ebp+var_10], ecx
sar     ecx, 4
dec     ecx
cmp     ecx, 20h
jge     short loc_1000F86C
or      esi, 0FFFFFFFFh
shr     esi, cl
or      [ebp+var_8], 0FFFFFFFFh
mov     [ebp+var_C], esi
jmp     short loc_1000F87C

loc_1000F86C:
add     ecx, 0FFFFFFE0h
or      eax, 0FFFFFFFFh
xor     esi, esi
shr     eax, cl
mov     [ebp+var_C], esi
mov     [ebp+var_8], eax

loc_1000F87C:
mov     eax, dword_1001BAFC
mov     ebx, eax
cmp     ebx, edi
mov     [ebp+arg_0], ebx
jnb     short loc_1000F8A3

loc_1000F88A:
mov     ecx, [ebx+4]
mov     edi, [ebx]
and     ecx, [ebp+var_8]
and     edi, esi
or      ecx, edi
jnz     short loc_1000F8A3
add     ebx, 14h
cmp     ebx, [ebp+var_4]
mov     [ebp+arg_0], ebx
jb      short loc_1000F88A

loc_1000F8A3:
cmp     ebx, [ebp+var_4]
jnz     short loc_1000F921
mov     ebx, edx

loc_1000F8AA:
cmp     ebx, eax
mov     [ebp+arg_0], ebx
jnb     short loc_1000F8C6
mov     ecx, [ebx+4]
mov     edi, [ebx]
and     ecx, [ebp+var_8]
and     edi, esi
or      ecx, edi
jnz     short loc_1000F8C4
add     ebx, 14h
jmp     short loc_1000F8AA

loc_1000F8C4:
cmp     ebx, eax

loc_1000F8C6:
jnz     short loc_1000F921

loc_1000F8C8:
cmp     ebx, [ebp+var_4]
jnb     short loc_1000F8DE
cmp     dword ptr [ebx+8], 0
jnz     short loc_1000F8DB
add     ebx, 14h
mov     [ebp+arg_0], ebx
jmp     short loc_1000F8C8

loc_1000F8DB:
cmp     ebx, [ebp+var_4]

loc_1000F8DE:
jnz     short loc_1000F906
mov     ebx, edx

loc_1000F8E2:
cmp     ebx, eax
mov     [ebp+arg_0], ebx
jnb     short loc_1000F8F6
cmp     dword ptr [ebx+8], 0
jnz     short loc_1000F8F4
add     ebx, 14h
jmp     short loc_1000F8E2

loc_1000F8F4:
cmp     ebx, eax

loc_1000F8F6:
jnz     short loc_1000F906
call    sub_1000FB35
mov     ebx, eax
test    ebx, ebx
mov     [ebp+arg_0], ebx
jz      short loc_1000F91A

loc_1000F906:
push    ebx
call    sub_1000FBE6
pop     ecx
mov     ecx, [ebx+10h]
mov     [ecx], eax
mov     eax, [ebx+10h]
cmp     dword ptr [eax], 0FFFFFFFFh
jnz     short loc_1000F921

loc_1000F91A:
xor     eax, eax
jmp     loc_1000FB30

loc_1000F921:
mov     dword_1001BAFC, ebx
mov     eax, [ebx+10h]
mov     edx, [eax]
cmp     edx, 0FFFFFFFFh
mov     [ebp+var_4], edx
jz      short loc_1000F948
mov     ecx, [eax+edx*4+0C4h]
mov     edi, [eax+edx*4+44h]
and     ecx, [ebp+var_8]
and     edi, esi
or      ecx, edi
jnz     short loc_1000F97F

loc_1000F948:
mov     edx, [eax+0C4h]
mov     esi, [eax+44h]
and     edx, [ebp+var_8]
and     esi, [ebp+var_C]
and     [ebp+var_4], 0
lea     ecx, [eax+44h]
or      edx, esi
mov     esi, [ebp+var_C]
jnz     short loc_1000F97C

loc_1000F965:
mov     edx, [ecx+84h]
inc     [ebp+var_4]
and     edx, [ebp+var_8]
add     ecx, 4
mov     edi, esi
and     edi, [ecx]
or      edx, edi
jz      short loc_1000F965

loc_1000F97C:
mov     edx, [ebp+var_4]

loc_1000F97F:
mov     ecx, edx
xor     edi, edi
imul    ecx, 204h
lea     ecx, [ecx+eax+144h]
mov     [ebp+var_C], ecx
mov     ecx, [eax+edx*4+44h]
and     ecx, esi
jnz     short loc_1000F9A8
mov     ecx, [eax+edx*4+0C4h]
push    20h
and     ecx, [ebp+var_8]
pop     edi

loc_1000F9A8:
test    ecx, ecx
jl      short loc_1000F9B1
shl     ecx, 1
inc     edi
jmp     short loc_1000F9A8

loc_1000F9B1:
mov     ecx, [ebp+var_C]
mov     edx, [ecx+edi*8+4]
mov     ecx, [edx]
sub     ecx, [ebp+var_10]
mov     esi, ecx
mov     [ebp+var_8], ecx
sar     esi, 4
dec     esi
cmp     esi, 3Fh
jle     short loc_1000F9CE
push    3Fh
pop     esi

loc_1000F9CE:
cmp     esi, edi
jz      loc_1000FAE3
mov     ecx, [edx+4]
cmp     ecx, [edx+8]
jnz     short loc_1000FA3F
cmp     edi, 20h
jge     short loc_1000FA0E
mov     ebx, 80000000h
mov     ecx, edi
shr     ebx, cl
mov     ecx, [ebp+var_4]
lea     edi, [eax+edi+4]
not     ebx
mov     [ebp+var_14], ebx
and     ebx, [eax+ecx*4+44h]
mov     [eax+ecx*4+44h], ebx
dec     byte ptr [edi]
jnz     short loc_1000FA3C
mov     ebx, [ebp+arg_0]
mov     ecx, [ebp+var_14]
and     [ebx], ecx
jmp     short loc_1000FA3F

loc_1000FA0E:
lea     ecx, [edi-20h]
mov     ebx, 80000000h
shr     ebx, cl
mov     ecx, [ebp+var_4]
lea     edi, [eax+edi+4]
lea     ecx, [eax+ecx*4+0C4h]
not     ebx
and     [ecx], ebx
dec     byte ptr [edi]
mov     [ebp+var_14], ebx
jnz     short loc_1000FA3C
mov     ebx, [ebp+arg_0]
mov     ecx, [ebp+var_14]
and     [ebx+4], ecx
jmp     short loc_1000FA3F

loc_1000FA3C:
mov     ebx, [ebp+arg_0]

loc_1000FA3F:
mov     ecx, [edx+8]
mov     edi, [edx+4]
cmp     [ebp+var_8], 0
mov     [ecx+4], edi
mov     ecx, [edx+4]
mov     edi, [edx+8]
mov     [ecx+8], edi
jz      loc_1000FAEF
mov     ecx, [ebp+var_C]
mov     edi, [ecx+esi*8+4]
lea     ecx, [ecx+esi*8]
mov     [edx+4], edi
mov     [edx+8], ecx
mov     [ecx+4], edx
mov     ecx, [edx+4]
mov     [ecx+8], edx
mov     ecx, [edx+4]
cmp     ecx, [edx+8]
jnz     short loc_1000FAE0
mov     cl, [esi+eax+4]
cmp     esi, 20h
mov     byte ptr [ebp+arg_0+3], cl
jge     short loc_1000FAB1
inc     cl
cmp     byte ptr [ebp+arg_0+3], 0
mov     [esi+eax+4], cl
jnz     short loc_1000FA9F
mov     edi, 80000000h
mov     ecx, esi
shr     edi, cl
or      [ebx], edi

loc_1000FA9F:
mov     edi, 80000000h
mov     ecx, esi
shr     edi, cl
mov     ecx, [ebp+var_4]
or      [eax+ecx*4+44h], edi
jmp     short loc_1000FAE0

loc_1000FAB1:
inc     cl
cmp     byte ptr [ebp+arg_0+3], 0
mov     [esi+eax+4], cl
jnz     short loc_1000FACA
lea     ecx, [esi-20h]
mov     edi, 80000000h
shr     edi, cl
or      [ebx+4], edi

loc_1000FACA:
mov     ecx, [ebp+var_4]
lea     edi, [eax+ecx*4+0C4h]
lea     ecx, [esi-20h]
mov     esi, 80000000h
shr     esi, cl
or      [edi], esi

loc_1000FAE0:
mov     ecx, [ebp+var_8]

loc_1000FAE3:
test    ecx, ecx
jz      short loc_1000FAF2
mov     [edx], ecx
mov     [ecx+edx-4], ecx
jmp     short loc_1000FAF2

loc_1000FAEF:
mov     ecx, [ebp+var_8]

loc_1000FAF2:
mov     esi, [ebp+var_10]
add     edx, ecx
lea     ecx, [esi+1]
mov     [edx], ecx
mov     [edx+esi-4], ecx
mov     esi, [ebp+var_C]
mov     ecx, [esi]
test    ecx, ecx
lea     edi, [ecx+1]
mov     [esi], edi
jnz     short loc_1000FB28
cmp     ebx, dword_1001BB00
jnz     short loc_1000FB28
mov     ecx, [ebp+var_4]
cmp     ecx, dword_1001BAF8
jnz     short loc_1000FB28
and     dword_1001BB00, 0

loc_1000FB28:
mov     ecx, [ebp+var_4]
mov     [eax], ecx
lea     eax, [edx+4]

loc_1000FB30:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000F82C endp




sub_1000FB35 proc near
mov     eax, dword_1001BB04
mov     ecx, dword_1001BAF4
push    esi
push    edi
xor     edi, edi
cmp     eax, ecx
jnz     short loc_1000FB78
lea     eax, [ecx+ecx*4+50h]
shl     eax, 2
push    eax             ; dwBytes
push    lpMem           ; lpMem
push    edi             ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapReAlloc
cmp     eax, edi
jz      short loc_1000FBC8
add     dword_1001BAF4, 10h
mov     lpMem, eax
mov     eax, dword_1001BB04

loc_1000FB78:
mov     ecx, lpMem
push    41C4h           ; dwBytes
push    8               ; dwFlags
lea     eax, [eax+eax*4]
push    hHeap           ; hHeap
lea     esi, [ecx+eax*4]
call    ds:HeapAlloc
cmp     eax, edi
mov     [esi+10h], eax
jz      short loc_1000FBC8
push    4               ; flProtect
push    2000h           ; flAllocationType
push    100000h         ; dwSize
push    edi             ; lpAddress
call    ds:VirtualAlloc
cmp     eax, edi
mov     [esi+0Ch], eax
jnz     short loc_1000FBCC
push    dword ptr [esi+10h] ; lpMem
push    edi             ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapFree

loc_1000FBC8:
xor     eax, eax
jmp     short loc_1000FBE3

loc_1000FBCC:
or      dword ptr [esi+8], 0FFFFFFFFh
mov     [esi], edi
mov     [esi+4], edi
inc     dword_1001BB04
mov     eax, [esi+10h]
or      dword ptr [eax], 0FFFFFFFFh
mov     eax, esi

loc_1000FBE3:
pop     edi
pop     esi
retn
sub_1000FB35 endp



; Attributes: bp-based frame

sub_1000FBE6 proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
mov     ecx, [ebp+arg_0]
push    ebx
push    esi
push    edi
mov     esi, [ecx+10h]
mov     eax, [ecx+8]
xor     ebx, ebx

loc_1000FBF8:
test    eax, eax
jl      short loc_1000FC01
shl     eax, 1
inc     ebx
jmp     short loc_1000FBF8

loc_1000FC01:
mov     eax, ebx
push    3Fh
imul    eax, 204h
pop     edx
lea     eax, [eax+esi+144h]
mov     [ebp+var_4], eax

loc_1000FC16:
mov     [eax+8], eax
mov     [eax+4], eax
add     eax, 8
dec     edx
jnz     short loc_1000FC16
mov     edi, ebx
push    4               ; flProtect
shl     edi, 0Fh
add     edi, [ecx+0Ch]
push    1000h           ; flAllocationType
push    8000h           ; dwSize
push    edi             ; lpAddress
call    ds:VirtualAlloc
test    eax, eax
jnz     short loc_1000FC49
or      eax, 0FFFFFFFFh
jmp     loc_1000FCDC

loc_1000FC49:
lea     edx, [edi+7000h]
cmp     edi, edx
ja      short loc_1000FC8F
lea     eax, [edi+10h]

loc_1000FC56:
or      dword ptr [eax-8], 0FFFFFFFFh
or      dword ptr [eax+0FECh], 0FFFFFFFFh
lea     ecx, [eax+0FFCh]
mov     dword ptr [eax-4], 0FF0h
mov     [eax], ecx
lea     ecx, [eax-1004h]
mov     [eax+4], ecx
mov     dword ptr [eax+0FE8h], 0FF0h
add     eax, 1000h
lea     ecx, [eax-10h]
cmp     ecx, edx
jbe     short loc_1000FC56

loc_1000FC8F:
mov     eax, [ebp+var_4]
lea     ecx, [edi+0Ch]
add     eax, 1F8h
push    1
pop     edi
mov     [eax+4], ecx
mov     [ecx+8], eax
lea     ecx, [edx+0Ch]
mov     [eax+8], ecx
mov     [ecx+4], eax
and     dword ptr [esi+ebx*4+44h], 0
mov     [esi+ebx*4+0C4h], edi
mov     al, [esi+43h]
mov     cl, al
inc     cl
test    al, al
mov     eax, [ebp+arg_0]
mov     [esi+43h], cl
jnz     short loc_1000FCCC
or      [eax+4], edi

loc_1000FCCC:
mov     edx, 80000000h
mov     ecx, ebx
shr     edx, cl
not     edx
and     [eax+8], edx
mov     eax, ebx

loc_1000FCDC:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000FBE6 endp




sub_1000FCE1 proc near
cmp     dword_10018720, 0FFFFFFFFh
push    ebx
push    ebp
push    esi
push    edi
jnz     short loc_1000FCF5
mov     esi, offset off_10018710
jmp     short loc_1000FD12

loc_1000FCF5:           ; dwBytes
push    2020h
push    0               ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapAlloc
mov     esi, eax
test    esi, esi
jz      loc_1000FE1E

loc_1000FD12:
mov     ebp, ds:VirtualAlloc
push    4               ; flProtect
push    2000h           ; flAllocationType
push    400000h         ; dwSize
push    0               ; lpAddress
call    ebp ; VirtualAlloc
mov     edi, eax
test    edi, edi
jz      loc_1000FE07
push    4               ; flProtect
mov     ebx, 10000h
push    1000h           ; flAllocationType
push    ebx             ; dwSize
push    edi             ; lpAddress
call    ebp ; VirtualAlloc
test    eax, eax
jz      loc_1000FDF9
mov     eax, offset off_10018710
cmp     esi, eax
jnz     short loc_1000FD71
cmp     off_10018710, 0
jnz     short loc_1000FD61
mov     off_10018710, eax

loc_1000FD61:
cmp     off_10018714, 0
jnz     short loc_1000FD86
mov     off_10018714, eax
jmp     short loc_1000FD86

loc_1000FD71:
mov     [esi], eax
mov     eax, off_10018714
mov     [esi+4], eax
mov     off_10018714, esi
mov     eax, [esi+4]
mov     [eax], esi

loc_1000FD86:
lea     eax, [edi+400000h]
lea     ecx, [esi+98h]
mov     [esi+14h], eax
lea     eax, [esi+18h]
mov     [esi+0Ch], ecx
mov     [esi+10h], edi
mov     [esi+8], eax
xor     ebp, ebp
mov     ecx, 0F1h

loc_1000FDA8:
xor     edx, edx
cmp     ebp, 10h
setnl   dl
dec     edx
and     edx, ecx
dec     edx
inc     ebp
mov     [eax], edx
mov     [eax+4], ecx
add     eax, 8
cmp     ebp, 400h
jl      short loc_1000FDA8
push    ebx
push    0
push    edi
call    sub_10012000
add     esp, 0Ch

loc_1000FDD1:
mov     eax, [esi+10h]
add     eax, ebx
cmp     edi, eax
jnb     short loc_1000FDF5
or      byte ptr [edi+0F8h], 0FFh
lea     eax, [edi+8]
mov     [edi], eax
mov     dword ptr [edi+4], 0F0h
add     edi, 1000h
jmp     short loc_1000FDD1

loc_1000FDF5:
mov     eax, esi
jmp     short loc_1000FE20

loc_1000FDF9:           ; dwFreeType
push    8000h
push    0               ; dwSize
push    edi             ; lpAddress
call    ds:VirtualFree

loc_1000FE07:
cmp     esi, offset off_10018710
jz      short loc_1000FE1E
push    esi             ; lpMem
push    0               ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapFree

loc_1000FE1E:
xor     eax, eax

loc_1000FE20:
pop     edi
pop     esi
pop     ebp
pop     ebx
retn
sub_1000FCE1 endp




; int __cdecl sub_1000FE25(LPVOID lpMem)
sub_1000FE25 proc near

lpMem= dword ptr  4

push    esi
mov     esi, [esp+4+lpMem]
push    8000h           ; dwFreeType
push    0               ; dwSize
push    dword ptr [esi+10h] ; lpAddress
call    ds:VirtualFree
cmp     off_1001A730, esi
jnz     short loc_1000FE4A
mov     eax, [esi+4]
mov     off_1001A730, eax

loc_1000FE4A:
cmp     esi, offset off_10018710
jz      short loc_1000FE72
mov     eax, [esi+4]
mov     ecx, [esi]
push    esi             ; lpMem
push    0               ; dwFlags
mov     [eax], ecx
mov     eax, [esi]
mov     ecx, [esi+4]
mov     [eax+4], ecx
push    hHeap           ; hHeap
call    ds:HeapFree
pop     esi
retn

loc_1000FE72:
or      dword_10018720, 0FFFFFFFFh
pop     esi
retn
sub_1000FE25 endp



; Attributes: bp-based frame

sub_1000FE7B proc near

var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
push    ebx
push    esi
mov     esi, off_10018714
push    edi

loc_1000FE88:
cmp     dword ptr [esi+10h], 0FFFFFFFFh
jz      loc_1000FF26
and     [ebp+var_4], 0
lea     edi, [esi+2010h]
mov     ebx, 3FF000h

loc_1000FEA1:
cmp     dword ptr [edi], 0F0h
jnz     short loc_1000FEE2
mov     eax, ebx
push    4000h           ; dwFreeType
add     eax, [esi+10h]
push    1000h           ; dwSize
push    eax             ; lpAddress
call    ds:VirtualFree
test    eax, eax
jz      short loc_1000FEE2
or      dword ptr [edi], 0FFFFFFFFh
dec     dword_1001B434
mov     eax, [esi+0Ch]
test    eax, eax
jz      short loc_1000FED7
cmp     eax, edi
jbe     short loc_1000FEDA

loc_1000FED7:
mov     [esi+0Ch], edi

loc_1000FEDA:
inc     [ebp+var_4]
dec     [ebp+arg_0]
jz      short loc_1000FEEF

loc_1000FEE2:
sub     ebx, 1000h
sub     edi, 8
test    ebx, ebx
jge     short loc_1000FEA1

loc_1000FEEF:
cmp     [ebp+var_4], 0
mov     ecx, esi
mov     esi, [esi+4]
jz      short loc_1000FF26
cmp     dword ptr [ecx+18h], 0FFFFFFFFh
jnz     short loc_1000FF26
push    1
lea     eax, [ecx+20h]
pop     edx

loc_1000FF06:
cmp     dword ptr [eax], 0FFFFFFFFh
jnz     short loc_1000FF17
inc     edx
add     eax, 8
cmp     edx, 400h
jl      short loc_1000FF06

loc_1000FF17:
cmp     edx, 400h
jnz     short loc_1000FF26
push    ecx             ; lpMem
call    sub_1000FE25
pop     ecx

loc_1000FF26:
cmp     esi, off_10018714
jz      short loc_1000FF38
cmp     [ebp+arg_0], 0
jg      loc_1000FE88

loc_1000FF38:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000FE7B endp




sub_1000FF3D proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

mov     eax, [esp+arg_0]
mov     edx, offset off_10018710
push    esi
mov     ecx, edx

loc_1000FF49:
cmp     eax, [ecx+10h]
jbe     short loc_1000FF53
cmp     eax, [ecx+14h]
jb      short loc_1000FF5B

loc_1000FF53:
mov     ecx, [ecx]
cmp     ecx, edx
jz      short loc_1000FF90
jmp     short loc_1000FF49

loc_1000FF5B:
test    al, 0Fh
jnz     short loc_1000FF90
mov     esi, eax
mov     edx, 100h
and     esi, 0FFFh
cmp     esi, edx
jb      short loc_1000FF90
mov     esi, [esp+4+arg_4]
mov     [esi], ecx
mov     esi, [esp+4+arg_8]
mov     ecx, eax
and     cx, 0F000h
sub     eax, ecx
mov     [esi], ecx
sub     eax, edx
pop     esi
sar     eax, 4
lea     eax, [eax+ecx+8]
retn

loc_1000FF90:
xor     eax, eax
pop     esi
retn
sub_1000FF3D endp




sub_1000FF94 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

mov     eax, [esp+arg_0]
mov     ecx, [esp+arg_4]
sub     ecx, [eax+10h]
sar     ecx, 0Ch
lea     eax, [eax+ecx*8+18h]
mov     ecx, [esp+arg_8]
movzx   edx, byte ptr [ecx]
add     [eax], edx
and     byte ptr [ecx], 0
cmp     dword ptr [eax], 0F0h
mov     dword ptr [eax+4], 0F1h
jnz     short locret_1000FFD8
inc     dword_1001B434
cmp     dword_1001B434, 20h
jnz     short locret_1000FFD8
push    10h
call    sub_1000FE7B
pop     ecx

locret_1000FFD8:
retn
sub_1000FF94 endp



; Attributes: bp-based frame

sub_1000FFD9 proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
push    ecx
push    ecx
push    ebx
push    esi
mov     esi, off_1001A730
push    edi

loc_1000FFE7:
mov     edx, [esi+10h]
cmp     edx, 0FFFFFFFFh
jz      loc_10010092
mov     edi, [esi+8]
lea     ecx, [esi+2018h]
mov     eax, edi
sub     eax, esi
sub     eax, 18h
sar     eax, 3
shl     eax, 0Ch
add     eax, edx
cmp     edi, ecx
mov     [ebp+var_4], eax
jnb     short loc_1001004C

loc_10010012:
mov     ecx, [edi]
mov     ebx, [ebp+arg_0]
cmp     ecx, ebx
jl      short loc_10010035
cmp     [edi+4], ebx
jbe     short loc_10010035
push    ebx
push    ecx
push    eax
call    sub_100101E1
add     esp, 0Ch
test    eax, eax
jnz     short loc_100100A4
mov     eax, [ebp+var_4]
mov     [edi+4], ebx

loc_10010035:
add     edi, 8
lea     ecx, [esi+2018h]
add     eax, 1000h
cmp     edi, ecx
mov     [ebp+var_4], eax
jb      short loc_10010012
jmp     short loc_1001004F

loc_1001004C:
mov     ebx, [ebp+arg_0]

loc_1001004F:
mov     eax, [esi+8]
mov     ecx, [esi+10h]
lea     edi, [esi+18h]
mov     [ebp+var_8], eax
cmp     edi, eax
mov     [ebp+var_4], ecx
jnb     short loc_10010095

loc_10010062:
mov     eax, [edi]
cmp     eax, ebx
jl      short loc_10010081
cmp     [edi+4], ebx
jbe     short loc_10010081
push    ebx
push    eax
push    [ebp+var_4]
call    sub_100101E1
add     esp, 0Ch
test    eax, eax
jnz     short loc_100100A4
mov     [edi+4], ebx

loc_10010081:
add     [ebp+var_4], 1000h
add     edi, 8
cmp     edi, [ebp+var_8]
jb      short loc_10010062
jmp     short loc_10010095

loc_10010092:
mov     ebx, [ebp+arg_0]

loc_10010095:
mov     esi, [esi]
cmp     esi, off_1001A730
jz      short loc_100100B4
jmp     loc_1000FFE7

loc_100100A4:
mov     off_1001A730, esi
sub     [edi], ebx
mov     [esi+8], edi
jmp     loc_100101DC

loc_100100B4:
mov     eax, offset off_10018710
mov     edi, eax

loc_100100BB:
cmp     dword ptr [edi+10h], 0FFFFFFFFh
jz      short loc_100100C7
cmp     dword ptr [edi+0Ch], 0
jnz     short loc_100100D3

loc_100100C7:
mov     edi, [edi]
cmp     edi, eax
jz      loc_100101A8
jmp     short loc_100100BB

loc_100100D3:
mov     ebx, [edi+0Ch]
and     [ebp+var_4], 0
mov     esi, ebx
mov     eax, ebx
sub     esi, edi
sub     esi, 18h
sar     esi, 3
shl     esi, 0Ch
add     esi, [edi+10h]
cmp     dword ptr [ebx], 0FFFFFFFFh
jnz     short loc_10010102

loc_100100F1:
cmp     [ebp+var_4], 10h
jge     short loc_10010102
add     eax, 8
inc     [ebp+var_4]
cmp     dword ptr [eax], 0FFFFFFFFh
jz      short loc_100100F1

loc_10010102:
mov     eax, [ebp+var_4]
push    4               ; flProtect
shl     eax, 0Ch
push    1000h           ; flAllocationType
push    eax             ; dwSize
push    esi             ; lpAddress
mov     [ebp+var_8], eax
call    ds:VirtualAlloc
cmp     eax, esi
jnz     loc_100101DA
push    0
push    [ebp+var_8]
push    esi
call    sub_10012000
mov     edx, [ebp+var_4]
add     esp, 0Ch
test    edx, edx
mov     ecx, ebx
jle     short loc_10010169
lea     eax, [esi+4]
mov     [ebp+var_4], edx

loc_1001013F:
or      byte ptr [eax+0F4h], 0FFh
lea     edx, [eax+4]
mov     [eax-4], edx
mov     edx, 0F0h
mov     [eax], edx
mov     [ecx], edx
mov     dword ptr [ecx+4], 0F1h
add     eax, 1000h
add     ecx, 8
dec     [ebp+var_4]
jnz     short loc_1001013F

loc_10010169:
mov     off_1001A730, edi
lea     eax, [edi+2018h]

loc_10010175:
cmp     ecx, eax
jnb     short loc_10010185
cmp     dword ptr [ecx], 0FFFFFFFFh
jz      short loc_10010183
add     ecx, 8
jmp     short loc_10010175

loc_10010183:
cmp     ecx, eax

loc_10010185:
sbb     eax, eax
and     eax, ecx
mov     [edi+0Ch], eax
mov     eax, [ebp+arg_0]
mov     [esi+8], al
mov     [edi+8], ebx
sub     [ebx], eax
sub     [esi+4], eax
lea     ecx, [esi+eax+8]
lea     eax, [esi+100h]
mov     [esi], ecx
jmp     short loc_100101DC

loc_100101A8:
call    sub_1000FCE1
test    eax, eax
jz      short loc_100101DA
mov     ecx, [eax+10h]
mov     [ecx+8], bl
lea     edx, [ecx+ebx+8]
mov     off_1001A730, eax
mov     [ecx], edx
mov     edx, 0F0h
sub     edx, ebx
mov     [ecx+4], edx
movzx   edx, bl
sub     [eax+18h], edx
lea     eax, [ecx+100h]
jmp     short loc_100101DC

loc_100101DA:
xor     eax, eax

loc_100101DC:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1000FFD9 endp



; Attributes: bp-based frame

sub_100101E1 proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    ecx
mov     ecx, [ebp+arg_0]
mov     edx, [ebp+arg_8]
push    ebx
push    esi
mov     esi, [ecx+4]
push    edi
mov     edi, [ecx]
lea     ebx, [ecx+0F8h]
cmp     esi, edx
mov     [ebp+var_4], edi
mov     eax, edi
mov     [ebp+arg_0], ebx
jb      short loc_10010226
lea     eax, [edi+edx]
mov     [edi], dl
cmp     eax, ebx
jnb     short loc_10010215
add     [ecx], edx
sub     [ecx+4], edx
jmp     short loc_1001021E

loc_10010215:
and     dword ptr [ecx+4], 0
lea     eax, [ecx+8]
mov     [ecx], eax

loc_1001021E:
lea     eax, [edi+8]
jmp     loc_100102F4

loc_10010226:
add     esi, edi
cmp     byte ptr [esi], 0
jz      short loc_1001022F
mov     eax, esi

loc_1001022F:
lea     esi, [eax+edx]
cmp     esi, ebx
jnb     short loc_10010279

loc_10010236:
mov     bl, [eax]
test    bl, bl
jnz     short loc_1001026C
push    1
lea     ebx, [eax+1]
pop     esi

loc_10010242:
cmp     byte ptr [ebx], 0
jnz     short loc_1001024B
inc     ebx
inc     esi
jmp     short loc_10010242

loc_1001024B:
cmp     esi, edx
jnb     short loc_1001029D
cmp     eax, [ebp+var_4]
jnz     short loc_10010259
mov     [ecx+4], esi
jmp     short loc_10010265

loc_10010259:
sub     [ebp+arg_4], esi
cmp     [ebp+arg_4], edx
jb      loc_100102FE

loc_10010265:
mov     edi, [ebp+var_4]
mov     eax, ebx
jmp     short loc_10010271

loc_1001026C:
movzx   esi, bl
add     eax, esi

loc_10010271:
lea     esi, [eax+edx]
cmp     esi, [ebp+arg_0]
jb      short loc_10010236

loc_10010279:
lea     esi, [ecx+8]

loc_1001027C:
cmp     esi, edi
jnb     short loc_100102FE
lea     eax, [esi+edx]
cmp     eax, [ebp+arg_0]
jnb     short loc_100102FE
mov     al, [esi]
test    al, al
jnz     short loc_100102CE
push    1
lea     ebx, [esi+1]
pop     eax

loc_10010294:
cmp     byte ptr [ebx], 0
jnz     short loc_100102BE
inc     ebx
inc     eax
jmp     short loc_10010294

loc_1001029D:
lea     ebx, [eax+edx]
cmp     ebx, [ebp+arg_0]
jnb     short loc_100102AE
sub     esi, edx
mov     [ecx], ebx
mov     [ecx+4], esi
jmp     short loc_100102B7

loc_100102AE:
and     dword ptr [ecx+4], 0
lea     esi, [ecx+8]
mov     [ecx], esi

loc_100102B7:
mov     [eax], dl
add     eax, 8
jmp     short loc_100102F4

loc_100102BE:
cmp     eax, edx
jnb     short loc_100102D5
sub     [ebp+arg_4], eax
cmp     [ebp+arg_4], edx
jb      short loc_100102FE
mov     esi, ebx
jmp     short loc_1001027C

loc_100102CE:
movzx   eax, al
add     esi, eax
jmp     short loc_1001027C

loc_100102D5:
lea     ebx, [esi+edx]
cmp     ebx, [ebp+arg_0]
jnb     short loc_100102E6
sub     eax, edx
mov     [ecx], ebx
mov     [ecx+4], eax
jmp     short loc_100102EF

loc_100102E6:
and     dword ptr [ecx+4], 0
lea     eax, [ecx+8]
mov     [ecx], eax

loc_100102EF:
mov     [esi], dl
lea     eax, [esi+8]

loc_100102F4:
imul    ecx, 0Fh
shl     eax, 4
sub     eax, ecx
jmp     short loc_10010300

loc_100102FE:
xor     eax, eax

loc_10010300:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_100101E1 endp




sub_10010305 proc near
push    esi
mov     esi, ds:InitializeCriticalSection
push    lpCriticalSection ; lpCriticalSection
call    esi ; InitializeCriticalSection
push    off_1001A76C    ; lpCriticalSection
call    esi ; InitializeCriticalSection
push    off_1001A75C    ; lpCriticalSection
call    esi ; InitializeCriticalSection
push    off_1001A73C    ; lpCriticalSection
call    esi ; InitializeCriticalSection
pop     esi
retn
sub_10010305 endp




sub_1001032E proc near
push    esi
push    edi
mov     edi, ds:DeleteCriticalSection
mov     esi, offset dword_1001A738

loc_1001033B:
mov     eax, [esi]
test    eax, eax
jz      short loc_1001036C
cmp     esi, offset lpCriticalSection
jz      short loc_1001036C
cmp     esi, offset off_1001A76C
jz      short loc_1001036C
cmp     esi, offset off_1001A75C
jz      short loc_1001036C
cmp     esi, offset off_1001A73C
jz      short loc_1001036C
push    eax             ; lpCriticalSection
call    edi ; DeleteCriticalSection
push    dword ptr [esi] ; lpMem
call    sub_1000D97B
pop     ecx

loc_1001036C:
add     esi, 4
cmp     esi, offset unk_1001A7F8
jl      short loc_1001033B
push    off_1001A75C    ; lpCriticalSection
call    edi ; DeleteCriticalSection
push    off_1001A76C    ; lpCriticalSection
call    edi ; DeleteCriticalSection
push    lpCriticalSection ; lpCriticalSection
call    edi ; DeleteCriticalSection
push    off_1001A73C    ; lpCriticalSection
call    edi ; DeleteCriticalSection
pop     edi
pop     esi
retn
sub_1001032E endp



; Attributes: bp-based frame

sub_1001039A proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    esi
cmp     dword_1001A738[eax*4], 0
lea     esi, dword_1001A738[eax*4]
jnz     short loc_100103F0
push    edi
push    18h
call    sub_1000DA64
mov     edi, eax
pop     ecx
test    edi, edi
jnz     short loc_100103C9
push    11h             ; NumberOfBytesWritten
call    sub_1000E400
pop     ecx

loc_100103C9:
push    11h
call    sub_1001039A
cmp     dword ptr [esi], 0
pop     ecx
push    edi             ; lpMem
jnz     short loc_100103E1
call    ds:InitializeCriticalSection
mov     [esi], edi
jmp     short loc_100103E7

loc_100103E1:
call    sub_1000D97B
pop     ecx

loc_100103E7:
push    11h
call    sub_100103FB
pop     ecx
pop     edi

loc_100103F0:           ; lpCriticalSection
push    dword ptr [esi]
call    ds:EnterCriticalSection
pop     esi
pop     ebp
retn
sub_1001039A endp



; Attributes: bp-based frame

sub_100103FB proc near

arg_0= dword ptr  8

push    ebp
mov     ebp, esp
mov     eax, [ebp+arg_0]
push    dword_1001A738[eax*4] ; lpCriticalSection
call    ds:LeaveCriticalSection
pop     ebp
retn
sub_100103FB endp



; Attributes: bp-based frame

; int __cdecl sub_10010410(PVOID TargetFrame)
sub_10010410 proc near

TargetFrame= dword ptr  8

push    ebp
mov     ebp, esp
push    ebx
push    esi
push    edi
push    ebp
push    0               ; ReturnValue
push    0               ; ExceptionRecord
push    offset loc_10010428 ; TargetIp
push    [ebp+TargetFrame] ; TargetFrame
call    RtlUnwind

loc_10010428:
pop     ebp
pop     edi
pop     esi
pop     ebx
mov     esp, ebp
pop     ebp
retn
sub_10010410 endp




sub_10010430 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_C= dword ptr  10h

mov     ecx, [esp+arg_0]
test    dword ptr [ecx+4], 6
mov     eax, 1
jz      short locret_10010451
mov     eax, [esp+arg_4]
mov     edx, [esp+arg_C]
mov     [edx], eax
mov     eax, 3

locret_10010451:
retn
sub_10010430 endp




sub_10010452 proc near

var_14= dword ptr -14h
arg_0= dword ptr  4
arg_4= dword ptr  8

push    ebx
push    esi
push    edi
mov     eax, [esp+0Ch+arg_0]
push    eax
push    0FFFFFFFEh
push    offset sub_10010430
push    large dword ptr fs:0
mov     large fs:0, esp

loc_1001046F:
mov     eax, [esp+1Ch+arg_0]
mov     ebx, [eax+8]
mov     esi, [eax+0Ch]
cmp     esi, 0FFFFFFFFh
jz      short loc_100104AC
cmp     esi, [esp+1Ch+arg_4]
jz      short loc_100104AC
lea     esi, [esi+esi*2]
mov     ecx, [ebx+esi*4]
mov     [esp+1Ch+var_14], ecx
mov     [eax+0Ch], ecx
cmp     dword ptr [ebx+esi*4+4], 0
jnz     short loc_100104AA
push    101h
mov     eax, [ebx+esi*4+8]
call    sub_100104E6
call    dword ptr [ebx+esi*4+8]

loc_100104AA:
jmp     short loc_1001046F

loc_100104AC:
pop     large dword ptr fs:0
add     esp, 0Ch
pop     edi
pop     esi
pop     ebx
retn
sub_10010452 endp

xor     eax, eax
mov     ecx, large fs:0
cmp     dword ptr [ecx+4], offset sub_10010430
jnz     short locret_100104DC
mov     edx, [ecx+0Ch]
mov     edx, [edx+0Ch]
cmp     [ecx+8], edx
jnz     short locret_100104DC
mov     eax, 1

locret_100104DC:
retn
push    ebx
push    ecx
mov     ebx, offset unk_1001A7F8
jmp     short loc_100104F0



sub_100104E6 proc near
push    ebx
push    ecx
mov     ebx, offset unk_1001A7F8
mov     ecx, [ebp+8]

loc_100104F0:
mov     [ebx+8], ecx
mov     [ebx+4], eax
mov     [ebx+0Ch], ebp
pop     ecx
pop     ebx
retn    4
sub_100104E6 endp

align 10h
push    esi
inc     ebx
xor     dh, [eax]
pop     eax
inc     ebx
xor     [eax], dh


; Attributes: bp-based frame

; int __cdecl sub_10010508(int, PVOID TargetFrame, int)
sub_10010508 proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
TargetFrame= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 8
push    ebx
push    esi
push    edi
push    ebp
cld
mov     ebx, [ebp+TargetFrame]
mov     eax, [ebp+arg_0]
test    dword ptr [eax+4], 6
jnz     loc_100105A8
mov     [ebp+var_8], eax
mov     eax, [ebp+arg_8]
mov     [ebp+var_4], eax
lea     eax, [ebp+var_8]
mov     [ebx-4], eax
mov     esi, [ebx+0Ch]
mov     edi, [ebx+8]

loc_1001053B:
cmp     esi, 0FFFFFFFFh
jz      short loc_100105A1
lea     ecx, [esi+esi*2]
cmp     dword ptr [edi+ecx*4+4], 0
jz      short loc_1001058F
push    esi
push    ebp
lea     ebp, [ebx+10h]
call    dword ptr [edi+ecx*4+4]
pop     ebp
pop     esi
mov     ebx, [ebp+TargetFrame]
or      eax, eax
jz      short loc_1001058F
js      short loc_1001059A
mov     edi, [ebx+8]
push    ebx             ; TargetFrame
call    sub_10010410
add     esp, 4
lea     ebp, [ebx+10h]
push    esi
push    ebx
call    sub_10010452
add     esp, 8
lea     ecx, [esi+esi*2]
push    1
mov     eax, [edi+ecx*4+8]
call    sub_100104E6
mov     eax, [edi+ecx*4]
mov     [ebx+0Ch], eax
call    dword ptr [edi+ecx*4+8]

loc_1001058F:
mov     edi, [ebx+8]
lea     ecx, [esi+esi*2]
mov     esi, [edi+ecx*4]
jmp     short loc_1001053B

loc_1001059A:
mov     eax, 0
jmp     short loc_100105BD

loc_100105A1:
mov     eax, 1
jmp     short loc_100105BD

loc_100105A8:
push    ebp
lea     ebp, [ebx+10h]
push    0FFFFFFFFh
push    ebx
call    sub_10010452
add     esp, 8
pop     ebp
mov     eax, 1

loc_100105BD:
pop     ebp
pop     edi
pop     esi
pop     ebx
mov     esp, ebp
pop     ebp
retn
sub_10010508 endp

push    ebp
mov     ecx, [esp+8]
mov     ebp, [ecx]
mov     eax, [ecx+1Ch]
push    eax
mov     eax, [ecx+18h]
push    eax
call    sub_10010452
add     esp, 8
pop     ebp
retn    4



sub_100105E0 proc near

arg_0= dword ptr  4

mov     eax, dword_1001B49C
test    eax, eax
jz      short loc_100105F8
push    [esp+arg_0]
call    eax ; dword_1001B49C
test    eax, eax
pop     ecx
jz      short loc_100105F8
push    1
pop     eax
retn

loc_100105F8:
xor     eax, eax
retn
sub_100105E0 endp

align 10h
mov     byte ptr [ebp-90h], 0FEh
or      ch, ch
jnz     short loc_10010656
fxch    st(1)

loc_1001060D:
fyl2x
jmp     short loc_1001061E



sub_10010611 proc near

; FUNCTION CHUNK AT 10010908 SIZE 00000005 BYTES

mov     byte ptr [ebp-90h], 0FEh
xor     ch, ch
fldl2e
fmulp   st(1), st

loc_1001061E:
call    sub_1001075E
fld1
faddp   st(1), st
test    byte ptr [ebp-9Fh], 1
jz      short loc_10010644
fld1
cmp     dword_1001B41C, 1
jz      short loc_1001063F
fdivrp  st(1), st
jmp     short loc_10010644

loc_1001063F:
call    sub_10013081

loc_10010644:
test    dl, 40h
jnz     short loc_1001064B
fscale

loc_1001064B:
or      ch, ch
jz      short loc_10010651
fchs

loc_10010651:
jmp     loc_10010908
sub_10010611 endp


loc_10010656:
call    sub_100107A1
or      eax, eax
jz      short loc_10010673
xor     ch, ch
cmp     eax, 2
jz      short loc_10010668
not     ch

loc_10010668:
fxch    st(1)
fabs
jmp     short loc_1001060D
jmp     loc_1001091B

loc_10010673:
jmp     loc_100109B6
fstp    st
fstp    st
fld     tbyte_1001A810
mov     byte ptr [ebp-90h], 2
retn
fldln2
fxch    st(1)
ftst
fstsw   word ptr [ebp-0A0h]
wait
test    byte ptr [ebp-9Fh], 41h
jnz     short loc_10010673
fyl2x
retn
mov     byte ptr [ebp-90h], 2
fstp    st
fld     tbyte_1001A81A
retn
or      cl, cl
jnz     short loc_1001070B
retn
fldlg2
jmp     short loc_100106BF
fldln2

loc_100106BF:
fxch    st(1)
or      cl, cl
jnz     short loc_10010673
fyl2x
retn
jmp     loc_1001091B
call    sub_100107A1
fstp    st
fstp    st
or      cl, cl
jnz     short loc_100106E8
fldz
cmp     eax, 1
jnz     short locret_100106E7
or      ch, ch
jz      short locret_100106E7
fchs

locret_100106E7:
retn

loc_100106E8:
mov     byte ptr [ebp-90h], 2
fld     tbyte_1001A810
cmp     eax, 1
jnz     short locret_100106E7
or      ch, ch
jz      short locret_100106E7
fchs
jmp     short locret_100106E7
fstp    st
; START OF FUNCTION CHUNK FOR sub_10010751

loc_10010704:
jmp     loc_10010916
; END OF FUNCTION CHUNK FOR sub_10010751
fstp    st

loc_1001070B:
jmp     loc_100109B8
; START OF FUNCTION CHUNK FOR sub_1001075E

loc_10010710:
pop     eax
ftst
fstsw   word ptr [ebp-0A0h]
wait
test    byte ptr [ebp-9Fh], 1
jnz     short loc_10010733
fstp    st
fld     tbyte_1001A810
or      ch, ch
jz      short locret_10010732
fchs

locret_10010732:
retn

loc_10010733:
mov     byte ptr [ebp-90h], 4
jmp     loc_10010916
; END OF FUNCTION CHUNK FOR sub_1001075E
fstp    st
fstp    st
fld     tbyte_1001A810
mov     byte ptr [ebp-90h], 3
retn



sub_10010751 proc near

; FUNCTION CHUNK AT 10010704 SIZE 00000005 BYTES
; FUNCTION CHUNK AT 10010916 SIZE 00000005 BYTES

or      cl, cl
jnz     short loc_10010704
fstp    st
fld     tbyte_1001A810
retn
sub_10010751 endp




sub_1001075E proc near

; FUNCTION CHUNK AT 10010710 SIZE 0000002F BYTES
; FUNCTION CHUNK AT 10010916 SIZE 00000005 BYTES

fld     st
fabs
fld     tbyte_1001A82E
fcompp
fstsw   word ptr [ebp-0A0h]
wait
test    byte ptr [ebp-9Fh], 41h
jnz     short loc_10010710
fld     st
frndint
ftst
fstsw   word ptr [ebp-0A0h]
wait
mov     dl, [ebp-9Fh]
fxch    st(1)
fsub    st, st(1)
ftst
fstsw   word ptr [ebp-0A0h]
fabs
f2xm1
retn
sub_1001075E endp ; sp-analysis failed




sub_100107A1 proc near
fld     st
frndint
fcomp   st(1)
fstsw   ax
sahf
jnz     short loc_100107C7
fld     st
fmul    dbl_1001A842
fld     st
frndint
fcompp
fstsw   ax
sahf
jz      short loc_100107CE
mov     eax, 1

locret_100107C6:
retn

loc_100107C7:
mov     eax, 0
jmp     short locret_100107C6

loc_100107CE:
mov     eax, 2
jmp     short locret_100107C6
sub_100107A1 endp

push    esi
sub     esp, 74h
mov     esi, esp
push    esi
sub     esp, 8
fstp    qword ptr [esp]
sub     esp, 8
fstp    qword ptr [esp]
fsave   byte ptr [esi+8]
call    sub_10010BCC
add     esp, 14h
frstor  byte ptr [esi+8]
fld     qword ptr [esi]
add     esp, 74h
pop     esi
test    eax, eax
jz      short locret_10010806
jmp     sub_100109C9

locret_10010806:
retn
align 10h
cmp     byte ptr [edx+0Eh], 5
jnz     short loc_10010827
mov     bx, [ebp-0A4h]
or      bh, 2
and     bh, 0FEh
mov     bl, 3Fh
jmp     short loc_1001082B

loc_10010827:
mov     bx, 133Fh

loc_1001082B:
mov     [ebp-0A2h], bx
fldcw   word ptr [ebp-0A2h]
mov     ebx, offset unk_1001A88C
fxam
mov     [ebp-94h], edx
fstsw   word ptr [ebp-0A0h]
mov     byte ptr [ebp-90h], 0
wait
mov     cl, [ebp-9Fh]
shl     cl, 1
sar     cl, 1
rol     cl, 1
mov     al, cl
and     al, 0Fh
xlat
movsx   eax, al
and     ecx, 404h
mov     ebx, edx
add     ebx, eax
add     ebx, 10h
jmp     dword ptr [ebx]
cmp     byte ptr [edx+0Eh], 5
jnz     short loc_1001088E
mov     bx, [ebp-0A4h]
or      bh, 2
and     bh, 0FEh
mov     bl, 3Fh
jmp     short loc_10010892

loc_1001088E:
mov     bx, 133Fh

loc_10010892:
mov     [ebp-0A2h], bx
fldcw   word ptr [ebp-0A2h]
mov     ebx, offset unk_1001A88C
fxam
mov     [ebp-94h], edx
fstsw   word ptr [ebp-0A0h]
mov     byte ptr [ebp-90h], 0
fxch    st(1)
mov     cl, [ebp-9Fh]
fxam
fstsw   word ptr [ebp-0A0h]
fxch    st(1)
mov     ch, [ebp-9Fh]
shl     ch, 1
sar     ch, 1
rol     ch, 1
mov     al, ch
and     al, 0Fh
xlat
mov     ah, al
shl     cl, 1
sar     cl, 1
rol     cl, 1
mov     al, cl
and     al, 0Fh
xlat
shl     ah, 1
shl     ah, 1
or      al, ah
movsx   eax, al
and     ecx, 404h
mov     ebx, edx
add     ebx, eax
add     ebx, 10h
jmp     dword ptr [ebx]
call    sub_100109C9
; START OF FUNCTION CHUNK FOR sub_10010611

loc_10010908:
fxch    st(1)

loc_1001090A:
fstp    st
retn
; END OF FUNCTION CHUNK FOR sub_10010611
call    sub_100109C9
jmp     short loc_1001090A
fstp    st
; START OF FUNCTION CHUNK FOR sub_1001075E
;   ADDITIONAL PARENT FUNCTION sub_10010751

loc_10010916:
fstp    st
fldz
retn
; END OF FUNCTION CHUNK FOR sub_1001075E

loc_1001091B:
fstp    st



sub_1001091D proc near
fstp    st
fld1
retn
sub_1001091D endp




sub_10010922 proc near
fstp    tbyte ptr [ebp-9Eh]
fld     tbyte ptr [ebp-9Eh]
test    byte ptr [ebp-97h], 40h
jz      short loc_1001093F
mov     byte ptr [ebp-90h], 7
retn

loc_1001093F:
mov     byte ptr [ebp-90h], 1
fadd    dbl_1001A884
retn
sub_10010922 endp

fxch    st(1)
fstp    tbyte ptr [ebp-9Eh]
fld     tbyte ptr [ebp-9Eh]
test    byte ptr [ebp-97h], 40h
jz      short loc_1001096D
mov     byte ptr [ebp-90h], 7
jmp     short loc_10010974

loc_1001096D:
mov     byte ptr [ebp-90h], 1

loc_10010974:
faddp   st(1), st
retn
fstp    tbyte ptr [ebp-9Eh]
fld     tbyte ptr [ebp-9Eh]
test    byte ptr [ebp-97h], 40h
jz      short loc_100109AC
fxch    st(1)
fstp    tbyte ptr [ebp-9Eh]
fld     tbyte ptr [ebp-9Eh]
test    byte ptr [ebp-97h], 40h
jz      short loc_100109AC
mov     byte ptr [ebp-90h], 7
jmp     short loc_100109B3

loc_100109AC:
mov     byte ptr [ebp-90h], 1

loc_100109B3:
faddp   st(1), st
retn

loc_100109B6:
fstp    st

loc_100109B8:
fstp    st
fld     tbyte_1001A870
cmp     byte ptr [ebp-90h], 0
jg      short loc_100109D0



sub_100109C9 proc near
mov     byte ptr [ebp-90h], 1

loc_100109D0:
or      cl, cl
retn
sub_100109C9 endp

or      cl, cl
jz      short locret_100109D9
fchs

locret_100109D9:
retn
align 10h


; Attributes: bp-based frame

sub_100109E0 proc near

var_20= dword ptr -20h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
arg_10= dword ptr  18h
arg_14= dword ptr  1Ch

push    ebp
mov     ebp, esp
add     esp, 0FFFFFFE0h
mov     [ebp+var_20], eax
mov     eax, [ebp+arg_10]
mov     [ebp+var_10], eax
mov     eax, [ebp+arg_14]
mov     [ebp+var_C], eax
jmp     short loc_10010A00
sub_100109E0 endp



; Attributes: bp-based frame

sub_100109F7 proc near

var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_8= qword ptr -8
arg_0= word ptr  8
arg_8= dword ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
add     esp, 0FFFFFFE0h
mov     [ebp+var_20], eax

loc_10010A00:
fstp    [ebp+var_8]
mov     [ebp+var_1C], ecx
mov     eax, [ebp+arg_8]
mov     ecx, [ebp+arg_C]
mov     [ebp+var_18], eax
mov     [ebp+var_14], ecx
lea     eax, [ebp+arg_0]
lea     ecx, [ebp+var_20]
push    eax
push    ecx
push    edx
call    sub_1001361B
add     esp, 0Ch
fld     [ebp+var_8]
cmp     [ebp+arg_0], 27Fh
jz      short locret_10010A31
fldcw   [ebp+arg_0]

locret_10010A31:
leave
retn
sub_100109F7 endp

align 10h



sub_10010A40 proc near
fld     st
frndint
fsubr   st(1), st
fxch    st(1)
fchs
f2xm1
fld1
faddp   st(1), st
fscale
fstp    st(1)
retn
sub_10010A40 endp




sub_10010A55 proc near

arg_0= dword ptr  4

mov     edx, [esp+arg_0]
and     edx, 300h
or      edx, 7Fh
mov     word ptr [esp+arg_0+2], dx
fldcw   word ptr [esp+arg_0+2]
retn
sub_10010A55 endp




sub_10010A6C proc near
test    eax, 80000h
jz      short loc_10010A79
mov     eax, 7
retn

loc_10010A79:
fadd    ds:dbl_100162F0
mov     eax, 1
retn
sub_10010A6C endp




sub_10010A85 proc near

var_A= tbyte ptr -0Ah

mov     eax, [edx+4]
and     eax, 7FF00000h
cmp     eax, 7FF00000h
jz      short loc_10010A97
fld     qword ptr [edx]
retn

loc_10010A97:
mov     eax, [edx+4]
sub     esp, 0Ah
or      eax, 7FFF0000h
mov     dword ptr [esp+0Ah+var_A+6], eax
mov     eax, [edx+4]
mov     ecx, [edx]
shld    eax, ecx, 0Bh
shl     ecx, 0Bh
mov     [esp+4], eax
mov     dword ptr [esp+0Ah+var_A], ecx
fld     [esp+0Ah+var_A]
add     esp, 0Ah
test    eax, 0
mov     eax, [edx+4]
retn
sub_10010A85 endp




sub_10010AC8 proc near

arg_4= dword ptr  8

mov     eax, [esp+arg_4]
and     eax, 7FF00000h
cmp     eax, 7FF00000h
jz      short loc_10010AD9
retn

loc_10010AD9:
mov     eax, [esp+arg_4]
retn
sub_10010AC8 endp

; START OF FUNCTION CHUNK FOR sub_1000DEF9
;   ADDITIONAL PARENT FUNCTION sub_1000E114
;   ADDITIONAL PARENT FUNCTION sub_1000E1E4

loc_10010ADE:
cmp     [esp+4+var_4], 27Fh
jz      short loc_10010AE9
fldcw   [esp+4+var_4]

loc_10010AE9:
pop     edx
retn
; END OF FUNCTION CHUNK FOR sub_1000DEF9
; START OF FUNCTION CHUNK FOR sub_1000E114

loc_10010AEB:
mov     ax, [esp+4+var_4]
cmp     ax, 27Fh
jz      short loc_10010B13
and     ax, 20h
jz      short loc_10010B10
fstsw   ax
and     ax, 20h
jz      short loc_10010B10
mov     eax, 8
call    sub_100109F7
pop     edx
retn

loc_10010B10:
fldcw   [esp+4+var_4]

loc_10010B13:
pop     edx
retn
; END OF FUNCTION CHUNK FOR sub_1000E114
sub     esp, 8
fst     qword ptr [esp]
mov     eax, [esp+4]
add     esp, 8
and     eax, 7FF00000h
jmp     short loc_10010B3D



sub_10010B29 proc near

var_8= qword ptr -8

sub     esp, 8
fst     [esp+8+var_8]
mov     eax, dword ptr [esp+8+var_8+4]
add     esp, 8
and     eax, 7FF00000h
jz      short loc_10010B7A

loc_10010B3D:
cmp     eax, 7FF00000h
jz      short loc_10010BA3
mov     ax, [esp+0]
cmp     ax, 27Fh
jz      short loc_10010B78
and     ax, 20h
jnz     short loc_10010B75
fstsw   ax
and     ax, 20h
jz      short loc_10010B75
mov     eax, 8

loc_10010B62:
cmp     edx, 1Dh
jz      short loc_10010B6E
call    sub_100109F7
pop     edx
retn

loc_10010B6E:
call    sub_100109E0
pop     edx
retn

loc_10010B75:
fldcw   word ptr [esp+0]

loc_10010B78:
pop     edx
retn

loc_10010B7A:
fld     ds:dbl_1001631C
fxch    st(1)
fscale
fstp    st(1)
fld     st
fabs
fcomp   ds:dbl_1001630C
fstsw   ax
sahf
mov     eax, 4
jnb     short loc_10010B62
fmul    ds:dbl_1001632C
jmp     short loc_10010B62

loc_10010BA3:
fld     ds:dbl_10016314
fxch    st(1)
fscale
fstp    st(1)
fld     st
fabs
fcomp   ds:dbl_10016304
fstsw   ax
sahf
mov     eax, 3
jbe     short loc_10010B62
fmul    ds:dbl_10016324
jmp     short loc_10010B62
sub_10010B29 endp ; sp-analysis failed



; Attributes: bp-based frame

; int __cdecl sub_10010BCC(double, double, int)
sub_10010BCC proc near

var_14= qword ptr -14h
var_8= qword ptr -8
arg_0= qword ptr  8
arg_8= qword ptr  10h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
push    ecx
push    ecx
fld     [ebp+arg_0]
fcomp   ds:dbl_100160F8
fld     [ebp+arg_0]
push    esi
xor     edx, edx
xor     esi, esi
fnstsw  ax
sahf
jnb     short loc_10010BE9
fchs

loc_10010BE9:
fstp    [ebp+var_8]
mov     eax, 7FF00000h
mov     ecx, 0FFF00000h
cmp     dword ptr [ebp+arg_8+4], eax
jnz     short loc_10010C2F
cmp     dword ptr [ebp+arg_8], edx
jnz     short loc_10010C57
fld     [ebp+var_8]
fcomp   ds:dbl_100160F0
fnstsw  ax
sahf
ja      short loc_10010C73
fld     [ebp+var_8]
fcomp   ds:dbl_100160F0
fnstsw  ax
sahf
jb      short loc_10010C89

loc_10010C1C:
fld     dbl_100186D0
mov     eax, [ebp+arg_10]
push    1
pop     esi
fstp    qword ptr [eax]
jmp     loc_10010CF7

loc_10010C2F:
cmp     dword ptr [ebp+arg_8+4], ecx
jnz     short loc_10010C57
cmp     dword ptr [ebp+arg_8], edx
jnz     short loc_10010C57
fld     [ebp+var_8]
fcomp   ds:dbl_100160F0
fnstsw  ax
sahf
ja      short loc_10010C89
fld     [ebp+var_8]
fcomp   ds:dbl_100160F0
fnstsw  ax
sahf
jnb     short loc_10010C1C
jmp     short loc_10010C73

loc_10010C57:
cmp     dword ptr [ebp+arg_0+4], eax
jnz     short loc_10010C8D
cmp     dword ptr [ebp+arg_0], edx
jnz     loc_10010CF7
fld     [ebp+arg_8]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jbe     short loc_10010C7B

loc_10010C73:
fld     dbl_100186C8
jmp     short loc_10010CF2

loc_10010C7B:
fld     [ebp+arg_8]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jnb     short loc_10010CF0

loc_10010C89:
fldz
jmp     short loc_10010CF2

loc_10010C8D:
cmp     dword ptr [ebp+arg_0+4], ecx
jnz     short loc_10010CF7
cmp     dword ptr [ebp+arg_0], edx
jnz     short loc_10010CF7
fld     [ebp+arg_8]
push    ecx
push    ecx
fstp    [esp+14h+var_14] ; double
call    sub_10010CFC
fld     [ebp+arg_8]
fcomp   ds:dbl_100160F8
pop     ecx
pop     ecx
mov     ecx, eax
fnstsw  ax
sahf
jbe     short loc_10010CCB
fld     dbl_100186C8
cmp     ecx, 1
jnz     short loc_10010CC3
fchs

loc_10010CC3:
fstp    [ebp+arg_8]
fld     [ebp+arg_8]
jmp     short loc_10010CF2

loc_10010CCB:
fld     [ebp+arg_8]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
jnb     short loc_10010CF0
cmp     ecx, 1
jnz     short loc_10010CE6
fld     dbl_100186E8
jmp     short loc_10010CE8

loc_10010CE6:
fldz

loc_10010CE8:
fstp    [ebp+arg_8]
fld     [ebp+arg_8]
jmp     short loc_10010CF2

loc_10010CF0:
fld1

loc_10010CF2:
mov     eax, [ebp+arg_10]
fstp    qword ptr [eax]

loc_10010CF7:
mov     eax, esi
pop     esi
leave
retn
sub_10010BCC endp



; Attributes: bp-based frame

; int __cdecl sub_10010CFC(double)
sub_10010CFC proc near

var_10= qword ptr -10h
var_8= qword ptr -8
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
push    ecx
push    ecx
fld     [ebp+arg_0]
push    ecx
push    ecx
fstp    [esp+10h+var_10] ; double
call    sub_100136FD
pop     ecx
test    al, 90h
pop     ecx
jnz     short loc_10010D5D
fld     [ebp+arg_0]
push    ecx
push    ecx
fstp    [esp+10h+var_10] ; double
call    sub_100136EB
fstp    [ebp+var_8]
fld     [ebp+var_8]
fcomp   [ebp+arg_0]
pop     ecx
pop     ecx
fnstsw  ax
sahf
jnz     short loc_10010D5D
fld     [ebp+arg_0]
fdiv    ds:dbl_10016338
push    ecx
push    ecx
fstp    [ebp+arg_0]
fld     [ebp+arg_0]
fstp    [esp+10h+var_10] ; double
call    sub_100136EB
fcomp   [ebp+arg_0]
pop     ecx
pop     ecx
fnstsw  ax
sahf
jnz     short loc_10010D58
push    2
jmp     short loc_10010D5A

loc_10010D58:
push    1

loc_10010D5A:
pop     eax
leave
retn

loc_10010D5D:
xor     eax, eax
leave
retn
sub_10010CFC endp




sub_10010D61 proc near
mov     eax, off_10018380
test    eax, eax
jz      short loc_10010D6C
call    eax ; sub_1000D4EB

loc_10010D6C:
push    offset unk_10018010
push    offset unk_10018008
call    sub_10010E65
push    offset unk_10018004
push    offset unk_10018000
call    sub_10010E65
add     esp, 10h
retn
sub_10010D61 endp




sub_10010D8E proc near

uExitCode= dword ptr  4

push    0               ; int
push    1               ; int
push    [esp+8+uExitCode] ; uExitCode
call    sub_10010DAE
add     esp, 0Ch
retn
sub_10010D8E endp




sub_10010D9F proc near
push    1               ; int
push    0               ; int
push    0               ; uExitCode
call    sub_10010DAE
add     esp, 0Ch
retn
sub_10010D9F endp




; int __cdecl sub_10010DAE(UINT uExitCode, int, int)
sub_10010DAE proc near

uExitCode= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

push    edi
call    sub_10010E53
push    1
pop     edi
cmp     dword_1001B4E0, edi
jnz     short loc_10010DD0
push    [esp+4+uExitCode] ; uExitCode
call    ds:GetCurrentProcess
push    eax             ; hProcess
call    ds:TerminateProcess

loc_10010DD0:
cmp     [esp+4+arg_4], 0
push    ebx
mov     ebx, [esp+8+arg_8]
mov     dword_1001B4DC, edi
mov     byte_1001B4D8, bl
jnz     short loc_10010E24
mov     eax, dword_1001BAF0
test    eax, eax
jz      short loc_10010E13
mov     ecx, dword_1001BAEC
push    esi
lea     esi, [ecx-4]
cmp     esi, eax
jb      short loc_10010E12

loc_10010DFF:
mov     eax, [esi]
test    eax, eax
jz      short loc_10010E07
call    eax

loc_10010E07:
sub     esi, 4
cmp     esi, dword_1001BAF0
jnb     short loc_10010DFF

loc_10010E12:
pop     esi

loc_10010E13:
push    offset unk_10018018
push    offset unk_10018014
call    sub_10010E65
pop     ecx
pop     ecx

loc_10010E24:
push    offset unk_10018020
push    offset unk_1001801C
call    sub_10010E65
pop     ecx
pop     ecx
test    ebx, ebx
pop     ebx
jz      short loc_10010E41
call    sub_10010E5C
pop     edi
retn

loc_10010E41:           ; uExitCode
push    [esp+4+uExitCode]
mov     dword_1001B4E0, edi
call    ds:ExitProcess
sub_10010DAE endp

pop     edi
retn



sub_10010E53 proc near
push    0Dh
call    sub_1001039A
pop     ecx
retn
sub_10010E53 endp




sub_10010E5C proc near
push    0Dh
call    sub_100103FB
pop     ecx
retn
sub_10010E5C endp




sub_10010E65 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    esi
mov     esi, [esp+4+arg_0]

loc_10010E6A:
cmp     esi, [esp+4+arg_4]
jnb     short loc_10010E7D
mov     eax, [esi]
test    eax, eax
jz      short loc_10010E78
call    eax

loc_10010E78:
add     esi, 4
jmp     short loc_10010E6A

loc_10010E7D:
pop     esi
retn
sub_10010E65 endp




sub_10010E7F proc near
push    esi
call    sub_10010305
call    ds:TlsAlloc
cmp     eax, 0FFFFFFFFh
mov     dwTlsIndex, eax
jz      short loc_10010ECF
push    74h
push    1
call    sub_1001378F
mov     esi, eax
pop     ecx
test    esi, esi
pop     ecx
jz      short loc_10010ECF
push    esi             ; lpTlsValue
push    dwTlsIndex      ; dwTlsIndex
call    ds:TlsSetValue
test    eax, eax
jz      short loc_10010ECF
push    esi
call    sub_10010EF1
pop     ecx
call    ds:GetCurrentThreadId
or      dword ptr [esi+4], 0FFFFFFFFh
push    1
mov     [esi], eax
pop     eax
pop     esi
retn

loc_10010ECF:
xor     eax, eax
pop     esi
retn
sub_10010E7F endp




sub_10010ED3 proc near
call    sub_1001032E
mov     eax, dwTlsIndex
cmp     eax, 0FFFFFFFFh
jz      short locret_10010EF0
push    eax             ; dwTlsIndex
call    ds:TlsFree
or      dwTlsIndex, 0FFFFFFFFh

locret_10010EF0:
retn
sub_10010ED3 endp




sub_10010EF1 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
mov     dword ptr [eax+50h], offset unk_1001AC60
mov     dword ptr [eax+14h], 1
retn
sub_10010EF1 endp




sub_10010F04 proc near
push    esi
push    edi
call    ds:GetLastError
push    dwTlsIndex      ; dwTlsIndex
mov     edi, eax
call    ds:TlsGetValue
mov     esi, eax
test    esi, esi
jnz     short loc_10010F5F
push    74h
push    1
call    sub_1001378F
mov     esi, eax
pop     ecx
test    esi, esi
pop     ecx
jz      short loc_10010F57
push    esi             ; lpTlsValue
push    dwTlsIndex      ; dwTlsIndex
call    ds:TlsSetValue
test    eax, eax
jz      short loc_10010F57
push    esi
call    sub_10010EF1
pop     ecx
call    ds:GetCurrentThreadId
or      dword ptr [esi+4], 0FFFFFFFFh
mov     [esi], eax
jmp     short loc_10010F5F

loc_10010F57:           ; NumberOfBytesWritten
push    10h
call    sub_1000E400
pop     ecx

loc_10010F5F:           ; dwErrCode
push    edi
call    ds:SetLastError
mov     eax, esi
pop     edi
pop     esi
retn
sub_10010F04 endp




; int __cdecl sub_10010F6B(LPVOID lpMem)
sub_10010F6B proc near

lpMem= dword ptr  4

mov     eax, dwTlsIndex
cmp     eax, 0FFFFFFFFh
jz      locret_1001100A
push    esi
mov     esi, [esp+4+lpMem]
test    esi, esi
jnz     short loc_10010F8F
push    eax             ; dwTlsIndex
call    ds:TlsGetValue
mov     esi, eax
test    esi, esi
jz      short loc_10010FFB

loc_10010F8F:
mov     eax, [esi+24h]
test    eax, eax
jz      short loc_10010F9D
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010F9D:
mov     eax, [esi+28h]
test    eax, eax
jz      short loc_10010FAB
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010FAB:
mov     eax, [esi+30h]
test    eax, eax
jz      short loc_10010FB9
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010FB9:
mov     eax, [esi+38h]
test    eax, eax
jz      short loc_10010FC7
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010FC7:
mov     eax, [esi+40h]
test    eax, eax
jz      short loc_10010FD5
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010FD5:
mov     eax, [esi+44h]
test    eax, eax
jz      short loc_10010FE3
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010FE3:
mov     eax, [esi+50h]
cmp     eax, offset unk_1001AC60
jz      short loc_10010FF4
push    eax             ; lpMem
call    sub_1000D97B
pop     ecx

loc_10010FF4:           ; lpMem
push    esi
call    sub_1000D97B
pop     ecx

loc_10010FFB:           ; lpTlsValue
push    0
push    dwTlsIndex      ; dwTlsIndex
call    ds:TlsSetValue
pop     esi

locret_1001100A:
retn
sub_10010F6B endp



; Attributes: bp-based frame

sub_1001100B proc near

StartupInfo= _STARTUPINFOA ptr -48h
var_4= dword ptr -4

push    ebp
mov     ebp, esp
sub     esp, 48h
push    ebx
push    esi
push    edi
push    480h
call    sub_1000DA64
mov     esi, eax
pop     ecx
test    esi, esi
jnz     short loc_1001102D
push    1Bh             ; NumberOfBytesWritten
call    sub_1000E400
pop     ecx

loc_1001102D:
mov     dword_1001B9E0, esi
mov     uNumber, 20h
lea     eax, [esi+480h]

loc_10011043:
cmp     esi, eax
jnb     short loc_10011065
and     byte ptr [esi+4], 0
or      dword ptr [esi], 0FFFFFFFFh
and     dword ptr [esi+8], 0
mov     byte ptr [esi+5], 0Ah
mov     eax, dword_1001B9E0
add     esi, 24h
add     eax, 480h
jmp     short loc_10011043

loc_10011065:
lea     eax, [ebp+StartupInfo]
push    eax             ; lpStartupInfo
call    ds:GetStartupInfoA
cmp     [ebp+StartupInfo.cbReserved2], 0
jz      loc_1001114B
mov     eax, [ebp+StartupInfo.lpReserved2]
test    eax, eax
jz      loc_1001114B
mov     edi, [eax]
lea     ebx, [eax+4]
lea     eax, [ebx+edi]
mov     [ebp+var_4], eax
mov     eax, 800h
cmp     edi, eax
jl      short loc_1001109B
mov     edi, eax

loc_1001109B:
cmp     uNumber, edi
jge     short loc_100110F9
mov     esi, offset unk_1001B9E4

loc_100110A8:
push    480h
call    sub_1000DA64
test    eax, eax
pop     ecx
jz      short loc_100110F3
add     uNumber, 20h
mov     [esi], eax
lea     ecx, [eax+480h]

loc_100110C6:
cmp     eax, ecx
jnb     short loc_100110E6
and     byte ptr [eax+4], 0
or      dword ptr [eax], 0FFFFFFFFh
and     dword ptr [eax+8], 0
mov     byte ptr [eax+5], 0Ah
mov     ecx, [esi]
add     eax, 24h
add     ecx, 480h
jmp     short loc_100110C6

loc_100110E6:
add     esi, 4
cmp     uNumber, edi
jl      short loc_100110A8
jmp     short loc_100110F9

loc_100110F3:
mov     edi, uNumber

loc_100110F9:
xor     esi, esi
test    edi, edi
jle     short loc_1001114B

loc_100110FF:
mov     eax, [ebp+var_4]
mov     ecx, [eax]
cmp     ecx, 0FFFFFFFFh
jz      short loc_10011141
mov     al, [ebx]
test    al, 1
jz      short loc_10011141
test    al, 8
jnz     short loc_1001111E
push    ecx             ; hFile
call    ds:GetFileType
test    eax, eax
jz      short loc_10011141

loc_1001111E:
mov     ecx, esi
mov     eax, esi
sar     ecx, 5
and     eax, 1Fh
mov     ecx, dword_1001B9E0[ecx*4]
lea     eax, [eax+eax*8]
lea     eax, [ecx+eax*4]
mov     ecx, [ebp+var_4]
mov     ecx, [ecx]
mov     [eax], ecx
mov     cl, [ebx]
mov     [eax+4], cl

loc_10011141:
add     [ebp+var_4], 4
inc     esi
inc     ebx
cmp     esi, edi
jl      short loc_100110FF

loc_1001114B:
xor     ebx, ebx

loc_1001114D:
mov     ecx, dword_1001B9E0
lea     eax, [ebx+ebx*8]
cmp     dword ptr [ecx+eax*4], 0FFFFFFFFh
lea     esi, [ecx+eax*4]
jnz     short loc_100111AC
test    ebx, ebx
mov     byte ptr [esi+4], 81h
jnz     short loc_1001116C
push    0FFFFFFF6h
pop     eax
jmp     short loc_10011176

loc_1001116C:
mov     eax, ebx
dec     eax
neg     eax
sbb     eax, eax
add     eax, 0FFFFFFF5h

loc_10011176:           ; nStdHandle
push    eax
call    ds:GetStdHandle
mov     edi, eax
cmp     edi, 0FFFFFFFFh
jz      short loc_1001119B
push    edi             ; hFile
call    ds:GetFileType
test    eax, eax
jz      short loc_1001119B
and     eax, 0FFh
mov     [esi], edi
cmp     eax, 2
jnz     short loc_100111A1

loc_1001119B:
or      byte ptr [esi+4], 40h
jmp     short loc_100111B0

loc_100111A1:
cmp     eax, 3
jnz     short loc_100111B0
or      byte ptr [esi+4], 8
jmp     short loc_100111B0

loc_100111AC:
or      byte ptr [esi+4], 80h

loc_100111B0:
inc     ebx
cmp     ebx, 3
jl      short loc_1001114D
push    uNumber         ; uNumber
call    ds:SetHandleCount
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1001100B endp




sub_100111C7 proc near
push    ebx
push    esi
push    edi
mov     esi, offset dword_1001B9E0

loc_100111CF:
mov     eax, [esi]
test    eax, eax
jz      short loc_1001120C
mov     edi, eax
add     eax, 480h
cmp     edi, eax
jnb     short loc_10011201
lea     ebx, [edi+0Ch]

loc_100111E3:
cmp     dword ptr [ebx-4], 0
jz      short loc_100111F0
push    ebx             ; lpCriticalSection
call    ds:DeleteCriticalSection

loc_100111F0:
mov     eax, [esi]
add     edi, 24h
add     eax, 480h
add     ebx, 24h
cmp     edi, eax
jb      short loc_100111E3

loc_10011201:           ; lpMem
push    dword ptr [esi]
call    sub_1000D97B
and     dword ptr [esi], 0
pop     ecx

loc_1001120C:
add     esi, 4
cmp     esi, offset uNumber
jl      short loc_100111CF
pop     edi
pop     esi
pop     ebx
retn
sub_100111C7 endp




sub_1001121B proc near
push    ebx
xor     ebx, ebx
cmp     dword_1001BAE8, ebx
push    esi
push    edi
jnz     short loc_1001122D
call    sub_10013CA4

loc_1001122D:
mov     esi, dword_1001B424
xor     edi, edi

loc_10011235:
mov     al, [esi]
cmp     al, bl
jz      short loc_1001124D
cmp     al, 3Dh
jz      short loc_10011240
inc     edi

loc_10011240:
push    esi
call    sub_1000D900
pop     ecx
lea     esi, [esi+eax+1]
jmp     short loc_10011235

loc_1001124D:
lea     eax, ds:4[edi*4]
push    eax
call    sub_1000DA64
mov     esi, eax
pop     ecx
cmp     esi, ebx
mov     dword_1001B4C0, esi
jnz     short loc_1001126F
push    9               ; NumberOfBytesWritten
call    sub_1000E400
pop     ecx

loc_1001126F:
mov     edi, dword_1001B424
cmp     [edi], bl
jz      short loc_100112B2
push    ebp

loc_1001127A:
push    edi
call    sub_1000D900
mov     ebp, eax
pop     ecx
inc     ebp
cmp     byte ptr [edi], 3Dh
jz      short loc_100112AB
push    ebp
call    sub_1000DA64
cmp     eax, ebx
pop     ecx
mov     [esi], eax
jnz     short loc_1001129E
push    9               ; NumberOfBytesWritten
call    sub_1000E400
pop     ecx

loc_1001129E:
push    edi
push    dword ptr [esi]
call    sub_1000D570
pop     ecx
add     esi, 4
pop     ecx

loc_100112AB:
add     edi, ebp
cmp     [edi], bl
jnz     short loc_1001127A
pop     ebp

loc_100112B2:           ; lpMem
push    dword_1001B424
call    sub_1000D97B
pop     ecx
mov     dword_1001B424, ebx
mov     [esi], ebx
pop     edi
pop     esi
mov     dword_1001BAE4, 1
pop     ebx
retn
sub_1001121B endp



; Attributes: bp-based frame

sub_100112D4 proc near

var_8= dword ptr -8
var_4= dword ptr -4

push    ebp
mov     ebp, esp
push    ecx
push    ecx
push    ebx
xor     ebx, ebx
cmp     dword_1001BAE8, ebx
push    esi
push    edi
jnz     short loc_100112EB
call    sub_10013CA4

loc_100112EB:
mov     esi, offset Filename
push    104h            ; nSize
push    esi             ; lpFilename
push    ebx             ; hModule
call    ds:GetModuleFileNameA
mov     eax, dword_1001BB18
mov     dword_1001B4D0, esi
mov     edi, esi
cmp     [eax], bl
jz      short loc_10011310
mov     edi, eax

loc_10011310:
lea     eax, [ebp+var_8]
push    eax
lea     eax, [ebp+var_4]
push    eax
push    ebx
push    ebx
push    edi
call    sub_1001136D
mov     eax, [ebp+var_8]
mov     ecx, [ebp+var_4]
lea     eax, [eax+ecx*4]
push    eax
call    sub_1000DA64
mov     esi, eax
add     esp, 18h
cmp     esi, ebx
jnz     short loc_10011340
push    8               ; NumberOfBytesWritten
call    sub_1000E400
pop     ecx

loc_10011340:
lea     eax, [ebp+var_8]
push    eax
lea     eax, [ebp+var_4]
push    eax
mov     eax, [ebp+var_4]
lea     eax, [esi+eax*4]
push    eax
push    esi
push    edi
call    sub_1001136D
mov     eax, [ebp+var_4]
add     esp, 14h
dec     eax
mov     dword_1001B4B8, esi
pop     edi
pop     esi
mov     dword_1001B4B4, eax
pop     ebx
leave
retn
sub_100112D4 endp



; Attributes: bp-based frame

sub_1001136D proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h

push    ebp
mov     ebp, esp
mov     ecx, [ebp+arg_10]
mov     eax, [ebp+arg_C]
push    ebx
push    esi
and     dword ptr [ecx], 0
mov     esi, [ebp+arg_8]
push    edi
mov     edi, [ebp+arg_4]
mov     dword ptr [eax], 1
mov     eax, [ebp+arg_0]
test    edi, edi
jz      short loc_10011397
mov     [edi], esi
add     edi, 4
mov     [ebp+arg_4], edi

loc_10011397:
cmp     byte ptr [eax], 22h
jnz     short loc_100113E0

loc_1001139C:
mov     dl, [eax+1]
inc     eax
cmp     dl, 22h
jz      short loc_100113CE
test    dl, dl
jz      short loc_100113CE
movzx   edx, dl
test    byte_1001B8C1[edx], 4
jz      short loc_100113C1
inc     dword ptr [ecx]
test    esi, esi
jz      short loc_100113C1
mov     dl, [eax]
mov     [esi], dl
inc     esi
inc     eax

loc_100113C1:
inc     dword ptr [ecx]
test    esi, esi
jz      short loc_1001139C
mov     dl, [eax]
mov     [esi], dl
inc     esi
jmp     short loc_1001139C

loc_100113CE:
inc     dword ptr [ecx]
test    esi, esi
jz      short loc_100113D8
and     byte ptr [esi], 0
inc     esi

loc_100113D8:
cmp     byte ptr [eax], 22h
jnz     short loc_10011423
inc     eax
jmp     short loc_10011423

loc_100113E0:
inc     dword ptr [ecx]
test    esi, esi
jz      short loc_100113EB
mov     dl, [eax]
mov     [esi], dl
inc     esi

loc_100113EB:
mov     dl, [eax]
inc     eax
movzx   ebx, dl
test    byte_1001B8C1[ebx], 4
jz      short loc_10011406
inc     dword ptr [ecx]
test    esi, esi
jz      short loc_10011405
mov     bl, [eax]
mov     [esi], bl
inc     esi

loc_10011405:
inc     eax

loc_10011406:
cmp     dl, 20h
jz      short loc_10011414
test    dl, dl
jz      short loc_10011418
cmp     dl, 9
jnz     short loc_100113E0

loc_10011414:
test    dl, dl
jnz     short loc_1001141B

loc_10011418:
dec     eax
jmp     short loc_10011423

loc_1001141B:
test    esi, esi
jz      short loc_10011423
and     byte ptr [esi-1], 0

loc_10011423:
and     [ebp+arg_10], 0

loc_10011427:
cmp     byte ptr [eax], 0
jz      loc_10011510

loc_10011430:
mov     dl, [eax]
cmp     dl, 20h
jz      short loc_1001143C
cmp     dl, 9
jnz     short loc_1001143F

loc_1001143C:
inc     eax
jmp     short loc_10011430

loc_1001143F:
cmp     byte ptr [eax], 0
jz      loc_10011510
test    edi, edi
jz      short loc_10011454
mov     [edi], esi
add     edi, 4
mov     [ebp+arg_4], edi

loc_10011454:
mov     edx, [ebp+arg_C]
inc     dword ptr [edx]

loc_10011459:
mov     [ebp+arg_0], 1
xor     ebx, ebx

loc_10011462:
cmp     byte ptr [eax], 5Ch
jnz     short loc_1001146B
inc     eax
inc     ebx
jmp     short loc_10011462

loc_1001146B:
cmp     byte ptr [eax], 22h
jnz     short loc_1001149C
test    bl, 1
jnz     short loc_1001149A
xor     edi, edi
cmp     [ebp+arg_10], edi
jz      short loc_10011489
cmp     byte ptr [eax+1], 22h
lea     edx, [eax+1]
jnz     short loc_10011489
mov     eax, edx
jmp     short loc_1001148C

loc_10011489:
mov     [ebp+arg_0], edi

loc_1001148C:
mov     edi, [ebp+arg_4]
xor     edx, edx
cmp     [ebp+arg_10], edx
setz    dl
mov     [ebp+arg_10], edx

loc_1001149A:
shr     ebx, 1

loc_1001149C:
mov     edx, ebx
dec     ebx
test    edx, edx
jz      short loc_100114B1
inc     ebx

loc_100114A4:
test    esi, esi
jz      short loc_100114AC
mov     byte ptr [esi], 5Ch
inc     esi

loc_100114AC:
inc     dword ptr [ecx]
dec     ebx
jnz     short loc_100114A4

loc_100114B1:
mov     dl, [eax]
test    dl, dl
jz      short loc_10011501
cmp     [ebp+arg_10], 0
jnz     short loc_100114C7
cmp     dl, 20h
jz      short loc_10011501
cmp     dl, 9
jz      short loc_10011501

loc_100114C7:
cmp     [ebp+arg_0], 0
jz      short loc_100114FB
test    esi, esi
jz      short loc_100114EA
movzx   ebx, dl
test    byte_1001B8C1[ebx], 4
jz      short loc_100114E3
mov     [esi], dl
inc     esi
inc     eax
inc     dword ptr [ecx]

loc_100114E3:
mov     dl, [eax]
mov     [esi], dl
inc     esi
jmp     short loc_100114F9

loc_100114EA:
movzx   edx, dl
test    byte_1001B8C1[edx], 4
jz      short loc_100114F9
inc     eax
inc     dword ptr [ecx]

loc_100114F9:
inc     dword ptr [ecx]

loc_100114FB:
inc     eax
jmp     loc_10011459

loc_10011501:
test    esi, esi
jz      short loc_10011509
and     byte ptr [esi], 0
inc     esi

loc_10011509:
inc     dword ptr [ecx]
jmp     loc_10011427

loc_10011510:
test    edi, edi
jz      short loc_10011517
and     dword ptr [edi], 0

loc_10011517:
mov     eax, [ebp+arg_C]
pop     edi
pop     esi
pop     ebx
inc     dword ptr [eax]
pop     ebp
retn
sub_1001136D endp




sub_10011521 proc near

lpMem= dword ptr -8
cchWideChar= dword ptr -4

push    ecx
push    ecx
mov     eax, dword_1001B5E8
push    ebx
push    ebp
mov     ebp, ds:GetEnvironmentStringsW
push    esi
push    edi
xor     ebx, ebx
xor     esi, esi
xor     edi, edi
cmp     eax, ebx
jnz     short loc_1001156F
call    ebp ; GetEnvironmentStringsW
mov     esi, eax
cmp     esi, ebx
jz      short loc_10011550
mov     dword_1001B5E8, 1
jmp     short loc_10011578

loc_10011550:
call    ds:GetEnvironmentStrings
mov     edi, eax
cmp     edi, ebx
jz      loc_1001164A
mov     dword_1001B5E8, 2
jmp     loc_100115FE

loc_1001156F:
cmp     eax, 1
jnz     loc_100115F9

loc_10011578:
cmp     esi, ebx
jnz     short loc_10011588
call    ebp ; GetEnvironmentStringsW
mov     esi, eax
cmp     esi, ebx
jz      loc_1001164A

loc_10011588:
cmp     [esi], bx
mov     eax, esi
jz      short loc_1001159D

loc_1001158F:
inc     eax
inc     eax
cmp     [eax], bx
jnz     short loc_1001158F
inc     eax
inc     eax
cmp     [eax], bx
jnz     short loc_1001158F

loc_1001159D:
sub     eax, esi
mov     edi, ds:WideCharToMultiByte
sar     eax, 1
push    ebx             ; lpUsedDefaultChar
push    ebx             ; lpDefaultChar
inc     eax
push    ebx             ; cbMultiByte
push    ebx             ; lpMultiByteStr
push    eax             ; cchWideChar
push    esi             ; lpWideCharStr
push    ebx             ; dwFlags
push    ebx             ; CodePage
mov     [esp+38h+cchWideChar], eax
call    edi ; WideCharToMultiByte
mov     ebp, eax
cmp     ebp, ebx
jz      short loc_100115EE
push    ebp
call    sub_1000DA64
cmp     eax, ebx
pop     ecx
mov     [esp+18h+lpMem], eax
jz      short loc_100115EE
push    ebx             ; lpUsedDefaultChar
push    ebx             ; lpDefaultChar
push    ebp             ; cbMultiByte
push    eax             ; lpMultiByteStr
push    [esp+28h+cchWideChar] ; cchWideChar
push    esi             ; lpWideCharStr
push    ebx             ; dwFlags
push    ebx             ; CodePage
call    edi ; WideCharToMultiByte
test    eax, eax
jnz     short loc_100115EA
push    [esp+18h+lpMem] ; lpMem
call    sub_1000D97B
pop     ecx
mov     [esp+18h+lpMem], ebx

loc_100115EA:
mov     ebx, [esp+18h+lpMem]

loc_100115EE:           ; LPWCH
push    esi
call    ds:FreeEnvironmentStringsW
mov     eax, ebx
jmp     short loc_1001164C

loc_100115F9:
cmp     eax, 2
jnz     short loc_1001164A

loc_100115FE:
cmp     edi, ebx
jnz     short loc_1001160E
call    ds:GetEnvironmentStrings
mov     edi, eax
cmp     edi, ebx
jz      short loc_1001164A

loc_1001160E:
cmp     [edi], bl
mov     eax, edi
jz      short loc_1001161E

loc_10011614:
inc     eax
cmp     [eax], bl
jnz     short loc_10011614
inc     eax
cmp     [eax], bl
jnz     short loc_10011614

loc_1001161E:
sub     eax, edi
inc     eax
mov     ebp, eax
push    ebp
call    sub_1000DA64
mov     esi, eax
pop     ecx
cmp     esi, ebx
jnz     short loc_10011634
xor     esi, esi
jmp     short loc_1001163F

loc_10011634:
push    ebp
push    edi
push    esi
call    sub_1000DBA0
add     esp, 0Ch

loc_1001163F:           ; LPCH
push    edi
call    ds:FreeEnvironmentStringsA
mov     eax, esi
jmp     short loc_1001164C

loc_1001164A:
xor     eax, eax

loc_1001164C:
pop     edi
pop     esi
pop     ebp
pop     ebx
pop     ecx
pop     ecx
retn
sub_10011521 endp




sub_10011653 proc near
push    1
pop     eax
retn    0Ch
sub_10011653 endp




sub_10011659 proc near
mov     eax, dword_1001B42C
cmp     eax, 1
jz      short loc_10011670
test    eax, eax
jnz     short locret_10011691
cmp     dword_1001B430, 1
jnz     short locret_10011691

loc_10011670:           ; NumberOfBytesWritten
push    0FCh
call    sub_10011692
mov     eax, dword_1001B5EC
pop     ecx
test    eax, eax
jz      short loc_10011686
call    eax ; dword_1001B5EC

loc_10011686:           ; NumberOfBytesWritten
push    0FFh
call    sub_10011692
pop     ecx

locret_10011691:
retn
sub_10011659 endp



; Attributes: bp-based frame

; int __cdecl sub_10011692(DWORD NumberOfBytesWritten)
sub_10011692 proc near

Filename= byte ptr -1A4h
var_A0= byte ptr -0A0h
NumberOfBytesWritten= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 1A4h
mov     edx, [ebp+NumberOfBytesWritten]
xor     ecx, ecx
mov     eax, offset dword_1001A8D0

loc_100116A5:
cmp     edx, [eax]
jz      short loc_100116B4
add     eax, 8
inc     ecx
cmp     eax, offset unk_1001A960
jl      short loc_100116A5

loc_100116B4:
push    esi
mov     esi, ecx
shl     esi, 3
cmp     edx, dword_1001A8D0[esi]
jnz     loc_100117E2
mov     eax, dword_1001B42C
cmp     eax, 1
jz      loc_100117BC
test    eax, eax
jnz     short loc_100116E5
cmp     dword_1001B430, 1
jz      loc_100117BC

loc_100116E5:
cmp     edx, 0FCh
jz      loc_100117E2
lea     eax, [ebp+Filename]
push    104h            ; nSize
push    eax             ; lpFilename
push    0               ; hModule
call    ds:GetModuleFileNameA
test    eax, eax
jnz     short loc_1001171C
lea     eax, [ebp+Filename]
push    offset aProgramNameUnk ; "<program name unknown>"
push    eax
call    sub_1000D570
pop     ecx
pop     ecx

loc_1001171C:
lea     eax, [ebp+Filename]
push    edi
push    eax
lea     edi, [ebp+Filename]
call    sub_1000D900
inc     eax
pop     ecx
cmp     eax, 3Ch
jbe     short loc_1001175F
lea     eax, [ebp+Filename]
push    eax
call    sub_1000D900
mov     edi, eax
lea     eax, [ebp+Filename]
sub     eax, 3Bh
push    3
add     edi, eax
push    offset asc_10016614 ; "..."
push    edi
call    sub_1000D740
add     esp, 10h

loc_1001175F:
lea     eax, [ebp+var_A0]
push    offset aRuntimeErrorPr ; "Runtime Error!\n\nProgram: "
push    eax
call    sub_1000D570
lea     eax, [ebp+var_A0]
push    edi
push    eax
call    sub_1000D580
lea     eax, [ebp+var_A0]
push    offset asc_100165F4 ; "\n\n"
push    eax
call    sub_1000D580
push    off_1001A8D4[esi]
lea     eax, [ebp+var_A0]
push    eax
call    sub_1000D580
push    12010h
lea     eax, [ebp+var_A0]
push    offset aMicrosoftVisua ; "Microsoft Visual C++ Runtime Library"
push    eax
call    sub_10013CC0
add     esp, 2Ch
pop     edi
jmp     short loc_100117E2

loc_100117BC:
lea     eax, [ebp+NumberOfBytesWritten]
lea     esi, off_1001A8D4[esi]
push    0               ; lpOverlapped
push    eax             ; lpNumberOfBytesWritten
push    dword ptr [esi]
call    sub_1000D900
pop     ecx
push    eax             ; nNumberOfBytesToWrite
push    dword ptr [esi] ; lpBuffer
push    0FFFFFFF4h      ; nStdHandle
call    ds:GetStdHandle
push    eax             ; hFile
call    ds:WriteFile

loc_100117E2:
pop     esi
leave
retn
sub_10011692 endp



; Attributes: bp-based frame

sub_100117E5 proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
push    esi
fstcw   word ptr [ebp+var_4]
push    [ebp+var_4]
call    sub_10011830
mov     esi, eax
mov     eax, [ebp+arg_4]
not     eax
and     esi, eax
mov     eax, [ebp+arg_0]
and     eax, [ebp+arg_4]
or      esi, eax
push    esi
call    sub_100118C2
pop     ecx
mov     [ebp+arg_4], eax
pop     ecx
fldcw   word ptr [ebp+arg_4]
mov     eax, esi
pop     esi
leave
retn
sub_100117E5 endp




sub_1001181A proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     eax, [esp+arg_4]
and     eax, 0FFF7FFFFh
push    eax
push    [esp+4+arg_0]
call    sub_100117E5
pop     ecx
pop     ecx
retn
sub_1001181A endp




sub_10011830 proc near

arg_0= dword ptr  4

push    ebx
mov     ebx, [esp+4+arg_0]
xor     eax, eax
push    ebp
test    bl, 1
push    edi
jz      short loc_10011841
push    10h
pop     eax

loc_10011841:
test    bl, 4
jz      short loc_10011848
or      al, 8

loc_10011848:
test    bl, 8
jz      short loc_1001184F
or      al, 4

loc_1001184F:
test    bl, 10h
jz      short loc_10011856
or      al, 2

loc_10011856:
test    bl, 20h
jz      short loc_1001185D
or      al, 1

loc_1001185D:
test    bl, 2
jz      short loc_10011867
or      eax, 80000h

loc_10011867:
movzx   ecx, bx
push    esi
mov     edx, ecx
mov     esi, 0C00h
mov     edi, 300h
and     edx, esi
mov     ebp, 200h
jz      short loc_1001189F
cmp     edx, 400h
jz      short loc_1001189C
cmp     edx, 800h
jz      short loc_10011898
cmp     edx, esi
jnz     short loc_1001189F
or      eax, edi
jmp     short loc_1001189F

loc_10011898:
or      eax, ebp
jmp     short loc_1001189F

loc_1001189C:
or      ah, 1

loc_1001189F:
and     ecx, edi
pop     esi
jz      short loc_100118AF
cmp     ecx, ebp
jnz     short loc_100118B4
or      eax, 10000h
jmp     short loc_100118B4

loc_100118AF:
or      eax, 20000h

loc_100118B4:
pop     edi
pop     ebp
test    bh, 10h
pop     ebx
jz      short locret_100118C1
or      eax, 40000h

locret_100118C1:
retn
sub_10011830 endp




sub_100118C2 proc near

arg_0= dword ptr  4

push    ebx
mov     ebx, [esp+4+arg_0]
xor     eax, eax
push    esi
test    bl, 10h
jz      short loc_100118D2
push    1
pop     eax

loc_100118D2:
test    bl, 8
jz      short loc_100118D9
or      al, 4

loc_100118D9:
test    bl, 4
jz      short loc_100118E0
or      al, 8

loc_100118E0:
test    bl, 2
jz      short loc_100118E7
or      al, 10h

loc_100118E7:
test    bl, 1
jz      short loc_100118EE
or      al, 20h

loc_100118EE:
test    ebx, 80000h
jz      short loc_100118F8
or      al, 2

loc_100118F8:
mov     ecx, ebx
mov     edx, 300h
and     ecx, edx
mov     esi, 200h
jz      short loc_10011925
cmp     ecx, 100h
jz      short loc_10011922
cmp     ecx, esi
jz      short loc_1001191D
cmp     ecx, edx
jnz     short loc_10011925
or      ah, 0Ch
jmp     short loc_10011925

loc_1001191D:
or      ah, 8
jmp     short loc_10011925

loc_10011922:
or      ah, 4

loc_10011925:
mov     ecx, ebx
and     ecx, 30000h
jz      short loc_1001193B
cmp     ecx, 10000h
jnz     short loc_1001193D
or      eax, esi
jmp     short loc_1001193D

loc_1001193B:
or      eax, edx

loc_1001193D:
pop     esi
test    ebx, 40000h
pop     ebx
jz      short locret_1001194A
or      ah, 10h

locret_1001194A:
retn
sub_100118C2 endp




; int __cdecl sub_1001194B(CHAR SrcStr)
sub_1001194B proc near

SrcStr= byte ptr  4

push    ebx
xor     ebx, ebx
cmp     dword_1001B62C, ebx
jnz     short loc_10011969
mov     eax, dword ptr [esp+4+SrcStr]
cmp     eax, 41h
jl      short loc_100119B8
cmp     eax, 5Ah
jg      short loc_100119B8
add     eax, 20h
pop     ebx
retn

loc_10011969:
push    esi
mov     esi, offset Addend
push    edi
push    esi             ; lpAddend
call    ds:InterlockedIncrement
cmp     dword_1001B788, ebx
mov     edi, ds:InterlockedDecrement
jz      short loc_10011993
push    esi             ; lpAddend
call    edi ; InterlockedDecrement
push    13h
call    sub_1001039A
pop     ecx
push    1
pop     ebx

loc_10011993:           ; SrcStr
push    dword ptr [esp+0Ch+SrcStr]
call    sub_100119BA
test    ebx, ebx
pop     ecx
mov     dword ptr [esp+0Ch+SrcStr], eax
jz      short loc_100119AF
push    13h
call    sub_100103FB
pop     ecx
jmp     short loc_100119B2

loc_100119AF:           ; lpAddend
push    esi
call    edi ; InterlockedDecrement

loc_100119B2:
mov     eax, dword ptr [esp+0Ch+SrcStr]
pop     edi
pop     esi

loc_100119B8:
pop     ebx
retn
sub_1001194B endp



; Attributes: bp-based frame

; int __cdecl sub_100119BA(CHAR SrcStr)
sub_100119BA proc near

DestStr= byte ptr -4
var_3= byte ptr -3
SrcStr= byte ptr  8

push    ebp
mov     ebp, esp
push    ecx
cmp     dword_1001B62C, 0
push    ebx
push    esi
push    edi
jnz     short loc_100119E7
mov     eax, dword ptr [ebp+SrcStr]
cmp     eax, 41h
jl      loc_10011A80
cmp     eax, 5Ah
jg      loc_10011A80
add     eax, 20h
jmp     loc_10011A80

loc_100119E7:
mov     ebx, dword ptr [ebp+SrcStr]
mov     edi, 100h
push    1
cmp     ebx, edi
pop     esi
jge     short loc_10011A1B
cmp     dword_100185E0, esi
jle     short loc_10011A09
push    esi             ; int
push    ebx             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_10011A13

loc_10011A09:
mov     eax, off_100183D4
mov     al, [eax+ebx*2]
and     eax, esi

loc_10011A13:
test    eax, eax
jnz     short loc_10011A1B

loc_10011A17:
mov     eax, ebx
jmp     short loc_10011A80

loc_10011A1B:
mov     edx, off_100183D4
mov     eax, ebx
sar     eax, 8
movzx   ecx, al
test    byte ptr [edx+ecx*2+1], 80h
jz      short loc_10011A3F
and     byte ptr [ebp+0Ah], 0
push    2
mov     [ebp+SrcStr], al
mov     [ebp+9], bl
pop     eax
jmp     short loc_10011A48

loc_10011A3F:
and     byte ptr [ebp+9], 0
mov     [ebp+SrcStr], bl
mov     eax, esi

loc_10011A48:           ; int
push    esi
push    0               ; CodePage
lea     ecx, [ebp+DestStr]
push    3               ; cchDest
push    ecx             ; lpDestStr
push    eax             ; cchSrc
lea     eax, [ebp+SrcStr]
push    eax             ; lpSrcStr
push    edi             ; dwMapFlags
push    dword_1001B62C  ; Locale
call    sub_10013D49
add     esp, 20h
test    eax, eax
jz      short loc_10011A17
cmp     eax, esi
jnz     short loc_10011A73
movzx   eax, [ebp+DestStr]
jmp     short loc_10011A80

loc_10011A73:
movzx   eax, [ebp+var_3]
movzx   ecx, [ebp+DestStr]
shl     eax, 8
or      eax, ecx

loc_10011A80:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_100119BA endp




sub_10011A85 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     eax, [esp+arg_4]
push    esi
push    20h
cdq
pop     ecx
idiv    ecx
push    1Fh
mov     esi, eax
mov     eax, [esp+8+arg_4]
cdq
idiv    ecx
pop     ecx
mov     eax, [esp+4+arg_0]
sub     ecx, edx
or      edx, 0FFFFFFFFh
shl     edx, cl
not     edx
test    [eax+esi*4], edx
jnz     short loc_10011ACA
inc     esi
cmp     esi, 3
jge     short loc_10011AC5
lea     eax, [eax+esi*4]

loc_10011AB7:
cmp     dword ptr [eax], 0
jnz     short loc_10011ACA
inc     esi
add     eax, 4
cmp     esi, 3
jl      short loc_10011AB7

loc_10011AC5:
push    1
pop     eax
pop     esi
retn

loc_10011ACA:
xor     eax, eax
pop     esi
retn
sub_10011A85 endp




sub_10011ACE proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     eax, [esp+arg_4]
push    ebx
push    esi
push    edi
push    20h
mov     ebx, [esp+10h+arg_0]
cdq
pop     ecx
idiv    ecx
mov     esi, eax
mov     eax, [esp+0Ch+arg_4]
cdq
idiv    ecx
lea     edi, [ebx+esi*4]
push    edi
push    1Fh
pop     ecx
push    1
pop     eax
sub     ecx, edx
shl     eax, cl
push    eax
push    dword ptr [edi]
call    sub_10013F98
add     esp, 0Ch
dec     esi
js      short loc_10011B20
lea     edi, [ebx+esi*4]

loc_10011B07:
test    eax, eax
jz      short loc_10011B20
push    edi
push    1
push    dword ptr [edi]
call    sub_10013F98
add     esp, 0Ch
dec     esi
sub     edi, 4
test    esi, esi
jge     short loc_10011B07

loc_10011B20:
pop     edi
pop     esi
pop     ebx
retn
sub_10011ACE endp



; Attributes: bp-based frame

sub_10011B24 proc near

var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
push    ecx
mov     eax, [ebp+arg_4]
push    ebx
push    esi
push    edi
lea     edi, [eax-1]
push    20h
pop     ecx
and     [ebp+var_4], 0
lea     ebx, [edi+1]
push    20h
mov     eax, ebx
pop     esi
cdq
idiv    ecx
push    1Fh
mov     ecx, eax
mov     eax, ebx
cdq
idiv    esi
mov     eax, [ebp+arg_0]
pop     esi
push    1
mov     [ebp+var_8], ecx
lea     eax, [eax+ecx*4]
mov     [ebp+arg_4], eax
sub     esi, edx
pop     edx
mov     ecx, esi
shl     edx, cl
test    [eax], edx
jz      short loc_10011B88
inc     ebx
push    ebx
push    [ebp+arg_0]
call    sub_10011A85
pop     ecx
test    eax, eax
pop     ecx
jnz     short loc_10011B85
push    edi
push    [ebp+arg_0]
call    sub_10011ACE
pop     ecx
mov     [ebp+var_4], eax
pop     ecx

loc_10011B85:
mov     eax, [ebp+arg_4]

loc_10011B88:
or      edx, 0FFFFFFFFh
mov     ecx, esi
shl     edx, cl
push    3
pop     ecx
and     [eax], edx
mov     eax, [ebp+var_8]
inc     eax
cmp     eax, ecx
jge     short loc_10011BA8
mov     edx, [ebp+arg_0]
sub     ecx, eax
lea     edi, [edx+eax*4]
xor     eax, eax
rep stosd

loc_10011BA8:
mov     eax, [ebp+var_4]
pop     edi
pop     esi
pop     ebx
leave
retn
sub_10011B24 endp




sub_10011BB0 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     eax, [esp+arg_4]
mov     ecx, [esp+arg_0]
push    esi
push    3
sub     ecx, eax
pop     edx

loc_10011BBE:
mov     esi, [eax]
mov     [ecx+eax], esi
add     eax, 4
dec     edx
jnz     short loc_10011BBE
pop     esi
retn
sub_10011BB0 endp




sub_10011BCB proc near

arg_0= dword ptr  4

push    edi
mov     edi, [esp+4+arg_0]
xor     eax, eax
stosd
stosd
stosd
pop     edi
retn
sub_10011BCB endp




sub_10011BD7 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
xor     ecx, ecx

loc_10011BDD:
cmp     dword ptr [eax], 0
jnz     short loc_10011BEF
inc     ecx
add     eax, 4
cmp     ecx, 3
jl      short loc_10011BDD
push    1
pop     eax
retn

loc_10011BEF:
xor     eax, eax
retn
sub_10011BD7 endp



; Attributes: bp-based frame

sub_10011BF2 proc near

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
mov     eax, [ebp+arg_4]
push    ebx
push    esi
push    edi
push    20h
mov     edi, [ebp+arg_0]
pop     ebx
or      esi, 0FFFFFFFFh
cdq
mov     ecx, ebx
mov     [ebp+var_4], 3
idiv    ecx
mov     [ebp+var_C], eax
mov     eax, [ebp+arg_4]
cdq
idiv    ecx
and     [ebp+arg_4], 0
mov     ecx, edx
shl     esi, cl
sub     ebx, edx
not     esi

loc_10011C28:
mov     eax, [edi]
mov     ecx, eax
and     ecx, esi
mov     [ebp+var_8], ecx
mov     ecx, edx
shr     eax, cl
or      eax, [ebp+arg_4]
mov     [edi], eax
mov     eax, [ebp+var_8]
mov     ecx, ebx
add     edi, 4
shl     eax, cl
dec     [ebp+var_4]
mov     [ebp+arg_4], eax
jnz     short loc_10011C28
mov     edi, [ebp+var_C]
push    2
pop     ebx
mov     esi, edi
push    8
pop     ecx
shl     esi, 2

loc_10011C5A:
cmp     ebx, edi
jl      short loc_10011C6D
mov     edx, [ebp+arg_0]
mov     eax, ecx
sub     eax, esi
mov     eax, [eax+edx]
mov     [ecx+edx], eax
jmp     short loc_10011C74

loc_10011C6D:
mov     eax, [ebp+arg_0]
and     dword ptr [ecx+eax], 0

loc_10011C74:
dec     ebx
sub     ecx, 4
jns     short loc_10011C5A
pop     edi
pop     esi
pop     ebx
leave
retn
sub_10011BF2 endp



; Attributes: bp-based frame

sub_10011C7F proc near

var_18= byte ptr -18h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 18h
mov     eax, [ebp+arg_0]
push    ebx
push    esi
push    edi
movzx   ecx, word ptr [eax+0Ah]
mov     ebx, ecx
and     ecx, 8000h
mov     [ebp+arg_0], ecx
mov     ecx, [eax+6]
mov     [ebp+var_C], ecx
mov     ecx, [eax+2]
movzx   eax, word ptr [eax]
mov     edi, [ebp+arg_8]
and     ebx, 7FFFh
sub     ebx, 3FFFh
mov     [ebp+var_8], ecx
shl     eax, 10h
cmp     ebx, 0FFFFC001h
mov     [ebp+var_4], eax
jnz     short loc_10011CEC
lea     eax, [ebp+var_C]
xor     esi, esi
push    eax
call    sub_10011BD7
test    eax, eax
pop     ecx
jnz     loc_10011DAB
lea     eax, [ebp+var_C]
push    eax
call    sub_10011BCB
pop     ecx

loc_10011CE4:
push    2

loc_10011CE6:
pop     eax
jmp     loc_10011DAD

loc_10011CEC:
lea     eax, [ebp+var_C]
push    eax
lea     eax, [ebp+var_18]
push    eax
call    sub_10011BB0
push    dword ptr [edi+8]
lea     eax, [ebp+var_C]
push    eax
call    sub_10011B24
add     esp, 10h
test    eax, eax
jz      short loc_10011D0D
inc     ebx

loc_10011D0D:
mov     eax, [edi+4]
mov     ecx, eax
sub     ecx, [edi+8]
cmp     ebx, ecx
jge     short loc_10011D25
lea     eax, [ebp+var_C]
push    eax
call    sub_10011BCB
pop     ecx
jmp     short loc_10011D61

loc_10011D25:
cmp     ebx, eax
jg      short loc_10011D68
sub     eax, ebx
mov     esi, eax
lea     eax, [ebp+var_18]
push    eax
lea     eax, [ebp+var_C]
push    eax
call    sub_10011BB0
lea     eax, [ebp+var_C]
push    esi
push    eax
call    sub_10011BF2
push    dword ptr [edi+8]
lea     eax, [ebp+var_C]
push    eax
call    sub_10011B24
mov     eax, [edi+0Ch]
inc     eax
push    eax
lea     eax, [ebp+var_C]
push    eax
call    sub_10011BF2
add     esp, 20h

loc_10011D61:
xor     esi, esi
jmp     loc_10011CE4

loc_10011D68:
cmp     ebx, [edi]
jl      short loc_10011D94
lea     eax, [ebp+var_C]
push    eax
call    sub_10011BCB
push    dword ptr [edi+0Ch]
or      byte ptr [ebp+var_C+3], 80h
lea     eax, [ebp+var_C]
push    eax
call    sub_10011BF2
mov     esi, [edi+14h]
add     esp, 0Ch
add     esi, [edi]
push    1
jmp     loc_10011CE6

loc_10011D94:
push    dword ptr [edi+0Ch]
mov     esi, [edi+14h]
and     byte ptr [ebp+var_C+3], 7Fh
lea     eax, [ebp+var_C]
push    eax
add     esi, ebx
call    sub_10011BF2
pop     ecx
pop     ecx

loc_10011DAB:
xor     eax, eax

loc_10011DAD:
push    1Fh
pop     ecx
sub     ecx, [edi+0Ch]
mov     edi, [edi+10h]
shl     esi, cl
mov     ecx, [ebp+arg_0]
neg     ecx
sbb     ecx, ecx
and     ecx, 80000000h
or      esi, ecx
or      esi, [ebp+var_C]
cmp     edi, 40h
jnz     short loc_10011DDC
mov     ecx, [ebp+arg_4]
mov     edx, [ebp+var_8]
mov     [ecx+4], esi
mov     [ecx], edx
jmp     short loc_10011DE6

loc_10011DDC:
cmp     edi, 20h
jnz     short loc_10011DE6
mov     ecx, [ebp+arg_4]
mov     [ecx], esi

loc_10011DE6:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_10011C7F endp




sub_10011DEB proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    offset unk_1001A960
push    [esp+4+arg_4]
push    [esp+8+arg_0]
call    sub_10011C7F
add     esp, 0Ch
retn
sub_10011DEB endp




sub_10011E01 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    offset unk_1001A978
push    [esp+4+arg_4]
push    [esp+8+arg_0]
call    sub_10011C7F
add     esp, 0Ch
retn
sub_10011E01 endp



; Attributes: bp-based frame

sub_10011E17 proc near

var_C= byte ptr -0Ch
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
xor     eax, eax
push    eax
push    eax
push    eax
push    eax
push    [ebp+arg_4]
lea     eax, [ebp+arg_4]
push    eax
lea     eax, [ebp+var_C]
push    eax
call    sub_10014139
push    [ebp+arg_0]
lea     eax, [ebp+var_C]
push    eax
call    sub_10011DEB
add     esp, 24h
leave
retn
sub_10011E17 endp



; Attributes: bp-based frame

sub_10011E44 proc near

var_C= byte ptr -0Ch
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 0Ch
xor     eax, eax
push    eax
push    eax
push    eax
push    eax
push    [ebp+arg_4]
lea     eax, [ebp+arg_4]
push    eax
lea     eax, [ebp+var_C]
push    eax
call    sub_10014139
push    [ebp+arg_0]
lea     eax, [ebp+var_C]
push    eax
call    sub_10011E01
add     esp, 24h
leave
retn
sub_10011E44 endp



; Attributes: bp-based frame

sub_10011E71 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
mov     edx, [ebp+arg_8]
push    ebx
mov     ebx, [ebp+arg_4]
push    esi
mov     esi, [ebp+arg_0]
mov     ecx, [edx+0Ch]
push    edi
lea     edi, [esi+1]
mov     byte ptr [esi], 30h
test    ebx, ebx
mov     eax, edi
jle     short loc_10011EAE
mov     [ebp+arg_0], ebx
xor     ebx, ebx

loc_10011E94:
mov     dl, [ecx]
test    dl, dl
jz      short loc_10011EA0
movsx   edx, dl
inc     ecx
jmp     short loc_10011EA3

loc_10011EA0:
push    30h
pop     edx

loc_10011EA3:
mov     [eax], dl
inc     eax
dec     [ebp+arg_0]
jnz     short loc_10011E94
mov     edx, [ebp+arg_8]

loc_10011EAE:
and     byte ptr [eax], 0
test    ebx, ebx
jl      short loc_10011EC7
cmp     byte ptr [ecx], 35h
jl      short loc_10011EC7

loc_10011EBA:
dec     eax
cmp     byte ptr [eax], 39h
jnz     short loc_10011EC5
mov     byte ptr [eax], 30h
jmp     short loc_10011EBA

loc_10011EC5:
inc     byte ptr [eax]

loc_10011EC7:
cmp     byte ptr [esi], 31h
jnz     short loc_10011ED1
inc     dword ptr [edx+4]
jmp     short loc_10011EE3

loc_10011ED1:
push    edi
call    sub_1000D900
inc     eax
push    eax
push    edi
push    esi
call    sub_10012060
add     esp, 10h

loc_10011EE3:
pop     edi
pop     esi
pop     ebx
pop     ebp
retn
sub_10011E71 endp



; Attributes: bp-based frame

sub_10011EE8 proc near

var_28= word ptr -28h
var_26= byte ptr -26h
var_24= byte ptr -24h
var_C= byte ptr -0Ch
arg_0= byte ptr  8
arg_8= dword ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
sub     esp, 28h
push    esi
lea     eax, [ebp+arg_0]
push    edi
push    eax
lea     eax, [ebp+var_C]
push    eax
call    sub_10011F44
pop     ecx
lea     eax, [ebp+var_28]
pop     ecx
lea     esi, [ebp+var_C]
push    eax
push    0
push    11h
sub     esp, 0Ch
mov     edi, esp
movsd
movsd
movsw
call    sub_1001460A
mov     esi, [ebp+arg_8]
mov     edi, [ebp+arg_C]
mov     [esi+8], eax
movsx   eax, [ebp+var_26]
mov     [esi], eax
movsx   eax, [ebp+var_28]
mov     [esi+4], eax
lea     eax, [ebp+var_24]
push    eax
push    edi
call    sub_1000D570
add     esp, 20h
mov     [esi+0Ch], edi
mov     eax, esi
pop     edi
pop     esi
leave
retn
sub_10011EE8 endp



; Attributes: bp-based frame

sub_10011F44 proc near

var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    ecx
mov     edx, [ebp+arg_4]
push    ebx
push    esi
push    edi
mov     ax, [edx+6]
mov     edi, 7FFh
mov     ecx, eax
and     eax, 8000h
shr     ecx, 4
and     ecx, edi
mov     [ebp+arg_4], eax
mov     eax, [edx+4]
mov     edx, [edx]
movzx   ebx, cx
mov     esi, 80000000h
and     eax, 0FFFFFh
test    ebx, ebx
mov     [ebp+var_4], esi
jz      short loc_10011F92
cmp     ebx, edi
jz      short loc_10011F8B
lea     edi, [ecx+3C00h]
jmp     short loc_10011FB3

loc_10011F8B:
mov     edi, 7FFFh
jmp     short loc_10011FB3

loc_10011F92:
xor     ebx, ebx
cmp     eax, ebx
jnz     short loc_10011FAA
cmp     edx, ebx
jnz     short loc_10011FAA
mov     eax, [ebp+arg_0]
mov     [eax+4], ebx
mov     [eax], ebx
mov     [eax+8], bx
jmp     short loc_10011FF5

loc_10011FAA:
lea     edi, [ecx+3C01h]
mov     [ebp+var_4], ebx

loc_10011FB3:
mov     ecx, edx
shr     ecx, 15h
shl     eax, 0Bh
or      ecx, eax
mov     eax, [ebp+arg_0]
or      ecx, [ebp+var_4]
shl     edx, 0Bh
mov     [eax+4], ecx
mov     [eax], edx

loc_10011FCB:
test    esi, ecx
jnz     short loc_10011FEC
mov     edx, [eax]
add     ecx, ecx
mov     ebx, edx
shr     ebx, 1Fh
or      ebx, ecx
lea     ecx, [edx+edx]
mov     [eax], ecx
mov     [eax+4], ebx
add     edi, 0FFFFh
mov     ecx, ebx
jmp     short loc_10011FCB

loc_10011FEC:
mov     ecx, [ebp+arg_4]
or      ecx, edi
mov     [eax+8], cx

loc_10011FF5:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_10011F44 endp

align 10h



sub_10012000 proc near

arg_0= dword ptr  4
arg_4= byte ptr  8
arg_8= dword ptr  0Ch

mov     edx, [esp+arg_8]
mov     ecx, [esp+arg_0]
test    edx, edx
jz      short loc_10012053
xor     eax, eax
mov     al, [esp+arg_4]
push    edi
mov     edi, ecx
cmp     edx, 4
jb      short loc_10012047
neg     ecx
and     ecx, 3
jz      short loc_10012029
sub     edx, ecx

loc_10012023:
mov     [edi], al
inc     edi
dec     ecx
jnz     short loc_10012023

loc_10012029:
mov     ecx, eax
shl     eax, 8
add     eax, ecx
mov     ecx, eax
shl     eax, 10h
add     eax, ecx
mov     ecx, edx
and     edx, 3
shr     ecx, 2
jz      short loc_10012047
rep stosd
test    edx, edx
jz      short loc_1001204D

loc_10012047:
mov     [edi], al
inc     edi
dec     edx
jnz     short loc_10012047

loc_1001204D:
mov     eax, [esp+4+arg_0]
pop     edi
retn

loc_10012053:
mov     eax, [esp+arg_0]
retn
sub_10012000 endp

align 10h


; Attributes: bp-based frame

sub_10012060 proc near

arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    edi
push    esi
mov     esi, [ebp+arg_4]
mov     ecx, [ebp+arg_8]
mov     edi, [ebp+arg_0]
mov     eax, ecx
mov     edx, ecx
add     eax, esi
cmp     edi, esi
jbe     short loc_10012080
cmp     edi, eax
jb      loc_100121F8

loc_10012080:
test    edi, 3
jnz     short loc_1001209C
shr     ecx, 2
and     edx, 3
cmp     ecx, 8          ; switch 8 cases
jb      short loc_100120BC
rep movsd               ; jumptable 100120BC default case
jmp     ds:off_100121A8[edx*4]

loc_1001209C:
mov     eax, edi
mov     edx, 3
sub     ecx, 4
jb      short loc_100120B4
and     eax, 3
add     ecx, eax
jmp     dword ptr ds:(loc_100120BC+4)[eax*4]

loc_100120B4:
jmp     dword ptr ds:loc_100121B8[ecx*4]
align 4

loc_100120BC:           ; switch jump
jmp     ds:off_1001213C[ecx*4]
align 4
dd offset loc_100120D0
dd offset loc_100120FC
dd offset loc_10012120

loc_100120D0:
and     edx, ecx
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
mov     [edi+1], al
mov     al, [esi+2]
shr     ecx, 2
mov     [edi+2], al
add     esi, 3
add     edi, 3
cmp     ecx, 8
jb      short loc_100120BC
rep movsd
jmp     ds:off_100121A8[edx*4]
align 4

loc_100120FC:
and     edx, ecx
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
shr     ecx, 2
mov     [edi+1], al
add     esi, 2
add     edi, 2
cmp     ecx, 8
jb      short loc_100120BC
rep movsd
jmp     ds:off_100121A8[edx*4]
align 10h

loc_10012120:
and     edx, ecx
mov     al, [esi]
mov     [edi], al
inc     esi
shr     ecx, 2
inc     edi
cmp     ecx, 8
jb      short loc_100120BC
rep movsd
jmp     ds:off_100121A8[edx*4]
align 4
off_1001213C dd offset loc_1001219F ; jump table for switch statement
dd offset loc_1001218C
dd offset loc_10012184
dd offset loc_1001217C
dd offset loc_10012174
dd offset loc_1001216C
dd offset loc_10012164
dd offset loc_1001215C

loc_1001215C:           ; jumptable 100120BC case 7
mov     eax, [esi+ecx*4-1Ch]
mov     [edi+ecx*4-1Ch], eax

loc_10012164:           ; jumptable 100120BC case 6
mov     eax, [esi+ecx*4-18h]
mov     [edi+ecx*4-18h], eax

loc_1001216C:           ; jumptable 100120BC case 5
mov     eax, [esi+ecx*4-14h]
mov     [edi+ecx*4-14h], eax

loc_10012174:           ; jumptable 100120BC case 4
mov     eax, [esi+ecx*4-10h]
mov     [edi+ecx*4-10h], eax

loc_1001217C:           ; jumptable 100120BC case 3
mov     eax, [esi+ecx*4-0Ch]
mov     [edi+ecx*4-0Ch], eax

loc_10012184:           ; jumptable 100120BC case 2
mov     eax, [esi+ecx*4-8]
mov     [edi+ecx*4-8], eax

loc_1001218C:           ; jumptable 100120BC case 1
mov     eax, [esi+ecx*4-4]
mov     [edi+ecx*4-4], eax
lea     eax, ds:0[ecx*4]
add     esi, eax
add     edi, eax

loc_1001219F:           ; jumptable 100120BC case 0
jmp     ds:off_100121A8[edx*4]
align 4
off_100121A8 dd offset loc_100121B8
dd offset loc_100121C0
dd offset loc_100121CC
dd offset loc_100121E0

loc_100121B8:
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 10h

loc_100121C0:
mov     al, [esi]
mov     [edi], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_100121CC:
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
mov     [edi+1], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 10h

loc_100121E0:
mov     al, [esi]
mov     [edi], al
mov     al, [esi+1]
mov     [edi+1], al
mov     al, [esi+2]
mov     [edi+2], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_100121F8:
lea     esi, [ecx+esi-4]
lea     edi, [ecx+edi-4]
test    edi, 3
jnz     short loc_1001222C
shr     ecx, 2
and     edx, 3
cmp     ecx, 8
jb      short loc_10012220
std
rep movsd
cld
jmp     ds:off_10012340[edx*4] ; jumptable 10012244 case 0
align 10h

loc_10012220:
neg     ecx
jmp     ds:off_100122F0[ecx*4]
align 4

loc_1001222C:
mov     eax, edi
mov     edx, 3
cmp     ecx, 4          ; switch 4 cases
jb      short loc_10012244
and     eax, 3          ; jumptable 10012244 default case
sub     ecx, eax
jmp     dword ptr ds:(loc_10012244+4)[eax*4]

loc_10012244:           ; switch jump
jmp     ds:off_10012340[ecx*4]
align 4
dd offset loc_10012258
dd offset loc_10012278
dd offset loc_100122A0

loc_10012258:
mov     al, [esi+3]
and     edx, ecx
mov     [edi+3], al
dec     esi
shr     ecx, 2
dec     edi
cmp     ecx, 8
jb      short loc_10012220
std
rep movsd
cld
jmp     ds:off_10012340[edx*4] ; jumptable 10012244 case 0
align 4

loc_10012278:
mov     al, [esi+3]
and     edx, ecx
mov     [edi+3], al
mov     al, [esi+2]
shr     ecx, 2
mov     [edi+2], al
sub     esi, 2
sub     edi, 2
cmp     ecx, 8
jb      short loc_10012220
std
rep movsd
cld
jmp     ds:off_10012340[edx*4] ; jumptable 10012244 case 0
align 10h

loc_100122A0:
mov     al, [esi+3]
and     edx, ecx
mov     [edi+3], al
mov     al, [esi+2]
mov     [edi+2], al
mov     al, [esi+1]
shr     ecx, 2
mov     [edi+1], al
sub     esi, 3
sub     edi, 3
cmp     ecx, 8
jb      loc_10012220
std
rep movsd
cld
jmp     ds:off_10012340[edx*4] ; jumptable 10012244 case 0
align 4
dd offset loc_100122F4
dd offset loc_100122FC
dd offset loc_10012304
dd offset loc_1001230C
dd offset loc_10012314
dd offset loc_1001231C
dd offset loc_10012324
off_100122F0 dd offset loc_10012337

loc_100122F4:
mov     eax, [esi+ecx*4+1Ch]
mov     [edi+ecx*4+1Ch], eax

loc_100122FC:
mov     eax, [esi+ecx*4+18h]
mov     [edi+ecx*4+18h], eax

loc_10012304:
mov     eax, [esi+ecx*4+14h]
mov     [edi+ecx*4+14h], eax

loc_1001230C:
mov     eax, [esi+ecx*4+10h]
mov     [edi+ecx*4+10h], eax

loc_10012314:
mov     eax, [esi+ecx*4+0Ch]
mov     [edi+ecx*4+0Ch], eax

loc_1001231C:
mov     eax, [esi+ecx*4+8]
mov     [edi+ecx*4+8], eax

loc_10012324:
mov     eax, [esi+ecx*4+4]
mov     [edi+ecx*4+4], eax
lea     eax, ds:0[ecx*4]
add     esi, eax
add     edi, eax

loc_10012337:           ; jumptable 10012244 case 0
jmp     ds:off_10012340[edx*4]
align 10h
off_10012340 dd offset loc_10012350 ; jump table for switch statement
dd offset loc_10012358  ; jumptable 10012244 case 1
dd offset loc_10012368  ; jumptable 10012244 case 2
dd offset loc_1001237C  ; jumptable 10012244 case 3

loc_10012350:           ; jumptable 10012244 case 0
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_10012358:           ; jumptable 10012244 case 1
mov     al, [esi+3]
mov     [edi+3], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_10012368:           ; jumptable 10012244 case 2
mov     al, [esi+3]
mov     [edi+3], al
mov     al, [esi+2]
mov     [edi+2], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
align 4

loc_1001237C:           ; jumptable 10012244 case 3
mov     al, [esi+3]
mov     [edi+3], al
mov     al, [esi+2]
mov     [edi+2], al
mov     al, [esi+1]
mov     [edi+1], al
mov     eax, [ebp+arg_0]
pop     esi
pop     edi
leave
retn
sub_10012060 endp




sub_10012395 proc near
push    2               ; NumberOfBytesWritten
call    sub_1000E400
pop     ecx
retn
sub_10012395 endp



; Attributes: bp-based frame

; int __cdecl sub_1001239E(DWORD dwInfoType, LPCSTR lpSrcStr, int cchSrc, LPWORD lpCharType, UINT CodePage, LCID Locale, int)
sub_1001239E proc near

var_24= dword ptr -24h
cchWideChar= dword ptr -20h
CharType= word ptr -1Ch
ms_exc= CPPEH_RECORD ptr -18h
dwInfoType= dword ptr  8
lpSrcStr= dword ptr  0Ch
cchSrc= dword ptr  10h
lpCharType= dword ptr  14h
CodePage= dword ptr  18h
Locale= dword ptr  1Ch
arg_18= dword ptr  20h

push    ebp
mov     ebp, esp
push    0FFFFFFFFh
push    offset stru_10016638
push    offset sub_10010508
mov     eax, large fs:0
push    eax
mov     large fs:0, esp
sub     esp, 18h
push    ebx
push    esi
push    edi
mov     [ebp+ms_exc.old_esp], esp
mov     eax, dword_1001B5F0
xor     ebx, ebx
cmp     eax, ebx
jnz     short loc_1001240D
lea     eax, [ebp+CharType]
push    eax             ; lpCharType
push    1
pop     esi
push    esi             ; cchSrc
push    offset SrcStr   ; lpSrcStr
push    esi             ; dwInfoType
call    ds:GetStringTypeW
test    eax, eax
jz      short loc_100123EB
mov     eax, esi
jmp     short loc_10012408

loc_100123EB:
lea     eax, [ebp+CharType]
push    eax             ; lpCharType
push    esi             ; cchSrc
push    offset byte_10016630 ; lpSrcStr
push    esi             ; dwInfoType
push    ebx             ; Locale
call    ds:GetStringTypeA
test    eax, eax
jz      loc_100124D3
push    2
pop     eax

loc_10012408:
mov     dword_1001B5F0, eax

loc_1001240D:
cmp     eax, 2
jnz     short loc_10012436
mov     eax, [ebp+Locale]
cmp     eax, ebx
jnz     short loc_1001241E
mov     eax, dword_1001B62C

loc_1001241E:           ; lpCharType
push    [ebp+lpCharType]
push    [ebp+cchSrc]    ; cchSrc
push    [ebp+lpSrcStr]  ; lpSrcStr
push    [ebp+dwInfoType] ; dwInfoType
push    eax             ; Locale
call    ds:GetStringTypeA
jmp     loc_100124D5

loc_10012436:
cmp     eax, 1
jnz     loc_100124D3
cmp     [ebp+CodePage], ebx
jnz     short loc_1001244C
mov     eax, dword_1001B63C
mov     [ebp+CodePage], eax

loc_1001244C:           ; cchWideChar
push    ebx
push    ebx             ; lpWideCharStr
push    [ebp+cchSrc]    ; cbMultiByte
push    [ebp+lpSrcStr]  ; lpMultiByteStr
mov     eax, [ebp+arg_18]
neg     eax
sbb     eax, eax
and     eax, 8
inc     eax
push    eax             ; dwFlags
push    [ebp+CodePage]  ; CodePage
call    ds:MultiByteToWideChar
mov     [ebp+cchWideChar], eax
cmp     eax, ebx
jz      short loc_100124D3
mov     [ebp+ms_exc.registration.TryLevel], ebx
lea     edi, [eax+eax]
mov     eax, edi
add     eax, 3
and     al, 0FCh
call    __alloca_probe
mov     [ebp+ms_exc.old_esp], esp
mov     esi, esp
mov     [ebp+var_24], esi
push    edi
push    ebx
push    esi
call    sub_10012000
add     esp, 0Ch
jmp     short loc_100124A2

loc_10012497:
push    1
pop     eax
retn

loc_1001249B:
mov     esp, [ebp+ms_exc.old_esp]
xor     ebx, ebx
xor     esi, esi

loc_100124A2:
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
cmp     esi, ebx
jz      short loc_100124D3
push    [ebp+cchWideChar] ; cchWideChar
push    esi             ; lpWideCharStr
push    [ebp+cchSrc]    ; cbMultiByte
push    [ebp+lpSrcStr]  ; lpMultiByteStr
push    1               ; dwFlags
push    [ebp+CodePage]  ; CodePage
call    ds:MultiByteToWideChar
cmp     eax, ebx
jz      short loc_100124D3
push    [ebp+lpCharType] ; lpCharType
push    eax             ; cchSrc
push    esi             ; lpSrcStr
push    [ebp+dwInfoType] ; dwInfoType
call    ds:GetStringTypeW
jmp     short loc_100124D5

loc_100124D3:
xor     eax, eax

loc_100124D5:
lea     esp, [ebp-34h]
mov     ecx, [ebp+ms_exc.registration.Next]
mov     large fs:0, ecx
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1001239E endp




sub_100124E7 proc near
call    sub_10010F04
add     eax, 8
retn
sub_100124E7 endp




sub_100124F0 proc near
xor     eax, eax
retn
sub_100124F0 endp




sub_100124F3 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

push    0
push    [esp+4+arg_8]
push    [esp+8+arg_4]
push    [esp+0Ch+arg_0]
call    sub_1001250A
add     esp, 10h
retn
sub_100124F3 endp



; Attributes: bp-based frame

sub_1001250A proc near

var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h

push    ebp
mov     ebp, esp
sub     esp, 0Ch
push    ebx
and     [ebp+var_8], 0
push    esi
push    edi
mov     edi, [ebp+arg_0]
mov     bl, [edi]
lea     esi, [edi+1]
mov     [ebp+var_4], esi

loc_10012522:
cmp     dword_100185E0, 1
jle     short loc_1001253A
movzx   eax, bl
push    8               ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_10012549

loc_1001253A:
mov     ecx, off_100183D4
movzx   eax, bl
mov     al, [ecx+eax*2]
and     eax, 8

loc_10012549:
test    eax, eax
jz      short loc_10012552
mov     bl, [esi]
inc     esi
jmp     short loc_10012522

loc_10012552:
cmp     bl, 2Dh
mov     [ebp+var_4], esi
jnz     short loc_10012560
or      [ebp+arg_C], 2
jmp     short loc_10012565

loc_10012560:
cmp     bl, 2Bh
jnz     short loc_1001256B

loc_10012565:
mov     bl, [esi]
inc     esi
mov     [ebp+var_4], esi

loc_1001256B:
mov     eax, [ebp+arg_8]
test    eax, eax
jl      loc_100126FF
cmp     eax, 1
jz      loc_100126FF
cmp     eax, 24h
jg      loc_100126FF
push    10h
test    eax, eax
pop     ecx
jnz     short loc_100125B3
cmp     bl, 30h
jz      short loc_1001259D
mov     [ebp+arg_8], 0Ah
jmp     short loc_100125CF

loc_1001259D:
mov     al, [esi]
cmp     al, 78h
jz      short loc_100125B0
cmp     al, 58h
jz      short loc_100125B0
mov     [ebp+arg_8], 8
jmp     short loc_100125CF

loc_100125B0:
mov     [ebp+arg_8], ecx

loc_100125B3:
cmp     [ebp+arg_8], ecx
jnz     short loc_100125CF
cmp     bl, 30h
jnz     short loc_100125CF
mov     al, [esi]
cmp     al, 78h
jz      short loc_100125C7
cmp     al, 58h
jnz     short loc_100125CF

loc_100125C7:
mov     bl, [esi+1]
inc     esi
inc     esi
mov     [ebp+var_4], esi

loc_100125CF:
or      eax, 0FFFFFFFFh
xor     edx, edx
div     [ebp+arg_8]
mov     edi, 103h
mov     [ebp+var_C], eax

loc_100125DF:
cmp     dword_100185E0, 1
movzx   esi, bl
jle     short loc_100125F7
push    4               ; int
push    esi             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_10012602

loc_100125F7:
mov     eax, off_100183D4
mov     al, [eax+esi*2]
and     eax, 4

loc_10012602:
test    eax, eax
jz      short loc_1001260E
movsx   ecx, bl
sub     ecx, 30h
jmp     short loc_10012640

loc_1001260E:
cmp     dword_100185E0, 1
jle     short loc_10012622
push    edi             ; int
push    esi             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_1001262D

loc_10012622:
mov     eax, off_100183D4
mov     ax, [eax+esi*2]
and     eax, edi

loc_1001262D:
test    eax, eax
jz      short loc_1001267B
movsx   eax, bl
push    eax             ; SrcStr
call    sub_1001489D
pop     ecx
mov     ecx, eax
sub     ecx, 37h

loc_10012640:
cmp     ecx, [ebp+arg_8]
jnb     short loc_1001267B
mov     esi, [ebp+var_8]
or      [ebp+arg_C], 8
cmp     esi, [ebp+var_C]
jb      short loc_10012665
jnz     short loc_1001265F
or      eax, 0FFFFFFFFh
xor     edx, edx
div     [ebp+arg_8]
cmp     ecx, edx
jbe     short loc_10012665

loc_1001265F:
or      [ebp+arg_C], 4
jmp     short loc_1001266E

loc_10012665:
imul    esi, [ebp+arg_8]
add     esi, ecx
mov     [ebp+var_8], esi

loc_1001266E:
mov     eax, [ebp+var_4]
inc     [ebp+var_4]
mov     bl, [eax]
jmp     loc_100125DF

loc_1001267B:
mov     eax, [ebp+arg_C]
dec     [ebp+var_4]
mov     ebx, [ebp+arg_4]
test    al, 8
jnz     short loc_10012698
test    ebx, ebx
jz      short loc_10012692
mov     eax, [ebp+arg_0]
mov     [ebp+var_4], eax

loc_10012692:
and     [ebp+var_8], 0
jmp     short loc_100126E3

loc_10012698:
test    al, 4
mov     esi, 7FFFFFFFh
jnz     short loc_100126BC
test    al, 1
jnz     short loc_100126E3
and     eax, 2
jz      short loc_100126B3
cmp     [ebp+var_8], 80000000h
ja      short loc_100126BC

loc_100126B3:
test    eax, eax
jnz     short loc_100126E3
cmp     [ebp+var_8], esi
jbe     short loc_100126E3

loc_100126BC:
call    sub_100124E7
test    byte ptr [ebp+arg_C], 1
mov     dword ptr [eax], 22h
jz      short loc_100126D3
or      [ebp+var_8], 0FFFFFFFFh
jmp     short loc_100126E3

loc_100126D3:
mov     eax, [ebp+arg_C]
and     al, 2
neg     al
sbb     eax, eax
neg     eax
add     eax, esi
mov     [ebp+var_8], eax

loc_100126E3:
test    ebx, ebx
jz      short loc_100126EC
mov     eax, [ebp+var_4]
mov     [ebx], eax

loc_100126EC:
test    byte ptr [ebp+arg_C], 2
jz      short loc_100126FA
mov     eax, [ebp+var_8]
neg     eax
mov     [ebp+var_8], eax

loc_100126FA:
mov     eax, [ebp+var_8]
jmp     short loc_1001270A

loc_100126FF:
mov     eax, [ebp+arg_4]
test    eax, eax
jz      short loc_10012708
mov     [eax], edi

loc_10012708:
xor     eax, eax

loc_1001270A:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1001250A endp

align 10h
; START OF FUNCTION CHUNK FOR sub_10012720

loc_10012710:
lea     eax, [edx-1]
pop     ebx
retn
; END OF FUNCTION CHUNK FOR sub_10012720
align 10h



sub_10012720 proc near

arg_0= dword ptr  4
arg_4= byte ptr  8

; FUNCTION CHUNK AT 10012710 SIZE 00000005 BYTES

xor     eax, eax
mov     al, [esp+arg_4]

loc_10012726:
push    ebx
mov     ebx, eax
shl     eax, 8
mov     edx, [esp+4+arg_0]
test    edx, 3
jz      short loc_1001274B

loc_10012738:
mov     cl, [edx]
inc     edx
cmp     cl, bl
jz      short loc_10012710
test    cl, cl
jz      short loc_10012794
test    edx, 3
jnz     short loc_10012738

loc_1001274B:
or      ebx, eax
push    edi
mov     eax, ebx
shl     ebx, 10h
push    esi
or      ebx, eax

loc_10012756:
mov     ecx, [edx]
mov     edi, 7EFEFEFFh
mov     eax, ecx
mov     esi, edi
xor     ecx, ebx
add     esi, eax
add     edi, ecx
xor     ecx, 0FFFFFFFFh
xor     eax, 0FFFFFFFFh
xor     ecx, edi
xor     eax, esi
add     edx, 4
and     ecx, 81010100h
jnz     short loc_10012798
and     eax, 81010100h
jz      short loc_10012756
and     eax, 1010100h
jnz     short loc_10012792
and     esi, 80000000h
jnz     short loc_10012756

loc_10012792:
pop     esi
pop     edi

loc_10012794:
pop     ebx
xor     eax, eax
retn

loc_10012798:
mov     eax, [edx-4]
cmp     al, bl
jz      short loc_100127D5
test    al, al
jz      short loc_10012792
cmp     ah, bl
jz      short loc_100127CE
test    ah, ah
jz      short loc_10012792
shr     eax, 10h
cmp     al, bl
jz      short loc_100127C7
test    al, al
jz      short loc_10012792
cmp     ah, bl
jz      short loc_100127C0
test    ah, ah
jz      short loc_10012792
jmp     short loc_10012756

loc_100127C0:
pop     esi
pop     edi
lea     eax, [edx-1]
pop     ebx
retn

loc_100127C7:
lea     eax, [edx-2]
pop     esi
pop     edi
pop     ebx
retn

loc_100127CE:
lea     eax, [edx-3]
pop     esi
pop     edi
pop     ebx
retn

loc_100127D5:
lea     eax, [edx-4]
pop     esi
pop     edi
pop     ebx
retn
sub_10012720 endp

align 10h



sub_100127E0 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     ecx, [esp+arg_4]
push    edi
push    ebx
push    esi
mov     dl, [ecx]
mov     edi, [esp+0Ch+arg_0]
test    dl, dl
jz      short loc_1001285A
mov     dh, [ecx+1]
test    dh, dh
jz      short loc_10012847

loc_100127F8:
mov     esi, edi
mov     ecx, [esp+0Ch+arg_4]
mov     al, [edi]
inc     esi
cmp     al, dl
jz      short loc_1001281A
test    al, al
jz      short loc_10012814

loc_10012809:
mov     al, [esi]
inc     esi

loc_1001280C:
cmp     al, dl
jz      short loc_1001281A
test    al, al
jnz     short loc_10012809

loc_10012814:
pop     esi
pop     ebx
pop     edi
xor     eax, eax
retn

loc_1001281A:
mov     al, [esi]
inc     esi
cmp     al, dh
jnz     short loc_1001280C
lea     edi, [esi-1]

loc_10012824:
mov     ah, [ecx+2]
test    ah, ah
jz      short loc_10012853
mov     al, [esi]
add     esi, 2
cmp     al, ah
jnz     short loc_100127F8
mov     al, [ecx+3]
test    al, al
jz      short loc_10012853
mov     ah, [esi-1]
add     ecx, 2
cmp     al, ah
jz      short loc_10012824
jmp     short loc_100127F8

loc_10012847:
xor     eax, eax
pop     esi
pop     ebx
pop     edi
mov     al, dl
jmp     loc_10012726

loc_10012853:
lea     eax, [edi-1]
pop     esi
pop     ebx
pop     edi
retn

loc_1001285A:
mov     eax, edi
pop     esi
pop     ebx
pop     edi
retn
sub_100127E0 endp

; [0000002F BYTES: COLLAPSED FUNCTION __alloca_probe. PRESS CTRL-NUMPAD+ TO EXPAND]
align 10h



; int __cdecl sub_10012890(_TBYTE, _TBYTE, int, int)
sub_10012890 proc near

arg_0= tbyte ptr  4
arg_C= tbyte ptr  10h
arg_18= dword ptr  1Ch
arg_1C= dword ptr  20h

fld     [esp+arg_C]
fld     [esp+arg_0]

loc_10012898:
mov     eax, dword ptr [esp+arg_0+4]
add     eax, eax
jnb     loc_1001292A
xor     eax, 0E000000h
test    eax, 0E000000h
jz      short loc_100128B3
fdivp   st(1), st
retn

loc_100128B3:
shr     eax, 1Ch
cmp     byte_1001AB00[eax], 0
jnz     short loc_100128C2
fdivp   st(1), st
retn

loc_100128C2:
mov     eax, dword ptr [esp+arg_0+8]
and     eax, 7FFFh
jz      short loc_10012934
cmp     eax, 7FFFh
jz      short loc_10012934
fnstcw  word ptr [esp+arg_18]
mov     eax, [esp+arg_18]
or      eax, 33Fh
and     eax, 0F3FFh
mov     [esp+arg_1C], eax
fldcw   word ptr [esp+arg_1C]
mov     eax, dword ptr [esp+arg_C+8]
and     eax, 7FFFh
cmp     eax, 1
jz      short loc_10012913
fmul    flt_1001AB10
fxch    st(1)
fmul    flt_1001AB10
fxch    st(1)
fldcw   word ptr [esp+arg_18]
fdivp   st(1), st
retn

loc_10012913:
fmul    flt_1001AB14
fxch    st(1)
fmul    flt_1001AB14
fxch    st(1)
fldcw   word ptr [esp+arg_18]
fdivp   st(1), st
retn

loc_1001292A:
mov     eax, dword ptr [esp+arg_0]
or      eax, dword ptr [esp+arg_0+4]
jnz     short loc_10012937

loc_10012934:
fdivp   st(1), st
retn

loc_10012937:
mov     eax, dword ptr [esp+arg_0+8]
and     eax, 7FFFh
jnz     short loc_10012934
fnstcw  word ptr [esp+arg_18]
mov     eax, [esp+arg_18]
or      eax, 33Fh
and     eax, 0F3FFh
mov     [esp+arg_1C], eax
fldcw   word ptr [esp+arg_1C]
mov     eax, dword ptr [esp+arg_C+8]
and     eax, 7FFFh
jz      short loc_10012978
cmp     eax, 7FFFh
jz      short loc_100129A0
mov     eax, dword ptr [esp+arg_C+4]
add     eax, eax
jnb     short loc_100129A0
jmp     short loc_10012980

loc_10012978:
mov     eax, dword ptr [esp+arg_C+4]
add     eax, eax
jb      short loc_100129A0

loc_10012980:
fxch    st(1)
fstp    st
fld     st
fmul    flt_1001AB18
fstp    [esp+arg_0]
fld     [esp+arg_C]
fxch    st(1)
wait
fldcw   word ptr [esp+arg_18]
jmp     loc_10012898

loc_100129A0:
fldcw   word ptr [esp+arg_18]
fdivp   st(1), st
retn
sub_10012890 endp

db 83h
dd 0E0832CECh, 8524FF3Fh
dd offset off_1001AB5E



sub_100129B4 proc near
fdiv    st, st
add     esp, 2Ch
retn
sub_100129B4 endp ; sp-analysis failed

word_100129BA dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 2

sub_100129BF proc near
fdivr   st, st
add     esp, 2Ch
retn
sub_100129BF endp ; sp-analysis failed

byte_100129C5 db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 4

sub_100129CA proc near
fdiv    st, st
add     esp, 2Ch
retn
sub_100129CA endp ; sp-analysis failed



; jumptable 100129AD case 5

sub_100129D0 proc near
fdivp   st, st
add     esp, 2Ch
retn
sub_100129D0 endp ; sp-analysis failed



; jumptable 100129AD case 6

sub_100129D6 proc near
fdivr   st, st
add     esp, 2Ch
retn
sub_100129D6 endp ; sp-analysis failed



; jumptable 100129AD case 7

sub_100129DC proc near
fdivrp  st, st
add     esp, 2Ch
retn
sub_100129DC endp ; sp-analysis failed



; jumptable 100129AD case 8

sub_100129E2 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fld     [esp+arg_1C]
fxch    st(1)
add     esp, 2Ch
retn
sub_100129E2 endp ; sp-analysis failed

word_100129FE dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 10

sub_10012A03 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fld     [esp+arg_8]
fxch    st(1)
add     esp, 2Ch
retn
sub_10012A03 endp ; sp-analysis failed

byte_10012A19 db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 12

sub_10012A1E proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(1)
fstp    [esp+arg_8]     ; _TBYTE
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012A1E endp ; sp-analysis failed



; jumptable 100129AD case 13

sub_10012A3A proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
add     esp, 2Ch
retn
sub_10012A3A endp ; sp-analysis failed



; jumptable 100129AD case 14

sub_10012A4A proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012A4A endp ; sp-analysis failed



; jumptable 100129AD case 15

sub_10012A5E proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
add     esp, 2Ch
retn
sub_10012A5E endp ; sp-analysis failed



; jumptable 100129AD case 16

sub_10012A6E proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(1)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(1)
fld     [esp+arg_1C]
fxch    st(2)
add     esp, 2Ch
retn
sub_10012A6E endp ; sp-analysis failed

word_10012A8E dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 18

sub_10012A93 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(1)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(1)
fld     [esp+arg_8]
fxch    st(2)
add     esp, 2Ch
retn
sub_10012A93 endp ; sp-analysis failed

byte_10012AAD db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 20

sub_10012AB2 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(2)
fstp    [esp+arg_8]     ; _TBYTE
fxch    st(1)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(1)
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012AB2 endp ; sp-analysis failed



; jumptable 100129AD case 21

sub_10012AD2 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(1)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(1)
add     esp, 2Ch
retn
sub_10012AD2 endp ; sp-analysis failed



; jumptable 100129AD case 22

sub_10012AE6 proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(1)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(1)
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012AE6 endp ; sp-analysis failed



; jumptable 100129AD case 23

sub_10012AFE proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(1)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(1)
add     esp, 2Ch
retn
sub_10012AFE endp ; sp-analysis failed



; jumptable 100129AD case 24

sub_10012B12 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(2)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(2)
fld     [esp+arg_1C]
fxch    st(3)
add     esp, 2Ch
retn
sub_10012B12 endp ; sp-analysis failed

word_10012B32 dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 26

sub_10012B37 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(2)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(2)
fld     [esp+arg_8]
fxch    st(3)
add     esp, 2Ch
retn
sub_10012B37 endp ; sp-analysis failed

byte_10012B51 db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 28

sub_10012B56 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(3)
fstp    [esp+arg_8]     ; _TBYTE
fxch    st(2)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(2)
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012B56 endp ; sp-analysis failed



; jumptable 100129AD case 29

sub_10012B76 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(2)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(2)
add     esp, 2Ch
retn
sub_10012B76 endp ; sp-analysis failed



; jumptable 100129AD case 30

sub_10012B8A proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(2)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(2)
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012B8A endp ; sp-analysis failed



; jumptable 100129AD case 31

sub_10012BA2 proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(2)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(2)
add     esp, 2Ch
retn
sub_10012BA2 endp ; sp-analysis failed



; jumptable 100129AD case 32

sub_10012BB6 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(3)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(3)
fld     [esp+arg_1C]
fxch    st(4)
add     esp, 2Ch
retn
sub_10012BB6 endp ; sp-analysis failed

word_10012BD6 dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 34

sub_10012BDB proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(3)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(3)
fld     [esp+arg_8]
fxch    st(4)
add     esp, 2Ch
retn
sub_10012BDB endp ; sp-analysis failed

byte_10012BF5 db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 36

sub_10012BFA proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(4)
fstp    [esp+arg_8]     ; _TBYTE
fxch    st(3)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(3)
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012BFA endp ; sp-analysis failed



; jumptable 100129AD case 37

sub_10012C1A proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(3)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(3)
add     esp, 2Ch
retn
sub_10012C1A endp ; sp-analysis failed



; jumptable 100129AD case 38

sub_10012C2E proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(3)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(3)
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012C2E endp ; sp-analysis failed



; jumptable 100129AD case 39

sub_10012C46 proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(3)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(3)
add     esp, 2Ch
retn
sub_10012C46 endp ; sp-analysis failed



; jumptable 100129AD case 40

sub_10012C5A proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(4)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(4)
fld     [esp+arg_1C]
fxch    st(5)
add     esp, 2Ch
retn
sub_10012C5A endp ; sp-analysis failed

word_10012C7A dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 42

sub_10012C7F proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(4)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(4)
fld     [esp+arg_8]
fxch    st(5)
add     esp, 2Ch
retn
sub_10012C7F endp ; sp-analysis failed

byte_10012C99 db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 44

sub_10012C9E proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(5)
fstp    [esp+arg_8]     ; _TBYTE
fxch    st(4)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(4)
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012C9E endp ; sp-analysis failed



; jumptable 100129AD case 45

sub_10012CBE proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(4)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(4)
add     esp, 2Ch
retn
sub_10012CBE endp ; sp-analysis failed



; jumptable 100129AD case 46

sub_10012CD2 proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(4)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(4)
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012CD2 endp ; sp-analysis failed



; jumptable 100129AD case 47

sub_10012CEA proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(4)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(4)
add     esp, 2Ch
retn
sub_10012CEA endp ; sp-analysis failed



; jumptable 100129AD case 48

sub_10012CFE proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(5)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(5)
fld     [esp+arg_1C]
fxch    st(6)
add     esp, 2Ch
retn
sub_10012CFE endp ; sp-analysis failed

word_10012D1E dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 50

sub_10012D23 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(5)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(5)
fld     [esp+arg_8]
fxch    st(6)
add     esp, 2Ch
retn
sub_10012D23 endp ; sp-analysis failed

byte_10012D3D db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 52

sub_10012D42 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(6)
fstp    [esp+arg_8]     ; _TBYTE
fxch    st(5)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(5)
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012D42 endp ; sp-analysis failed



; jumptable 100129AD case 53

sub_10012D62 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(5)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(5)
add     esp, 2Ch
retn
sub_10012D62 endp ; sp-analysis failed



; jumptable 100129AD case 54

sub_10012D76 proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(5)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(5)
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012D76 endp ; sp-analysis failed



; jumptable 100129AD case 55

sub_10012D8E proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(5)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(5)
add     esp, 2Ch
retn
sub_10012D8E endp ; sp-analysis failed



; jumptable 100129AD case 56

sub_10012DA2 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(6)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(6)
fld     [esp+arg_1C]
fxch    st(7)
add     esp, 2Ch
retn
sub_10012DA2 endp ; sp-analysis failed

word_10012DC2 dw 0C483h
sub     al, 0CDh
push    es


; jumptable 100129AD case 58

sub_10012DC7 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(6)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(6)
fld     [esp+arg_8]
fxch    st(7)
add     esp, 2Ch
retn
sub_10012DC7 endp ; sp-analysis failed

byte_10012DE1 db 83h, 0C4h, 2Ch
db 0CDh, 6


; jumptable 100129AD case 60

sub_10012DE6 proc near

arg_8= tbyte ptr  0Ch
arg_1C= tbyte ptr  20h

fxch    st(7)
fstp    [esp+arg_8]     ; _TBYTE
fxch    st(6)
fld     st
fstp    tbyte ptr [esp+0] ; _TBYTE
fstp    [esp+arg_1C]
call    sub_10012890
fxch    st(6)
fld     [esp+arg_1C]
add     esp, 2Ch
retn
sub_10012DE6 endp ; sp-analysis failed



; jumptable 100129AD case 61

sub_10012E06 proc near

arg_8= tbyte ptr  0Ch

fstp    tbyte ptr [esp+0] ; _TBYTE
fxch    st(6)
fstp    [esp+arg_8]     ; _TBYTE
call    sub_10012890
fxch    st(6)
add     esp, 2Ch
retn
sub_10012E06 endp ; sp-analysis failed



; jumptable 100129AD case 62

sub_10012E1A proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(6)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(6)
fld     [esp+arg_8]
add     esp, 2Ch
retn
sub_10012E1A endp ; sp-analysis failed



; jumptable 100129AD case 63

sub_10012E32 proc near

arg_8= tbyte ptr  0Ch

fstp    [esp+arg_8]     ; _TBYTE
fxch    st(6)
fstp    tbyte ptr [esp+0] ; _TBYTE
call    sub_10012890
fxch    st(6)
add     esp, 2Ch
retn
sub_10012E32 endp ; sp-analysis failed




sub_10012E46 proc near

var_2C= tbyte ptr -2Ch
var_20= tbyte ptr -20h

sub     esp, 2Ch
fstp    [esp+2Ch+var_2C] ; _TBYTE
fstp    [esp+2Ch+var_20] ; _TBYTE
call    sub_10012890
add     esp, 2Ch
retn
sub_10012E46 endp




sub_10012E59 proc near

var_2C= tbyte ptr -2Ch
var_20= tbyte ptr -20h

sub     esp, 2Ch
fstp    [esp+2Ch+var_20] ; _TBYTE
fstp    [esp+2Ch+var_2C] ; _TBYTE
call    sub_10012890
add     esp, 2Ch
retn
sub_10012E59 endp

push    eax
mov     eax, [esp+8]
and     eax, 7F800000h
cmp     eax, 7F800000h
jz      short loc_10012EB0
fnstsw  ax
and     eax, 3800h
jz      short loc_10012E93
fld     dword ptr [esp+8]
call    sub_10012E46
pop     eax
retn    4

loc_10012E93:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fld     dword ptr [esp+14h]
call    sub_10012E46
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    4

loc_10012EB0:
fdiv    dword ptr [esp+8]
pop     eax
retn    4
push    eax
mov     eax, [esp+0Ch]
and     eax, 7FF00000h
cmp     eax, 7FF00000h
jz      short loc_10012EFC
fnstsw  ax
and     eax, 3800h
jz      short loc_10012EDF
fld     qword ptr [esp+8]
call    sub_10012E46
pop     eax
retn    8

loc_10012EDF:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fld     qword ptr [esp+14h]
call    sub_10012E46
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    8

loc_10012EFC:
fdiv    qword ptr [esp+8]
pop     eax
retn    8
push    eax
fnstsw  ax
and     eax, 3800h
jz      short loc_10012F1B
fild    word ptr [esp+8]
call    sub_10012E46
pop     eax
retn    4

loc_10012F1B:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fild    word ptr [esp+14h]
call    sub_10012E46
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    4
push    eax
fnstsw  ax
and     eax, 3800h
jz      short loc_10012F4F
fild    dword ptr [esp+8]
call    sub_10012E46
pop     eax
retn    4

loc_10012F4F:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fild    dword ptr [esp+14h]
call    sub_10012E46
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    4
push    eax
mov     eax, [esp+8]
and     eax, 7F800000h
cmp     eax, 7F800000h
jz      short loc_10012FB0
fnstsw  ax
and     eax, 3800h
jz      short loc_10012F93
fld     dword ptr [esp+8]
call    sub_10012E59
pop     eax
retn    4

loc_10012F93:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fld     dword ptr [esp+14h]
call    sub_10012E59
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    4

loc_10012FB0:
fdivr   dword ptr [esp+8]
pop     eax
retn    4
push    eax
mov     eax, [esp+0Ch]
and     eax, 7FF00000h
cmp     eax, 7FF00000h
jz      short loc_10012FFC
fnstsw  ax
and     eax, 3800h
jz      short loc_10012FDF
fld     qword ptr [esp+8]
call    sub_10012E59
pop     eax
retn    8

loc_10012FDF:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fld     qword ptr [esp+14h]
call    sub_10012E59
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    8

loc_10012FFC:
fdivr   qword ptr [esp+8]
pop     eax
retn    8
push    eax
fnstsw  ax
and     eax, 3800h
jz      short loc_1001301B
fild    word ptr [esp+8]
call    sub_10012E59
pop     eax
retn    4

loc_1001301B:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fild    word ptr [esp+14h]
call    sub_10012E59
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    4
push    eax
fnstsw  ax
and     eax, 3800h
jz      short loc_1001304F
fild    dword ptr [esp+8]
call    sub_10012E59
pop     eax
retn    4

loc_1001304F:
fxch    st(1)
sub     esp, 0Ch
fstp    tbyte ptr [esp]
fild    dword ptr [esp+14h]
call    sub_10012E59
fld     tbyte ptr [esp]
fxch    st(1)
add     esp, 0Ch
pop     eax
retn    4
push    eax
sub     esp, 2Ch
fstp    tbyte ptr [esp]
fstp    tbyte ptr [esp+0Ch]
call    sub_10012890
add     esp, 2Ch
pop     eax
retn



sub_10013081 proc near

var_30= tbyte ptr -30h
var_24= tbyte ptr -24h

push    eax
sub     esp, 2Ch
fstp    [esp+30h+var_24] ; _TBYTE
fstp    [esp+30h+var_30] ; _TBYTE
call    sub_10012890
add     esp, 2Ch
pop     eax
retn
sub_10013081 endp




sub_10013096 proc near

var_28= byte ptr -28h
var_24= dword ptr -24h
arg_6= dword ptr  0Ah
arg_C= tbyte ptr  10h
arg_1E= dword ptr  22h
arg_24= dword ptr  28h
arg_28= dword ptr  2Ch
arg_2C= dword ptr  30h

push    eax
push    ebx
push    ecx
mov     eax, [esp+0Ch+arg_6]
xor     eax, 700h
test    eax, 700h
jnz     loc_10013230
shr     eax, 0Bh
and     eax, 0Fh
cmp     byte_1001AB1C[eax], 0
jz      loc_10013230
mov     eax, [esp+0Ch+arg_6]
and     eax, 7FFF0000h
cmp     eax, 7FFF0000h
jz      loc_10013230
mov     eax, [esp+0Ch+arg_1E]
and     eax, 7FFF0000h
jz      loc_10013230
cmp     eax, 7FFF0000h
jz      loc_10013230
mov     eax, [esp+2Ch]
add     eax, eax
jnz     loc_10013230
mov     eax, [esp+14h]
add     eax, eax
jnz     loc_10013230
mov     eax, [esp+0Ch+arg_6+2]
and     eax, 7FFFh
add     eax, 3Fh
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
sub     ebx, eax
ja      short loc_1001317E

loc_10013120:
mov     eax, [esp+0Ch+arg_6+2]
and     eax, 7FFFh
add     eax, 0Ah
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
sub     ebx, eax
js      loc_10013230
fld     tbyte ptr [esp+28h]
mov     eax, [esp+0Ch+arg_6+2]
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
mov     ecx, ebx
sub     ebx, eax
and     ebx, 7
or      ebx, 4
sub     ecx, ebx
mov     ebx, eax
and     ebx, 8000h
or      ecx, ebx
mov     [esp+0Ch+arg_6+2], ecx
fld     tbyte ptr [esp+10h]
mov     [esp+0Ch+arg_6+2], eax
fxch    st(1)
fprem
fstp    tbyte ptr [esp+28h]
fstp    st
jmp     short loc_10013120

loc_1001317E:
test    edx, 2
jnz     short loc_1001318E
fld     tbyte ptr [esp+10h]
fstp    [esp+0Ch+arg_C]

loc_1001318E:
fnstcw  word ptr [esp+0Ch+arg_24]
mov     eax, [esp+0Ch+arg_24]
or      eax, 33Fh
mov     [esp+0Ch+arg_28], eax
fldcw   word ptr [esp+0Ch+arg_28]
mov     eax, [esp+0Ch+arg_6+2]
and     eax, 7FFFh
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
sub     ebx, eax
and     ebx, 3Fh
or      ebx, 20h
add     ebx, 1
mov     ecx, ebx
mov     eax, [esp+0Ch+arg_6+2]
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
and     eax, 8000h
or      ebx, eax
mov     [esp+0Ch+arg_6+2], ebx
fld     tbyte ptr [esp+10h]
fabs
fld     tbyte ptr [esp+28h]
fabs

loc_100131E8:
fcom    st(1)
fnstsw  ax
and     eax, 100h
jnz     short loc_100131F5
fsub    st, st(1)

loc_100131F5:
fxch    st(1)
fmul    dbl_1001AB4C
fxch    st(1)
sub     ecx, 1
jnz     short loc_100131E8
mov     ebx, [esp+0Ch+arg_1E+2]
fstp    tbyte ptr [esp+28h]
fstp    st
fld     [esp+0Ch+arg_C]
fld     tbyte_1001AB54
fprem
fstp    st
fld     tbyte ptr [esp+28h]
fldcw   word ptr [esp+0Ch+arg_24]
and     ebx, 8000h
jz      short loc_1001323A
fchs
jmp     short loc_1001323A

loc_10013230:
fld     tbyte ptr [esp+10h]
fld     tbyte ptr [esp+28h]
fprem

loc_1001323A:
test    edx, 3
jz      short loc_10013298
fnstsw  word ptr [esp+0Ch+arg_2C]
test    edx, 1
jz      short loc_1001326D
fnstcw  word ptr [esp+0Ch+arg_24]
mov     eax, [esp+0Ch+arg_24]
or      eax, 300h
mov     [esp+0Ch+arg_28], eax
fldcw   word ptr [esp+0Ch+arg_28]
fmul    dbl_1001AB3C
fldcw   word ptr [esp+0Ch+arg_24]

loc_1001326D:
mov     eax, [esp+0Ch+arg_2C]
fxch    st(1)
fstp    st
fld     [esp+0Ch+arg_C]
fxch    st(1)
and     eax, 4300h
sub     esp, 1Ch
fnstenv [esp+28h+var_28]
and     [esp+28h+var_24], 0BCFFh
or      [esp+28h+var_24], eax
fldenv  [esp+28h+var_28]
add     esp, 1Ch

loc_10013298:
pop     ecx
pop     ebx
pop     eax
retn
sub_10013096 endp




sub_1001329C proc near

var_34= tbyte ptr -34h
var_28= tbyte ptr -28h
var_1C= tbyte ptr -1Ch
var_10= dword ptr -10h
var_C= dword ptr -0Ch

push    edx
sub     esp, 30h
fstp    [esp+34h+var_1C]
fstp    [esp+34h+var_34]
xor     edx, edx
mov     eax, dword ptr [esp+34h+var_34+6]
test    eax, 7FFF0000h
jz      short loc_100132BE
call    sub_10013096
add     esp, 30h
pop     edx
retn

loc_100132BE:
fld     [esp+34h+var_34]
fld     [esp+34h+var_1C]
mov     eax, dword ptr [esp+34h+var_34]
or      eax, dword ptr [esp+34h+var_34+4]
jz      short loc_10013347
fxch    st(1)
fstp    [esp+34h+var_28]
fld     [esp+34h+var_34]
fxch    st(1)
or      edx, 2
fnstcw  word ptr [esp+34h+var_10]
mov     eax, [esp+34h+var_10]
or      eax, 33Fh
mov     [esp+34h+var_C], eax
fldcw   word ptr [esp+34h+var_C]
mov     eax, dword ptr [esp+34h+var_1C+8]
and     eax, 7FFFh
cmp     eax, 7FBEh
ja      short loc_10013319
or      edx, 1
fmul    dbl_1001AB34
fstp    [esp+34h+var_1C]
fmul    dbl_1001AB34
fstp    [esp+34h+var_34]
jmp     short loc_10013339

loc_10013319:
fnstcw  word ptr [esp+34h+var_10]
mov     eax, [esp+34h+var_10]
or      eax, 300h
mov     [esp+34h+var_C], eax
fldcw   word ptr [esp+34h+var_C]
fstp    st
fmul    dbl_1001AB34
fstp    [esp+34h+var_34]

loc_10013339:
fldcw   word ptr [esp+34h+var_10]
call    sub_10013096
add     esp, 30h
pop     edx
retn

loc_10013347:
fprem
add     esp, 30h
pop     edx
retn
sub_1001329C endp




sub_1001334E proc near

var_28= byte ptr -28h
var_24= dword ptr -24h
arg_6= dword ptr  0Ah
arg_C= tbyte ptr  10h
arg_1E= dword ptr  22h
arg_24= dword ptr  28h
arg_28= dword ptr  2Ch
arg_2C= dword ptr  30h

push    eax
push    ebx
push    ecx
mov     eax, [esp+0Ch+arg_6]
xor     eax, 700h
test    eax, 700h
jnz     loc_100134E8
shr     eax, 0Bh
and     eax, 0Fh
cmp     byte_1001AB1C[eax], 0
jz      loc_100134E8
mov     eax, [esp+0Ch+arg_6]
and     eax, 7FFF0000h
cmp     eax, 7FFF0000h
jz      loc_100134E8
mov     eax, [esp+0Ch+arg_1E]
and     eax, 7FFF0000h
jz      loc_100134E8
cmp     eax, 7FFF0000h
jz      loc_100134E8
mov     eax, [esp+2Ch]
add     eax, eax
jnz     loc_100134E8
mov     eax, [esp+14h]
add     eax, eax
jnz     loc_100134E8
mov     eax, [esp+0Ch+arg_6+2]
and     eax, 7FFFh
add     eax, 3Fh
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
sub     ebx, eax
ja      short loc_10013436

loc_100133D8:
mov     eax, [esp+0Ch+arg_6+2]
and     eax, 7FFFh
add     eax, 0Ah
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
sub     ebx, eax
js      loc_100134E8
fld     tbyte ptr [esp+28h]
mov     eax, [esp+0Ch+arg_6+2]
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
mov     ecx, ebx
sub     ebx, eax
and     ebx, 7
or      ebx, 4
sub     ecx, ebx
mov     ebx, eax
and     ebx, 8000h
or      ecx, ebx
mov     [esp+0Ch+arg_6+2], ecx
fld     tbyte ptr [esp+10h]
mov     [esp+0Ch+arg_6+2], eax
fxch    st(1)
fprem
fstp    tbyte ptr [esp+28h]
fstp    st
jmp     short loc_100133D8

loc_10013436:
test    ebx, 2
jnz     short loc_10013446
fld     tbyte ptr [esp+10h]
fstp    [esp+0Ch+arg_C]

loc_10013446:
fnstcw  word ptr [esp+0Ch+arg_24]
mov     eax, [esp+0Ch+arg_24]
or      eax, 33Fh
mov     [esp+0Ch+arg_28], eax
fldcw   word ptr [esp+0Ch+arg_28]
mov     eax, [esp+0Ch+arg_6+2]
and     eax, 7FFFh
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
sub     ebx, eax
and     ebx, 3Fh
or      ebx, 20h
add     ebx, 1
mov     ecx, ebx
mov     eax, [esp+0Ch+arg_6+2]
mov     ebx, [esp+0Ch+arg_1E+2]
and     ebx, 7FFFh
and     eax, 8000h
or      ebx, eax
mov     [esp+0Ch+arg_6+2], ebx
fld     tbyte ptr [esp+10h]
fabs
fld     tbyte ptr [esp+28h]
fabs

loc_100134A0:
fcom    st(1)
fnstsw  ax
and     eax, 100h
jnz     short loc_100134AD
fsub    st, st(1)

loc_100134AD:
fxch    st(1)
fmul    dbl_1001AB4C
fxch    st(1)
sub     ecx, 1
jnz     short loc_100134A0
mov     ebx, [esp+0Ch+arg_1E+2]
fstp    tbyte ptr [esp+28h]
fstp    st
fld     [esp+0Ch+arg_C]
fld     tbyte_1001AB54
fprem1
fstp    st
fld     tbyte ptr [esp+28h]
fldcw   word ptr [esp+0Ch+arg_24]
and     ebx, 8000h
jz      short loc_100134F2
fchs
jmp     short loc_100134F2

loc_100134E8:
fld     tbyte ptr [esp+10h]
fld     tbyte ptr [esp+28h]
fprem1

loc_100134F2:
test    edx, 3
jz      short loc_10013550
fnstsw  word ptr [esp+0Ch+arg_2C]
test    edx, 1
jz      short loc_10013525
fnstcw  word ptr [esp+0Ch+arg_24]
mov     eax, [esp+0Ch+arg_24]
or      eax, 300h
mov     [esp+0Ch+arg_28], eax
fldcw   word ptr [esp+0Ch+arg_28]
fmul    dbl_1001AB3C
fldcw   word ptr [esp+0Ch+arg_24]

loc_10013525:
mov     eax, [esp+0Ch+arg_2C]
fxch    st(1)
fstp    st
fld     [esp+0Ch+arg_C]
fxch    st(1)
and     eax, 4300h
sub     esp, 1Ch
fnstenv [esp+28h+var_28]
and     [esp+28h+var_24], 0BCFFh
or      [esp+28h+var_24], eax
fldenv  [esp+28h+var_28]
add     esp, 1Ch

loc_10013550:
pop     ecx
pop     ebx
pop     eax
retn
sub_1001334E endp




sub_10013554 proc near

var_34= tbyte ptr -34h
var_28= tbyte ptr -28h
var_1C= tbyte ptr -1Ch
var_10= dword ptr -10h
var_C= dword ptr -0Ch

push    edx
sub     esp, 30h
fstp    [esp+34h+var_1C]
fstp    [esp+34h+var_34]
mov     edx, 0
mov     eax, dword ptr [esp+34h+var_34+6]
test    eax, 7FFF0000h
jz      short loc_10013579
call    sub_1001334E
add     esp, 30h
pop     edx
retn

loc_10013579:
fld     [esp+34h+var_34]
fld     [esp+34h+var_1C]
mov     eax, dword ptr [esp+34h+var_34]
or      eax, dword ptr [esp+34h+var_34+4]
jz      short loc_10013602
fxch    st(1)
fstp    [esp+34h+var_28]
fld     [esp+34h+var_34]
fxch    st(1)
or      edx, 2
fnstcw  word ptr [esp+34h+var_10]
mov     eax, [esp+34h+var_10]
or      eax, 33Fh
mov     [esp+34h+var_C], eax
fldcw   word ptr [esp+34h+var_C]
mov     eax, dword ptr [esp+34h+var_1C+8]
and     eax, 7FFFh
cmp     eax, 7FBEh
ja      short loc_100135D4
or      edx, 1
fmul    dbl_1001AB34
fstp    [esp+34h+var_1C]
fmul    dbl_1001AB34
fstp    [esp+34h+var_34]
jmp     short loc_100135F4

loc_100135D4:
fnstcw  word ptr [esp+34h+var_10]
mov     eax, [esp+34h+var_10]
or      eax, 300h
mov     [esp+34h+var_C], eax
fldcw   word ptr [esp+34h+var_C]
fstp    st
fmul    dbl_1001AB34
fstp    [esp+34h+var_34]

loc_100135F4:
fldcw   word ptr [esp+34h+var_10]
call    sub_1001334E
add     esp, 30h
pop     edx
retn

loc_10013602:
fprem
add     esp, 30h
pop     edx
retn
sub_10013554 endp

call    sub_1001329C
retn
call    sub_10013554
retn
fpatan
retn
fptan
retn


; Attributes: bp-based frame

sub_1001361B proc near

Arguments= dword ptr -58h
var_30= qword ptr -30h
var_20= dword ptr -20h
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 58h
mov     eax, [ebp+arg_8]
push    ebx
push    esi
mov     esi, [ebp+arg_4]
movzx   ecx, word ptr [eax]
mov     eax, [esi]
push    edi
dec     eax
mov     [ebp+arg_8], ecx
jz      short loc_10013660
dec     eax
jz      short loc_1001365C
dec     eax
jz      short loc_10013658
dec     eax
jz      short loc_10013654
dec     eax
jz      short loc_10013660
dec     eax
dec     eax
jz      short loc_1001364C
dec     eax
jnz     short loc_100136B6
push    10h
jmp     short loc_10013662

loc_1001364C:
mov     dword ptr [esi], 1
jmp     short loc_100136B6

loc_10013654:
push    12h
jmp     short loc_10013662

loc_10013658:
push    11h
jmp     short loc_10013662

loc_1001365C:
push    4
jmp     short loc_10013662

loc_10013660:
push    8

loc_10013662:
pop     ebx
lea     edi, [esi+18h]
push    ecx
push    edi
push    ebx
call    sub_1000ED23
add     esp, 0Ch
test    eax, eax
jnz     short loc_100136B6
mov     eax, [ebp+arg_0]
cmp     eax, 10h
jz      short loc_1001368D
cmp     eax, 16h
jz      short loc_1001368D
cmp     eax, 1Dh
jz      short loc_1001368D
and     [ebp+var_20], 0FFFFFFFEh
jmp     short loc_1001369F

loc_1001368D:
mov     ecx, [ebp+var_20]
fld     qword ptr [esi+10h]
and     ecx, 0FFFFFFE3h
fstp    [ebp+var_30]
or      ecx, 3
mov     [ebp+var_20], ecx

loc_1001369F:
lea     ecx, [esi+8]
push    edi             ; int
push    ecx             ; int
push    eax             ; int
lea     eax, [ebp+arg_8]
push    ebx             ; dwExceptionCode
push    eax             ; int
lea     eax, [ebp+Arguments]
push    eax             ; Arguments
call    sub_1000EA70
add     esp, 18h

loc_100136B6:
push    0FFFFh
push    [ebp+arg_8]
call    sub_1000F19D
cmp     dword ptr [esi], 8
pop     ecx
pop     ecx
jz      short loc_100136DE
cmp     dword_1001AAF8, 0
jnz     short loc_100136DE
push    esi
call    sub_100124F0
test    eax, eax
pop     ecx
jnz     short loc_100136E6

loc_100136DE:
push    dword ptr [esi]
call    sub_1000EFC2
pop     ecx

loc_100136E6:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1001361B endp



; Attributes: bp-based frame

; int __cdecl sub_100136EB(double)
sub_100136EB proc near

var_8= qword ptr -8
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
push    ecx
push    ecx
fld     [ebp+arg_0]
frndint
fstp    [ebp+var_8]
fld     [ebp+var_8]
leave
retn
sub_100136EB endp



; Attributes: bp-based frame

; int __cdecl sub_100136FD(double)
sub_100136FD proc near

var_8= qword ptr -8
arg_0= qword ptr  8

push    ebp
mov     ebp, esp
mov     eax, dword ptr [ebp+arg_0+6]
mov     ecx, 7FF0h
mov     edx, eax
and     edx, ecx
cmp     dx, cx
jnz     short loc_1001373D
fld     qword ptr [ebp+8]
push    ecx
push    ecx
fstp    [esp+8+var_8]
call    sub_1000F065
pop     ecx
dec     eax
pop     ecx
jz      short loc_10013736
dec     eax
jz      short loc_10013732
dec     eax
jz      short loc_1001372E
push    1

loc_1001372B:
pop     eax
pop     ebp
retn

loc_1001372E:
push    2
jmp     short loc_1001372B

loc_10013732:
push    4
jmp     short loc_1001372B

loc_10013736:
mov     eax, 200h
pop     ebp
retn

loc_1001373D:
and     eax, 8000h
test    dx, dx
mov     ecx, eax
jnz     short loc_10013767
test    dword ptr [ebp+0Ch], 0FFFFFh
jnz     short loc_10013758
cmp     dword ptr [ebp+arg_0], 0
jz      short loc_10013767

loc_10013758:
mov     eax, ecx
neg     eax
sbb     eax, eax
and     al, 90h
add     eax, 80h
pop     ebp
retn

loc_10013767:
fld     [ebp+arg_0]
fcomp   ds:dbl_100160F8
fnstsw  ax
sahf
mov     eax, ecx
jnz     short loc_10013782
neg     eax
sbb     eax, eax
and     al, 0E0h
add     eax, 40h
pop     ebp
retn

loc_10013782:
neg     eax
sbb     eax, eax
and     al, 8
add     eax, 100h
pop     ebp
retn
sub_100136FD endp



; Attributes: bp-based frame

sub_1001378F proc near

var_20= dword ptr -20h
var_1C= dword ptr -1Ch
ms_exc= CPPEH_RECORD ptr -18h
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
push    0FFFFFFFFh
push    offset stru_10016648
push    offset sub_10010508
mov     eax, large fs:0
push    eax
mov     large fs:0, esp
sub     esp, 18h
push    ebx
push    esi
push    edi
mov     esi, [ebp+arg_0]
imul    esi, [ebp+arg_4]
mov     [ebp+arg_4], esi
mov     [ebp+var_1C], esi
cmp     esi, 0FFFFFFE0h
ja      short loc_100137D8
xor     ebx, ebx
cmp     esi, ebx
jnz     short loc_100137CD
push    1
pop     esi

loc_100137CD:
add     esi, 0Fh
and     esi, 0FFFFFFF0h
mov     [ebp+arg_4], esi
jmp     short loc_100137DA

loc_100137D8:
xor     ebx, ebx

loc_100137DA:
mov     [ebp+var_20], ebx
cmp     esi, 0FFFFFFE0h
ja      loc_1001388E
mov     eax, dword_1001BB14
cmp     eax, 3
jnz     short loc_10013831
mov     edi, [ebp+var_1C]
cmp     edi, dword_1001BB0C
ja      short loc_10013877
push    9
call    sub_1001039A
pop     ecx
mov     [ebp+ms_exc.registration.TryLevel], ebx
push    edi
call    sub_1000F82C
pop     ecx
mov     [ebp+var_20], eax
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
call    loc_10013828

loc_10013819:
cmp     [ebp+var_20], ebx
jz      short loc_1001387C
push    [ebp+var_1C]
jmp     short loc_1001386B

loc_10013823:
xor     ebx, ebx
mov     esi, [ebp+arg_4]

loc_10013828:
push    9
call    sub_100103FB
pop     ecx
retn

loc_10013831:
cmp     eax, 2
jnz     short loc_10013877
cmp     esi, dword_1001A734
ja      short loc_10013877
push    9
call    sub_1001039A
pop     ecx
mov     [ebp+ms_exc.registration.TryLevel], 1
mov     eax, esi
shr     eax, 4
push    eax
call    sub_1000FFD9
pop     ecx
mov     [ebp+var_20], eax
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
call    loc_100138B1

loc_10013865:
cmp     [ebp+var_20], ebx
jz      short loc_1001387C
push    esi

loc_1001386B:
push    ebx
push    [ebp+var_20]
call    sub_10012000
add     esp, 0Ch

loc_10013877:
cmp     [ebp+var_20], ebx
jnz     short loc_100138BA

loc_1001387C:           ; dwBytes
push    esi
push    8               ; dwFlags
push    hHeap           ; hHeap
call    ds:HeapAlloc
mov     [ebp+var_20], eax

loc_1001388E:
cmp     [ebp+var_20], ebx
jnz     short loc_100138BA
cmp     dword_1001B498, ebx
jz      short loc_100138BA
push    esi
call    sub_100105E0
pop     ecx
test    eax, eax
jnz     loc_100137DA
jmp     short loc_100138BD

loc_100138AC:
xor     ebx, ebx
mov     esi, [ebp+arg_4]

loc_100138B1:
push    9
call    sub_100103FB
pop     ecx
retn

loc_100138BA:
mov     eax, [ebp+var_20]

loc_100138BD:
mov     ecx, [ebp+ms_exc.registration.Next]
mov     large fs:0, ecx
pop     edi
pop     esi
pop     ebx
leave
retn
sub_1001378F endp



; Attributes: bp-based frame

sub_100138CC proc near

CPInfo= _cpinfo ptr -18h
var_4= dword ptr -4
arg_0= dword ptr  8

push    ebp
mov     ebp, esp
sub     esp, 18h
push    ebx
push    esi
push    edi
push    19h
call    sub_1001039A
push    [ebp+arg_0]
call    sub_10013A79
mov     ebx, eax
pop     ecx
cmp     ebx, CodePage
pop     ecx
mov     [ebp+arg_0], ebx
jnz     short loc_100138FA

loc_100138F3:
xor     esi, esi
jmp     loc_10013A6A

loc_100138FA:
test    ebx, ebx
jz      loc_10013A58
xor     edx, edx
mov     eax, offset unk_1001ACF0

loc_10013909:
cmp     [eax], ebx
jz      short loc_10013981
add     eax, 30h
inc     edx
cmp     eax, offset unk_1001ADE0
jl      short loc_10013909
lea     eax, [ebp+CPInfo]
push    eax             ; lpCPInfo
push    ebx             ; CodePage
call    ds:GetCPInfo
push    1
pop     esi
cmp     eax, esi
jnz     loc_10013A4F
push    40h
and     Locale, 0
pop     ecx
xor     eax, eax
mov     edi, offset unk_1001B8C0
cmp     [ebp+CPInfo.MaxCharSize], esi
rep stosd
stosb
mov     CodePage, ebx
jbe     loc_10013A3C
cmp     [ebp+CPInfo.LeadByte], 0
jz      loc_10013A17
lea     ecx, [ebp+CPInfo.LeadByte+1]

loc_1001395E:
mov     dl, [ecx]
test    dl, dl
jz      loc_10013A17
movzx   eax, byte ptr [ecx-1]
movzx   edx, dl

loc_1001396F:
cmp     eax, edx
ja      loc_10013A0B
or      byte_1001B8C1[eax], 4
inc     eax
jmp     short loc_1001396F

loc_10013981:
and     [ebp+var_4], 0
push    40h
pop     ecx
xor     eax, eax
mov     edi, offset unk_1001B8C0
lea     esi, [edx+edx*2]
rep stosd
shl     esi, 4
stosb
lea     ebx, unk_1001AD00[esi]

loc_1001399E:
cmp     byte ptr [ebx], 0
mov     ecx, ebx
jz      short loc_100139D1

loc_100139A5:
mov     dl, [ecx+1]
test    dl, dl
jz      short loc_100139D1
movzx   eax, byte ptr [ecx]
movzx   edi, dl
cmp     eax, edi
ja      short loc_100139CA
mov     edx, [ebp+var_4]
mov     dl, byte_1001ACE8[edx]

loc_100139BF:
or      byte_1001B8C1[eax], dl
inc     eax
cmp     eax, edi
jbe     short loc_100139BF

loc_100139CA:
inc     ecx
inc     ecx
cmp     byte ptr [ecx], 0
jnz     short loc_100139A5

loc_100139D1:
inc     [ebp+var_4]
add     ebx, 8
cmp     [ebp+var_4], 4
jb      short loc_1001399E
mov     eax, [ebp+arg_0]
mov     dword_1001B7AC, 1
push    eax
mov     CodePage, eax
call    sub_10013AC3
lea     esi, unk_1001ACF4[esi]
mov     edi, offset unk_1001B7A0
movsd
movsd
pop     ecx
mov     Locale, eax
movsd
jmp     short loc_10013A5D

loc_10013A0B:
inc     ecx
inc     ecx
cmp     byte ptr [ecx-1], 0
jnz     loc_1001395E

loc_10013A17:
mov     eax, esi

loc_10013A19:
or      byte_1001B8C1[eax], 8
inc     eax
cmp     eax, 0FFh
jb      short loc_10013A19
push    ebx
call    sub_10013AC3
pop     ecx
mov     Locale, eax
mov     dword_1001B7AC, esi
jmp     short loc_10013A43

loc_10013A3C:
and     dword_1001B7AC, 0

loc_10013A43:
xor     eax, eax
mov     edi, offset unk_1001B7A0
stosd
stosd
stosd
jmp     short loc_10013A5D

loc_10013A4F:
cmp     dword_1001B5F4, 0
jz      short loc_10013A67

loc_10013A58:
call    sub_10013AF6

loc_10013A5D:
call    sub_10013B1F
jmp     loc_100138F3

loc_10013A67:
or      esi, 0FFFFFFFFh

loc_10013A6A:
push    19h
call    sub_100103FB
pop     ecx
mov     eax, esi
pop     edi
pop     esi
pop     ebx
leave
retn
sub_100138CC endp




sub_10013A79 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
and     dword_1001B5F4, 0
cmp     eax, 0FFFFFFFEh
jnz     short loc_10013A99
mov     dword_1001B5F4, 1
jmp     ds:GetOEMCP

loc_10013A99:
cmp     eax, 0FFFFFFFDh
jnz     short loc_10013AAE
mov     dword_1001B5F4, 1
jmp     ds:GetACP

loc_10013AAE:
cmp     eax, 0FFFFFFFCh
jnz     short locret_10013AC2
mov     eax, dword_1001B63C
mov     dword_1001B5F4, 1

locret_10013AC2:
retn
sub_10013A79 endp




sub_10013AC3 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
sub     eax, 3A4h
jz      short loc_10013AF0
sub     eax, 4
jz      short loc_10013AEA
sub     eax, 0Dh
jz      short loc_10013AE4
dec     eax
jz      short loc_10013ADE
xor     eax, eax
retn

loc_10013ADE:
mov     eax, 404h
retn

loc_10013AE4:
mov     eax, 412h
retn

loc_10013AEA:
mov     eax, 804h
retn

loc_10013AF0:
mov     eax, 411h
retn
sub_10013AC3 endp




sub_10013AF6 proc near
push    edi
push    40h
pop     ecx
xor     eax, eax
mov     edi, offset unk_1001B8C0
rep stosd
stosb
xor     eax, eax
mov     edi, offset unk_1001B7A0
mov     CodePage, eax
mov     dword_1001B7AC, eax
mov     Locale, eax
stosd
stosd
stosd
pop     edi
retn
sub_10013AF6 endp



; Attributes: bp-based frame

sub_10013B1F proc near

CharType= word ptr -514h
var_314= byte ptr -314h
DestStr= byte ptr -214h
SrcStr= byte ptr -114h
CPInfo= _cpinfo ptr -14h

push    ebp
mov     ebp, esp
sub     esp, 514h
lea     eax, [ebp+CPInfo]
push    esi
push    eax             ; lpCPInfo
push    CodePage        ; CodePage
call    ds:GetCPInfo
cmp     eax, 1
jnz     loc_10013C58
xor     eax, eax
mov     esi, 100h

loc_10013B49:
mov     [ebp+eax+SrcStr], al
inc     eax
cmp     eax, esi
jb      short loc_10013B49
mov     al, [ebp+CPInfo.LeadByte]
mov     [ebp+SrcStr], 20h
test    al, al
jz      short loc_10013B9A
push    ebx
push    edi
lea     edx, [ebp+CPInfo.LeadByte+1]

loc_10013B68:
movzx   ecx, byte ptr [edx]
movzx   eax, al
cmp     eax, ecx
ja      short loc_10013B8F
sub     ecx, eax
lea     edi, [ebp+eax+SrcStr]
inc     ecx
mov     eax, 20202020h
mov     ebx, ecx
shr     ecx, 2
rep stosd
mov     ecx, ebx
and     ecx, 3
rep stosb

loc_10013B8F:
inc     edx
inc     edx
mov     al, [edx-1]
test    al, al
jnz     short loc_10013B68
pop     edi
pop     ebx

loc_10013B9A:           ; int
push    0
lea     eax, [ebp+CharType]
push    Locale          ; Locale
push    CodePage        ; CodePage
push    eax             ; lpCharType
lea     eax, [ebp+SrcStr]
push    esi             ; cchSrc
push    eax             ; lpSrcStr
push    1               ; dwInfoType
call    sub_1001239E
push    0               ; int
lea     eax, [ebp+DestStr]
push    CodePage        ; CodePage
push    esi             ; cchDest
push    eax             ; lpDestStr
lea     eax, [ebp+SrcStr]
push    esi             ; cchSrc
push    eax             ; lpSrcStr
push    esi             ; dwMapFlags
push    Locale          ; Locale
call    sub_10013D49
push    0               ; int
lea     eax, [ebp+var_314]
push    CodePage        ; CodePage
push    esi             ; cchDest
push    eax             ; lpDestStr
lea     eax, [ebp+SrcStr]
push    esi             ; cchSrc
push    eax             ; lpSrcStr
push    200h            ; dwMapFlags
push    Locale          ; Locale
call    sub_10013D49
add     esp, 5Ch
xor     eax, eax
lea     ecx, [ebp+CharType]

loc_10013C15:
mov     dx, [ecx]
test    dl, 1
jz      short loc_10013C33
or      byte_1001B8C1[eax], 10h
mov     dl, [ebp+eax+DestStr]

loc_10013C2B:
mov     byte_1001B7C0[eax], dl
jmp     short loc_10013C4F

loc_10013C33:
test    dl, 2
jz      short loc_10013C48
or      byte_1001B8C1[eax], 20h
mov     dl, [ebp+eax+var_314]
jmp     short loc_10013C2B

loc_10013C48:
and     byte_1001B7C0[eax], 0

loc_10013C4F:
inc     eax
inc     ecx
inc     ecx
cmp     eax, esi
jb      short loc_10013C15
jmp     short loc_10013CA1

loc_10013C58:
xor     eax, eax
mov     esi, 100h

loc_10013C5F:
cmp     eax, 41h
jb      short loc_10013C7D
cmp     eax, 5Ah
ja      short loc_10013C7D
or      byte_1001B8C1[eax], 10h
mov     cl, al
add     cl, 20h

loc_10013C75:
mov     byte_1001B7C0[eax], cl
jmp     short loc_10013C9C

loc_10013C7D:
cmp     eax, 61h
jb      short loc_10013C95
cmp     eax, 7Ah
ja      short loc_10013C95
or      byte_1001B8C1[eax], 20h
mov     cl, al
sub     cl, 20h
jmp     short loc_10013C75

loc_10013C95:
and     byte_1001B7C0[eax], 0

loc_10013C9C:
inc     eax
cmp     eax, esi
jb      short loc_10013C5F

loc_10013CA1:
pop     esi
leave
retn
sub_10013B1F endp




sub_10013CA4 proc near
cmp     dword_1001BAE8, 0
jnz     short locret_10013CBF
push    0FFFFFFFDh
call    sub_100138CC
pop     ecx
mov     dword_1001BAE8, 1

locret_10013CBF:
retn
sub_10013CA4 endp




sub_10013CC0 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

push    ebx
xor     ebx, ebx
cmp     dword_1001B5F8, ebx
push    esi
push    edi
jnz     short loc_10013D0F
push    offset LibFileName ; "user32.dll"
call    ds:LoadLibraryA
mov     edi, eax
cmp     edi, ebx
jz      short loc_10013D45
mov     esi, ds:GetProcAddress
push    offset aMessageboxa ; "MessageBoxA"
push    edi             ; hModule
call    esi ; GetProcAddress
test    eax, eax
mov     dword_1001B5F8, eax
jz      short loc_10013D45
push    offset aGetactivewindo ; "GetActiveWindow"
push    edi             ; hModule
call    esi ; GetProcAddress
push    offset aGetlastactivep ; "GetLastActivePopup"
push    edi             ; hModule
mov     dword_1001B5FC, eax
call    esi ; GetProcAddress
mov     dword_1001B600, eax

loc_10013D0F:
mov     eax, dword_1001B5FC
test    eax, eax
jz      short loc_10013D2E
call    eax ; dword_1001B5FC
mov     ebx, eax
test    ebx, ebx
jz      short loc_10013D2E
mov     eax, dword_1001B600
test    eax, eax
jz      short loc_10013D2E
push    ebx
call    eax ; dword_1001B600
mov     ebx, eax

loc_10013D2E:
push    [esp+0Ch+arg_8]
push    [esp+10h+arg_4]
push    [esp+14h+arg_0]
push    ebx
call    dword_1001B5F8

loc_10013D41:
pop     edi
pop     esi
pop     ebx
retn

loc_10013D45:
xor     eax, eax
jmp     short loc_10013D41
sub_10013CC0 endp



; Attributes: bp-based frame

; int __cdecl sub_10013D49(LCID Locale, DWORD dwMapFlags, LPCSTR lpSrcStr, int cchSrc, LPSTR lpDestStr, int cchDest, UINT CodePage, int)
sub_10013D49 proc near

var_28= dword ptr -28h
lpWideCharStr= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
ms_exc= CPPEH_RECORD ptr -18h
Locale= dword ptr  8
dwMapFlags= dword ptr  0Ch
lpSrcStr= dword ptr  10h
cchSrc= dword ptr  14h
lpDestStr= dword ptr  18h
cchDest= dword ptr  1Ch
CodePage= dword ptr  20h
arg_1C= dword ptr  24h

push    ebp
mov     ebp, esp
push    0FFFFFFFFh
push    offset stru_100166A0
push    offset sub_10010508
mov     eax, large fs:0
push    eax
mov     large fs:0, esp
sub     esp, 1Ch
push    ebx
push    esi
push    edi
mov     [ebp+ms_exc.old_esp], esp
xor     edi, edi
cmp     dword_1001B644, edi
jnz     short loc_10013DBF
push    edi             ; cchDest
push    edi             ; lpDestStr
push    1
pop     ebx
push    ebx             ; cchSrc
push    offset SrcStr   ; lpSrcStr
mov     esi, 100h
push    esi             ; dwMapFlags
push    edi             ; Locale
call    ds:LCMapStringW
test    eax, eax
jz      short loc_10013D9D
mov     dword_1001B644, ebx
jmp     short loc_10013DBF

loc_10013D9D:           ; cchDest
push    edi
push    edi             ; lpDestStr
push    ebx             ; cchSrc
push    offset byte_10016630 ; lpSrcStr
push    esi             ; dwMapFlags
push    edi             ; Locale
call    ds:LCMapStringA
test    eax, eax
jz      loc_10013ED7
mov     dword_1001B644, 2

loc_10013DBF:
cmp     [ebp+cchSrc], edi
jle     short loc_10013DD4
push    [ebp+cchSrc]
push    [ebp+lpSrcStr]
call    sub_10013F6D
pop     ecx
pop     ecx
mov     [ebp+cchSrc], eax

loc_10013DD4:
mov     eax, dword_1001B644
cmp     eax, 2
jnz     short loc_10013DFB
push    [ebp+cchDest]   ; cchDest
push    [ebp+lpDestStr] ; lpDestStr
push    [ebp+cchSrc]    ; cchSrc
push    [ebp+lpSrcStr]  ; lpSrcStr
push    [ebp+dwMapFlags] ; dwMapFlags
push    [ebp+Locale]    ; Locale
call    ds:LCMapStringA
jmp     loc_10013ED9

loc_10013DFB:
cmp     eax, 1
jnz     loc_10013ED7
cmp     [ebp+CodePage], edi
jnz     short loc_10013E11
mov     eax, dword_1001B63C
mov     [ebp+CodePage], eax

loc_10013E11:           ; cchWideChar
push    edi
push    edi             ; lpWideCharStr
push    [ebp+cchSrc]    ; cbMultiByte
push    [ebp+lpSrcStr]  ; lpMultiByteStr
mov     eax, [ebp+arg_1C]
neg     eax
sbb     eax, eax
and     eax, 8
inc     eax
push    eax             ; dwFlags
push    [ebp+CodePage]  ; CodePage
call    ds:MultiByteToWideChar
mov     ebx, eax
mov     [ebp+var_1C], ebx
cmp     ebx, edi
jz      loc_10013ED7
mov     [ebp+ms_exc.registration.TryLevel], edi
lea     eax, [ebx+ebx]
add     eax, 3
and     al, 0FCh
call    __alloca_probe
mov     [ebp+ms_exc.old_esp], esp
mov     eax, esp
mov     [ebp+lpWideCharStr], eax
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
jmp     short loc_10013E6C

loc_10013E59:
push    1
pop     eax
retn

loc_10013E5D:
mov     esp, [ebp+ms_exc.old_esp]
xor     edi, edi
mov     [ebp+lpWideCharStr], edi
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
mov     ebx, [ebp+var_1C]

loc_10013E6C:
cmp     [ebp+lpWideCharStr], edi
jz      short loc_10013ED7
push    ebx             ; cchWideChar
push    [ebp+lpWideCharStr] ; lpWideCharStr
push    [ebp+cchSrc]    ; cbMultiByte
push    [ebp+lpSrcStr]  ; lpMultiByteStr
push    1               ; dwFlags
push    [ebp+CodePage]  ; CodePage
call    ds:MultiByteToWideChar
test    eax, eax
jz      short loc_10013ED7
push    edi             ; cchDest
push    edi             ; lpDestStr
push    ebx             ; cchSrc
push    [ebp+lpWideCharStr] ; lpSrcStr
push    [ebp+dwMapFlags] ; dwMapFlags
push    [ebp+Locale]    ; Locale
call    ds:LCMapStringW
mov     esi, eax
mov     [ebp+var_28], esi
cmp     esi, edi
jz      short loc_10013ED7
test    byte ptr [ebp+dwMapFlags+1], 4
jz      short loc_10013EEB
cmp     [ebp+cchDest], edi
jz      loc_10013F66
cmp     esi, [ebp+cchDest]
jg      short loc_10013ED7
push    [ebp+cchDest]   ; cchDest
push    [ebp+lpDestStr] ; lpDestStr
push    ebx             ; cchSrc
push    [ebp+lpWideCharStr] ; lpSrcStr
push    [ebp+dwMapFlags] ; dwMapFlags
push    [ebp+Locale]    ; Locale
call    ds:LCMapStringW
test    eax, eax
jnz     loc_10013F66

loc_10013ED7:
xor     eax, eax

loc_10013ED9:
lea     esp, [ebp-38h]
mov     ecx, [ebp+ms_exc.registration.Next]
mov     large fs:0, ecx
pop     edi
pop     esi
pop     ebx
leave
retn

loc_10013EEB:
mov     [ebp+ms_exc.registration.TryLevel], 1
lea     eax, [esi+esi]
add     eax, 3
and     al, 0FCh
call    __alloca_probe
mov     [ebp+ms_exc.old_esp], esp
mov     ebx, esp
mov     [ebp+var_20], ebx
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
jmp     short loc_10013F1F

loc_10013F0D:
push    1
pop     eax
retn

loc_10013F11:
mov     esp, [ebp+ms_exc.old_esp]
xor     edi, edi
xor     ebx, ebx
or      [ebp+ms_exc.registration.TryLevel], 0FFFFFFFFh
mov     esi, [ebp+var_28]

loc_10013F1F:
cmp     ebx, edi
jz      short loc_10013ED7
push    esi             ; cchDest
push    ebx             ; lpDestStr
push    [ebp+var_1C]    ; cchSrc
push    [ebp+lpWideCharStr] ; lpSrcStr
push    [ebp+dwMapFlags] ; dwMapFlags
push    [ebp+Locale]    ; Locale
call    ds:LCMapStringW
test    eax, eax
jz      short loc_10013ED7
cmp     [ebp+cchDest], edi
push    edi             ; lpUsedDefaultChar
push    edi             ; lpDefaultChar
jnz     short loc_10013F46
push    edi
push    edi
jmp     short loc_10013F4C

loc_10013F46:           ; cbMultiByte
push    [ebp+cchDest]
push    [ebp+lpDestStr] ; lpMultiByteStr

loc_10013F4C:           ; cchWideChar
push    esi
push    ebx             ; lpWideCharStr
push    220h            ; dwFlags
push    [ebp+CodePage]  ; CodePage
call    ds:WideCharToMultiByte
mov     esi, eax
cmp     esi, edi
jz      loc_10013ED7

loc_10013F66:
mov     eax, esi
jmp     loc_10013ED9
sub_10013D49 endp




sub_10013F6D proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

mov     edx, [esp+arg_4]
mov     eax, [esp+arg_0]
test    edx, edx
push    esi
lea     ecx, [edx-1]
jz      short loc_10013F8A

loc_10013F7D:
cmp     byte ptr [eax], 0
jz      short loc_10013F8A
inc     eax
mov     esi, ecx
dec     ecx
test    esi, esi
jnz     short loc_10013F7D

loc_10013F8A:
cmp     byte ptr [eax], 0
pop     esi
jnz     short loc_10013F95
sub     eax, [esp+arg_0]
retn

loc_10013F95:
mov     eax, edx
retn
sub_10013F6D endp




sub_10013F98 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8
arg_8= dword ptr  0Ch

mov     edx, [esp+arg_0]
push    esi
mov     esi, [esp+4+arg_4]
xor     eax, eax
lea     ecx, [edx+esi]
cmp     ecx, edx
jb      short loc_10013FAE
cmp     ecx, esi
jnb     short loc_10013FB1

loc_10013FAE:
push    1
pop     eax

loc_10013FB1:
mov     edx, [esp+4+arg_8]
pop     esi
mov     [edx], ecx
retn
sub_10013F98 endp




sub_10013FB9 proc near

arg_0= dword ptr  4
arg_4= dword ptr  8

push    esi
mov     esi, [esp+4+arg_0]
push    edi
mov     edi, [esp+8+arg_4]
push    esi
push    dword ptr [edi]
push    dword ptr [esi]
call    sub_10013F98
add     esp, 0Ch
test    eax, eax
jz      short loc_10013FEB
lea     eax, [esi+4]
push    eax
push    1
push    dword ptr [eax]
call    sub_10013F98
add     esp, 0Ch
test    eax, eax
jz      short loc_10013FEB
inc     dword ptr [esi+8]

loc_10013FEB:
lea     eax, [esi+4]
push    eax
push    dword ptr [edi+4]
push    dword ptr [eax]
call    sub_10013F98
add     esp, 0Ch
test    eax, eax
jz      short loc_10014003
inc     dword ptr [esi+8]

loc_10014003:
lea     eax, [esi+8]
push    eax
push    dword ptr [edi+8]
push    dword ptr [eax]
call    sub_10013F98
add     esp, 0Ch
pop     edi
pop     esi
retn
sub_10013FB9 endp




sub_10014017 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
push    esi
push    edi
mov     esi, [eax]
mov     edi, [eax+4]
mov     ecx, esi
add     esi, esi
mov     [eax], esi
lea     esi, [edi+edi]
shr     ecx, 1Fh
or      esi, ecx
mov     ecx, [eax+8]
mov     edx, edi
mov     [eax+4], esi
shr     edx, 1Fh
shl     ecx, 1
or      ecx, edx
pop     edi
mov     [eax+8], ecx
pop     esi
retn
sub_10014017 endp




sub_10014045 proc near

arg_0= dword ptr  4

mov     eax, [esp+arg_0]
push    esi
push    edi
mov     edx, [eax+8]
mov     ecx, [eax+4]
mov     esi, edx
mov     edi, ecx
shl     esi, 1Fh
shr     ecx, 1
or      ecx, esi
mov     [eax+4], ecx
mov     ecx, [eax]
shl     edi, 1Fh
shr     ecx, 1
shr     edx, 1
or      ecx, edi
pop     edi
mov     [eax+8], edx
mov     [eax], ecx
pop     esi
retn
sub_10014045 endp



; Attributes: bp-based frame

sub_10014072 proc near

var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 10h
mov     eax, [ebp+arg_4]
push    ebx
mov     ebx, [ebp+arg_8]
xor     edx, edx
cmp     eax, edx
push    esi
mov     [ebp+var_4], 404Eh
mov     [ebx], edx
mov     [ebx+4], edx
mov     [ebx+8], edx
jbe     short loc_100140E6
push    edi
mov     [ebp+arg_8], eax

loc_10014099:
mov     esi, ebx
lea     edi, [ebp+var_10]
movsd
movsd
push    ebx
movsd
call    sub_10014017
push    ebx
call    sub_10014017
lea     eax, [ebp+var_10]
push    eax
push    ebx
call    sub_10013FB9
push    ebx
call    sub_10014017
mov     eax, [ebp+arg_0]
and     [ebp+var_C], 0
and     [ebp+var_8], 0
movsx   eax, byte ptr [eax]
mov     [ebp+var_10], eax
lea     eax, [ebp+var_10]
push    eax
push    ebx
call    sub_10013FB9
add     esp, 1Ch
inc     [ebp+arg_0]
dec     [ebp+arg_8]
jnz     short loc_10014099
xor     edx, edx
pop     edi

loc_100140E6:
cmp     [ebx+8], edx
jnz     short loc_10014113
mov     ecx, [ebx+4]
mov     eax, ecx
shr     eax, 10h
mov     [ebx+8], eax
mov     eax, [ebx]
mov     esi, eax
shr     esi, 10h
shl     ecx, 10h
or      esi, ecx
shl     eax, 10h
add     [ebp+var_4], 0FFF0h
mov     [ebx+4], esi
mov     [ebx], eax
jmp     short loc_100140E6

loc_10014113:
mov     esi, 8000h

loc_10014118:
test    [ebx+8], esi
jnz     short loc_1001412D
push    ebx
call    sub_10014017
add     [ebp+var_4], 0FFFFh
pop     ecx
jmp     short loc_10014118

loc_1001412D:
mov     ax, word ptr [ebp+var_4]
pop     esi
mov     [ebx+0Ah], ax
pop     ebx
leave
retn
sub_10014072 endp



; Attributes: bp-based frame

sub_10014139 proc near

var_5C= byte ptr -5Ch
var_45= byte ptr -45h
var_40= dword ptr -40h
var_3A= dword ptr -3Ah
var_36= dword ptr -36h
var_30= dword ptr -30h
var_2C= dword ptr -2Ch
var_28= dword ptr -28h
var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= dword ptr  18h
arg_14= dword ptr  1Ch
arg_18= dword ptr  20h

push    ebp
mov     ebp, esp
sub     esp, 5Ch
push    ebx
push    esi
push    edi
mov     edi, [ebp+arg_8]
lea     eax, [ebp+var_5C]
push    1
mov     [ebp+var_C], eax
xor     eax, eax
pop     edx
mov     [ebp+var_28], eax
mov     [ebp+var_18], edx
mov     [ebp+var_4], eax
mov     [ebp+var_10], eax
mov     [ebp+var_24], eax
mov     [ebp+var_20], eax
mov     [ebp+var_2C], eax
mov     [ebp+var_30], eax
mov     [ebp+var_1C], eax
mov     [ebp+var_8], eax
mov     [ebp+var_14], eax
mov     [ebp+arg_8], edi

loc_10014174:
mov     cl, [edi]
cmp     cl, 20h
jz      short loc_1001418A
cmp     cl, 9
jz      short loc_1001418A
cmp     cl, 0Ah
jz      short loc_1001418A
cmp     cl, 0Dh
jnz     short loc_1001418D

loc_1001418A:
inc     edi
jmp     short loc_10014174

loc_1001418D:
push    4
pop     esi

loc_10014190:
mov     bl, [edi]
inc     edi
cmp     eax, 0Bh        ; switch 12 cases
ja      loc_10014413    ; jumptable 1001419C default case
jmp     ds:off_100145DA[eax*4] ; switch jump

loc_100141A3:           ; jumptable 1001419C case 0
cmp     bl, 31h
jl      short loc_100141B4
cmp     bl, 39h
jg      short loc_100141B4

loc_100141AD:
push    3
jmp     loc_100143D1

loc_100141B4:
cmp     bl, byte_100185E4
jnz     short loc_100141C3

loc_100141BC:
push    5
jmp     loc_10014409

loc_100141C3:
movsx   eax, bl
sub     eax, 2Bh
jz      short loc_100141E9
dec     eax
dec     eax
jz      short loc_100141DD
sub     eax, 3
jnz     loc_100144AC
jmp     loc_1001426C

loc_100141DD:
push    2
mov     [ebp+var_28], 8000h
pop     eax
jmp     short loc_10014190

loc_100141E9:
and     [ebp+var_28], 0
push    2
pop     eax
jmp     short loc_10014190

loc_100141F2:           ; jumptable 1001419C case 1
cmp     bl, 31h
mov     [ebp+var_10], edx
jl      short loc_100141FF
cmp     bl, 39h
jle     short loc_100141AD

loc_100141FF:
cmp     bl, byte_100185E4
jz      loc_100142C7
cmp     bl, 2Bh
jz      short loc_10014241
cmp     bl, 2Dh
jz      short loc_10014241
cmp     bl, 30h
jz      short loc_1001426C

loc_1001421A:
cmp     bl, 43h
jle     loc_100144AC
cmp     bl, 45h
jle     short loc_1001423A
cmp     bl, 63h
jle     loc_100144AC
cmp     bl, 65h
jg      loc_100144AC

loc_1001423A:
push    6
jmp     loc_10014409

loc_10014241:
dec     edi
push    0Bh
jmp     loc_10014409

loc_10014249:           ; jumptable 1001419C case 2
cmp     bl, 31h
jl      short loc_10014257
cmp     bl, 39h
jle     loc_100141AD

loc_10014257:
cmp     bl, byte_100185E4
jz      loc_100141BC
cmp     bl, 30h
jnz     loc_10014421

loc_1001426C:
mov     eax, edx
jmp     loc_10014190

loc_10014273:           ; jumptable 1001419C case 3
mov     [ebp+var_10], edx

loc_10014276:
cmp     dword_100185E0, edx
jle     short loc_1001428F
movzx   eax, bl
push    esi             ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
push    1
pop     edx
jmp     short loc_1001429D

loc_1001428F:
mov     ecx, off_100183D4
movzx   eax, bl
mov     al, [ecx+eax*2]
and     eax, esi

loc_1001429D:
test    eax, eax
jz      short loc_100142BF
cmp     [ebp+var_4], 19h
jnb     short loc_100142B7
mov     eax, [ebp+var_C]
inc     [ebp+var_4]
sub     bl, 30h
inc     [ebp+var_C]
mov     [eax], bl
jmp     short loc_100142BA

loc_100142B7:
inc     [ebp+var_8]

loc_100142BA:
mov     bl, [edi]
inc     edi
jmp     short loc_10014276

loc_100142BF:
cmp     bl, byte_100185E4
jnz     short loc_1001432E

loc_100142C7:
mov     eax, esi
jmp     loc_10014190

loc_100142CE:           ; jumptable 1001419C case 4
cmp     [ebp+var_4], 0
mov     [ebp+var_10], edx
mov     [ebp+var_24], edx
jnz     short loc_100142E7

loc_100142DA:
cmp     bl, 30h
jnz     short loc_100142E7
dec     [ebp+var_8]
mov     bl, [edi]
inc     edi
jmp     short loc_100142DA

loc_100142E7:
cmp     dword_100185E0, edx
jle     short loc_10014300
movzx   eax, bl
push    esi             ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
push    1
pop     edx
jmp     short loc_1001430E

loc_10014300:
mov     ecx, off_100183D4
movzx   eax, bl
mov     al, [ecx+eax*2]
and     eax, esi

loc_1001430E:
test    eax, eax
jz      short loc_1001432E
cmp     [ebp+var_4], 19h
jnb     short loc_10014329
mov     eax, [ebp+var_C]
inc     [ebp+var_4]
sub     bl, 30h
inc     [ebp+var_C]
dec     [ebp+var_8]
mov     [eax], bl

loc_10014329:
mov     bl, [edi]
inc     edi
jmp     short loc_100142E7

loc_1001432E:
cmp     bl, 2Bh
jz      loc_10014241
cmp     bl, 2Dh
jz      loc_10014241
jmp     loc_1001421A

loc_10014345:           ; jumptable 1001419C case 5
cmp     dword_100185E0, edx
mov     [ebp+var_24], edx
jle     short loc_10014361
movzx   eax, bl
push    esi             ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
push    1
pop     edx
jmp     short loc_1001436F

loc_10014361:
mov     ecx, off_100183D4
movzx   eax, bl
mov     al, [ecx+eax*2]
and     eax, esi

loc_1001436F:
test    eax, eax
jz      loc_10014421
mov     eax, esi
jmp     short loc_100143D2

loc_1001437B:           ; jumptable 1001419C case 6
lea     ecx, [edi-2]
cmp     bl, 31h
mov     [ebp+arg_8], ecx
jl      short loc_1001438B
cmp     bl, 39h
jle     short loc_100143CF

loc_1001438B:
movsx   eax, bl
sub     eax, 2Bh
jz      short loc_10014407
dec     eax
dec     eax
jz      short loc_100143FB
sub     eax, 3
jnz     loc_100144AF

loc_100143A0:
push    8
jmp     short loc_10014409

loc_100143A4:           ; jumptable 1001419C case 8
mov     [ebp+var_20], edx

loc_100143A7:
cmp     bl, 30h
jnz     short loc_100143B1
mov     bl, [edi]
inc     edi
jmp     short loc_100143A7

loc_100143B1:
cmp     bl, 31h
jl      loc_100144AC
cmp     bl, 39h
jg      loc_100144AC
jmp     short loc_100143CF

loc_100143C5:           ; jumptable 1001419C case 7
cmp     bl, 31h
jl      short loc_100143D8
cmp     bl, 39h
jg      short loc_100143D8

loc_100143CF:
push    9

loc_100143D1:
pop     eax

loc_100143D2:
dec     edi
jmp     loc_10014190

loc_100143D8:
cmp     bl, 30h
jnz     short loc_10014421
jmp     short loc_100143A0

loc_100143DF:           ; jumptable 1001419C case 11
cmp     [ebp+arg_18], 0
jz      short loc_1001440F
movsx   eax, bl
lea     ecx, [edi-1]
sub     eax, 2Bh
mov     [ebp+arg_8], ecx
jz      short loc_10014407
dec     eax
dec     eax
jnz     loc_100144AF

loc_100143FB:
or      [ebp+var_18], 0FFFFFFFFh
push    7
pop     eax
jmp     loc_10014190

loc_10014407:
push    7

loc_10014409:
pop     eax
jmp     loc_10014190

loc_1001440F:
push    0Ah
dec     edi
pop     eax

loc_10014413:           ; jumptable 1001419C default case
cmp     eax, 0Ah
jz      loc_100144B1
jmp     loc_10014190

loc_10014421:
mov     edi, [ebp+arg_8]
jmp     loc_100144B1

loc_10014429:           ; jumptable 1001419C case 9
mov     [ebp+var_20], 1
xor     esi, esi

loc_10014432:
cmp     dword_100185E0, 1
jle     short loc_1001444A
movzx   eax, bl
push    4               ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_10014459

loc_1001444A:
mov     ecx, off_100183D4
movzx   eax, bl
mov     al, [ecx+eax*2]
and     eax, 4

loc_10014459:
test    eax, eax
jz      short loc_10014479
movsx   ecx, bl
lea     eax, [esi+esi*4]
lea     esi, [ecx+eax*2-30h]
cmp     esi, 1450h
jg      short loc_10014474
mov     bl, [edi]
inc     edi
jmp     short loc_10014432

loc_10014474:
mov     esi, 1451h

loc_10014479:
mov     [ebp+var_1C], esi

loc_1001447C:
cmp     dword_100185E0, 1
jle     short loc_10014494
movzx   eax, bl
push    4               ; int
push    eax             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_100144A3

loc_10014494:
mov     ecx, off_100183D4
movzx   eax, bl
mov     al, [ecx+eax*2]
and     eax, 4

loc_100144A3:
test    eax, eax
jz      short loc_100144AC
mov     bl, [edi]
inc     edi
jmp     short loc_1001447C

loc_100144AC:
dec     edi
jmp     short loc_100144B1

loc_100144AF:
mov     edi, ecx

loc_100144B1:
mov     eax, [ebp+arg_4]
cmp     [ebp+var_10], 0
mov     [eax], edi
jz      loc_10014599
push    18h
pop     eax
cmp     [ebp+var_4], eax
jbe     short loc_100144DD
cmp     [ebp+var_45], 5
jl      short loc_100144D1
inc     [ebp+var_45]

loc_100144D1:
mov     [ebp+var_4], eax
mov     eax, [ebp+var_C]
dec     eax
inc     [ebp+var_8]
jmp     short loc_100144E0

loc_100144DD:
mov     eax, [ebp+var_C]

loc_100144E0:
cmp     [ebp+var_4], 0
jbe     loc_1001458F

loc_100144EA:
dec     eax
cmp     byte ptr [eax], 0
jnz     short loc_100144F8
dec     [ebp+var_4]
inc     [ebp+var_8]
jmp     short loc_100144EA

loc_100144F8:
lea     eax, [ebp+var_40]
push    eax
lea     eax, [ebp+var_5C]
push    [ebp+var_4]
push    eax
call    sub_10014072
mov     eax, [ebp+var_1C]
xor     ecx, ecx
add     esp, 0Ch
cmp     [ebp+var_18], ecx
jge     short loc_10014517
neg     eax

loc_10014517:
add     eax, [ebp+var_8]
cmp     [ebp+var_20], ecx
jnz     short loc_10014522
add     eax, [ebp+arg_10]

loc_10014522:
cmp     [ebp+var_24], ecx
jnz     short loc_1001452A
sub     eax, [ebp+arg_14]

loc_1001452A:
cmp     eax, 1450h
jle     short loc_10014561
mov     [ebp+var_2C], 1

loc_10014538:
mov     ebx, [ebp+arg_8]
mov     esi, [ebp+arg_8]
mov     eax, [ebp+arg_8]
mov     edx, [ebp+arg_8]

loc_10014544:
cmp     [ebp+var_2C], 0
jz      short loc_100145AA
xor     ebx, ebx
mov     eax, 7FFFh
mov     esi, 80000000h
xor     edx, edx
mov     [ebp+var_14], 2
jmp     short loc_100145BF

loc_10014561:
cmp     eax, 0FFFFEBB0h
jge     short loc_10014571
mov     [ebp+var_30], 1
jmp     short loc_10014538

loc_10014571:
push    [ebp+arg_C]
push    eax
lea     eax, [ebp+var_40]
push    eax
call    sub_10014D0A
mov     edx, [ebp+var_40]
mov     ebx, [ebp+var_40+2]
mov     esi, [ebp+var_3A]
mov     eax, [ebp+var_36]
add     esp, 0Ch
jmp     short loc_10014544

loc_1001458F:
xor     edx, edx
xor     eax, eax
xor     esi, esi
xor     ebx, ebx
jmp     short loc_10014544

loc_10014599:
xor     edx, edx
xor     eax, eax
xor     esi, esi
xor     ebx, ebx
mov     [ebp+var_14], 4
jmp     short loc_100145BF

loc_100145AA:
cmp     [ebp+var_30], 0
jz      short loc_100145BF
xor     edx, edx
xor     eax, eax
xor     esi, esi
xor     ebx, ebx
mov     [ebp+var_14], 1

loc_100145BF:
mov     ecx, [ebp+arg_0]
or      eax, [ebp+var_28]
pop     edi
mov     [ecx+6], esi
mov     [ecx+2], ebx
mov     [ecx+0Ah], ax
mov     eax, [ebp+var_14]
pop     esi
mov     [ecx], dx
pop     ebx
leave
retn
sub_10014139 endp

off_100145DA dd offset loc_100141A3 ; jump table for switch statement
dd offset loc_100141F2
dd offset loc_10014249
dd offset loc_10014273
dd offset loc_100142CE
dd offset loc_10014345
dd offset loc_1001437B
dd offset loc_100143C5
dd offset loc_100143A4
dd offset loc_10014429
dd offset loc_10014413
dd offset loc_100143DF


; Attributes: bp-based frame

sub_1001460A proc near

var_1C= byte ptr -1Ch
var_1B= byte ptr -1Bh
var_1A= byte ptr -1Ah
var_19= byte ptr -19h
var_18= byte ptr -18h
var_17= byte ptr -17h
var_16= byte ptr -16h
var_15= byte ptr -15h
var_14= byte ptr -14h
var_13= byte ptr -13h
var_12= byte ptr -12h
var_11= byte ptr -11h
var_10= word ptr -10h
var_E= dword ptr -0Eh
var_A= dword ptr -0Ah
var_6= word ptr -6
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h
arg_C= dword ptr  14h
arg_10= byte ptr  18h
arg_14= dword ptr  1Ch

push    ebp
mov     ebp, esp
sub     esp, 1Ch
mov     eax, [ebp+arg_8]
push    ebx
mov     ebx, [ebp+arg_14]
push    esi
mov     ecx, eax
mov     esi, 7FFFh
and     ecx, 8000h
and     eax, esi
test    cx, cx
push    edi
mov     [ebp+var_1C], 0CCh
mov     [ebp+var_1B], 0CCh
mov     [ebp+var_1A], 0CCh
mov     [ebp+var_19], 0CCh
mov     [ebp+var_18], 0CCh
mov     [ebp+var_17], 0CCh
mov     [ebp+var_16], 0CCh
mov     [ebp+var_15], 0CCh
mov     [ebp+var_14], 0CCh
mov     [ebp+var_13], 0CCh
mov     [ebp+var_12], 0FBh
mov     [ebp+var_11], 3Fh
mov     [ebp+var_4], 1
mov     edx, eax
jz      short loc_1001466C
mov     byte ptr [ebx+2], 2Dh
jmp     short loc_10014670

loc_1001466C:
mov     byte ptr [ebx+2], 20h

loc_10014670:
mov     edi, [ebp+arg_4]
test    dx, dx
jnz     short loc_10014696
test    edi, edi
jnz     short loc_10014696
cmp     [ebp+arg_0], edi
jnz     short loc_10014696

loc_10014681:
and     word ptr [ebx], 0
mov     byte ptr [ebx+2], 20h
mov     byte ptr [ebx+3], 1
mov     byte ptr [ebx+4], 30h
jmp     loc_10014894

loc_10014696:
cmp     dx, si
jnz     short loc_10014715
mov     eax, 80000000h
mov     word ptr [ebx], 1
cmp     edi, eax
jnz     short loc_100146AF
cmp     [ebp+arg_0], 0
jz      short loc_100146BE

loc_100146AF:
test    edi, 40000000h
jnz     short loc_100146BE
push    offset a1Snan   ; "1#SNAN"
jmp     short loc_10014704

loc_100146BE:
test    cx, cx
jz      short loc_100146D8
cmp     edi, 0C0000000h
jnz     short loc_100146D8
cmp     [ebp+arg_0], 0
jnz     short loc_100146FF
push    offset a1Ind    ; "1#IND"
jmp     short loc_100146E7

loc_100146D8:
cmp     edi, eax
jnz     short loc_100146FF
cmp     [ebp+arg_0], 0
jnz     short loc_100146FF
push    offset a1Inf    ; "1#INF"

loc_100146E7:
lea     eax, [ebx+4]
push    eax
call    sub_1000D570
pop     ecx
mov     byte ptr [ebx+3], 5
pop     ecx

loc_100146F6:
and     [ebp+var_4], 0
jmp     loc_1001486D

loc_100146FF:
push    offset a1Qnan   ; "1#QNAN"

loc_10014704:
lea     eax, [ebx+4]
push    eax
call    sub_1000D570
pop     ecx
mov     byte ptr [ebx+3], 6
pop     ecx
jmp     short loc_100146F6

loc_10014715:
movzx   eax, dx
mov     ecx, edi
mov     esi, eax
shr     ecx, 18h
imul    eax, 4D10h
shr     esi, 8
and     [ebp+var_10], 0
push    1
lea     ecx, [esi+ecx*2]
mov     [ebp+var_6], dx
imul    ecx, 4Dh
mov     [ebp+var_A], edi
lea     esi, [ecx+eax-134312F4h]
mov     eax, [ebp+arg_0]
sar     esi, 10h
mov     [ebp+var_E], eax
movsx   eax, si
neg     eax
push    eax
lea     eax, [ebp+var_10]
push    eax
call    sub_10014D0A
add     esp, 0Ch
cmp     [ebp+var_6], 3FFFh
jb      short loc_10014776
lea     eax, [ebp+var_1C]
inc     esi
push    eax
lea     eax, [ebp+var_10]
push    eax
call    sub_10014AEA
pop     ecx
pop     ecx

loc_10014776:
test    [ebp+arg_10], 1
mov     [ebx], si
jz      short loc_10014790
mov     edi, [ebp+arg_C]
movsx   eax, si
add     edi, eax
test    edi, edi
jg      short loc_10014793
jmp     loc_10014681

loc_10014790:
mov     edi, [ebp+arg_C]

loc_10014793:
cmp     edi, 15h
jle     short loc_1001479B
push    15h
pop     edi

loc_1001479B:
movzx   esi, [ebp+var_6]
sub     esi, 3FFEh
and     [ebp+var_6], 0
mov     [ebp+arg_14], 8

loc_100147B1:
lea     eax, [ebp+var_10]
push    eax
call    sub_10014017
dec     [ebp+arg_14]
pop     ecx
jnz     short loc_100147B1
test    esi, esi
jge     short loc_100147DB
neg     esi
and     esi, 0FFh
jle     short loc_100147DB

loc_100147CE:
lea     eax, [ebp+var_10]
push    eax
call    sub_10014045
dec     esi
pop     ecx
jnz     short loc_100147CE

loc_100147DB:
lea     ecx, [edi+1]
lea     eax, [ebx+4]
test    ecx, ecx
mov     [ebp+arg_14], eax
jle     short loc_10014838
mov     [ebp+arg_C], ecx

loc_100147EB:
lea     esi, [ebp+var_10]
lea     edi, [ebp+arg_0]
movsd
movsd
lea     eax, [ebp+var_10]
push    eax
movsd
call    sub_10014017
lea     eax, [ebp+var_10]
push    eax
call    sub_10014017
lea     eax, [ebp+arg_0]
push    eax
lea     eax, [ebp+var_10]
push    eax
call    sub_10013FB9
lea     eax, [ebp+var_10]
push    eax
call    sub_10014017
mov     al, byte ptr [ebp+var_6+1]
mov     ecx, [ebp+arg_14]
and     byte ptr [ebp+var_6+1], 0
add     esp, 14h
add     al, 30h
inc     [ebp+arg_14]
dec     [ebp+arg_C]
mov     [ecx], al
jnz     short loc_100147EB
mov     eax, [ebp+arg_14]

loc_10014838:
mov     cl, [eax-1]
dec     eax
dec     eax
cmp     cl, 35h
lea     ecx, [ebx+4]
jl      short loc_10014875

loc_10014845:
cmp     eax, ecx
jb      short loc_10014858
cmp     byte ptr [eax], 39h
jnz     short loc_10014854
mov     byte ptr [eax], 30h
dec     eax
jmp     short loc_10014845

loc_10014854:
cmp     eax, ecx
jnb     short loc_1001485C

loc_10014858:
inc     eax
inc     word ptr [ebx]

loc_1001485C:
inc     byte ptr [eax]

loc_1001485E:
sub     al, bl
sub     al, 3
mov     [ebx+3], al
movsx   eax, al
and     byte ptr [eax+ebx+4], 0

loc_1001486D:
mov     eax, [ebp+var_4]

loc_10014870:
pop     edi
pop     esi
pop     ebx
leave
retn

loc_10014875:
cmp     eax, ecx
jb      short loc_10014885
cmp     byte ptr [eax], 30h
jnz     short loc_10014881
dec     eax
jmp     short loc_10014875

loc_10014881:
cmp     eax, ecx
jnb     short loc_1001485E

loc_10014885:
and     word ptr [ebx], 0
mov     byte ptr [ebx+2], 20h
mov     byte ptr [ebx+3], 1
mov     byte ptr [ecx], 30h

loc_10014894:
and     byte ptr [ebx+5], 0
push    1
pop     eax
jmp     short loc_10014870
sub_1001460A endp




; int __cdecl sub_1001489D(CHAR SrcStr)
sub_1001489D proc near

SrcStr= byte ptr  4

push    ebx
xor     ebx, ebx
cmp     dword_1001B62C, ebx
jnz     short loc_100148BB
mov     eax, dword ptr [esp+4+SrcStr]
cmp     eax, 61h
jl      short loc_1001490A
cmp     eax, 7Ah
jg      short loc_1001490A
sub     eax, 20h
pop     ebx
retn

loc_100148BB:
push    esi
mov     esi, offset Addend
push    edi
push    esi             ; lpAddend
call    ds:InterlockedIncrement
cmp     dword_1001B788, ebx
mov     edi, ds:InterlockedDecrement
jz      short loc_100148E5
push    esi             ; lpAddend
call    edi ; InterlockedDecrement
push    13h
call    sub_1001039A
pop     ecx
push    1
pop     ebx

loc_100148E5:           ; SrcStr
push    dword ptr [esp+0Ch+SrcStr]
call    sub_1001490C
test    ebx, ebx
pop     ecx
mov     dword ptr [esp+0Ch+SrcStr], eax
jz      short loc_10014901
push    13h
call    sub_100103FB
pop     ecx
jmp     short loc_10014904

loc_10014901:           ; lpAddend
push    esi
call    edi ; InterlockedDecrement

loc_10014904:
mov     eax, dword ptr [esp+0Ch+SrcStr]
pop     edi
pop     esi

loc_1001490A:
pop     ebx
retn
sub_1001489D endp



; Attributes: bp-based frame

; int __cdecl sub_1001490C(CHAR SrcStr)
sub_1001490C proc near

DestStr= byte ptr -4
var_3= byte ptr -3
SrcStr= byte ptr  8

push    ebp
mov     ebp, esp
push    ecx
cmp     dword_1001B62C, 0
push    ebx
jnz     short loc_10014937
mov     eax, dword ptr [ebp+SrcStr]
cmp     eax, 61h
jl      loc_100149D5
cmp     eax, 7Ah
jg      loc_100149D5
sub     eax, 20h
jmp     loc_100149D5

loc_10014937:
mov     ebx, dword ptr [ebp+SrcStr]
cmp     ebx, 100h
jge     short loc_1001496A
cmp     dword_100185E0, 1
jle     short loc_10014957
push    2               ; int
push    ebx             ; CharType
call    sub_1000E8D2
pop     ecx
pop     ecx
jmp     short loc_10014962

loc_10014957:
mov     eax, off_100183D4
mov     al, [eax+ebx*2]
and     eax, 2

loc_10014962:
test    eax, eax
jnz     short loc_1001496A

loc_10014966:
mov     eax, ebx
jmp     short loc_100149D5

loc_1001496A:
mov     edx, off_100183D4
mov     eax, ebx
sar     eax, 8
movzx   ecx, al
test    byte ptr [edx+ecx*2+1], 80h
jz      short loc_1001498D
and     byte ptr [ebp+0Ah], 0
mov     [ebp+SrcStr], al
mov     [ebp+9], bl
push    2
jmp     short loc_10014996

loc_1001498D:
and     byte ptr [ebp+9], 0
mov     [ebp+SrcStr], bl
push    1

loc_10014996:
pop     eax
lea     ecx, [ebp+DestStr]
push    1               ; int
push    0               ; CodePage
push    3               ; cchDest
push    ecx             ; lpDestStr
push    eax             ; cchSrc
lea     eax, [ebp+SrcStr]
push    eax             ; lpSrcStr
push    200h            ; dwMapFlags
push    dword_1001B62C  ; Locale
call    sub_10013D49
add     esp, 20h
test    eax, eax
jz      short loc_10014966
cmp     eax, 1
jnz     short loc_100149C8
movzx   eax, [ebp+DestStr]
jmp     short loc_100149D5

loc_100149C8:
movzx   eax, [ebp+var_3]
movzx   ecx, [ebp+DestStr]
shl     eax, 8
or      eax, ecx

loc_100149D5:
pop     ebx
leave
retn
sub_1001490C endp

align 10h
mov     edx, [esp+4]
mov     ecx, [esp+8]
test    edx, 3
jnz     short loc_10014A2C

loc_100149F0:
mov     eax, [edx]
cmp     al, [ecx]
jnz     short loc_10014A24
or      al, al
jz      short loc_10014A20
cmp     ah, [ecx+1]
jnz     short loc_10014A24
or      ah, ah
jz      short loc_10014A20
shr     eax, 10h
cmp     al, [ecx+2]
jnz     short loc_10014A24
or      al, al
jz      short loc_10014A20
cmp     ah, [ecx+3]
jnz     short loc_10014A24
add     ecx, 4
add     edx, 4
or      ah, ah
jnz     short loc_100149F0
mov     edi, edi

loc_10014A20:
xor     eax, eax
retn
align 4

loc_10014A24:
sbb     eax, eax
shl     eax, 1
inc     eax
retn
align 4

loc_10014A2C:
test    edx, 1
jz      short loc_10014A48
mov     al, [edx]
inc     edx
cmp     al, [ecx]
jnz     short loc_10014A24
inc     ecx
or      al, al
jz      short loc_10014A20
test    edx, 2
jz      short loc_100149F0

loc_10014A48:
mov     ax, [edx]
add     edx, 2
cmp     al, [ecx]
jnz     short loc_10014A24
or      al, al
jz      short loc_10014A20
cmp     ah, [ecx+1]
jnz     short loc_10014A24
or      ah, ah
jz      short loc_10014A20
add     ecx, 2
jmp     short loc_100149F0
align 10h
push    ebp
mov     ebp, esp
push    esi
xor     eax, eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
mov     edx, [ebp+0Ch]
lea     ecx, [ecx+0]

loc_10014A84:
mov     al, [edx]
or      al, al
jz      short loc_10014A91
inc     edx
bts     [esp], eax
jmp     short loc_10014A84

loc_10014A91:
mov     esi, [ebp+8]
or      ecx, 0FFFFFFFFh
nop

loc_10014A98:
inc     ecx
mov     al, [esi]
or      al, al
jz      short loc_10014AA6
inc     esi
bt      [esp], eax
jnb     short loc_10014A98

loc_10014AA6:
mov     eax, ecx
add     esp, 20h
pop     esi
leave
retn
align 10h
push    ebp
mov     ebp, esp
push    esi
xor     eax, eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
push    eax
mov     edx, [ebp+0Ch]
lea     ecx, [ecx+0]

loc_10014AC4:
mov     al, [edx]
or      al, al
jz      short loc_10014AD1
inc     edx
bts     [esp], eax
jmp     short loc_10014AC4

loc_10014AD1:
mov     esi, [ebp+8]

loc_10014AD4:
mov     al, [esi]
or      al, al
jz      short loc_10014AE4
inc     esi
bt      [esp], eax
jnb     short loc_10014AD4
lea     eax, [esi-1]

loc_10014AE4:
add     esp, 20h
pop     esi
leave
retn


; Attributes: bp-based frame

sub_10014AEA proc near

var_24= dword ptr -24h
var_20= dword ptr -20h
var_1C= dword ptr -1Ch
var_18= dword ptr -18h
var_14= dword ptr -14h
var_10= dword ptr -10h
var_C= dword ptr -0Ch
var_8= dword ptr -8
var_4= dword ptr -4
arg_0= dword ptr  8
arg_4= dword ptr  0Ch

push    ebp
mov     ebp, esp
sub     esp, 24h
push    ebx
mov     ebx, [ebp+arg_4]
push    esi
mov     esi, [ebp+arg_0]
mov     cx, [ebx+0Ah]
xor     eax, eax
push    edi
mov     [ebp+var_14], eax
mov     [ebp+var_24], eax
mov     [ebp+var_20], eax
mov     [ebp+var_1C], eax
mov     ax, [esi+0Ah]
mov     edi, ecx
mov     edx, 7FFFh
xor     edi, eax
and     eax, edx
and     ecx, edx
and     edi, 8000h
cmp     ax, 7FFFh
lea     edx, [ecx+eax]
mov     [ebp+arg_0], edx
jnb     loc_10014CEA
cmp     cx, 7FFFh
jnb     loc_10014CEA
cmp     dx, 0BFFDh
ja      loc_10014CEA
cmp     dx, 3FBFh
ja      short loc_10014B53
xor     eax, eax
jmp     short loc_10014B8D

loc_10014B53:
test    ax, ax
mov     edx, 7FFFFFFFh
jnz     short loc_10014B75
inc     [ebp+arg_0]
test    [esi+8], edx
jnz     short loc_10014B75
xor     eax, eax
cmp     [esi+4], eax
jnz     short loc_10014B77
cmp     [esi], eax
jnz     short loc_10014B77
jmp     loc_10014CE4

loc_10014B75:
xor     eax, eax

loc_10014B77:
cmp     cx, ax
jnz     short loc_10014B9A
inc     [ebp+arg_0]
test    [ebx+8], edx
jnz     short loc_10014B9A
cmp     [ebx+4], eax
jnz     short loc_10014B9A
cmp     [ebx], eax
jnz     short loc_10014B9A

loc_10014B8D:
mov     [esi+8], eax
mov     [esi+4], eax
mov     [esi], eax
jmp     loc_10014D05

loc_10014B9A:
mov     [ebp+var_10], eax
lea     eax, [ebp+var_20]
mov     [ebp+var_4], eax
mov     [ebp+arg_4], 5

loc_10014BAA:
mov     eax, [ebp+var_10]
add     eax, eax
cmp     [ebp+arg_4], 0
jle     short loc_10014BFE
add     eax, esi
lea     ecx, [ebx+8]
mov     [ebp+var_8], eax
mov     eax, [ebp+arg_4]
mov     [ebp+var_C], ecx
mov     [ebp+var_18], eax

loc_10014BC6:
mov     eax, [ebp+var_8]
mov     ecx, [ebp+var_C]
movzx   eax, word ptr [eax]
movzx   ecx, word ptr [ecx]
imul    eax, ecx
mov     ecx, [ebp+var_4]
add     ecx, 0FFFFFFFCh
push    ecx
push    eax
push    dword ptr [ecx]
call    sub_10013F98
add     esp, 0Ch
test    eax, eax
jz      short loc_10014BF1
mov     eax, [ebp+var_4]
inc     word ptr [eax]

loc_10014BF1:
add     [ebp+var_8], 2
sub     [ebp+var_C], 2
dec     [ebp+var_18]
jnz     short loc_10014BC6

loc_10014BFE:
add     [ebp+var_4], 2
inc     [ebp+var_10]
dec     [ebp+arg_4]
cmp     [ebp+arg_4], 0
jg      short loc_10014BAA
add     [ebp+arg_0], 0C002h
cmp     word ptr [ebp+arg_0], 0
jle     short loc_10014C41

loc_10014C1C:
test    byte ptr [ebp+var_1C+3], 80h
jnz     short loc_10014C3A
lea     eax, [ebp+var_24]
push    eax
call    sub_10014017
add     [ebp+arg_0], 0FFFFh
pop     ecx
cmp     word ptr [ebp+arg_0], 0
jg      short loc_10014C1C

loc_10014C3A:
cmp     word ptr [ebp+arg_0], 0
jg      short loc_10014C7A

loc_10014C41:
add     [ebp+arg_0], 0FFFFh
cmp     word ptr [ebp+arg_0], 0
jge     short loc_10014C7A
movsx   eax, word ptr [ebp+arg_0]
neg     eax
add     [ebp+arg_0], eax
mov     ebx, eax

loc_10014C5A:
test    byte ptr [ebp+var_24], 1
jz      short loc_10014C63
inc     [ebp+var_14]

loc_10014C63:
lea     eax, [ebp+var_24]
push    eax
call    sub_10014045
dec     ebx
pop     ecx
jnz     short loc_10014C5A
cmp     [ebp+var_14], 0
jz      short loc_10014C7A
or      byte ptr [ebp+var_24], 1

loc_10014C7A:
cmp     word ptr [ebp+var_24], 8000h
ja      short loc_10014C91
mov     eax, [ebp+var_24]
and     eax, 1FFFFh
cmp     eax, 18000h
jnz     short loc_10014CC6

loc_10014C91:
cmp     [ebp+var_24+2], 0FFFFFFFFh
jnz     short loc_10014CC3
and     [ebp+var_24+2], 0
cmp     [ebp+var_20+2], 0FFFFFFFFh
jnz     short loc_10014CBE
and     [ebp+var_20+2], 0
cmp     word ptr [ebp+var_1C+2], 0FFFFh
jnz     short loc_10014CB8
inc     [ebp+arg_0]
mov     word ptr [ebp+var_1C+2], 8000h
jmp     short loc_10014CC6

loc_10014CB8:
inc     word ptr [ebp+var_1C+2]
jmp     short loc_10014CC6

loc_10014CBE:
inc     [ebp+var_20+2]
jmp     short loc_10014CC6

loc_10014CC3:
inc     [ebp+var_24+2]

loc_10014CC6:
mov     eax, [ebp+arg_0]
cmp     ax, 7FFFh
jnb     short loc_10014CEA
mov     cx, word ptr [ebp+var_24+2]
or      eax, edi
mov     [esi], cx
mov     ecx, [ebp+var_20]
mov     [esi+2], ecx
mov     ecx, [ebp+var_1C]
mov     [esi+6], ecx

loc_10014CE4:
mov     [esi+0Ah], ax
jmp     short loc_10014D05

loc_10014CEA:
neg     di
sbb     edi, edi
and     dword ptr [esi+4], 0
and     edi, 80000000h
add     edi, 7FFF8000h
and     dword ptr [esi], 0
mov     [esi+8], edi

loc_10014D05:
pop     edi
pop     esi
pop     ebx
leave
retn
sub_10014AEA endp



; Attributes: bp-based frame

sub_10014D0A proc near

var_C= byte ptr -0Ch
var_A= dword ptr -0Ah
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
sub     esp, 0Ch
push    ebx
mov     ebx, offset unk_1001AFF0
xor     ecx, ecx
sub     ebx, 60h
cmp     [ebp+arg_4], ecx
jz      short loc_10014D83
jge     short loc_10014D32
mov     eax, [ebp+arg_4]
mov     ebx, offset unk_1001B150
neg     eax
mov     [ebp+arg_4], eax
sub     ebx, 60h

loc_10014D32:
cmp     [ebp+arg_8], ecx
jnz     short loc_10014D3D
mov     eax, [ebp+arg_0]
mov     [eax], cx

loc_10014D3D:
cmp     [ebp+arg_4], ecx
jz      short loc_10014D83
push    esi
push    edi

loc_10014D44:
mov     eax, [ebp+arg_4]
add     ebx, 54h
sar     [ebp+arg_4], 3
and     eax, 7
cmp     eax, ecx
jz      short loc_10014D7C
lea     eax, [eax+eax*2]
cmp     word ptr [ebx+eax*4], 8000h
lea     esi, [ebx+eax*4]
jb      short loc_10014D6F
lea     edi, [ebp+var_C]
movsd
movsd
movsd
dec     [ebp+var_A]
lea     esi, [ebp+var_C]

loc_10014D6F:
push    esi
push    [ebp+arg_0]
call    sub_10014AEA
pop     ecx
pop     ecx
xor     ecx, ecx

loc_10014D7C:
cmp     [ebp+arg_4], ecx
jnz     short loc_10014D44
pop     edi
pop     esi

loc_10014D83:
pop     ebx
leave
retn
sub_10014D0A endp

align 10h
push    ebp
mov     ebp, esp
push    edi
push    esi
push    ebx
mov     esi, [ebp+0Ch]
mov     edi, [ebp+8]
lea     eax, unk_1001B624
cmp     dword ptr [eax+8], 0
jnz     short loc_10014DE3
mov     al, 0FFh
mov     edi, edi

loc_10014DAC:
or      al, al
jz      short loc_10014DDE
mov     al, [esi]
inc     esi
mov     ah, [edi]
inc     edi
cmp     ah, al
jz      short loc_10014DAC
sub     al, 41h
cmp     al, 1Ah
sbb     cl, cl
and     cl, 20h
add     al, cl
add     al, 41h
xchg    ah, al
sub     al, 41h
cmp     al, 1Ah
sbb     cl, cl
and     cl, 20h
add     al, cl
add     al, 41h
cmp     al, ah
jz      short loc_10014DAC
sbb     al, al
sbb     al, 0FFh

loc_10014DDE:
movsx   eax, al
jmp     short loc_10014E5B

loc_10014DE3:
lock inc Addend
cmp     dword_1001B788, 0
jg      short loc_10014DF7
push    0
jmp     short loc_10014E0C

loc_10014DF7:
lock dec Addend
push    13h
call    sub_1001039A
mov     dword ptr [esp], 1

loc_10014E0C:
mov     eax, 0FFh
xor     ebx, ebx
nop

loc_10014E14:
or      al, al
jz      short loc_10014E3F
mov     al, [esi]
inc     esi
mov     bl, [edi]
inc     edi
cmp     al, bl
jz      short loc_10014E14
push    eax
push    ebx
call    sub_100119BA
mov     ebx, eax
add     esp, 4
call    sub_100119BA
add     esp, 4
cmp     bl, al
jz      short loc_10014E14
sbb     eax, eax
sbb     eax, 0FFFFFFFFh

loc_10014E3F:
mov     ebx, eax
pop     eax
or      eax, eax
jnz     short loc_10014E4F
lock dec Addend
jmp     short loc_10014E59

loc_10014E4F:
push    13h
call    sub_100103FB
add     esp, 4

loc_10014E59:
mov     eax, ebx

loc_10014E5B:
pop     ebx
pop     esi
pop     edi
leave
retn


; Attributes: bp-based frame

sub_10014E60 proc near

var_10= dword ptr -10h
arg_0= dword ptr  8
arg_4= dword ptr  0Ch
arg_8= dword ptr  10h

push    ebp
mov     ebp, esp
push    edi
push    esi
push    ebx
mov     ecx, [ebp+arg_8]
or      ecx, ecx
jz      loc_10014F5A
mov     esi, [ebp+arg_0]
mov     edi, [ebp+arg_4]
lea     eax, unk_1001B624
cmp     dword ptr [eax+8], 0
jnz     short loc_10014ED1
mov     bh, 41h
mov     bl, 5Ah
mov     dh, 20h
lea     ecx, [ecx+0]

loc_10014E8C:
mov     ah, [esi]
or      ah, ah
mov     al, [edi]
jz      short loc_10014EB5
or      al, al
jz      short loc_10014EB5
inc     esi
inc     edi
cmp     ah, bh
jb      short loc_10014EA4
cmp     ah, bl
ja      short loc_10014EA4
add     ah, dh

loc_10014EA4:
cmp     al, bh
jb      short loc_10014EAE
cmp     al, bl
ja      short loc_10014EAE
add     al, dh

loc_10014EAE:
cmp     ah, al
jnz     short loc_10014EBF
dec     ecx
jnz     short loc_10014E8C

loc_10014EB5:
xor     ecx, ecx
cmp     ah, al
jz      loc_10014F5A

loc_10014EBF:
mov     ecx, 0FFFFFFFFh
jb      loc_10014F5A
neg     ecx
jmp     loc_10014F5A

loc_10014ED1:
lock inc Addend
cmp     dword_1001B788, 0
jg      short loc_10014EE5
push    0
jmp     short loc_10014EFE

loc_10014EE5:
lock dec Addend
mov     ebx, ecx
push    13h
call    sub_1001039A
mov     [esp+10h+var_10], 1
mov     ecx, ebx

loc_10014EFE:
xor     eax, eax
xor     ebx, ebx
mov     edi, edi

loc_10014F04:
mov     al, [esi]
or      eax, eax
mov     bl, [edi]
jz      short loc_10014F2F
or      ebx, ebx
jz      short loc_10014F2F
inc     esi
inc     edi
push    ecx
push    eax             ; SrcStr
push    ebx             ; SrcStr
call    sub_100119BA
mov     ebx, eax
add     esp, 4
call    sub_100119BA
add     esp, 4
pop     ecx
cmp     eax, ebx
jnz     short loc_10014F35
dec     ecx
jnz     short loc_10014F04

loc_10014F2F:
xor     ecx, ecx
cmp     eax, ebx
jz      short loc_10014F3E

loc_10014F35:
mov     ecx, 0FFFFFFFFh
jb      short loc_10014F3E
neg     ecx

loc_10014F3E:
pop     eax
or      eax, eax
jnz     short loc_10014F4C
lock dec Addend
jmp     short loc_10014F5A

loc_10014F4C:
mov     ebx, ecx
push    13h
call    sub_100103FB
add     esp, 4
mov     ecx, ebx

loc_10014F5A:
mov     eax, ecx
pop     ebx
pop     esi
pop     edi
leave
retn
sub_10014E60 endp

align 10h
push    ebx
push    esi
mov     eax, [esp+18h]
or      eax, eax
jnz     short loc_10014F92
mov     ecx, [esp+14h]
mov     eax, [esp+10h]
xor     edx, edx
div     ecx
mov     ebx, eax
mov     eax, [esp+0Ch]
div     ecx
mov     edx, ebx
jmp     short loc_10014FD3

loc_10014F92:
mov     ecx, eax
mov     ebx, [esp+14h]
mov     edx, [esp+10h]
mov     eax, [esp+0Ch]

loc_10014FA0:
shr     ecx, 1
rcr     ebx, 1
shr     edx, 1
rcr     eax, 1
or      ecx, ecx
jnz     short loc_10014FA0
div     ebx
mov     esi, eax
mul     dword ptr [esp+18h]
mov     ecx, eax
mov     eax, [esp+14h]
mul     esi
add     edx, ecx
jb      short loc_10014FCE
cmp     edx, [esp+10h]
ja      short loc_10014FCE
jb      short loc_10014FCF
cmp     eax, [esp+0Ch]
jbe     short loc_10014FCF

loc_10014FCE:
dec     esi

loc_10014FCF:
xor     edx, edx
mov     eax, esi

loc_10014FD3:
pop     esi
pop     ebx
retn    10h
align 10h
push    ebx
mov     eax, [esp+14h]
or      eax, eax
jnz     short loc_10015001
mov     ecx, [esp+10h]
mov     eax, [esp+0Ch]
xor     edx, edx
div     ecx
mov     eax, [esp+8]
div     ecx
mov     eax, edx
xor     edx, edx
jmp     short loc_10015051

loc_10015001:
mov     ecx, eax
mov     ebx, [esp+10h]
mov     edx, [esp+0Ch]
mov     eax, [esp+8]

loc_1001500F:
shr     ecx, 1
rcr     ebx, 1
shr     edx, 1
rcr     eax, 1
or      ecx, ecx
jnz     short loc_1001500F
div     ebx
mov     ecx, eax
mul     dword ptr [esp+14h]
xchg    eax, ecx
mul     dword ptr [esp+10h]
add     edx, ecx
jb      short loc_1001503A
cmp     edx, [esp+0Ch]
ja      short loc_1001503A
jb      short loc_10015042
cmp     eax, [esp+8]
jbe     short loc_10015042

loc_1001503A:
sub     eax, [esp+10h]
sbb     edx, [esp+14h]

loc_10015042:
sub     eax, [esp+8]
sbb     edx, [esp+0Ch]
neg     edx
neg     eax
sbb     edx, 0

loc_10015051:
pop     ebx
retn    10h
align 10h
; [00000006 BYTES: COLLAPSED FUNCTION RtlUnwind. PRESS CTRL-NUMPAD+ TO EXPAND]
align 1000h
_text ends

; Section 2. (virtual address 00016000)
; Virtual size                  : 00001F7E (   8062.)
; Section size in file          : 00002000 (   8192.)
; Offset to raw data for section: 00016000
; Flags 40000040: Data Readable
; Alignment     : default
;
; Imports from KERNEL32.dll
;

; Segment type: Externs
; _idata
; LPVOID __stdcall TlsGetValue(DWORD dwTlsIndex)
extrn TlsGetValue:dword
; DWORD __stdcall GetLastError()
extrn GetLastError:dword
; FARPROC __stdcall GetProcAddress(HMODULE hModule, LPCSTR lpProcName)
extrn GetProcAddress:dword
; HMODULE __stdcall LoadLibraryA(LPCSTR lpLibFileName)
extrn LoadLibraryA:dword
; BOOL __stdcall GetVersionExA(LPOSVERSIONINFOA lpVersionInformation)
extrn GetVersionExA:dword
; BOOL __stdcall FreeLibrary(HMODULE hLibModule)
extrn FreeLibrary:dword
; BOOL __stdcall HeapFree(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem)
extrn HeapFree:dword
; LPVOID __stdcall HeapAlloc(HANDLE hHeap, DWORD dwFlags, SIZE_T dwBytes)
extrn HeapAlloc:dword
; LPSTR __stdcall GetCommandLineA()
extrn GetCommandLineA:dword
; DWORD __stdcall GetVersion()
extrn GetVersion:dword
; HMODULE __stdcall GetModuleHandleA(LPCSTR lpModuleName)
extrn GetModuleHandleA:dword
; void __stdcall RaiseException(DWORD dwExceptionCode, DWORD dwExceptionFlags, DWORD nNumberOfArguments, const ULONG_PTR *lpArguments)
extrn RaiseException:dword
; DWORD __stdcall GetModuleFileNameA(HMODULE hModule, LPSTR lpFilename, DWORD nSize)
extrn GetModuleFileNameA:dword
; DWORD __stdcall GetEnvironmentVariableA(LPCSTR lpName, LPSTR lpBuffer, DWORD nSize)
extrn GetEnvironmentVariableA:dword
; BOOL __stdcall HeapDestroy(HANDLE hHeap)
extrn HeapDestroy:dword
; HANDLE __stdcall HeapCreate(DWORD flOptions, SIZE_T dwInitialSize, SIZE_T dwMaximumSize)
extrn HeapCreate:dword
; BOOL __stdcall VirtualFree(LPVOID lpAddress, SIZE_T dwSize, DWORD dwFreeType)
extrn VirtualFree:dword
; LPVOID __stdcall VirtualAlloc(LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, DWORD flProtect)
extrn VirtualAlloc:dword
; LPVOID __stdcall HeapReAlloc(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem, SIZE_T dwBytes)
extrn HeapReAlloc:dword
; void __stdcall InitializeCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
extrn InitializeCriticalSection:dword
; void __stdcall DeleteCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
extrn DeleteCriticalSection:dword
; void __stdcall EnterCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
extrn EnterCriticalSection:dword
; void __stdcall LeaveCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
extrn LeaveCriticalSection:dword
; void __stdcall __noreturn ExitProcess(UINT uExitCode)
extrn ExitProcess:dword
; void __stdcall RtlUnwind(PVOID TargetFrame, PVOID TargetIp, PEXCEPTION_RECORD ExceptionRecord, PVOID ReturnValue)
extrn __imp_RtlUnwind:dword
; BOOL __stdcall TerminateProcess(HANDLE hProcess, UINT uExitCode)
extrn TerminateProcess:dword
; HANDLE __stdcall GetCurrentProcess()
extrn GetCurrentProcess:dword
; DWORD __stdcall GetCurrentThreadId()
extrn GetCurrentThreadId:dword
; BOOL __stdcall TlsSetValue(DWORD dwTlsIndex, LPVOID lpTlsValue)
extrn TlsSetValue:dword
; DWORD __stdcall TlsAlloc()
extrn TlsAlloc:dword
; BOOL __stdcall TlsFree(DWORD dwTlsIndex)
extrn TlsFree:dword
; void __stdcall SetLastError(DWORD dwErrCode)
extrn SetLastError:dword
; BOOL __stdcall GetStringTypeW(DWORD dwInfoType, LPCWSTR lpSrcStr, int cchSrc, LPWORD lpCharType)
extrn GetStringTypeW:dword
; UINT __stdcall SetHandleCount(UINT uNumber)
extrn SetHandleCount:dword
; HANDLE __stdcall GetStdHandle(DWORD nStdHandle)
extrn GetStdHandle:dword
; DWORD __stdcall GetFileType(HANDLE hFile)
extrn GetFileType:dword
; void __stdcall GetStartupInfoA(LPSTARTUPINFOA lpStartupInfo)
extrn GetStartupInfoA:dword
; BOOL __stdcall FreeEnvironmentStringsA(LPCH)
extrn FreeEnvironmentStringsA:dword
; BOOL __stdcall FreeEnvironmentStringsW(LPWCH)
extrn FreeEnvironmentStringsW:dword
; int __stdcall WideCharToMultiByte(UINT CodePage, DWORD dwFlags, LPCWSTR lpWideCharStr, int cchWideChar, LPSTR lpMultiByteStr, int cbMultiByte, LPCSTR lpDefaultChar, LPBOOL lpUsedDefaultChar)
extrn WideCharToMultiByte:dword
; LPCH __stdcall GetEnvironmentStrings()
extrn GetEnvironmentStrings:dword
; LPWCH __stdcall GetEnvironmentStringsW()
extrn GetEnvironmentStringsW:dword
; BOOL __stdcall WriteFile(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped)
extrn WriteFile:dword
; LONG __stdcall InterlockedDecrement(volatile LONG *lpAddend)
extrn InterlockedDecrement:dword
; LONG __stdcall InterlockedIncrement(volatile LONG *lpAddend)
extrn InterlockedIncrement:dword
; int __stdcall MultiByteToWideChar(UINT CodePage, DWORD dwFlags, LPCSTR lpMultiByteStr, int cbMultiByte, LPWSTR lpWideCharStr, int cchWideChar)
extrn MultiByteToWideChar:dword
; BOOL __stdcall GetStringTypeA(LCID Locale, DWORD dwInfoType, LPCSTR lpSrcStr, int cchSrc, LPWORD lpCharType)
extrn GetStringTypeA:dword
; int __stdcall LCMapStringW(LCID Locale, DWORD dwMapFlags, LPCWSTR lpSrcStr, int cchSrc, LPWSTR lpDestStr, int cchDest)
extrn LCMapStringW:dword
; BOOL __stdcall GetCPInfo(UINT CodePage, LPCPINFO lpCPInfo)
extrn GetCPInfo:dword
; UINT __stdcall GetACP()
extrn GetACP:dword
; UINT __stdcall GetOEMCP()
extrn GetOEMCP:dword
; int __stdcall LCMapStringA(LCID Locale, DWORD dwMapFlags, LPCSTR lpSrcStr, int cchSrc, LPSTR lpDestStr, int cchDest)
extrn LCMapStringA:dword

;
; Imports from WINMM.dll
;
; MMRESULT __stdcall timeEndPeriod(UINT uPeriod)
extrn timeEndPeriod:dword
; MMRESULT __stdcall timeBeginPeriod(UINT uPeriod)
extrn timeBeginPeriod:dword
; DWORD __stdcall timeGetTime()
extrn timeGetTime:dword



; Segment type: Pure data
; Segment permissions: Read
_rdata segment para public 'DATA' use32
assume cs:_rdata
;org 100160E4h
align 10h
dbl_100160F0 dq 1.0
dbl_100160F8 dq 0.0
dbl_10016100 dq -1.0
dbl_10016108 dq 8.0e8
dbl_10016110 dq 2.0e9
dbl_10016118 dq 3.0
dbl_10016120 dq 3.4e9
dbl_10016128 dq 8.5e9
dbl_10016130 dq 1.6e9
dbl_10016138 dq 100000.0
word_10016140 dw 0C350h
align 4
dword_10016144 dd 1F5h
word_10016148 dw 1F5h
align 10h
dbl_10016150 dq 1000.0
dbl_10016158 dq -3.0
dbl_10016160 dq 128.0
dbl_10016168 dq -1000.0
dbl_10016170 dq 20.0
dbl_10016178 dq 10.0
dbl_10016180 dq 0.001
dbl_10016188 dq 1.0e9
dbl_10016190 dq 0.9999999899999999
stru_10016198 _SCOPETABLE_ENTRY <0FFFFFFFFh, 0, \ ; SEH scope table for function 1000D97B
                   offset loc_1000D9E5>
_SCOPETABLE_ENTRY <0FFFFFFFFh, 0, \
                   offset loc_1000DA3D>
stru_100161B0 _SCOPETABLE_ENTRY <0FFFFFFFFh, 0, \ ; SEH scope table for function 1000DAA2
                   offset loc_1000DB09>
_SCOPETABLE_ENTRY <0FFFFFFFFh, 0, \
                   offset loc_1000DB65>
dbl_100161C8 dq 4195835.0
dbl_100161D0 dq 3145727.0
; CHAR ProcName[]
ProcName db 'IsProcessorFeaturePresent',0
align 4
; CHAR ModuleName[]
ModuleName db 'KERNEL32',0
align 10h
aE000 db 'e+000',0
align 4
aYn db '_yn',0
aY1 db '_y1',0
aY0 db '_y0',0
aFrexp db 'frexp',0
align 4
aFmod db 'fmod',0
align 4
aHypot db '_hypot',0
align 4
aCabs db '_cabs',0
align 4
aLdexp db 'ldexp',0
align 4
aModf db 'modf',0
align 4
aFabs db 'fabs',0
align 4
aFloor db 'floor',0
align 4
aCeil db 'ceil',0
align 4
aTan db 'tan',0
aCos db 'cos',0
aSin db 'sin',0
aSqrt_0 db 'sqrt',0
align 10h
aAtan2 db 'atan2',0
align 4
aAtan db 'atan',0
align 10h
aAcos db 'acos',0
align 4
aAsin db 'asin',0
align 10h
aTanh db 'tanh',0
align 4
aCosh db 'cosh',0
align 10h
aSinh db 'sinh',0
align 4
aLog10_0 db 'log10',0
align 10h
aLog db 'log',0
aPow db 'pow',0
aExp db 'exp',0
aGlobalHeapSele db '__GLOBAL_HEAP_SELECTED',0
align 4
; CHAR Name[]
Name db '__MSVCRT_HEAP_SELECT',0
align 10h
dbl_100162F0 dq 1.0
word_100162F8 dw 27Fh
db  35h ; 5
db 0C2h ; Â
db  68h ; h
db  21h ; !
db 0A2h ; ¢
db 0DAh ; Ú
db  0Fh
db 0C9h ; É
db  3Eh ; >
db  40h ; @
dbl_10016304 dq 1.797693134862316e308
dbl_1001630C dq 2.225073858507201e-308
dbl_10016314 dq -1536.0
dbl_1001631C dq 1536.0
dbl_10016324 dq 1.797693134862316e308
dbl_1001632C dq 0.0
align 8
dbl_10016338 dq 2.0
aRuntimeError db 'runtime error ',0
align 10h
asc_10016350 db 0Dh,0Ah,0
align 4
aTlossError db 'TLOSS error',0Dh,0Ah,0
align 4
aSingError db 'SING error',0Dh,0Ah,0
align 4
aDomainError db 'DOMAIN error',0Dh,0Ah,0
align 4
aR6028UnableToI db 'R6028',0Dh,0Ah
db '- unable to initialize heap',0Dh,0Ah
db 0
align 4
aR6027NotEnough db 'R6027',0Dh,0Ah
db '- not enough space for lowio initia'
db 'lization',0Dh,0Ah,0
align 4
aR6026NotEnough db 'R6026',0Dh,0Ah
db '- not enough space for stdio initia'
db 'lization',0Dh,0Ah,0
align 4
aR6025PureVirtu db 'R6025',0Dh,0Ah
db '- pure virtual function call',0Dh,0Ah
db 0
align 4
aR6024NotEnough db 'R6024',0Dh,0Ah
db '- not enough space for _onexit/atex'
db 'it table',0Dh,0Ah,0
align 4
aR6019UnableToO db 'R6019',0Dh,0Ah
db '- unable to open console device',0Dh
db 0Ah,0
align 4
aR6018Unexpecte db 'R6018',0Dh,0Ah
db '- unexpected heap error',0Dh,0Ah,0
align 4
aR6017Unexpecte db 'R6017',0Dh,0Ah
db '- unexpected multithread lock error'
db 0Dh,0Ah,0
align 4
aR6016NotEnough db 'R6016',0Dh,0Ah
db '- not enough space for thread data',0Dh
db 0Ah,0
aAbnormalProgra db 0Dh,0Ah
db 'abnormal program termination',0Dh,0Ah
db 0
align 4
aR6009NotEnough db 'R6009',0Dh,0Ah
db '- not enough space for environment',0Dh
db 0Ah,0
aR6008NotEnough db 'R6008',0Dh,0Ah
db '- not enough space for arguments',0Dh
db 0Ah,0
align 4
aR6002FloatingP db 'R6002',0Dh,0Ah
db '- floating point not loaded',0Dh,0Ah
db 0
align 4
aMicrosoftVisua db 'Microsoft Visual C++ Runtime Librar'
db 'y',0
align 4
asc_100165F4 db 0Ah
db 0Ah,0
align 4
aRuntimeErrorPr db 'Runtime Error!',0Ah
db 0Ah
db 'Program: ',0
align 4
asc_10016614 db '...',0
aProgramNameUnk db '<program name unknown>',0
align 10h
; CHAR byte_10016630[4]
byte_10016630 db 4 dup(0)
; const WCHAR SrcStr
SrcStr dw 0
align 4
stru_10016638 _SCOPETABLE_ENTRY <0FFFFFFFFh, \ ; SEH scope table for function 1001239E
                   offset loc_10012497, \
                   offset loc_1001249B>
align 8
stru_10016648 _SCOPETABLE_ENTRY <0FFFFFFFFh, 0, \ ; SEH scope table for function 1001378F
                   offset loc_10013823>
_SCOPETABLE_ENTRY <0FFFFFFFFh, 0, \
                   offset loc_100138AC>
; CHAR aGetlastactivep[]
aGetlastactivep db 'GetLastActivePopup',0
align 4
; CHAR aGetactivewindo[]
aGetactivewindo db 'GetActiveWindow',0
; CHAR aMessageboxa[]
aMessageboxa db 'MessageBoxA',0
; CHAR LibFileName[]
LibFileName db 'user32.dll',0
align 10h
stru_100166A0 _SCOPETABLE_ENTRY <0FFFFFFFFh, \ ; SEH scope table for function 10013D49
                   offset loc_10013E59, \
                   offset loc_10013E5D>
_SCOPETABLE_ENTRY <0FFFFFFFFh, \
                   offset loc_10013F0D, \
                   offset loc_10013F11>
a1Qnan db '1#QNAN',0
align 10h
a1Inf db '1#INF',0
align 4
a1Ind db '1#IND',0
align 10h
a1Snan db '1#SNAN',0
align 4
aHMmSs db 'H:mm:ss',0
aDdddMmmmDdYyyy db 'dddd, MMMM dd, yyyy',0
aMDYy db 'M/d/yy',0
align 4
aPm db 'PM',0
align 10h
aAm db 'AM',0
align 4
aDecember db 'December',0
align 10h
aNovember db 'November',0
align 4
aOctober db 'October',0
aSeptember db 'September',0
align 10h
aAugust db 'August',0
align 4
aJuly db 'July',0
align 10h
aJune db 'June',0
align 4
aApril db 'April',0
align 10h
aMarch db 'March',0
align 4
aFebruary db 'February',0
align 4
aJanuary db 'January',0
aDec db 'Dec',0
aNov db 'Nov',0
aOct db 'Oct',0
aSep db 'Sep',0
aAug db 'Aug',0
aJul db 'Jul',0
aJun db 'Jun',0
aMay db 'May',0
aApr db 'Apr',0
aMar db 'Mar',0
aFeb db 'Feb',0
aJan db 'Jan',0
aSaturday db 'Saturday',0
align 4
aFriday db 'Friday',0
align 10h
aThursday db 'Thursday',0
align 4
aWednesday db 'Wednesday',0
align 4
aTuesday db 'Tuesday',0
aMonday db 'Monday',0
align 4
aSunday db 'Sunday',0
align 10h
aSat db 'Sat',0
aFri db 'Fri',0
aThu db 'Thu',0
aWed db 'Wed',0
aTue db 'Tue',0
aMon db 'Mon',0
aSun db 'Sun',0
aSunmontuewedth db 'SunMonTueWedThuFriSat',0
align 4
aJanfebmaraprma db 'JanFebMarAprMayJunJulAugSepOctNovDe'
db 'c',0
align 4
__IMPORT_DESCRIPTOR_WINMM dd rva off_1001694C ; Import Name Table
dd 0                    ; Time stamp
dd 0                    ; Forwarder Chain
dd rva aWinmmDll        ; DLL Name
dd rva timeEndPeriod    ; Import Address Table
__IMPORT_DESCRIPTOR_KERNEL32 dd rva off_10016878 ; Import Name Table
dd 0                    ; Time stamp
dd 0                    ; Forwarder Chain
dd rva aKernel32Dll     ; DLL Name
dd rva TlsGetValue      ; Import Address Table
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
;
; Import names for KERNEL32.dll
;
off_10016878 dd rva word_10016B9C
dd rva word_10016BAA
dd rva word_10016996
dd rva word_100169A8
dd rva word_100169B8
dd rva word_100169C8
dd rva word_100169D6
dd rva word_100169E2
dd rva word_100169EE
dd rva word_10016A00
dd rva word_10016A0E
dd rva word_10016A22
dd rva word_10016A34
dd rva word_10016A4A
dd rva word_10016A64
dd rva word_10016A72
dd rva word_10016A80
dd rva word_10016A8E
dd rva word_10016A9E
dd rva word_10016AAC
dd rva word_10016AC8
dd rva word_10016AE0
dd rva word_10016AF8
dd rva word_10016B10
dd rva word_10016B1E
dd rva word_10016B2A
dd rva word_10016B3E
dd rva word_10016B52
dd rva word_10016B68
dd rva word_10016B76
dd rva word_10016B82
dd rva word_10016B8C
dd rva word_10016CDC
dd rva word_10016BBA
dd rva word_10016BCC
dd rva word_10016BDC
dd rva word_10016BEA
dd rva word_10016BFC
dd rva word_10016C16
dd rva word_10016C30
dd rva word_10016C46
dd rva word_10016C5E
dd rva word_10016C78
dd rva word_10016C84
dd rva word_10016C9C
dd rva word_10016CB4
dd rva word_10016CCA
dd rva word_10016D20
dd rva word_10016CEE
dd rva word_10016CFA
dd rva word_10016D04
dd rva word_10016D10
dd 0
;
; Import names for WINMM.dll
;
off_1001694C dd rva word_1001695C
dd rva word_1001697A
dd rva word_1001696C
dd 0
word_1001695C dw 95h
db 'timeEndPeriod',0
word_1001696C dw 98h
db 'timeGetTime',0
word_1001697A dw 94h
db 'timeBeginPeriod',0
aWinmmDll db 'WINMM.dll',0
word_10016996 dw 13Eh
db 'GetProcAddress',0
align 4
word_100169A8 dw 1C2h
db 'LoadLibraryA',0
align 4
word_100169B8 dw 175h
db 'GetVersionExA',0
word_100169C8 dw 0B4h
db 'FreeLibrary',0
word_100169D6 dw 19Fh
db 'HeapFree',0
align 2
word_100169E2 dw 199h
db 'HeapAlloc',0
word_100169EE dw 0CAh
db 'GetCommandLineA',0
word_10016A00 dw 174h
db 'GetVersion',0
align 2
word_10016A0E dw 126h
db 'GetModuleHandleA',0
align 2
word_10016A22 dw 20Bh
db 'RaiseException',0
align 4
word_10016A34 dw 124h
db 'GetModuleFileNameA',0
align 2
word_10016A4A dw 109h
db 'GetEnvironmentVariableA',0
word_10016A64 dw 19Dh
db 'HeapDestroy',0
word_10016A72 dw 19Bh
db 'HeapCreate',0
align 10h
word_10016A80 dw 2BFh
db 'VirtualFree',0
word_10016A8E dw 2BBh
db 'VirtualAlloc',0
align 2
word_10016A9E dw 1A2h
db 'HeapReAlloc',0
word_10016AAC dw 1AAh
db 'InitializeCriticalSection',0
word_10016AC8 dw 55h
db 'DeleteCriticalSection',0
word_10016AE0 dw 66h
db 'EnterCriticalSection',0
align 4
word_10016AF8 dw 1C1h
db 'LeaveCriticalSection',0
align 10h
word_10016B10 dw 7Dh
db 'ExitProcess',0
word_10016B1E dw 22Fh
db 'RtlUnwind',0
word_10016B2A dw 29Eh
db 'TerminateProcess',0
align 2
word_10016B3E dw 0F7h
db 'GetCurrentProcess',0
word_10016B52 dw 0FAh
db 'GetCurrentThreadId',0
align 4
word_10016B68 dw 2A5h
db 'TlsSetValue',0
word_10016B76 dw 2A2h
db 'TlsAlloc',0
align 2
word_10016B82 dw 2A3h
db 'TlsFree',0
word_10016B8C dw 271h
db 'SetLastError',0
align 4
word_10016B9C dw 2A4h
db 'TlsGetValue',0
word_10016BAA dw 11Ah
db 'GetLastError',0
align 2
word_10016BBA dw 26Dh
db 'SetHandleCount',0
align 4
word_10016BCC dw 152h
db 'GetStdHandle',0
align 4
word_10016BDC dw 115h
db 'GetFileType',0
word_10016BEA dw 150h
db 'GetStartupInfoA',0
word_10016BFC dw 0B2h
db 'FreeEnvironmentStringsA',0
word_10016C16 dw 0B3h
db 'FreeEnvironmentStringsW',0
word_10016C30 dw 2D2h
db 'WideCharToMultiByte',0
word_10016C46 dw 106h
db 'GetEnvironmentStrings',0
word_10016C5E dw 108h
db 'GetEnvironmentStringsW',0
align 4
word_10016C78 dw 2DFh
db 'WriteFile',0
word_10016C84 dw 1ADh
db 'InterlockedDecrement',0
align 4
word_10016C9C dw 1B0h
db 'InterlockedIncrement',0
align 4
word_10016CB4 dw 1E4h
db 'MultiByteToWideChar',0
word_10016CCA dw 153h
db 'GetStringTypeA',0
align 4
word_10016CDC dw 156h
db 'GetStringTypeW',0
align 2
word_10016CEE dw 0BFh
db 'GetCPInfo',0
word_10016CFA dw 0B9h
db 'GetACP',0
align 4
word_10016D04 dw 131h
db 'GetOEMCP',0
align 10h
word_10016D10 dw 1BFh
db 'LCMapStringA',0
align 10h
word_10016D20 dw 1C0h
db 'LCMapStringW',0
align 10h
aKernel32Dll db 'KERNEL32.dll',0
align 10h
;
; Export directory for mtcsa32.dll
;
dd 0                    ; Characteristics
dd 38E0D1D8h            ; TimeDateStamp: Tue Mar 28 15:38:00 2000
dw 0                    ; MajorVersion
dw 0                    ; MinorVersion
dd rva aMtcsa32Dll      ; Name
dd 1                    ; Base
dd 0C5h                 ; NumberOfFunctions
dd 0C5h                 ; NumberOfNames
dd rva off_10016D68     ; AddressOfFunctions
dd rva off_1001707C     ; AddressOfNames
dd rva word_10017390    ; AddressOfNameOrdinals
;
; Export Address Table for mtcsa32.dll
;
off_10016D68 dd rva BreakSweep, rva CalcRBWCode, rva CalcVBWCode
dd rva CheckForFreqpts, rva CheckForMinMax
dd rva CheckHWStatus, rva CheckSWStatNoTO
dd rva CheckSWStatus, rva ClearDataFIFO
dd rva ClearFuncStatusCode, rva CloseSession
dd rva CommInterrupts, rva CommTrigDetect
dd rva ConfigStartFreq, rva ConfigStepSize
dd rva ConfigStopFreq, rva ConfigTrigFreq
dd rva ConfigZspanFreq, rva Copy9052Struct
dd rva DefltSetTimeRBW, rva DefltSetTimeVBW
dd rva DelayOps, rva FindEquivDbmRef, rva FindHighPeak
dd rva FindIdxForSwpFreq, rva FindNextPeak
dd rva FreqInRange, rva FuncStatusFromEngineReply
dd rva GetAmplData, rva GetAmplForDbm, rva GetAmplFornV
dd rva GetAmplWithFreqExt, rva GetCalPoint
dd rva GetCalPointExt, rva GetCodeForRatio
dd rva GetDbmForAmpl, rva GetDbmForVoltage
dd rva GetEngineReplyCode, rva GetErrorStatus
dd rva GetFuncStatusCode, rva GetMinMaxAmpl
dd rva GetMinMaxAmplWithFreqExt, rva GetRBWString
dd rva GetRBWwide, rva GetRatioForCode, rva GetTraceData
dd rva GetVBWString, rva GetnVForAmpl, rva GetnVForDbm
dd rva IdQuery, rva IeTimer, rva IeTimerFrom
dd rva InitDataCapSweep, rva InitDataCapZspan
dd rva InitEngine, rva InitFreqHop, rva InitGuiSweep
dd rva InitGuiZspan, rva InitInstrData, rva InitTimeoutLoop
dd rva IsCalibrated, rva IsSweeping, rva IsValidInit
dd rva IsValidStep, rva LoadHopTable, rva LoadHopTableExt
dd rva MeasureAmplData, rva MeasureAmplWithFreq
dd rva MeasureMinMaxAmpl, rva MeasureMinMaxAmplWithFreq
dd rva OpenSession, rva OverRideSetTime
dd rva PulseGetMinMax, rva PulseMeasure
dd rva PulseSigPresent, rva RBWCodeFromFreq
dd rva RBWFreqFromCode, rva RdAttenuatr
dd rva RdAutoCell, rva RdCellMode, rva RdCommDelay
dd rva RdCommHandle, rva RdCommInitString
dd rva RdCommNumber, rva RdDefltPts, rva RdDetect
dd rva RdDetectCode, rva RdDwellTime, rva RdEngOption
dd rva RdEngineModel, rva RdErrorStatus
dd rva RdExternRef, rva RdFiltRatio, rva RdHopTabCnt
dd rva RdInterfaceType, rva RdIntrCode, rva RdIrqNum
dd rva RdLinRefLevel, rva RdLinearAttn, rva RdLogAddr
dd rva RdMaxAttLimit, rva RdMaxFreqLimit
dd rva RdMinAttLimit, rva RdMinFreqLimit
dd rva RdNumCells, rva RdNumDataPts, rva RdNumSwpPts
dd rva RdPortNum, rva RdPreamp, rva RdRBW
dd rva RdRBWmode, rva RdRefLevel, rva RdSessionHandle
dd rva RdSessionString, rva RdSettleTime
dd rva RdSweepCode, rva RdSwpIdx, rva RdSwpTime
dd rva RdTimeoutWait, rva RdTrigDelay, rva RdTrigMode
dd rva RdTrigThrsh, rva RdVBW, rva RdVBWmode
dd rva RdZCellSize, rva RdZSamplCnt, rva RdZSamplDvdr
dd rva RdZSamplRate, rva RdZspanFreq, rva ReadCellPtFreq
dd rva ReadStartFreq, rva ReadStepSize, rva ReadStopFreq
dd rva ReadSwpPtFreq, rva ReadTrigFreq, rva ReadZspanFreq
dd rva Recouple, rva ResetEngine, rva SendCommand
dd rva SendWord, rva SetAttenuatr, rva SetAutoCell
dd rva SetCellMode, rva SetCommHandle, rva SetDefltPts
dd rva SetDetect3IF, rva SetDetectCode, rva SetDetectLin
dd rva SetDetectLog, rva SetDwellTime, rva SetEngOption
dd rva SetEngineModel, rva SetEngineReplyCode
dd rva SetErrorStatus, rva SetExternRef
dd rva SetFiltRatio, rva SetFuncStatusCode
dd rva SetHopTabCnt, rva SetIFStepAttn, rva SetInterfaceType
dd rva SetIntrCode, rva SetIrqNum, rva SetLinRefLevel
dd rva SetLinearAttn, rva SetLogAddr, rva SetNumCells
dd rva SetNumSwpPts, rva SetPortNum, rva SetPreamp
dd rva SetRBW, rva SetRBWmode, rva SetRefLevel
dd rva SetSessionHandle, rva SetSweepCode
dd rva SetSwpIdx, rva SetSwpTime, rva SetTimeoutWait
dd rva SetTrigDelay, rva SetTrigMode, rva SetTrigThrsh
dd rva SetVBW, rva SetVBWmode, rva SetZCellSize
dd rva SetZSamplCnt, rva SetZSamplDvdr, rva SetZSamplRate
dd rva ShutdownEngine, rva StartFreqHop
dd rva StartSweep, rva StartZspan, rva StepSizeMode
dd rva SwpTimeMode, rva TestFuncStatusAndPtr
dd rva TestTimeoutDone, rva VBWCodeFromFreq
dd rva VBWFreqFromCode, rva WaitRecvWord
;
; Export Names Table for mtcsa32.dll
;
off_1001707C dd rva aBreaksweep, rva aCalcrbwcode, rva aCalcvbwcode ; "BreakSweep" ...
dd rva aCheckforfreqpt, rva aCheckforminmax
dd rva aCheckhwstatus, rva aCheckswstatnot
dd rva aCheckswstatus, rva aCleardatafifo
dd rva aClearfuncstatu, rva aClosesession
dd rva aComminterrupts, rva aCommtrigdetect
dd rva aConfigstartfre, rva aConfigstepsize
dd rva aConfigstopfreq, rva aConfigtrigfreq
dd rva aConfigzspanfre, rva aCopy9052struct
dd rva aDefltsettimerb, rva aDefltsettimevb
dd rva aDelayops, rva aFindequivdbmre, rva aFindhighpeak
dd rva aFindidxforswpf, rva aFindnextpeak
dd rva aFreqinrange, rva aFuncstatusfrom
dd rva aGetampldata, rva aGetamplfordbm
dd rva aGetamplfornv, rva aGetamplwithfre
dd rva aGetcalpoint, rva aGetcalpointext
dd rva aGetcodeforrati, rva aGetdbmforampl
dd rva aGetdbmforvolta, rva aGetenginereply
dd rva aGeterrorstatus, rva aGetfuncstatusc
dd rva aGetminmaxampl, rva aGetminmaxamplw
dd rva aGetrbwstring, rva aGetrbwwide, rva aGetratioforcod
dd rva aGettracedata, rva aGetvbwstring
dd rva aGetnvforampl, rva aGetnvfordbm, rva aIdquery
dd rva aIetimer, rva aIetimerfrom, rva aInitdatacapswe
dd rva aInitdatacapzsp, rva aInitengine
dd rva aInitfreqhop, rva aInitguisweep, rva aInitguizspan
dd rva aInitinstrdata, rva aInittimeoutloo
dd rva aIscalibrated, rva aIssweeping, rva aIsvalidinit
dd rva aIsvalidstep, rva aLoadhoptable, rva aLoadhoptableex
dd rva aMeasureampldat, rva aMeasureamplwit
dd rva aMeasureminmaxa, rva aMeasureminmaxa_0
dd rva aOpensession, rva aOverridesettim
dd rva aPulsegetminmax, rva aPulsemeasure
dd rva aPulsesigpresen, rva aRbwcodefromfre
dd rva aRbwfreqfromcod, rva aRdattenuatr
dd rva aRdautocell, rva aRdcellmode, rva aRdcommdelay
dd rva aRdcommhandle, rva aRdcomminitstri
dd rva aRdcommnumber, rva aRddefltpts, rva aRddetect
dd rva aRddetectcode, rva aRddwelltime, rva aRdengoption
dd rva aRdenginemodel, rva aRderrorstatus
dd rva aRdexternref, rva aRdfiltratio, rva aRdhoptabcnt
dd rva aRdinterfacetyp, rva aRdintrcode
dd rva aRdirqnum, rva aRdlinreflevel, rva aRdlinearattn
dd rva aRdlogaddr, rva aRdmaxattlimit, rva aRdmaxfreqlimit
dd rva aRdminattlimit, rva aRdminfreqlimit
dd rva aRdnumcells, rva aRdnumdatapts, rva aRdnumswppts
dd rva aRdportnum, rva aRdpreamp, rva aRdrbw
dd rva aRdrbwmode, rva aRdreflevel, rva aRdsessionhandl
dd rva aRdsessionstrin, rva aRdsettletime
dd rva aRdsweepcode, rva aRdswpidx, rva aRdswptime
dd rva aRdtimeoutwait, rva aRdtrigdelay
dd rva aRdtrigmode, rva aRdtrigthrsh, rva aRdvbw
dd rva aRdvbwmode, rva aRdzcellsize, rva aRdzsamplcnt
dd rva aRdzsampldvdr, rva aRdzsamplrate
dd rva aRdzspanfreq, rva aReadcellptfreq
dd rva aReadstartfreq, rva aReadstepsize
dd rva aReadstopfreq, rva aReadswpptfreq
dd rva aReadtrigfreq, rva aReadzspanfreq
dd rva aRecouple, rva aResetengine, rva aSendcommand
dd rva aSendword, rva aSetattenuatr, rva aSetautocell
dd rva aSetcellmode, rva aSetcommhandle
dd rva aSetdefltpts, rva aSetdetect3if, rva aSetdetectcode
dd rva aSetdetectlin, rva aSetdetectlog
dd rva aSetdwelltime, rva aSetengoption
dd rva aSetenginemodel, rva aSetenginereply
dd rva aSeterrorstatus, rva aSetexternref
dd rva aSetfiltratio, rva aSetfuncstatusc
dd rva aSethoptabcnt, rva aSetifstepattn
dd rva aSetinterfacety, rva aSetintrcode
dd rva aSetirqnum, rva aSetlinreflevel, rva aSetlinearattn
dd rva aSetlogaddr, rva aSetnumcells, rva aSetnumswppts
dd rva aSetportnum, rva aSetpreamp, rva aSetrbw
dd rva aSetrbwmode, rva aSetreflevel, rva aSetsessionhand
dd rva aSetsweepcode, rva aSetswpidx, rva aSetswptime
dd rva aSettimeoutwait, rva aSettrigdelay
dd rva aSettrigmode, rva aSettrigthrsh, rva aSetvbw
dd rva aSetvbwmode, rva aSetzcellsize, rva aSetzsamplcnt
dd rva aSetzsampldvdr, rva aSetzsamplrate
dd rva aShutdownengine, rva aStartfreqhop
dd rva aStartsweep, rva aStartzspan, rva aStepsizemode
dd rva aSwptimemode, rva aTestfuncstatus
dd rva aTesttimeoutdon, rva aVbwcodefromfre
dd rva aVbwfreqfromcod, rva aWaitrecvword
;
; Export Ordinals Table for mtcsa32.dll
;
word_10017390 dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0Ah, 0Bh
dw 0Ch, 0Dh, 0Eh, 0Fh, 10h, 11h, 12h, 13h
dw 14h, 15h, 16h, 17h, 18h, 19h, 1Ah, 1Bh
dw 1Ch, 1Dh, 1Eh, 1Fh, 20h, 21h, 22h, 23h
dw 24h, 25h, 26h, 27h, 28h, 29h, 2Ah, 2Bh
dw 2Ch, 2Dh, 2Eh, 2Fh, 30h, 31h, 32h, 33h
dw 34h, 35h, 36h, 37h, 38h, 39h, 3Ah, 3Bh
dw 3Ch, 3Dh, 3Eh, 3Fh, 40h, 41h, 42h, 43h
dw 44h, 45h, 46h, 47h, 48h, 49h, 4Ah, 4Bh
dw 4Ch, 4Dh, 4Eh, 4Fh, 50h, 51h, 52h, 53h
dw 54h, 55h, 56h, 57h, 58h, 59h, 5Ah, 5Bh
dw 5Ch, 5Dh, 5Eh, 5Fh, 60h, 61h, 62h, 63h
dw 64h, 65h, 66h, 67h, 68h, 69h, 6Ah, 6Bh
dw 6Ch, 6Dh, 6Eh, 6Fh, 70h, 71h, 72h, 73h
dw 74h, 75h, 76h, 77h, 78h, 79h, 7Ah, 7Bh
dw 7Ch, 7Dh, 7Eh, 7Fh, 80h, 81h, 82h, 83h
dw 84h, 85h, 86h, 87h, 88h, 89h, 8Ah, 8Bh
dw 8Ch, 8Dh, 8Eh, 8Fh, 90h, 91h, 92h, 93h
dw 94h, 95h, 96h, 97h, 98h, 99h, 9Ah, 9Bh
dw 9Ch, 9Dh, 9Eh, 9Fh, 0A0h, 0A1h, 0A2h
dw 0A3h, 0A4h, 0A5h, 0A6h, 0A7h, 0A8h, 0A9h
dw 0AAh, 0ABh, 0ACh, 0ADh, 0AEh, 0AFh, 0B0h
dw 0B1h, 0B2h, 0B3h, 0B4h, 0B5h, 0B6h, 0B7h
dw 0B8h, 0B9h, 0BAh, 0BBh, 0BCh, 0BDh, 0BEh
dw 0BFh, 0C0h, 0C1h, 0C2h, 0C3h, 0C4h
aMtcsa32Dll db 'mtcsa32.dll',0
aBreaksweep db 'BreakSweep',0
aCalcrbwcode db 'CalcRBWCode',0
aCalcvbwcode db 'CalcVBWCode',0
aCheckforfreqpt db 'CheckForFreqpts',0
aCheckforminmax db 'CheckForMinMax',0
aCheckhwstatus db 'CheckHWStatus',0
aCheckswstatnot db 'CheckSWStatNoTO',0
aCheckswstatus db 'CheckSWStatus',0
aCleardatafifo db 'ClearDataFIFO',0
aClearfuncstatu db 'ClearFuncStatusCode',0
aClosesession db 'CloseSession',0
aComminterrupts db 'CommInterrupts',0
aCommtrigdetect db 'CommTrigDetect',0
aConfigstartfre db 'ConfigStartFreq',0
aConfigstepsize db 'ConfigStepSize',0
aConfigstopfreq db 'ConfigStopFreq',0
aConfigtrigfreq db 'ConfigTrigFreq',0
aConfigzspanfre db 'ConfigZspanFreq',0
aCopy9052struct db 'Copy9052Struct',0
aDefltsettimerb db 'DefltSetTimeRBW',0
aDefltsettimevb db 'DefltSetTimeVBW',0
aDelayops db 'DelayOps',0
aFindequivdbmre db 'FindEquivDbmRef',0
aFindhighpeak db 'FindHighPeak',0
aFindidxforswpf db 'FindIdxForSwpFreq',0
aFindnextpeak db 'FindNextPeak',0
aFreqinrange db 'FreqInRange',0
aFuncstatusfrom db 'FuncStatusFromEngineReply',0
aGetampldata db 'GetAmplData',0
aGetamplfordbm db 'GetAmplForDbm',0
aGetamplfornv db 'GetAmplFornV',0
aGetamplwithfre db 'GetAmplWithFreqExt',0
aGetcalpoint db 'GetCalPoint',0
aGetcalpointext db 'GetCalPointExt',0
aGetcodeforrati db 'GetCodeForRatio',0
aGetdbmforampl db 'GetDbmForAmpl',0
aGetdbmforvolta db 'GetDbmForVoltage',0
aGetenginereply db 'GetEngineReplyCode',0
aGeterrorstatus db 'GetErrorStatus',0
aGetfuncstatusc db 'GetFuncStatusCode',0
aGetminmaxampl db 'GetMinMaxAmpl',0
aGetminmaxamplw db 'GetMinMaxAmplWithFreqExt',0
aGetrbwstring db 'GetRBWString',0
aGetrbwwide db 'GetRBWwide',0
aGetratioforcod db 'GetRatioForCode',0
aGettracedata db 'GetTraceData',0
aGetvbwstring db 'GetVBWString',0
aGetnvforampl db 'GetnVForAmpl',0
aGetnvfordbm db 'GetnVForDbm',0
aIdquery db 'IdQuery',0
aIetimer db 'IeTimer',0
aIetimerfrom db 'IeTimerFrom',0
aInitdatacapswe db 'InitDataCapSweep',0
aInitdatacapzsp db 'InitDataCapZspan',0
aInitengine db 'InitEngine',0
aInitfreqhop db 'InitFreqHop',0
aInitguisweep db 'InitGuiSweep',0
aInitguizspan db 'InitGuiZspan',0
aInitinstrdata db 'InitInstrData',0
aInittimeoutloo db 'InitTimeoutLoop',0
aIscalibrated db 'IsCalibrated',0
aIssweeping db 'IsSweeping',0
aIsvalidinit db 'IsValidInit',0
aIsvalidstep db 'IsValidStep',0
aLoadhoptable db 'LoadHopTable',0
aLoadhoptableex db 'LoadHopTableExt',0
aMeasureampldat db 'MeasureAmplData',0
aMeasureamplwit db 'MeasureAmplWithFreq',0
aMeasureminmaxa db 'MeasureMinMaxAmpl',0
aMeasureminmaxa_0 db 'MeasureMinMaxAmplWithFreq',0
aOpensession db 'OpenSession',0
aOverridesettim db 'OverRideSetTime',0
aPulsegetminmax db 'PulseGetMinMax',0
aPulsemeasure db 'PulseMeasure',0
aPulsesigpresen db 'PulseSigPresent',0
aRbwcodefromfre db 'RBWCodeFromFreq',0
aRbwfreqfromcod db 'RBWFreqFromCode',0
aRdattenuatr db 'RdAttenuatr',0
aRdautocell db 'RdAutoCell',0
aRdcellmode db 'RdCellMode',0
aRdcommdelay db 'RdCommDelay',0
aRdcommhandle db 'RdCommHandle',0
aRdcomminitstri db 'RdCommInitString',0
aRdcommnumber db 'RdCommNumber',0
aRddefltpts db 'RdDefltPts',0
aRddetect db 'RdDetect',0
aRddetectcode db 'RdDetectCode',0
aRddwelltime db 'RdDwellTime',0
aRdengoption db 'RdEngOption',0
aRdenginemodel db 'RdEngineModel',0
aRderrorstatus db 'RdErrorStatus',0
aRdexternref db 'RdExternRef',0
aRdfiltratio db 'RdFiltRatio',0
aRdhoptabcnt db 'RdHopTabCnt',0
aRdinterfacetyp db 'RdInterfaceType',0
aRdintrcode db 'RdIntrCode',0
aRdirqnum db 'RdIrqNum',0
aRdlinreflevel db 'RdLinRefLevel',0
aRdlinearattn db 'RdLinearAttn',0
aRdlogaddr db 'RdLogAddr',0
aRdmaxattlimit db 'RdMaxAttLimit',0
aRdmaxfreqlimit db 'RdMaxFreqLimit',0
aRdminattlimit db 'RdMinAttLimit',0
aRdminfreqlimit db 'RdMinFreqLimit',0
aRdnumcells db 'RdNumCells',0
aRdnumdatapts db 'RdNumDataPts',0
aRdnumswppts db 'RdNumSwpPts',0
aRdportnum db 'RdPortNum',0
aRdpreamp db 'RdPreamp',0
aRdrbw db 'RdRBW',0
aRdrbwmode db 'RdRBWmode',0
aRdreflevel db 'RdRefLevel',0
aRdsessionhandl db 'RdSessionHandle',0
aRdsessionstrin db 'RdSessionString',0
aRdsettletime db 'RdSettleTime',0
aRdsweepcode db 'RdSweepCode',0
aRdswpidx db 'RdSwpIdx',0
aRdswptime db 'RdSwpTime',0
aRdtimeoutwait db 'RdTimeoutWait',0
aRdtrigdelay db 'RdTrigDelay',0
aRdtrigmode db 'RdTrigMode',0
aRdtrigthrsh db 'RdTrigThrsh',0
aRdvbw db 'RdVBW',0
aRdvbwmode db 'RdVBWmode',0
aRdzcellsize db 'RdZCellSize',0
aRdzsamplcnt db 'RdZSamplCnt',0
aRdzsampldvdr db 'RdZSamplDvdr',0
aRdzsamplrate db 'RdZSamplRate',0
aRdzspanfreq db 'RdZspanFreq',0
aReadcellptfreq db 'ReadCellPtFreq',0
aReadstartfreq db 'ReadStartFreq',0
aReadstepsize db 'ReadStepSize',0
aReadstopfreq db 'ReadStopFreq',0
aReadswpptfreq db 'ReadSwpPtFreq',0
aReadtrigfreq db 'ReadTrigFreq',0
aReadzspanfreq db 'ReadZspanFreq',0
aRecouple db 'Recouple',0
aResetengine db 'ResetEngine',0
aSendcommand db 'SendCommand',0
aSendword db 'SendWord',0
aSetattenuatr db 'SetAttenuatr',0
aSetautocell db 'SetAutoCell',0
aSetcellmode db 'SetCellMode',0
aSetcommhandle db 'SetCommHandle',0
aSetdefltpts db 'SetDefltPts',0
aSetdetect3if db 'SetDetect3IF',0
aSetdetectcode db 'SetDetectCode',0
aSetdetectlin db 'SetDetectLin',0
aSetdetectlog db 'SetDetectLog',0
aSetdwelltime db 'SetDwellTime',0
aSetengoption db 'SetEngOption',0
aSetenginemodel db 'SetEngineModel',0
aSetenginereply db 'SetEngineReplyCode',0
aSeterrorstatus db 'SetErrorStatus',0
aSetexternref db 'SetExternRef',0
aSetfiltratio db 'SetFiltRatio',0
aSetfuncstatusc db 'SetFuncStatusCode',0
aSethoptabcnt db 'SetHopTabCnt',0
aSetifstepattn db 'SetIFStepAttn',0
aSetinterfacety db 'SetInterfaceType',0
aSetintrcode db 'SetIntrCode',0
aSetirqnum db 'SetIrqNum',0
aSetlinreflevel db 'SetLinRefLevel',0
aSetlinearattn db 'SetLinearAttn',0
aSetlogaddr db 'SetLogAddr',0
aSetnumcells db 'SetNumCells',0
aSetnumswppts db 'SetNumSwpPts',0
aSetportnum db 'SetPortNum',0
aSetpreamp db 'SetPreamp',0
aSetrbw db 'SetRBW',0
aSetrbwmode db 'SetRBWmode',0
aSetreflevel db 'SetRefLevel',0
aSetsessionhand db 'SetSessionHandle',0
aSetsweepcode db 'SetSweepCode',0
aSetswpidx db 'SetSwpIdx',0
aSetswptime db 'SetSwpTime',0
aSettimeoutwait db 'SetTimeoutWait',0
aSettrigdelay db 'SetTrigDelay',0
aSettrigmode db 'SetTrigMode',0
aSettrigthrsh db 'SetTrigThrsh',0
aSetvbw db 'SetVBW',0
aSetvbwmode db 'SetVBWmode',0
aSetzcellsize db 'SetZCellSize',0
aSetzsamplcnt db 'SetZSamplCnt',0
aSetzsampldvdr db 'SetZSamplDvdr',0
aSetzsamplrate db 'SetZSamplRate',0
aShutdownengine db 'ShutdownEngine',0
aStartfreqhop db 'StartFreqHop',0
aStartsweep db 'StartSweep',0
aStartzspan db 'StartZspan',0
aStepsizemode db 'StepSizeMode',0
aSwptimemode db 'SwpTimeMode',0
aTestfuncstatus db 'TestFuncStatusAndPtr',0
aTesttimeoutdon db 'TestTimeoutDone',0
aVbwcodefromfre db 'VBWCodeFromFreq',0
aVbwfreqfromcod db 'VBWFreqFromCode',0
aWaitrecvword db 'WaitRecvWord',0
align 100h
_rdata ends

; Section 3. (virtual address 00018000)
; Virtual size                  : 00003B20 (  15136.)
; Section size in file          : 00004000 (  16384.)
; Offset to raw data for section: 00018000
; Flags C0000040: Data Readable Writable
; Alignment     : default

; Segment type: Pure data
; Segment permissions: Read/Write
_data segment para public 'DATA' use32
assume cs:_data
;org 10018000h
unk_10018000 db    0
db    0
db    0
db    0
unk_10018004 db    0
db    0
db    0
db    0
unk_10018008 db    0
db    0
db    0
db    0
dd offset sub_10013CA4
unk_10018010 db    0
db    0
db    0
db    0
unk_10018014 db    0
db    0
db    0
db    0
unk_10018018 db    0
db    0
db    0
db    0
unk_1001801C db    0
db    0
db    0
db    0
unk_10018020 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_10018030 db  49h ; I
db  53h ; S
db  41h ; A
db    0
aIsa db 'ISA_',0
align 4
; CHAR aMtcisa32Dll[]
aMtcisa32Dll db 'mtcisa32.dll',0
align 4
aOpensessionste db 'OpenSessionStep',0
aCleardatafifo_0 db 'ClearDataFIFO',0
align 4
aCheckswstatus_0 db 'CheckSWStatus',0
align 4
aCheckhwstatus_0 db 'CheckHWStatus',0
align 4
aFetchdataword db 'FetchDataWord',0
align 4
aWaitrecvword_0 db 'WaitRecvWord',0
align 4
aSenddataitem db 'SendDataItem',0
align 4
aSendcommand_0 db 'SendCommand',0
aVerdatablock db 'VerDataBlock',0
align 4
aGetdatablock db 'GetDataBlock',0
align 4
aSendword_0 db 'SendWord',0
align 4
aCheckswstatnot_0 db 'CheckSWStatNoTO',0
aShutdownengine_0 db 'ShutdownEngine',0
align 4
aInitengine_0 db 'InitEngine',0
align 10h
aResetengine_0 db 'ResetEngine',0
aClosesession_0 db 'CloseSession',0
align 4
aIdquery_0 db 'IdQuery',0
asc_10018144 db '::',0
align 4
aVxi db 'VXI',0
aVisa db 'VISA_',0
align 4
; CHAR aMtcvsa32Dll[]
aMtcvsa32Dll db 'mtcvsa32.dll',0
align 4
aTcpip db 'TCPIP::',0
aTcpip_0 db 'TCPIP_',0
align 4
; CHAR aMtctcpipDll[]
aMtctcpipDll db 'mtctcpip.dll',0
align 4
aSicl db 'SICL::',0
align 4
aSicl_0 db 'SICL_',0
align 4
aMtcsiclDll db 'mtcsicl.dll',0
aSim_0 db 'SIM',0
aSim db 'SIM_',0
align 4
; CHAR aMtcsim32Dll[]
aMtcsim32Dll db 'mtcsim32.dll',0
align 4
aModem db 'MODEM::',0
aModem_0 db 'MODEM_',0
align 4
aMtcmodemDll db 'mtcmodem.dll',0
align 4
aSerial db 'SERIAL::',0
align 4
aSerial_0 db 'SERIAL_',0
aMtcserDll db 'mtcser.dll',0
align 4
aIsa_0 db 'ISA',0
aIsant db 'ISANT_',0
align 4
; CHAR aMtcisantDll[]
aMtcisantDll db 'mtcisant.dll',0
align 4
aVxi_0 db 'VXI::',0
align 10h
aVxi_1 db 'VXI_',0
align 4
dword_10018228 dd 2580h
db  40h ; @
db  38h ; 8
db    0
db    0
db    0
db  4Bh ; K
db    0
db    0
db    0
db  96h ; –
db    0
db    0
db 0C0h ; À
db 0DAh ; Ú
db    0
db    0
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
byte_10018240 db 6Eh
db    0
db    0
db    0
db  2Ch ; ,
db    1
db    0
db    0
db  58h ; X
db    2
db    0
db    0
db  84h ; „
db    3
db    0
db    0
db 0B0h ; °
db    4
db    0
db    0
db  60h ; `
db    9
db    0
db    0
db 0C0h ; À
db  12h
db    0
db    0
db  20h
db  1Ch
db    0
db    0
db  80h ; €
db  25h ; %
db    0
db    0
db 0E0h ; à
db  2Eh ; .
db    0
db    0
db  40h ; @
db  38h ; 8
db    0
db    0
db 0A0h ;  
db  41h ; A
db    0
db    0
db    0
db  4Bh ; K
db    0
db    0
db  60h ; `
db  54h ; T
db    0
db    0
db 0C0h ; À
db  5Dh ; ]
db    0
db    0
db  20h
db  67h ; g
db    0
db    0
db 80h
db  70h ; p
db    0
db    0
db 0E0h ; à
db  79h ; y
db 0
db    0
db  40h ; @
db  83h ; ƒ
db    0
db    0
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
word_10018290 dw 0FFFFh
word_10018292 dw 0FFFFh
align 8
dbl_10018298 dq 300.0
dq 3000.0
dq 30000.0
dq 300000.0
dq 3000000.0
dbl_100182C0 dq 0.0
dq 3.0
dq 30.0
dq 300.0
dq 3000.0
dq 30000.0
dq 300000.0
dq 3000000.0
a300Hz db '300 Hz',0
align 4
a3Khz db '3 KHz',0
align 10h
a30Khz db '30 KHz',0
align 4
a300Khz db '300 KHz',0
a3Mhz db '3 MHz',0
align 4
asc_10018328 db '     ',0
align 10h
aNone db 'NONE',0
align 4
a3Hz db '3 Hz',0
align 10h
a30Hz db '30 Hz',0
align 4
a300Hz_0 db '300 Hz',0
align 10h
a3Khz_0 db '3 KHz',0
align 4
a30Khz_0 db '30 KHz',0
align 10h
a300Khz_0 db '300 KHz',0
a3Mhz_0 db '3 MHz',0
align 10h
asc_10018370 db '     ',0
align 4
db  75h ; u
db  98h ; ˜
db    0
db    0
db  73h ; s
db  98h ; ˜
db    0
db    0
off_10018380 dd offset sub_1000D4EB
dd offset nullsub_1
dd offset nullsub_1
align 10h
dbl_10018390 dq 0.5
byte_10018398 db 70h
db  6Fh ; o
db  77h ; w
db    0
db    0
db    0
db    0
db    0
aLog10 db 'log10',0
align 10h
aSqrt db 'sqrt',0
align 4
off_100183B8 dd offset sub_10010D8E
off_100183BC dd offset sub_10012395
off_100183C0 dd offset sub_10012395
off_100183C4 dd offset sub_10012395
off_100183C8 dd offset sub_10012395
off_100183CC dd offset sub_10012395
off_100183D0 dd offset sub_10012395
off_100183D4 dd offset unk_100183DE
dd offset unk_100183DE
db    0
db    0
unk_100183DE db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  28h ; (
db    0
db  28h ; (
db    0
db  28h ; (
db    0
db  28h ; (
db    0
db  28h ; (
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  20h
db    0
db  48h ; H
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  84h ; „
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  81h
db    0
db  81h
db    0
db  81h
db    0
db  81h
db    0
db  81h
db    0
db  81h
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db    1
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  82h ; ‚
db    0
db  82h ; ‚
db    0
db  82h ; ‚
db    0
db  82h ; ‚
db    0
db  82h ; ‚
db    0
db  82h ; ‚
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db    2
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  10h
db    0
db  20h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_100185E0 dd 1
byte_100185E4 db 2Eh
align 4
db    1
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_100185F0 db  14h
db    0
db    0
db    0
off_100185F4 dd offset aExp ; "exp"
db  1Dh
db    0
db    0
db    0
dd offset aPow          ; "pow"
db  1Ah
db    0
db    0
db    0
dd offset aLog          ; "log"
db  1Bh
db    0
db    0
db    0
dd offset aLog10_0      ; "log10"
db  1Fh
db    0
db    0
db    0
dd offset aSinh         ; "sinh"
db  13h
db    0
db    0
db    0
dd offset aCosh         ; "cosh"
db  21h ; !
db    0
db    0
db    0
dd offset aTanh         ; "tanh"
db  0Eh
db    0
db    0
db    0
dd offset aAsin         ; "asin"
db  0Dh
db    0
db    0
db    0
dd offset aAcos         ; "acos"
db  0Fh
db    0
db    0
db    0
dd offset aAtan         ; "atan"
db  10h
db    0
db    0
db    0
dd offset aAtan2        ; "atan2"
db    5
db    0
db    0
db    0
dd offset aSqrt_0       ; "sqrt"
db  1Eh
db    0
db    0
db    0
dd offset aSin          ; "sin"
db  12h
db    0
db    0
db    0
dd offset aCos          ; "cos"
db  20h
db    0
db    0
db    0
dd offset aTan          ; "tan"
db  0Ch
db    0
db    0
db    0
dd offset aCeil         ; "ceil"
db  0Bh
db    0
db    0
db    0
dd offset aFloor        ; "floor"
db  15h
db    0
db    0
db    0
dd offset aFabs         ; "fabs"
db  1Ch
db    0
db    0
db    0
dd offset aModf         ; "modf"
db  19h
db    0
db    0
db    0
dd offset aLdexp        ; "ldexp"
db  11h
db    0
db    0
db    0
dd offset aCabs         ; "_cabs"
db  18h
db    0
db    0
db    0
dd offset aHypot        ; "_hypot"
db  16h
db    0
db    0
db    0
dd offset aFmod         ; "fmod"
db  17h
db    0
db    0
db    0
dd offset aFrexp        ; "frexp"
db  22h ; "
db    0
db    0
db    0
dd offset aY0           ; "_y0"
db  23h ; #
db    0
db    0
db    0
dd offset aY1           ; "_y1"
db  24h ; $
db    0
db    0
db    0
dd offset aYn           ; "_yn"
dbl_100186C8 dq 1.797693134862316e308
dbl_100186D0 dq -2.696539702293474e308
dbl_100186D8 dq 1.797693134862316e308
db    0
db    0
db    0
db    0
db    0
db    0
db  10h
db    0
dbl_100186E8 dq -0.0
tbyte_100186F0 dt 2.3562723457267347066e313
align 4
tbyte_100186FC dt 1.9149954921904370718e-1233
align 4
db  10h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
off_10018710 dd offset off_10018710
; LPVOID off_10018714
off_10018714 dd offset off_10018710
dd offset unk_10018728
dd offset unk_10018728
dword_10018720 dd 0FFFFFFFFh
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
unk_10018728 db 0F0h ; ð
db    0
db    0
db    0
db 0F1h ; ñ
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
off_1001A730 dd offset off_10018710
dword_1001A734 dd 1E0h
; LPCRITICAL_SECTION dword_1001A738
dword_1001A738 dd 0
; LPCRITICAL_SECTION off_1001A73C
off_1001A73C dd offset unk_1001B438
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
; LPCRITICAL_SECTION off_1001A75C
off_1001A75C dd offset unk_1001B468
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
; LPCRITICAL_SECTION off_1001A76C
off_1001A76C dd offset unk_1001B480
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
; LPCRITICAL_SECTION lpCriticalSection
lpCriticalSection dd offset unk_1001B450
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001A7F8 db  20h
db    5
db  93h ; “
db  19h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
tbyte_1001A810 dt 1.1897314953572317651e4932
tbyte_1001A81A dt -1.1897314953572317651e4932
db 0DCh ; Ü
db 0A7h ; §
db 0D7h ; ×
db 0B9h ; ¹
db  85h ; …
db  66h ; f
db  71h ; q
db 0B1h ; ±
db  0Dh
db  40h ; @
tbyte_1001A82E dt 32767.5
db 0F7h ; ÷
db  36h ; 6
db  43h ; C
db  0Ch
db  98h ; ˜
db  19h
db 0F6h ; ö
db  95h ; •
db 0FDh ; ý
db  3Fh ; ?
dbl_1001A842 dq 0.5
db    3
db  65h ; e
db  78h ; x
db  70h ; p
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    1
db  14h
db    0
dd offset sub_10010611
dd offset sub_1001091D
dd offset sub_10010922
dd offset sub_10010751
align 10h
tbyte_1001A870 dt -1.7845972430358476476e4932
db  35h ; 5
db 0C2h ; Â
db  68h ; h
db  21h ; !
db 0A2h ; ¢
db 0DAh ; Ú
db  0Fh
db 0C9h ; É
db 0FFh ; ÿ
db  3Fh ; ?
dbl_1001A884 dq 1.0
unk_1001A88C db    8
db    4
db    8
db    8
db    8
db    4
db    8
db    8
db    0
db    4
db  0Ch
db    8
db    0
db    4
db  0Ch
db    8
db    0
db    0
db    0
db    0
; DWORD dwTlsIndex
dwTlsIndex dd 0FFFFFFFFh
align 8
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db    0
db  0Ah
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_1001A8D0 dd 2
off_1001A8D4 dd offset aR6002FloatingP ; "R6002\r\n- floating point not loaded\r"...
db    8
db    0
db    0
db    0
dd offset aR6008NotEnough ; "R6008\r\n- not enough space for argumen"...
db    9
db    0
db    0
db    0
dd offset aR6009NotEnough ; "R6009\r\n- not enough space for environ"...
db  0Ah
db    0
db    0
db    0
dd offset aAbnormalProgra ; "\r\nabnormal program termination\r\n"
db  10h
db    0
db    0
db    0
dd offset aR6016NotEnough ; "R6016\r\n- not enough space for thread "...
db  11h
db    0
db    0
db    0
dd offset aR6017Unexpecte ; "R6017\r\n- unexpected multithread lock "...
db  12h
db    0
db    0
db    0
dd offset aR6018Unexpecte ; "R6018\r\n- unexpected heap error\r\n"
db  13h
db    0
db    0
db    0
dd offset aR6019UnableToO ; "R6019\r\n- unable to open console devic"...
db  18h
db    0
db    0
db    0
dd offset aR6024NotEnough ; "R6024\r\n- not enough space for _onexit"...
db  19h
db    0
db    0
db    0
dd offset aR6025PureVirtu ; "R6025\r\n- pure virtual function call\r"...
db  1Ah
db    0
db    0
db    0
dd offset aR6026NotEnough ; "R6026\r\n- not enough space for stdio i"...
db  1Bh
db    0
db    0
db    0
dd offset aR6027NotEnough ; "R6027\r\n- not enough space for lowio i"...
db  1Ch
db    0
db    0
db    0
dd offset aR6028UnableToI ; "R6028\r\n- unable to initialize heap\r"...
db  78h ; x
db    0
db    0
db    0
dd offset aDomainError  ; "DOMAIN error\r\n"
db  79h ; y
db    0
db    0
db    0
dd offset aSingError    ; "SING error\r\n"
db  7Ah ; z
db    0
db    0
db    0
dd offset aTlossError   ; "TLOSS error\r\n"
db 0FCh ; ü
db    0
db    0
db    0
dd offset asc_10016350  ; "\r\n"
db 0FFh ; ÿ
db    0
db    0
db    0
dd offset aRuntimeError ; "runtime error "
unk_1001A960 db    0
db    4
db    0
db    0
db    1
db 0FCh ; ü
db 0FFh ; ÿ
db 0FFh ; ÿ
db  35h ; 5
db    0
db    0
db    0
db  0Bh
db    0
db    0
db    0
db  40h ; @
db    0
db    0
db    0
db 0FFh ; ÿ
db    3
db    0
db    0
unk_1001A978 db  80h ; €
db    0
db    0
db    0
db  81h
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db  18h
db    0
db    0
db    0
db    8
db    0
db    0
db    0
db  20h
db    0
db    0
db    0
db  7Fh ; 
db    0
db    0
db    0
db    1
db    0
db    0
db    0
db  16h
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db    3
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db    4
db    0
db    0
db    0
db  18h
db    0
db    0
db    0
db    5
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db    6
db    0
db    0
db    0
db    9
db    0
db    0
db    0
db    7
db    0
db    0
db    0
db  0Ch
db    0
db    0
db    0
db    8
db    0
db    0
db    0
db  0Ch
db    0
db    0
db    0
db    9
db    0
db    0
db    0
db  0Ch
db    0
db    0
db    0
db  0Ah
db    0
db    0
db    0
db    7
db    0
db    0
db    0
db  0Bh
db    0
db    0
db    0
db    8
db    0
db    0
db    0
db  0Ch
db    0
db    0
db    0
db  16h
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  16h
db    0
db    0
db    0
db  0Fh
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db  10h
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  11h
db    0
db    0
db    0
db  12h
db    0
db    0
db    0
db  12h
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db  21h ; !
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  35h ; 5
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db  41h ; A
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  43h ; C
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db  50h ; P
db    0
db    0
db    0
db  11h
db    0
db    0
db    0
db  52h ; R
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  53h ; S
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  57h ; W
db    0
db    0
db    0
db  16h
db    0
db    0
db    0
db  59h ; Y
db    0
db    0
db    0
db  0Bh
db    0
db    0
db    0
db  6Ch ; l
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  6Dh ; m
db    0
db    0
db    0
db  20h
db    0
db    0
db    0
db  70h ; p
db    0
db    0
db    0
db  1Ch
db    0
db    0
db    0
db  72h ; r
db    0
db    0
db    0
db    9
db    0
db    0
db    0
db    6
db    0
db    0
db    0
db  16h
db    0
db    0
db    0
db  80h ; €
db    0
db    0
db    0
db  0Ah
db    0
db    0
db    0
db  81h
db    0
db    0
db    0
db  0Ah
db    0
db    0
db    0
db  82h ; ‚
db    0
db    0
db    0
db    9
db    0
db    0
db    0
db  83h ; ƒ
db    0
db    0
db    0
db  16h
db    0
db    0
db    0
db  84h ; „
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db  91h ; ‘
db    0
db    0
db    0
db  29h ; )
db    0
db    0
db    0
db  9Eh ; ž
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db 0A1h ; ¡
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db 0A4h ; ¤
db    0
db    0
db    0
db  0Bh
db    0
db    0
db    0
db 0A7h ; §
db    0
db    0
db    0
db  0Dh
db    0
db    0
db    0
db 0B7h ; ·
db    0
db    0
db    0
db  11h
db    0
db    0
db    0
db 0CEh ; Î
db    0
db    0
db    0
db    2
db    0
db    0
db    0
db 0D7h ; ×
db    0
db    0
db    0
db  0Bh
db    0
db    0
db    0
db  18h
db    7
db    0
db    0
db  0Ch
db    0
db    0
db    0
dword_1001AAF8 dd 2694h
align 10h
byte_1001AB00 db 0
db    1
db    0
db    0
db    4
db    0
db    0
db    7
db    0
db    0
db  0Ah
db    0
db    0
db  0Dh
db    0
db    0
flt_1001AB10 dd 0.9375
flt_1001AB14 dd 1.0625
flt_1001AB18 dd 9.223372e18
byte_1001AB1C db 0
db    1
db    0
db    0
db    4
db    0
db    0
db    7
db    0
db    0
db  0Ah
db    0
db    0
db  0Dh
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db 0EEh ; î
db  3Fh ; ?
dbl_1001AB34 dq 1.844674407370955e19
dbl_1001AB3C dq 5.421010862427522e-20
db    0
db    0
db    0
db    0
db    0
db    0
db 0F0h ; ð
db  3Fh ; ?
dbl_1001AB4C dq 0.5
tbyte_1001AB54 dt 1.1897133414953030964e4932
off_1001AB5E dd offset sub_100129B4, offset word_100129BA ; jumptable 100129AD case 2
dd offset sub_100129BF, offset byte_100129C5
dd offset sub_100129CA, offset sub_100129D0
dd offset sub_100129D6, offset sub_100129DC
dd offset sub_100129E2, offset word_100129FE
dd offset sub_10012A03, offset byte_10012A19
dd offset sub_10012A1E, offset sub_10012A3A
dd offset sub_10012A4A, offset sub_10012A5E
dd offset sub_10012A6E, offset word_10012A8E
dd offset sub_10012A93, offset byte_10012AAD
dd offset sub_10012AB2, offset sub_10012AD2
dd offset sub_10012AE6, offset sub_10012AFE
dd offset sub_10012B12, offset word_10012B32
dd offset sub_10012B37, offset byte_10012B51
dd offset sub_10012B56, offset sub_10012B76
dd offset sub_10012B8A, offset sub_10012BA2
dd offset sub_10012BB6, offset word_10012BD6
dd offset sub_10012BDB, offset byte_10012BF5
dd offset sub_10012BFA, offset sub_10012C1A
dd offset sub_10012C2E, offset sub_10012C46
dd offset sub_10012C5A, offset word_10012C7A
dd offset sub_10012C7F, offset byte_10012C99
dd offset sub_10012C9E, offset sub_10012CBE
dd offset sub_10012CD2, offset sub_10012CEA
dd offset sub_10012CFE, offset word_10012D1E
dd offset sub_10012D23, offset byte_10012D3D
dd offset sub_10012D42, offset sub_10012D62
dd offset sub_10012D76, offset sub_10012D8E
dd offset sub_10012DA2, offset word_10012DC2
dd offset sub_10012DC7, offset byte_10012DE1
dd offset sub_10012DE6, offset sub_10012E06
dd offset sub_10012E1A, offset sub_10012E32
align 10h
unk_1001AC60 db    5
db    0
db    0
db 0C0h ; À
db  0Bh
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  1Dh
db    0
db    0
db 0C0h ; À
db    4
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  96h ; –
db    0
db    0
db 0C0h ; À
db    4
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  8Dh
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  8Eh ; Ž
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  8Fh
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  90h
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  91h ; ‘
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  92h ; ’
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  93h ; “
db    0
db    0
db 0C0h ; À
db    8
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    3
db    0
db    0
db    0
db    7
db    0
db    0
db    0
db  78h ; x
db    0
db    0
db    0
db  0Ah
db    0
db    0
db    0
byte_1001ACE8 db 1
db    2
db    4
db    8
db    0
db    0
db    0
db    0
unk_1001ACF0 db 0A4h ; ¤
db    3
db    0
db    0
unk_1001ACF4 db  60h ; `
db  82h ; ‚
db  79h ; y
db  82h ; ‚
db  21h ; !
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001AD00 db 0A6h ; ¦
db 0DFh ; ß
db    0
db    0
db    0
db    0
db    0
db    0
db 0A1h ; ¡
db 0A5h ; ¥
db    0
db    0
db    0
db    0
db    0
db    0
db  81h
db  9Fh ; Ÿ
db 0E0h ; à
db 0FCh ; ü
db    0
db    0
db    0
db    0
db  40h ; @
db  7Eh ; ~
db  80h ; €
db 0FCh ; ü
db    0
db    0
db    0
db    0
db 0A8h ; ¨
db    3
db    0
db    0
db 0C1h ; Á
db 0A3h ; £
db 0DAh ; Ú
db 0A3h ; £
db  20h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  81h
db 0FEh ; þ
db    0
db    0
db    0
db    0
db    0
db    0
db  40h ; @
db 0FEh ; þ
db    0
db    0
db    0
db    0
db    0
db    0
db 0B5h ; µ
db    3
db    0
db    0
db 0C1h ; Á
db 0A3h ; £
db 0DAh ; Ú
db 0A3h ; £
db  20h
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  81h
db 0FEh ; þ
db    0
db    0
db    0
db    0
db    0
db    0
db  41h ; A
db 0FEh ; þ
db    0
db    0
db    0
db    0
db    0
db    0
db 0B6h ; ¶
db    3
db    0
db    0
db 0CFh ; Ï
db 0A2h ; ¢
db 0E4h ; ä
db 0A2h ; ¢
db  1Ah
db    0
db 0E5h ; å
db 0A2h ; ¢
db 0E8h ; è
db 0A2h ; ¢
db  5Bh ; [
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  81h
db 0FEh ; þ
db    0
db    0
db    0
db    0
db    0
db    0
db  40h ; @
db  7Eh ; ~
db 0A1h ; ¡
db 0FEh ; þ
db    0
db    0
db    0
db    0
db  51h ; Q
db    5
db    0
db    0
db  51h ; Q
db 0DAh ; Ú
db  5Eh ; ^
db 0DAh ; Ú
db  20h
db    0
db  5Fh ; _
db 0DAh ; Ú
db  6Ah ; j
db 0DAh ; Ú
db  32h ; 2
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  81h
db 0D3h ; Ó
db 0D8h ; Ø
db 0DEh ; Þ
db 0E0h ; à
db 0F9h ; ù
db    0
db    0
db  31h ; 1
db  7Eh ; ~
db  81h
db 0FEh ; þ
db    0
db    0
db    0
db    0
unk_1001ADE0 db  43h ; C
db    0
db    0
db    0
db  43h ; C
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  43h ; C
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dd offset off_1001AEF8
align 8
off_1001AEF8 dd offset aSun ; "Sun"
dd offset aMon          ; "Mon"
dd offset aTue          ; "Tue"
dd offset aWed          ; "Wed"
dd offset aThu          ; "Thu"
dd offset aFri          ; "Fri"
dd offset aSat          ; "Sat"
dd offset aSunday       ; "Sunday"
dd offset aMonday       ; "Monday"
dd offset aTuesday      ; "Tuesday"
dd offset aWednesday    ; "Wednesday"
dd offset aThursday     ; "Thursday"
dd offset aFriday       ; "Friday"
dd offset aSaturday     ; "Saturday"
dd offset aJan          ; "Jan"
dd offset aFeb          ; "Feb"
dd offset aMar          ; "Mar"
dd offset aApr          ; "Apr"
dd offset aMay          ; "May"
dd offset aJun          ; "Jun"
dd offset aJul          ; "Jul"
dd offset aAug          ; "Aug"
dd offset aSep          ; "Sep"
dd offset aOct          ; "Oct"
dd offset aNov          ; "Nov"
dd offset aDec          ; "Dec"
dd offset aJanuary      ; "January"
dd offset aFebruary     ; "February"
dd offset aMarch        ; "March"
dd offset aApril        ; "April"
dd offset aMay          ; "May"
dd offset aJune         ; "June"
dd offset aJuly         ; "July"
dd offset aAugust       ; "August"
dd offset aSeptember    ; "September"
dd offset aOctober      ; "October"
dd offset aNovember     ; "November"
dd offset aDecember     ; "December"
dd offset aAm           ; "AM"
dd offset aPm           ; "PM"
dd offset aMDYy         ; "M/d/yy"
dd offset aDdddMmmmDdYyyy ; "dddd, MMMM dd, yyyy"
dd offset aHMmSs        ; "H:mm:ss"
align 8
unk_1001AFA8 db  2Eh ; .
db    0
db    0
db    0
db    0
db    0
db    0
db    0
off_1001AFB0 dd offset unk_1001AFA8
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
dd offset unk_1001B6B4
db  7Fh ; 
db  7Fh ; 
db  7Fh ; 
db  7Fh ; 
db  7Fh ; 
db  7Fh ; 
db  7Fh ; 
db  7Fh ; 
dd offset off_1001AFB0
align 10h
unk_1001AFF0 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db 0A0h ;  
db    2
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db 0C8h ; È
db    5
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db 0FAh ; ú
db    8
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  40h ; @
db  9Ch ; œ
db  0Ch
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  50h ; P
db 0C3h ; Ã
db  0Fh
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  24h ; $
db 0F4h ; ô
db  12h
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  80h ; €
db  96h ; –
db  98h ; ˜
db  16h
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db  20h
db 0BCh ; ¼
db 0BEh ; ¾
db  19h
db  40h ; @
db    0
db    0
db    0
db    0
db    0
db    4
db 0BFh ; ¿
db 0C9h ; É
db  1Bh
db  8Eh ; Ž
db  34h ; 4
db  40h ; @
db    0
db    0
db    0
db 0A1h ; ¡
db 0EDh ; í
db 0CCh ; Ì
db 0CEh ; Î
db  1Bh
db 0C2h ; Â
db 0D3h ; Ó
db  4Eh ; N
db  40h ; @
db  20h
db 0F0h ; ð
db  9Eh ; ž
db 0B5h ; µ
db  70h ; p
db  2Bh ; +
db 0A8h ; ¨
db 0ADh ; ­
db 0C5h ; Å
db  9Dh
db  69h ; i
db  40h ; @
db 0D0h ; Ð
db  5Dh ; ]
db 0FDh ; ý
db  25h ; %
db 0E5h ; å
db  1Ah
db  8Eh ; Ž
db  4Fh ; O
db  19h
db 0EBh ; ë
db  83h ; ƒ
db  40h ; @
db  71h ; q
db  96h ; –
db 0D7h ; ×
db  95h ; •
db  43h ; C
db  0Eh
db    5
db  8Dh
db  29h ; )
db 0AFh ; ¯
db  9Eh ; ž
db  40h ; @
db 0F9h ; ù
db 0BFh ; ¿
db 0A0h ;  
db  44h ; D
db 0EDh ; í
db  81h
db  12h
db  8Fh
db  81h
db  82h ; ‚
db 0B9h ; ¹
db  40h ; @
db 0BFh ; ¿
db  3Ch ; <
db 0D5h ; Õ
db 0A6h ; ¦
db 0CFh ; Ï
db 0FFh ; ÿ
db  49h ; I
db  1Fh
db  78h ; x
db 0C2h ; Â
db 0D3h ; Ó
db  40h ; @
db  6Fh ; o
db 0C6h ; Æ
db 0E0h ; à
db  8Ch ; Œ
db 0E9h ; é
db  80h ; €
db 0C9h ; É
db  47h ; G
db 0BAh ; º
db  93h ; “
db 0A8h ; ¨
db  41h ; A
db 0BCh ; ¼
db  85h ; …
db  6Bh ; k
db  55h ; U
db  27h ; '
db  39h ; 9
db  8Dh
db 0F7h ; ÷
db  70h ; p
db 0E0h ; à
db  7Ch ; |
db  42h ; B
db 0BCh ; ¼
db 0DDh ; Ý
db  8Eh ; Ž
db 0DEh ; Þ
db 0F9h ; ù
db  9Dh
db 0FBh ; û
db 0EBh ; ë
db  7Eh ; ~
db 0AAh ; ª
db  51h ; Q
db  43h ; C
db 0A1h ; ¡
db 0E6h ; æ
db  76h ; v
db 0E3h ; ã
db 0CCh ; Ì
db 0F2h ; ò
db  29h ; )
db  2Fh ; /
db  84h ; „
db  81h
db  26h ; &
db  44h ; D
db  28h ; (
db  10h
db  17h
db 0AAh ; ª
db 0F8h ; ø
db 0AEh ; ®
db  10h
db 0E3h ; ã
db 0C5h ; Å
db 0C4h ; Ä
db 0FAh ; ú
db  44h ; D
db 0EBh ; ë
db 0A7h ; §
db 0D4h ; Ô
db 0F3h ; ó
db 0F7h ; ÷
db 0EBh ; ë
db 0E1h ; á
db  4Ah ; J
db  7Ah ; z
db  95h ; •
db 0CFh ; Ï
db  45h ; E
db  65h ; e
db 0CCh ; Ì
db 0C7h ; Ç
db  91h ; ‘
db  0Eh
db 0A6h ; ¦
db 0AEh ; ®
db 0A0h ;  
db  19h
db 0E3h ; ã
db 0A3h ; £
db  46h ; F
db  0Dh
db  65h ; e
db  17h
db  0Ch
db  75h ; u
db  81h
db  86h ; †
db  75h ; u
db  76h ; v
db 0C9h ; É
db  48h ; H
db  4Dh ; M
db  58h ; X
db  42h ; B
db 0E4h ; ä
db 0A7h ; §
db  93h ; “
db  39h ; 9
db  3Bh ; ;
db  35h ; 5
db 0B8h ; ¸
db 0B2h ; ²
db 0EDh ; í
db  53h ; S
db  4Dh ; M
db 0A7h ; §
db 0E5h ; å
db  5Dh ; ]
db  3Dh ; =
db 0C5h ; Å
db  5Dh ; ]
db  3Bh ; ;
db  8Bh ; ‹
db  9Eh ; ž
db  92h ; ’
db  5Ah ; Z
db 0FFh ; ÿ
db  5Dh ; ]
db 0A6h ; ¦
db 0F0h ; ð
db 0A1h ; ¡
db  20h
db 0C0h ; À
db  54h ; T
db 0A5h ; ¥
db  8Ch ; Œ
db  37h ; 7
db  61h ; a
db 0D1h ; Ñ
db 0FDh ; ý
db  8Bh ; ‹
db  5Ah ; Z
db  8Bh ; ‹
db 0D8h ; Ø
db  25h ; %
db  5Dh ; ]
db  89h ; ‰
db 0F9h ; ù
db 0DBh ; Û
db  67h ; g
db 0AAh ; ª
db  95h ; •
db 0F8h ; ø
db 0F3h ; ó
db  27h ; '
db 0BFh ; ¿
db 0A2h ; ¢
db 0C8h ; È
db  5Dh ; ]
db 0DDh ; Ý
db  80h ; €
db  6Eh ; n
db  4Ch ; L
db 0C9h ; É
db  9Bh ; ›
db  97h ; —
db  20h
db  8Ah ; Š
db    2
db  52h ; R
db  60h ; `
db 0C4h ; Ä
db  25h ; %
db  75h ; u
db    0
db    0
db    0
db    0
unk_1001B150 db 0CDh ; Í
db 0CCh ; Ì
db 0CDh ; Í
db 0CCh ; Ì
db 0CCh ; Ì
db 0CCh ; Ì
db 0CCh ; Ì
db 0CCh ; Ì
db 0CCh ; Ì
db 0CCh ; Ì
db 0FBh ; û
db  3Fh ; ?
db  71h ; q
db  3Dh ; =
db  0Ah
db 0D7h ; ×
db 0A3h ; £
db  70h ; p
db  3Dh ; =
db  0Ah
db 0D7h ; ×
db 0A3h ; £
db 0F8h ; ø
db  3Fh ; ?
db  5Ah ; Z
db  64h ; d
db  3Bh ; ;
db 0DFh ; ß
db  4Fh ; O
db  8Dh
db  97h ; —
db  6Eh ; n
db  12h
db  83h ; ƒ
db 0F5h ; õ
db  3Fh ; ?
db 0C3h ; Ã
db 0D3h ; Ó
db  2Ch ; ,
db  65h ; e
db  19h
db 0E2h ; â
db  58h ; X
db  17h
db 0B7h ; ·
db 0D1h ; Ñ
db 0F1h ; ñ
db  3Fh ; ?
db 0D0h ; Ð
db  0Fh
db  23h ; #
db  84h ; „
db  47h ; G
db  1Bh
db  47h ; G
db 0ACh ; ¬
db 0C5h ; Å
db 0A7h ; §
db 0EEh ; î
db  3Fh ; ?
db  40h ; @
db 0A6h ; ¦
db 0B6h ; ¶
db  69h ; i
db  6Ch ; l
db 0AFh ; ¯
db    5
db 0BDh ; ½
db  37h ; 7
db  86h ; †
db 0EBh ; ë
db  3Fh ; ?
db  33h ; 3
db  3Dh ; =
db 0BCh ; ¼
db  42h ; B
db  7Ah ; z
db 0E5h ; å
db 0D5h ; Õ
db  94h ; ”
db 0BFh ; ¿
db 0D6h ; Ö
db 0E7h ; ç
db  3Fh ; ?
db 0C2h ; Â
db 0FDh ; ý
db 0FDh ; ý
db 0CEh ; Î
db  61h ; a
db  84h ; „
db  11h
db  77h ; w
db 0CCh ; Ì
db 0ABh ; «
db 0E4h ; ä
db  3Fh ; ?
db  2Fh ; /
db  4Ch ; L
db  5Bh ; [
db 0E1h ; á
db  4Dh ; M
db 0C4h ; Ä
db 0BEh ; ¾
db  94h ; ”
db  95h ; •
db 0E6h ; æ
db 0C9h ; É
db  3Fh ; ?
db  92h ; ’
db 0C4h ; Ä
db  53h ; S
db  3Bh ; ;
db  75h ; u
db  44h ; D
db 0CDh ; Í
db  14h
db 0BEh ; ¾
db  9Ah ; š
db 0AFh ; ¯
db  3Fh ; ?
db 0DEh ; Þ
db  67h ; g
db 0BAh ; º
db  94h ; ”
db  39h ; 9
db  45h ; E
db 0ADh ; ­
db  1Eh
db 0B1h ; ±
db 0CFh ; Ï
db  94h ; ”
db  3Fh ; ?
db  24h ; $
db  23h ; #
db 0C6h ; Æ
db 0E2h ; â
db 0BCh ; ¼
db 0BAh ; º
db  3Bh ; ;
db  31h ; 1
db  61h ; a
db  8Bh ; ‹
db  7Ah ; z
db  3Fh ; ?
db  61h ; a
db  55h ; U
db  59h ; Y
db 0C1h ; Á
db  7Eh ; ~
db 0B1h ; ±
db  53h ; S
db  7Ch ; |
db  12h
db 0BBh ; »
db  5Fh ; _
db  3Fh ; ?
db 0D7h ; ×
db 0EEh ; î
db  2Fh ; /
db  8Dh
db    6
db 0BEh ; ¾
db  92h ; ’
db  85h ; …
db  15h
db 0FBh ; û
db  44h ; D
db  3Fh ; ?
db  24h ; $
db  3Fh ; ?
db 0A5h ; ¥
db 0E9h ; é
db  39h ; 9
db 0A5h ; ¥
db  27h ; '
db 0EAh ; ê
db  7Fh ; 
db 0A8h ; ¨
db  2Ah ; *
db  3Fh ; ?
db  7Dh ; }
db 0ACh ; ¬
db 0A1h ; ¡
db 0E4h ; ä
db 0BCh ; ¼
db  64h ; d
db  7Ch ; |
db  46h ; F
db 0D0h ; Ð
db 0DDh ; Ý
db  55h ; U
db  3Eh ; >
db  63h ; c
db  7Bh ; {
db    6
db 0CCh ; Ì
db  23h ; #
db  54h ; T
db  77h ; w
db  83h ; ƒ
db 0FFh ; ÿ
db  91h ; ‘
db  81h
db  3Dh ; =
db  91h ; ‘
db 0FAh ; ú
db  3Ah ; :
db  19h
db  7Ah ; z
db  63h ; c
db  25h ; %
db  43h ; C
db  31h ; 1
db 0C0h ; À
db 0ACh ; ¬
db  3Ch ; <
db  21h ; !
db  89h ; ‰
db 0D1h ; Ñ
db  38h ; 8
db  82h ; ‚
db  47h ; G
db  97h ; —
db 0B8h ; ¸
db    0
db 0FDh ; ý
db 0D7h ; ×
db  3Bh ; ;
db 0DCh ; Ü
db  88h ; ˆ
db  58h ; X
db    8
db  1Bh
db 0B1h ; ±
db 0E8h ; è
db 0E3h ; ã
db  86h ; †
db 0A6h ; ¦
db    3
db  3Bh ; ;
db 0C6h ; Æ
db  84h ; „
db  45h ; E
db  42h ; B
db    7
db 0B6h ; ¶
db  99h ; ™
db  75h ; u
db  37h ; 7
db 0DBh ; Û
db  2Eh ; .
db  3Ah ; :
db  33h ; 3
db  71h ; q
db  1Ch
db 0D2h ; Ò
db  23h ; #
db 0DBh ; Û
db  32h ; 2
db 0EEh ; î
db  49h ; I
db  90h
db  5Ah ; Z
db  39h ; 9
db 0A6h ; ¦
db  87h ; ‡
db 0BEh ; ¾
db 0C0h ; À
db  57h ; W
db 0DAh ; Ú
db 0A5h ; ¥
db  82h ; ‚
db 0A6h ; ¦
db 0A2h ; ¢
db 0B5h ; µ
db  32h ; 2
db 0E2h ; â
db  68h ; h
db 0B2h ; ²
db  11h
db 0A7h ; §
db  52h ; R
db  9Fh ; Ÿ
db  44h ; D
db  59h ; Y
db 0B7h ; ·
db  10h
db  2Ch ; ,
db  25h ; %
db  49h ; I
db 0E4h ; ä
db  2Dh ; -
db  36h ; 6
db  34h ; 4
db  4Fh ; O
db  53h ; S
db 0AEh ; ®
db 0CEh ; Î
db  6Bh ; k
db  25h ; %
db  8Fh
db  59h ; Y
db    4
db 0A4h ; ¤
db 0C0h ; À
db 0DEh ; Þ
db 0C2h ; Â
db  7Dh ; }
db 0FBh ; û
db 0E8h ; è
db 0C6h ; Æ
db  1Eh
db  9Eh ; ž
db 0E7h ; ç
db  88h ; ˆ
db  5Ah ; Z
db  57h ; W
db  91h ; ‘
db  3Ch ; <
db 0BFh ; ¿
db  50h ; P
db  83h ; ƒ
db  22h ; "
db  18h
db  4Eh ; N
db  4Bh ; K
db  65h ; e
db  62h ; b
db 0FDh ; ý
db  83h ; ƒ
db  8Fh
db 0AFh ; ¯
db    6
db  94h ; ”
db  7Dh ; }
db  11h
db 0E4h ; ä
db  2Dh ; -
db 0DEh ; Þ
db  9Fh ; Ÿ
db 0CEh ; Î
db 0D2h ; Ò
db 0C8h ; È
db    4
db 0DDh ; Ý
db 0A6h ; ¦
db 0D8h ; Ø
db  0Ah
db  80h ; €
db  70h ; p
db    0
db    0
db    1
db    0
db    0
db    0
db 0F0h ; ð
db 0F1h ; ñ
db 0FFh ; ÿ
db 0FFh ; ÿ
unk_1001B2B8 db  50h ; P
db  53h ; S
db  54h ; T
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B2F8 db  50h ; P
db  44h ; D
db  54h ; T
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dd offset unk_1001B2B8
dd offset unk_1001B2F8
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db  1Eh
db    0
db    0
db    0
db  3Bh ; ;
db    0
db    0
db    0
db  5Ah ; Z
db    0
db    0
db    0
db  78h ; x
db    0
db    0
db    0
db  97h ; —
db    0
db    0
db    0
db 0B5h ; µ
db    0
db    0
db    0
db 0D4h ; Ô
db    0
db    0
db    0
db 0F3h ; ó
db    0
db    0
db    0
db  11h
db    1
db    0
db    0
db  30h ; 0
db    1
db    0
db    0
db  4Eh ; N
db    1
db    0
db    0
db  6Dh ; m
db    1
db    0
db    0
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db 0FFh ; ÿ
db  1Eh
db    0
db    0
db    0
db  3Ah ; :
db    0
db    0
db    0
db  59h ; Y
db    0
db    0
db    0
db  77h ; w
db    0
db    0
db    0
db  96h ; –
db    0
db    0
db    0
db 0B4h ; ´
db    0
db    0
db    0
db 0D3h ; Ó
db    0
db    0
db    0
db 0F2h ; ò
db    0
db    0
db    0
db  10h
db    1
db    0
db    0
db  2Fh ; /
db    1
db    0
db    0
db  4Dh ; M
db    1
db    0
db    0
db  6Ch ; l
db    1
db    0
db    0
dword_1001B3C8 dd 0
word_1001B3CC dw 0
word_1001B3CE dw 0
word_1001B3D0 dw 0
word_1001B3D2 dw 0
word_1001B3D4 dw 0
word_1001B3D6 dw 0
db    0
db    0
db    0
db    0
dword_1001B3DC dd 0
word_1001B3E0 dw 0
align 4
dword_1001B3E4 dd 0
unk_1001B3E8 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_1001B410 dd 0
dword_1001B414 dd 0
dword_1001B418 dd 0
dword_1001B41C dd 0
dword_1001B420 dd 0
; LPVOID dword_1001B424
dword_1001B424 dd 0
db    0
db    0
db    0
db    0
dword_1001B42C dd 0
dword_1001B430 dd 0
dword_1001B434 dd 0
unk_1001B438 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B450 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B468 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B480 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_1001B498 dd 0
dword_1001B49C dd 0
db    0
db    0
db    0
db    0
dword_1001B4A4 dd 0
dword_1001B4A8 dd 0
dword_1001B4AC dd 0
dword_1001B4B0 dd 0
dword_1001B4B4 dd 0
dword_1001B4B8 dd 0
align 10h
dword_1001B4C0 dd 0
align 10h
dword_1001B4D0 dd 0
align 8
byte_1001B4D8 db 0
align 4
dword_1001B4DC dd 0
dword_1001B4E0 dd 0
; CHAR Filename[260]
Filename db 104h dup(0)
dword_1001B5E8 dd 0
dword_1001B5EC dd 0
dword_1001B5F0 dd 0
dword_1001B5F4 dd 0
dword_1001B5F8 dd 0
dword_1001B5FC dd 0
dword_1001B600 dd 0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B624 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
; LCID dword_1001B62C
dword_1001B62C dd 0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_1001B63C dd 0
db    0
db    0
db    0
db    0
dword_1001B644 dd 0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B6B4 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_1001B788 dd 0
; volatile LONG Addend
Addend dd 0
; UINT CodePage
CodePage dd 0
align 10h
unk_1001B7A0 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
dword_1001B7AC dd 0
align 20h
byte_1001B7C0 db 0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
unk_1001B8C0 db    0
byte_1001B8C1 db 0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
; LCID Locale
Locale dd 0
align 20h
dword_1001B9E0 dd 0
unk_1001B9E4 db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
db    0
; UINT uNumber
uNumber dd 0
dword_1001BAE4 dd 0
dword_1001BAE8 dd 0
dword_1001BAEC dd 0
dword_1001BAF0 dd 0
dword_1001BAF4 dd 0
dword_1001BAF8 dd 0
dword_1001BAFC dd 0
dword_1001BB00 dd 0
dword_1001BB04 dd 0
; LPVOID lpMem
lpMem dd 0
dword_1001BB0C dd 0
; HANDLE hHeap
hHeap dd 0
dword_1001BB14 dd 0
dword_1001BB18 dd 0
dword_1001BB1C dd 0
align 800h
_data ends


end DllEntryPoint

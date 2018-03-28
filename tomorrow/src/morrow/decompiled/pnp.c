#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

int32_t g3 = 0; // ebp
int32_t g5 = 0; // ecx
int32_t g4 = 0; // esi
int32_t g6 = 0; // edi
int32_t g7 = 0; // edx
int32_t g8 = 0; // esi

int32_t g35 = 1;
int32_t g37; // 0x1000eef4

int32_t g40 = 0;

SET9052 *g_sa9054_data = 0;

int32_t g59 = 0;
int32_t g60 = 0;
int32_t g62 = 0;
int32_t g63 = 0;

int32_t g93 = 0;
int32_t g94 = 0;
int32_t g95 = 0;
int32_t g96 = 0;
int32_t g97 = 0;
int32_t g98 = 0;


int32_t mr90xx_init(int32_t session_string, int32_t query_flag, int32_t reset_flag, int32_t * session_id);
int32_t mr90xx_SetEngineModel(int32_t a1, int16_t a2, int32_t a3) ;

int32_t function_10004411(int16_t a1);
int32_t function_10006643(char a1) ;
int32_t function_1000655f(char a1, int32_t a2);
int32_t function_10009277(int32_t a1, int32_t a2, char a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7, int32_t a8);

void *function_10004960(void *a1) ;

int32_t __amsg_exit(int32_t a1){return 0; }
int32_t __nh_malloc(int32_t a1, int32_t a2){ return 0; }
//HGLOBAL GlobalAlloc(_In_ UINT uFlags, _In_ SIZE_T dwBytes);
//HGLOBAL GlobalFree(HGLOBAL hMem);
//LPVOID GlobalLock(_In_ HGLOBAL hMem);
//BOOL GlobalUnlock(_In_ HGLOBAL hMem);
//VOID InitializeCriticalSection(_Out_ LPCRITICAL_SECTION lpCriticalSection);
//VOID EnterCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection);
//VOID LeaveCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection);


int32_t mr90xx_init(int32_t session_string, int32_t query_flag, int32_t reset_flag, int32_t * session_id) {
    int32_t v1 = (int32_t)session_id;
    *session_id = 0;
    if (session_string == 0) {
        // 0x10002fb5
        // branch -> 0x10003115
        // 0x10003115
        return -0x4003ffff;
    }
    int32_t v2 = query_flag & 0xffff; // 0x10002fc2
    if (v2 != 1) {
        // 0x10002fcd
        if (v2 != 0) {
            // 0x10002fda
            // branch -> 0x10003115
            // 0x10003115
            return -0x4003fffe;
        }
    }
    int32_t v3 = reset_flag & 0xffff; // 0x10002fe7
    if (v3 != 1) {
        // 0x10002ff1
        if (v3 != 0) {
            // 0x10002ffe
            // branch -> 0x10003115
            // 0x10003115
            return -0x4003fffd;
        }
    }
    int32_t result = mr90xx_OpenSession(session_string, session_id); // 0x10003020
    if (result != 0) {
        // 0x10003031
        // branch -> 0x10003115
        // 0x10003115
        return result;
    }
    int32_t v4 = *session_id; // 0x10003041
    g7 = v4;
    int32_t result2 = mr90xx_SetEngineModel(v4, 256, 0); // 0x10003044
    if (result2 != 0) {
        // 0x10003055
        mr90xx_CloseSession(*session_id);
        // branch -> 0x10003115
        // 0x10003115
        return result2;
    }
    // 0x1000306b
    g7 = v1;
    int32_t result3 = mr90xx_InitEngine(*session_id, 0); // 0x10003071
    if (result3 != 0x3ffc0811) {
        int32_t v5 = *session_id; // 0x10003088
        g7 = v5;
        mr90xx_CloseSession(v5);
        // branch -> 0x10003115
        // 0x10003115
        return result3;
    }
    // 0x10003098
    int32_t result5; // 0x10003118
    int32_t result4; // 0x100030ef
    int32_t v6; // 0x10003103
    if (v2 == 0) {
        // 0x100030dc
        g5 = v3;
        if (v3 != 0) {
            // 0x100030e9
            g7 = v1;
            result4 = mr90xx_reset(*session_id);
            if (result4 < 0) {
                // 0x10003100
                v6 = *session_id;
                g7 = v6;
                mr90xx_CloseSession(v6);
                // branch -> 0x10003115
                // 0x10003115
                return result4;
            }
        }
        // 0x10003113
        result5 = 0;
        // branch -> 0x10003115
    } else {
        // 0x100030a4
        g7 = v1;
        int16_t v7; // bp-8
        if (function_100037d0(*session_id, (int32_t)&v7, 0x3ffc0811) == 0) {
            // 0x100030bf
            if (v7 != 0) {
                // 0x100030dc
                g5 = v3;
                if (v3 != 0) {
                    // 0x100030e9
                    g7 = v1;
                    result4 = mr90xx_reset(*session_id);
                    if (result4 < 0) {
                        // 0x10003100
                        v6 = *session_id;
                        g7 = v6;
                        mr90xx_CloseSession(v6);
                        // branch -> 0x10003115
                        // 0x10003115
                        return result4;
                    }
                }
                // 0x10003113
                // branch -> 0x10003115
                // 0x10003115
                return 0;
            }
        }
        // 0x100030c7
        g7 = v1;
        mr90xx_CloseSession(*session_id);
        result5 = -0x4003f7f3;
        // branch -> 0x10003115
    }
    // 0x10003115
    return result5;
}

// Address range: 0x100046f3 - 0x1000495f
int32_t mr90xx_OpenSession(int32_t session_string, int32_t * session_id) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    SET9052 *v2 = function_10004960(-1); // 0x1000470f
    if (v2 == 0) {
        // 0x10004723
        // branch -> 0x1000495c
        // 0x1000495c
        g3 = v1;
        return -1;
    }
    // 0x1000472b
    ClearFuncStatusCode(v2);
    int32_t v3; // bp-280
    int32_t v4 = &v3; // 0x10004770
    int32_t v5 = 0; // 0x1000475512
    // branch -> 0x1000475e
    while (true) {
        int32_t * v6 = (int32_t *)(4 * v5 + (int32_t)&g60); // 0x10004764
        if (*v6 != 0) {
            // 0x10004770
            RdSessionString(*v6, v4);
            g5 = v4;
            if (function_1000a4b0((char *)&v3, session_string) == 0) {
                // 0x100047a4
                function_1000498f(v2);
                // branch -> 0x1000495c
                // 0x1000495c
                g3 = v1;
                return -0x4003f7f4;
            }
        }
        int32_t v7 = v5 + 1; // 0x1000474c
        if ((int16_t)v7 >= 100) {
            // break -> 0x100047bf
            break;
        }
        v5 = 0x10000 * v7 / 0x10000;
        // continue -> 0x1000475e
    }
    // 0x100047bf
    if ((0x10000 * InitInstrData(v2) || 0xffff) >= 0x1ffff) {
        // 0x100047d5
        function_1000498f(v2);
        // branch -> 0x1000495c
        // 0x1000495c
        g3 = v1;
        return -0x4003f7ff;
    }
    int16_t v8 = OpenSession(v2, session_string, 1); // 0x100047fb
    int32_t result; // 0x1000495f
    if (v8 == 0) {
        // 0x10004839
        *session_id = RdSessionHandle(v2);
        int32_t v9 = 0; // 0x1000486810
        int16_t v10 = 0;
        // branch -> 0x10004871
        while (true) {
            // 0x10004871
            if (*(int32_t *)(4 * v9 + (int32_t)&g60) != 0) {
                int32_t v11 = v9 + 1; // 0x1000485f
                int16_t v12 = v11; // 0x10004862
                if (v12 >= 100) {
                    // break -> 0x10004893
                    break;
                }
                v9 = 0x10000 * v11 / 0x10000;
                v10 = v12;
                // continue -> 0x10004871
                continue;
            }
            // 0x10004893
            if (v10 == -1) {
                // 0x1000489f
                function_1000498f(v2);
                // branch -> 0x1000495c
                // 0x1000495c
                g3 = v1;
                return -0x4003f7ff;
            }
            int32_t v13 = 0; // 0x100048d38
            // branch -> 0x100048dc
            while (true) {
                int32_t * v14 = (int32_t *)(4 * v13 + (int32_t)&g60); // 0x100048e2
                if (*v14 != 0) {
                    // 0x100048ee
                    if (*session_id == RdSessionHandle(*v14)) {
                        // 0x1000490b
                        function_1000498f(v2);
                        // branch -> 0x1000495c
                        // 0x1000495c
                        g3 = v1;
                        return -0x4003f7f4;
                    }
                }
                int32_t v15 = v13 + 1; // 0x100048ca
                if ((int16_t)v15 >= 100) {
                    // break -> 0x10004923
                    break;
                }
                v13 = 0x10000 * v15 / 0x10000;
                // continue -> 0x100048dc
            }
            int32_t v16 = 4 * (int32_t)v10; // 0x10004930
            *(int32_t *)(v16 + (int32_t)&g60) = v2;
            *(int32_t *)(v16 + (int32_t)&g59) = g_sa9054_data;
            ClearFuncStatusCode(v2);
            // branch -> 0x1000495c
            // 0x1000495c
            g3 = v1;
            return 0;
        }
    } else {
        // 0x10004815
        function_1000498f(v2);
        result = function_10004411(v8);
        // branch -> 0x1000495c
    }
    // 0x1000495c
    g3 = v1;
    return result;
}

// Address range: 0x100025dd - 0x1000262f
int32_t mr90xx_SetEngineModel(int32_t a1, int16_t a2, int32_t a3) {
    // entry
    g5 = a1;
    int32_t v1 = 0; // bp-16
    int32_t v2 = function_10004310(a1, &v1); // 0x100025eb
    int32_t result; // 0x1000262f
    if (v2 == 0) {
        // 0x10002601
        result = function_10004411((int16_t)SetEngineModel(function_10004402(v1)));
        // branch -> 0x1000262c
    } else {
        // 0x100025fc
        result = v2;
        // branch -> 0x1000262c
    }
    // 0x1000262c
    return result;
}

// Address range: 0x10004a21 - 0x10004a81
int32_t mr90xx_CloseSession(int32_t a1) {
    int32_t v1 = 0; // bp-8
    int32_t v2 = function_10004310(a1, &v1); // 0x10004a2f
    int32_t result = v2;
    if (v2 == 0) {
        int32_t v3 = *(int32_t *)(4 * v1 + (int32_t)&g60); // 0x10004a48
        CloseSession(v3, 0x10000 * RdInterfaceType(v3) / 0x10000);
        function_1000498f(v3);
        result = 0;
        // branch -> 0x10004a7e
    }
    // 0x10004a7e
    return result;
}

// Address range: 0x10003822 - 0x1000386f
int32_t mr90xx_InitEngine(int32_t a1, int32_t a2) {
    int32_t v1 = 0; // bp-16
    int32_t v2 = function_10004310(a1, &v1); // 0x10003830
    int32_t result; // 0x1000386f
    if (v2 == 0) {
        // 0x10003846
        result = function_10004411((int16_t)InitEngine(function_10004402(v1)));
        // branch -> 0x1000386c
    } else {
        // 0x10003841
        result = v2;
        // branch -> 0x1000386c
    }
    // 0x1000386c
    return result;
}

// Address range: 0x10003119 - 0x1000316d
int32_t mr90xx_reset(int32_t a1) {
    int32_t result = mr90xx_ResetEngine(a1, g5); // 0x10003121
    if (result != 0x3ffc0811) {
        // 0x10003135
        // branch -> 0x1000316a
        // 0x1000316a
        return result;
    }
    int32_t v1 = mr90xx_InitEngine(a1, 0x3ffc0811); // 0x1000313e
    int32_t result2; // 0x1000316d
    if (v1 == 0x3ffc0811) {
        // 0x10003157
        g7 = a1;
        mr90xx_SetTimeoutWait(a1, 300, 0x3ffc0811);
        result2 = 0;
        // branch -> 0x1000316a
    } else {
        // 0x10003152
        result2 = v1;
        // branch -> 0x1000316a
    }
    // 0x1000316a
    return result2;
}

int32_t mr90xx_ResetEngine(int32_t a1, int32_t a2) {
    int32_t v1 = 0; // bp-16
    int32_t v2 = function_10004310(a1, &v1); // 0x1000387e
    int32_t result; // 0x100038bd
    if (v2 == 0) {
        // 0x10003894
        result = function_10004411((int16_t)ResetEngine(function_10004402(v1)));
        // branch -> 0x100038ba
    } else {
        // 0x1000388f
        result = v2;
        // branch -> 0x100038ba
    }
    // 0x100038ba
    return result;
}

int32_t mr90xx_SetTimeoutWait(int32_t a1, int32_t a2, int32_t a3) {
    // entry
    g5 = a1;
    int32_t v1 = 0; // bp-16
    int32_t v2 = function_10004310(a1, &v1); // 0x10004c2f
    int32_t result; // 0x10004c72
    if (v2 == 0) {
        // 0x10004c45
        result = function_10004411((int16_t)SetTimeoutWait(function_10004402(v1)));
        // branch -> 0x10004c6f
    } else {
        // 0x10004c40
        result = v2;
        // branch -> 0x10004c6f
    }
    // 0x10004c6f
    return result;
}


// Address range: 0x100037d0 - 0x10003821
int32_t function_100037d0(int32_t a1, int32_t a2, int32_t a3) {
    // 0x100037d0
    g5 = a1;
    int32_t v1 = 0; // bp-16
    int32_t v2 = function_10004310(a1, &v1); // 0x100037de
    int32_t result; // 0x10003821
    if (v2 == 0) {
        // 0x100037f4
        result = function_10004411((int16_t)IdQuery(function_10004402(v1)));
        // branch -> 0x1000381e
    } else {
        // 0x100037ef
        result = v2;
        // branch -> 0x1000381e
    }
    // 0x1000381e
    return result;
}

// Address range: 0x10004960 - 0x1000498e
void *function_10004960(void *a1) {
	// DD: GlobalAlloc(_In_ UINT uFlags, _In_ SIZE_T dwBytes)
	// See https://technet.microsoft.com/de-de/library/aa366574(v=vs.85).aspx
	// 0x2000 is 'no flag'
	// 736 = 0x2e0
    void *hMem = GlobalAlloc(0x2000, 40736); // 0x1000496e
    g_sa9054_data = (void *)hMem;
    return (void *)GlobalLock(hMem);
}

int32_t function_1000a4b0(char * a1, int32_t a2) {
    int32_t v1 = g6; // 0x1000a4b3
    int32_t v2 = g8; // 0x1000a4b4
    int32_t v3 = g4; // 0x1000a4b5
    g8 = a2;
    int32_t v4 = (int32_t)a1; // 0x1000a4b9
    g6 = v4;
    if (g94 != 0) {
        int32_t v5 = g98; // 0x1000a503
        g98 = v5 + 1;
        int32_t v6;
        if (g97 >= 1) {
            // 0x1000a517
            g98 = v5;
            function_10007239(19);
            v6 = 1;
            // branch -> 0x1000a538
        } else {
            // 0x1000a513
            v6 = 0;
            // branch -> 0x1000a538
        }
        int32_t v7 = 0; // 0x1000a53b
        int32_t v8 = 0; // 0x1000a53414
        // branch -> 0x1000a538
        int32_t result2; // 0x1000a534
        while (true) {
            int32_t v9 = g8; // 0x1000a538
            unsigned char v10 = *(char *)v9; // 0x1000a538
            g8 = v9 + 1;
            int32_t v11 = g6; // 0x1000a53b
            unsigned char v12 = *(char *)v11; // 0x1000a53b
            g6 = v11 + 1;
            result2 = (int32_t)v10 | v8;
            int32_t v13 = (int32_t)v12 | v7 & -256; // 0x1000a53b30
            if (v10 != v12) {
                // 0x1000a542
                g4 = 0x1000000 * function_10006643(v12) / 0x1000000;
                int32_t v14 = function_10006643(v12); // 0x1000a54e
                int32_t v15 = g4; // 0x1000a556
                unsigned char v16 = (char)v15; // 0x1000a556
                unsigned char v17 = (char)v14; // 0x1000a556
                if (v16 != v17) {
                    int32_t v18 = v16 < v17 ? 2 : 1; // 0x1000a55c
                    int32_t result = (int32_t)(v16 < v17 & (v14 != -1 | v14 < (int32_t)(v16 < v17))) + v18; // 0x1000a55c
                    // branch -> 0x1000a55f
                    // 0x1000a55f
                    if (v6 != 0) {
                        // 0x1000a56f
                        function_1000729a(19);
                        // branch -> 0x1000a57b
                        // 0x1000a57b
                        g4 = v3;
                        g8 = v2;
                        g6 = v1;
                        return result;
                    }
                    // 0x1000a566
                    g98--;
                    // branch -> 0x1000a57b
                    // 0x1000a57b
                    g4 = v3;
                    g8 = v2;
                    g6 = v1;
                    return result;
                }
                result2 = v14;
                v13 = v15;
            }
            // 0x1000a534
            if ((char)result2 == 0) {
                // break -> 0x1000a55f
                break;
            }
            v7 = v13;
            v8 = result2 & -256;
            // continue -> 0x1000a538
        }
        // 0x1000a55f
        if (v6 != 0) {
            // 0x1000a56f
            function_1000729a(19);
            // branch -> 0x1000a57b
        } else {
            // 0x1000a566
            g98--;
            // branch -> 0x1000a57b
        }
        // 0x1000a57b
        g4 = v3;
        g8 = v2;
        g6 = v1;
        return result2;
    }
    int32_t v19 = (int32_t)&g93 & -256; // 0x1000a4cc24
    // branch -> 0x1000a4d0
    while (true) {
        unsigned char v20 = *(char *)a2; // 0x1000a4d0
        int32_t v21 = v20; // 0x1000a4d0
        unsigned char v22 = *(char *)v4; // 0x1000a4d3
        int32_t v23 = 256 * (int32_t)v22 | v21 | v19 & -0x10000; // 0x1000a4d3
        uint32_t v24 = v23 / 256; // 0x1000a4d6
        unsigned char v25 = (char)v24; // 0x1000a4d6
        if (v25 != v20) {
            uint32_t v26 = 256 * v21 | v19 & -0x10000; // 0x1000a4e7
            g5 &= -256;
            unsigned char v27 = (char)(v26 / 256); // 0x1000a4f6
            if (v25 != v27) {
                int32_t v28 = v25 < v27 ? 2 : 1; // 0x1000a4fc
                int32_t v29 = (int32_t)(v25 < v27 & (v25 != -1 | v25 < (char)(v25 < v27))) + v28 | v26; // 0x1000a4fc
                // branch -> 0x1000a4fe
                // 0x1000a4fe
                // branch -> 0x1000a57b
                // 0x1000a57b
                g4 = v3;
                g8 = v2;
                g6 = v1;
                return 0x1000000 * v29 / 0x1000000;
            }
            v23 = v24 & 255 | v26;
        }
        // 0x1000a4cc
        if ((char)v23 == 0) {
            // 0x1000a4fe
            // branch -> 0x1000a57b
            // 0x1000a57b
            g4 = v3;
            g8 = v2;
            g6 = v1;
            return 0x1000000 * v23 / 0x1000000;
        }
        // 0x1000a4cc
        v4++;
        a2++;
        v19 = v23 & -256;
        // branch -> 0x1000a4d0
    }
}

int32_t function_1000498f(int32_t a1) {
    int32_t v1 = 0; // bp-8
    int32_t v2 = 0; // 0x1000499c
    // branch -> 0x100049ab
    int32_t hMem; // 0x10004a10
    int32_t v3; // 0x100049c4
    int32_t v4; // 0x100049e6
    int32_t hMem2; // 0x100049c7
    int32_t hMem3; // 0x100049d8
    int32_t * v5; // 0x100049e0
    while (true) {
        // 0x100049ab
        v3 = v2;
        if (*(int32_t *)(4 * v2 + (int32_t)&g60) != a1) {
            int32_t v6 = v2 + 1; // 0x1000499f
            v1 = v6;
            if (v6 >= 100) {
                v3 = 100;
                // break -> 0x100049be
                break;
            }
            v2 = v6;
            // continue -> 0x100049ab
            continue;
        }
        // 0x100049be
        if (v3 >= 100) {
            // 0x10004a04
            GlobalUnlock((int32_t *)g_sa9054_data);
            hMem = g_sa9054_data;
            g5 = hMem;
            int32_t result = (int32_t)GlobalFree((int32_t *)hMem); // 0x10004a17
            // branch -> 0x10004a1d
            // 0x10004a1d
            return result;
        }
        // 0x100049c4
        hMem2 = *(int32_t *)(4 * v3 + (int32_t)&g59);
        GlobalUnlock((int32_t *)hMem2);
        hMem3 = *(int32_t *)(4 * v1 + (int32_t)&g59);
        v5 = GlobalFree((int32_t *)hMem3);
        v4 = v1;
        g5 = v4;
        *(int32_t *)(4 * v4 + (int32_t)&g59) = 0;
        *(int32_t *)(4 * v1 + (int32_t)&g60) = 0;
        // branch -> 0x10004a1d
        // 0x10004a1d
        return (int32_t)v5;
    }
    // 0x100049be
    int32_t result2; // 0x10004a20
    if (v3 < 100) {
        // 0x100049c4
        hMem2 = *(int32_t *)(4 * v3 + (int32_t)&g59);
        GlobalUnlock((int32_t *)hMem2);
        hMem3 = *(int32_t *)(4 * v1 + (int32_t)&g59);
        v5 = GlobalFree((int32_t *)hMem3);
        v4 = v1;
        g5 = v4;
        *(int32_t *)(4 * v4 + (int32_t)&g59) = 0;
        *(int32_t *)(4 * v1 + (int32_t)&g60) = 0;
        result2 = (int32_t)v5;
        // branch -> 0x10004a1d
    } else {
        // 0x10004a04
        GlobalUnlock((int32_t *)g_sa9054_data);
        hMem = g_sa9054_data;
        g5 = hMem;
        result2 = (int32_t)GlobalFree((int32_t *)hMem);
        // branch -> 0x10004a1d
    }
    // 0x10004a1d
    return result2;
}

// Address range: 0x10004411 - 0x100045a3
int32_t function_10004411(int16_t a1) {
    unsigned char v1 = *(char *)((0x10000 * (int32_t)a1 + 0x150000) / 0x10000 + 0x10004648); // 0x10004437
    g7 = v1;
    int32_t result; // 0x100045a3
    switch (v1) {
        default: {
            // 0x1000459b
            result = -0x4003f7f5;
            // branch -> 0x100045a0
            break;
        }
        case 0: {
            // 0x10004594
            result = -0x4003f7d1;
            // branch -> 0x100045a0
            break;
        }
        case 1: {
            // 0x1000449b
            result = -0x4003f7e1;
            // branch -> 0x100045a0
            break;
        }
        case 2: {
            // 0x100044b9
            result = -0x4003f7f6;
            // branch -> 0x100045a0
            break;
        }
        case 3: {
            // 0x100044af
            result = -0x4003f7f7;
            // branch -> 0x100045a0
            break;
        }
        case 4: {
            // 0x10004491
            result = -0x4003f7f8;
            // branch -> 0x100045a0
            break;
        }
        case 5: {
            // 0x10004487
            result = -0x4003f7f9;
            // branch -> 0x100045a0
            break;
        }
        case 6: {
            // 0x1000447d
            result = -0x4003f7fa;
            // branch -> 0x100045a0
            break;
        }
        case 7: {
            // 0x10004473
            result = -0x4003f7fb;
            // branch -> 0x100045a0
            break;
        }
        case 8: {
            // 0x10004469
            result = -0x4003f7fc;
            // branch -> 0x100045a0
            break;
        }
        case 9: {
            // 0x1000445f
            result = -0x4003f7fd;
            // branch -> 0x100045a0
            break;
        }
        case 10: {
            // 0x10004455
            result = -0x4003f7fe;
            // branch -> 0x100045a0
            break;
        }
        case 11: {
            // 0x10004444
            result = -0x4003f7ff;
            // branch -> 0x100045a0
            break;
        }
        case 12: {
            // 0x1000444e
            result = 0;
            // branch -> 0x100045a0
            break;
        }
        case 13: {
            // 0x100044a5
            result = 0x3ffc0801;
            // branch -> 0x100045a0
            break;
        }
        case 14: {
            // 0x100044c3
            result = 0x3ffc0802;
            // branch -> 0x100045a0
            break;
        }
        case 15: {
            // 0x100044cd
            result = 0x3ffc0803;
            // branch -> 0x100045a0
            break;
        }
        case 16: {
            // 0x100044d7
            result = 0x3ffc0810;
            // branch -> 0x100045a0
            break;
        }
        case 17: {
            // 0x100044e1
            result = 0x3ffc0811;
            // branch -> 0x100045a0
            break;
        }
        case 18: {
            // 0x100044eb
            result = 0x3ffc0812;
            // branch -> 0x100045a0
            break;
        }
        case 19: {
            // 0x100044f5
            result = 0x3ffc0813;
            // branch -> 0x100045a0
            break;
        }
        case 20: {
            // 0x100044ff
            result = 0x3ffc0815;
            // branch -> 0x100045a0
            break;
        }
        case 21: {
            // 0x10004509
            result = 0x3ffc0816;
            // branch -> 0x100045a0
            break;
        }
        case 22: {
            // 0x10004513
            result = 0x3ffc0817;
            // branch -> 0x100045a0
            break;
        }
        case 23: {
            // 0x1000451d
            result = 0x3ffc0818;
            // branch -> 0x100045a0
            break;
        }
        case 24: {
            // 0x10004524
            result = 0x3ffc0819;
            // branch -> 0x100045a0
            break;
        }
        case 25: {
            // 0x1000452b
            result = 0x3ffc081a;
            // branch -> 0x100045a0
            break;
        }
        case 26: {
            // 0x10004532
            result = 0x3ffc081c;
            // branch -> 0x100045a0
            break;
        }
        case 27: {
            // 0x10004539
            result = 0x3ffc081d;
            // branch -> 0x100045a0
            break;
        }
        case 28: {
            // 0x10004540
            result = 0x3ffc081e;
            // branch -> 0x100045a0
            break;
        }
        case 29: {
            // 0x10004547
            result = 0x3ffc081f;
            // branch -> 0x100045a0
            break;
        }
        case 30: {
            // 0x1000454e
            result = 0x3ffc0820;
            // branch -> 0x100045a0
            break;
        }
        case 31: {
            // 0x10004555
            result = 0x3ffc0821;
            // branch -> 0x100045a0
            break;
        }
        case 32: {
            // 0x1000455c
            result = 0x3ffc0822;
            // branch -> 0x100045a0
            break;
        }
        case 33: {
            // 0x10004563
            result = 0x3ffc0823;
            // branch -> 0x100045a0
            break;
        }
        case 34: {
            // 0x1000456a
            result = 0x3ffc0824;
            // branch -> 0x100045a0
            break;
        }
        case 35: {
            // 0x10004586
            result = 0x3ffc0828;
            // branch -> 0x100045a0
            break;
        }
        case 36: {
            // 0x1000458d
            result = 0x3ffc0829;
            // branch -> 0x100045a0
            break;
        }
        case 37: {
            // 0x1000457f
            result = 0x3ffc0827;
            // branch -> 0x100045a0
            break;
        }
        case 38: {
            // 0x10004578
            result = 0x3ffc0826;
            // branch -> 0x100045a0
            break;
        }
        case 39: {
            // 0x10004571
            result = 0x3ffc0825;
            // branch -> 0x100045a0
            break;
        }
    }
    // 0x100045a0
    return result;
}

int32_t function_10004310(int32_t a1, int32_t * a2) {
    int32_t v1 = (int32_t)a2;
    if (a2 == NULL) {
        // 0x10004323
        // branch -> 0x100043fe
        // 0x100043fe
        return -0x4003f7fe;
    }
    // 0x1000432d
    if (a1 == 0) {
        // 0x10004333
        // branch -> 0x100043fe
        // 0x100043fe
        return -0x4003f7f1;
    }
    // 0x1000433d
    int32_t v2; // 0x100043e3
    int32_t v3; // 0x100043c4
    if (g63 != a1) {
        int32_t v4 = 0;
        // branch -> 0x10004370
        while (true) {
            // 0x10004370
            g5 = v4;
            int32_t * v5 = (int32_t *)(4 * v4 + (int32_t)&g60); // 0x10004374
            int32_t v6;
            if (*v5 != 0) {
                // 0x10004380
                g7 = v4;
                if (*v5 != a1) {
                    // 0x10004390
                    g5 = v4;
                    int32_t v7 = *v5; // 0x10004394
                    g7 = v7;
                    if (RdSessionHandle(v7) != a1) {
                        // 0x1000435b
                        v6 = v4 + 1;
                        g7 = (g7 | v4) & -0x10000 | v6;
                        if (v6 >= 100) {
                            // break -> 0x100043b4
                            break;
                        }
                        v4 = v6;
                        // continue -> 0x10004370
                        continue;
                    }
                }
                // 0x100043a9
                v2 = v4;
                // branch -> 0x100043b4
            } else {
                // 0x1000435b
                v6 = v4 + 1;
                g7 = (g7 | v4) & -0x10000 | v6;
                if (v6 >= 100) {
                    // break -> 0x100043b4
                    break;
                }
                v4 = v6;
                // continue -> 0x10004370
                continue;
            }
            // 0x100043b4
            if (v2 == -1) {
                // 0x100043ba
                // branch -> 0x100043fe
                // 0x100043fe
                return -0x4003f7ff;
            }
            // 0x100043c1
            v3 = *(int32_t *)(4 * v2 + (int32_t)&g60);
            g7 = v3;
            g5 = a1;
            if (*(int32_t *)(v3 + 468) != a1) {
                // 0x100043dc
                // branch -> 0x100043fe
                // 0x100043fe
                return -0x4003f7f2;
            }
            // 0x100043e3
            g62 = v2;
            g63 = a1;
            g5 = v1;
            g7 = v2;
            *a2 = v2;
            // branch -> 0x100043fe
            // 0x100043fe
            return 0;
        }
        // 0x100043b4
        v2 = -1;
        // branch -> 0x100043b4
    } else {
        int32_t v8 = g62; // 0x10004348
        g5 = v8;
        v2 = v8;
        // branch -> 0x100043b4
    }
    // 0x100043b4
    if (v2 == -1) {
        // 0x100043ba
        // branch -> 0x100043fe
        // 0x100043fe
        return -0x4003f7ff;
    }
    // 0x100043c1
    v3 = *(int32_t *)(4 * v2 + (int32_t)&g60);
    g7 = v3;
    g5 = a1;
    int32_t result; // 0x10004401
    if (*(int32_t *)(v3 + 468) == a1) {
        // 0x100043e3
        g62 = v2;
        g63 = a1;
        g5 = v1;
        g7 = v2;
        *a2 = v2;
        result = 0;
        // branch -> 0x100043fe
    } else {
        // 0x100043dc
        result = -0x4003f7f2;
        // branch -> 0x100043fe
    }
    // 0x100043fe
    return result;
}


int32_t function_10004402(int32_t a1) {
    // 0x10004402
    return *(int32_t *)(4 * a1 + (int32_t)&g60);
}

// Schrott
int32_t function_10006643(char a1) {
    char v1 = a1;
    char v2 = g5; // bp-8
    int32_t v3 = &v2; // 0x10006646
    int32_t v4 = g8; // 0x1000664f
    int32_t v5 = g6; // 0x10006650
    int32_t result = a1; // 0x10006670
    int32_t result2; // 0x1000670d
    if (g94 == 0) {
        // 0x10006653
        if (a1 < 65) {
            // 0x10006709
            g6 = v5;
            g8 = v4;
            return result;
        }
        // 0x1000665f
        if (a1 == 90 || a1 < 90 != (89 - result & result) < 0) {
            // 0x10006668
            result2 = result + 32;
            // branch -> 0x10006709
        } else {
            result2 = result;
        }
        // 0x10006709
        g6 = v5;
        g8 = v4;
        return result2;
    }
    int32_t v6 = 256; // edi
    g8 = 1;
    unsigned char v7;
    int32_t v8; // 0x100066cc
    int32_t v9; // 0x100066cf
    int32_t v10; // 0x100066d1
    int32_t v11; // 0x100066da
    int32_t v12; // 0x100066e6
    int32_t v13; // 0x100066ac
    int32_t v14; // 0x10006700
    if (a1 < 0) {
        // 0x1000667f
        int32_t v15; // 0x10006689
        if (g35 > 1) {
            // 0x10006687
            v15 = function_1000655f(a1, 1);
            g5 = 1;
            // branch -> 0x1000669c
        } else {
            // 0x10006692
            v15 = (int32_t)*(char *)(g37 + 2 * result) & 1;
            // branch -> 0x1000669c
        }
        // 0x1000669c
        if (v15 != 0) {
            // 0x1000669c
            v8 = result;
            // branch -> 0x100066a4
            // 0x100066a4
            v13 = v8 / 256;
            if (*(char *)((2 * (v13 & 255) || 1) + g37) > -1) {
                // 0x100066c8
                v1 = v8;
                v9 = g8;
                v10 = v9;
                v11 = v9;
                // branch -> 0x100066d1
            } else {
                // 0x100066b9
                v1 = v13;
                v10 = g8;
                v11 = 2;
                // branch -> 0x100066d1
            }
            // 0x100066d1
            g5 = v3;
            v12 = function_10009277(g94, v6, (char)(int32_t)&v1, v11, v3, 3, 0, v10);
            if (v12 != 0) {
                // 0x100066f2
                if (v12 != g8) {
                    // 0x100066fc
                    v14 = v2;
                    g5 = v14;
                    result2 = v14 | 256 * (int32_t)v7;
                    // branch -> 0x10006709
                } else {
                    // 0x100066f6
                    result2 = v2;
                    // branch -> 0x10006709
                }
                // 0x10006709
                g6 = v5;
                g8 = v4;
                return result2;
            }
        }
    } else {
        v8 = result;
        // 0x100066a4
        v13 = v8 / 256;
        if (*(char *)((2 * (v13 & 255) || 1) + g37) > -1) {
            // 0x100066c8
            v1 = v8;
            v9 = g8;
            v10 = v9;
            v11 = v9;
            // branch -> 0x100066d1
        } else {
            // 0x100066b9
            v1 = v13;
            v10 = g8;
            v11 = 2;
            // branch -> 0x100066d1
        }
        // 0x100066d1
        g5 = v3;
        v12 = function_10009277(g94, v6, (char)(int32_t)&v1, v11, v3, 3, 0, v10);
        if (v12 != 0) {
            // 0x100066f2
            if (v12 != g8) {
                // 0x100066fc
                v14 = v2;
                g5 = v14;
                result2 = v14 | 256 * (int32_t)v7;
                // branch -> 0x10006709
            } else {
                // 0x100066f6
                result2 = v2;
                // branch -> 0x10006709
            }
            // 0x10006709
            g6 = v5;
            g8 = v4;
            return result2;
        }
    }
    // 0x100066a0
    // branch -> 0x10006709
    // 0x10006709
    g6 = v5;
    g8 = v4;
    return result;
}

// Schrott
int32_t function_10007239(int32_t a1) {
    int32_t v1 = g8; // 0x1000723f
    int32_t lpCriticalSection2 = 4 * a1 + (int32_t)&g40; // 0x10007240
    g8 = lpCriticalSection2;
    if (*(int32_t *)lpCriticalSection2 != 0) {
        // branch -> 0x1000728f
    } else {
        int32_t v2 = g6; // 0x10007251
        int32_t lpCriticalSection = function_100074d5(24); // 0x10007254
        g6 = lpCriticalSection;
        if (lpCriticalSection == 0) {
            // 0x10007260
            __amsg_exit(17);
            // branch -> 0x10007268
        }
        // 0x10007268
        function_10007239(17);
        if (*(int32_t *)g8 != 0) {
            // 0x10007280
            function_100073ec(lpCriticalSection);
            // branch -> 0x10007286
        } else {
            // 0x10007276
            InitializeCriticalSection((struct _RTL_CRITICAL_SECTION *)lpCriticalSection);
            *(int32_t *)g8 = lpCriticalSection;
            // branch -> 0x10007286
        }
        // 0x10007286
        function_1000729a(17);
        g5 = 17;
        g6 = (int32_t)(struct _RTL_CRITICAL_SECTION *)v2;
        lpCriticalSection2 = g8;
        // branch -> 0x1000728f
    }
    // 0x1000728f
    EnterCriticalSection((struct _RTL_CRITICAL_SECTION *)*(int32_t *)lpCriticalSection2);
    g8 = v1;
    int32_t * v3;
    return (int32_t)&v3;
}

int32_t function_1000729a(int32_t a1) {
    int32_t lpCriticalSection = *(int32_t *)(4 * a1 + (int32_t)&g40); // 0x100072a0
    LeaveCriticalSection((struct _RTL_CRITICAL_SECTION *)lpCriticalSection);
    int32_t * v1;
    return (int32_t)&v1;
}

int32_t function_1000655f(char a1, int32_t a2) {
    int16_t v1 = a2;
    int32_t v2 = g3; // bp-4
    char v3 = g5; // bp-8
    int32_t v4 = a1; // 0x10006563
    int32_t v5;
    if (v4 > 255) {
        int32_t v6 = v4 / 256; // 0x10006586
        int32_t v7 = v6 & 255; // 0x10006589
        g7 = v7;
        char v8 = *(char *)(g37 + (2 * v7 | 1)); // 0x1000658c
        v3 = v8 > -1 ? v4 : v6;
        int32_t result = function_1000912e((char *)1, (int32_t)&v3, 2 - (int32_t)(v8 > -1), (int32_t)&v1, 0, 0, 1); // 0x100065bd
        if (result == 0) {
            // 0x100065c9
            g3 = v2;
            return result;
        }
        v5 = v1;
        // branch -> 0x100065cf
    } else {
        // 0x10006571
        v5 = (int32_t)*(int16_t *)(g37 + 2 * v4);
        // branch -> 0x100065cf
    }
    // 0x100065cf
    int32_t v9;
    return v5 & v9;
}

// Address range: 0x10009277 - 0x1000949a
int32_t function_10009277(int32_t a1, int32_t a2, char a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7, int32_t a8) {
    // 0x10009277
    abort();
    // UNREACHABLE
}

int32_t function_100074d5(int32_t a1) {
    // 0x100074d5
    return __nh_malloc(a1, g96);
}

int32_t function_100073ec(int32_t a1) {
    // 0x100073ec
    abort();
    // UNREACHABLE
}

int32_t function_1000912e(char * a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5, int32_t a6, int32_t a7) {
    // 0x1000912e
    abort();
    // UNREACHABLE
}


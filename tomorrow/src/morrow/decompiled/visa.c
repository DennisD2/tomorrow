
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr_defin.h>

int32_t dd_WriteCommand(int32_t deviceId, int16_t command) ;
int32_t VISA_SendWord(int32_t deviceId, int16_t command);

int32_t function_10001354(int32_t deviceId, uint16_t command, int32_t a3, int32_t response) ;
int32_t function_10001249(int32_t deviceId, uint16_t a2, int32_t a3, int32_t a4) ;
int32_t function_100015d0(int32_t deviceId, int32_t a2, int16_t a3, int32_t a4);
int32_t function_10001654(int32_t deviceId, int16_t a2, int32_t a3);
int32_t function_10001a0a(int32_t deviceId, int16_t command) ;

static int32_t g2 = 0; // eax
static int32_t g3 = 0; // ebp
//static int32_t g4 = 0; // ebx
static int32_t g5 = 0; // ecx
static int32_t g7 = 0; // edx
static int32_t g52 = 0; /* DD: this seems to be the 'current device' ? */
static int32_t g53 = 0;


int32_t VISA_OpenSessionStep(int32_t deviceId) {
    // entry
    if (deviceId == 0) {
        // 0x100021de
        // branch -> 0x10002370
        // 0x10002370
        return g2 & -0x10000 | 0xfff6;
    }
    int32_t * v1 = (int32_t *)(deviceId + 468); // 0x100021ea
    if (*v1 != 0) {
        // 0x100021f3
        // branch -> 0x10002370
        // 0x10002370
        return deviceId & -0x10000 | 0xffed;
    }
    // 0x100021fc
    if (g53 == 0) {
        int32_t v2 = _imported_function_ord_141((int32_t)&g52); // 0x1000220a
        if (v2 != 0) {
            // 0x10002218
            // branch -> 0x10002370
            // 0x10002370
            return v2 | 0xffff;
        }
    }
    // 0x10002221
    int32_t v3; // bp-8
    int32_t v4 = &v3; // 0x10002221
    if (_imported_function_ord_131(g52, deviceId + 210, 0, 0, v4) != 0) {
        int32_t v5 = g52; // 0x10002247
        g52 = 0;
        int32_t result = _imported_function_ord_132(v5) | 0xffff; // 0x1000225d
        // branch -> 0x10002370
        // 0x10002370
        return result;
    }
    // 0x10002266
    g53++;
    int16_t * v6 = (int16_t *)(deviceId + 208); // 0x10002278
    *v6 = *v6 + 1;
    int32_t v7 = _imported_function_ord_134(v3, 0x3fff001a, 0x2710); // 0x1000229b
    g2 = v7;
    if (v7 < 0) {
        int32_t result2 = VISA_CloseSession(deviceId) | 0xffff; // 0x100022b0
        // branch -> 0x10002370
        // 0x10002370
        return result2;
    }
    // 0x100022b9
    if (_imported_function_ord_267(v3, 3, 4000) < 0) {
        // 0x100022cd
        g2 = deviceId;
        int32_t result3 = VISA_CloseSession(deviceId) | 0xffff; // 0x100022d9
        // branch -> 0x10002370
        // 0x10002370
        return result3;
    }
    int32_t v8 = _imported_function_ord_134(v3, 0x3fff002d, 1); // 0x100022ed
    g2 = v8;
    if (v8 < 0) {
        int32_t result4 = VISA_CloseSession(deviceId) | 0xffff; // 0x10002302
        // branch -> 0x10002370
        // 0x10002370
        return result4;
    }
    int32_t v9 = _imported_function_ord_134(v3, 0x3fff002a, 1); // 0x10002313
    g2 = v9;
    if (v9 < 0) {
        int32_t result5 = VISA_CloseSession(deviceId) | 0xffff; // 0x10002328
        // branch -> 0x10002370
        // 0x10002370
        return result5;
    }
    // 0x1000232e
    *v1 = v3;
    int32_t v10 = VISA_InitEngine(deviceId); // 0x1000233e
    int32_t result6; // 0x10002373
    if (0x10000 * v10 == 0x410000) {
        // 0x1000236d
        result6 = v10 & -0x10000;
        // branch -> 0x10002370
    } else {
        // 0x1000234e
        g2 = deviceId;
        int32_t v11 = VISA_CloseSession(deviceId); // 0x10002352
        *v1 = 0;
        result6 = v11 | 0xffff;
        // branch -> 0x10002370
    }
    // 0x10002370
    return result6;
}

int32_t VISA_CloseSession(int32_t deviceId) {
    // entry
    if (deviceId == 0) {
        // 0x1000237d
        // branch -> 0x10002400
        // 0x10002400
        return g2 & -0x10000 | 0xfff6;
    }
    int32_t * v1 = (int32_t *)(deviceId + 468); // 0x10002386
    int32_t result; // 0x10002401
    if (*v1 != 0) {
        // 0x10002395
        _imported_function_ord_132(*v1);
        int32_t v2 = g53 - 1; // 0x100023a9
        g53 = v2;
        if (v2 == 0) {
            // 0x100023ba
            _imported_function_ord_132(g52);
            g52 = 0;
            // branch -> 0x100023d0
        }
        // 0x100023d0
        g52 = 0;
        *v1 = 0;
        *(int16_t *)(deviceId + 208) = 0;
        *(char *)(deviceId + 210) = 0;
        result = deviceId & -0x10000;
        // branch -> 0x10002400
    } else {
        // 0x1000238f
        result = deviceId & -0x10000 | 0xffed;
        // branch -> 0x10002400
    }
    // 0x10002400
    return result;
}

// DD: dd_WriteCommand = write( device, command ) yippie!
// Address range: 0x10001fa1 - 0x100020e2
int32_t VISA_InitEngine(int32_t deviceId) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    SetTimeoutWait(deviceId, 100);
    g5 = deviceId;
    // DD: -0x3701 = 0xc8ff ANO
    int32_t v2 = dd_WriteCommand(deviceId, 0xc8ff /*-0x3701*/); // 0x10001fbe
    int32_t v3 = RdErrorStatus(deviceId); // 0x10001fce
    int32_t v4 = v3; // 0x10001fe3
    if (v3 == 0) {
        int32_t v5 = 0x10000 * v2;
        if (v5 == -0x20000) {
            // 0x10001fec
            g5 = deviceId;
            // DD: -769 = -0x301 = 0xfcff BNO
            int32_t v6 = dd_WriteCommand(deviceId, 0xfcff /*-769*/); // 0x10001ff5
            int32_t v7 = RdErrorStatus(deviceId); // 0x10002005
            if (v7 != 0) {
                // 0x10002011
                // branch -> 0x100020df
                // 0x100020df
                return v7 | 0xffff;
            }
            // DD: 3840 = 0xf00
            // 0x1000201a
            if ((v6 & 3840) != 3840) {
                // 0x1000202a
                // branch -> 0x100020df
                // 0x100020df
                return 0xffff;
            }
            int32_t v8 = function_100016c8(deviceId); // 0x10002037
            if ((0x10000 * v8 || 0xffff) >= 0x1ffff) {
                // 0x10002046
                // branch -> 0x100020df
                // 0x100020df
                return v8 | 0xffff;
            }
            // DD: 0x7c00 = VXI_GETVERSION
            // 0x1000204f
            dd_WriteCommand(deviceId, 0x7c00);
            int32_t v9 = RdErrorStatus(deviceId); // 0x10002064
            if (v9 != 0) {
                // 0x10002070
                // branch -> 0x100020df
                // 0x100020df
                return v9 | 0xffff;
            }
            int32_t v10 = 0x10000 * BreakSweep(deviceId, 0);
            if (v10 != 0x410000) {
                // 0x10002091
                // branch -> 0x100020df
                // 0x100020df
                return v10 / 0x10000 | 0xffff;
            }
            int32_t v11 = 0x10000 * CommTrigDetect(deviceId, 65);
            if (v11 != 0x410000) {
                // 0x100020b0
                // branch -> 0x100020df
                // 0x100020df
                return v11 / 0x10000 | 0xffff;
            }
            int32_t v12 = 0x10000 * CommInterrupts(deviceId, 65);
            int32_t result; // 0x100020e2
            if (v12 == 0x410000) {
                // 0x100020d5
                result = 65;
                // branch -> 0x100020df
            } else {
                // 0x100020cf
                result = v12 / 0x10000 | 0xffff;
                // branch -> 0x100020df
            }
            // 0x100020df
            return result;
        }
        v4 = v5 / 0x10000;
    }
    // 0x10001fe3
    // branch -> 0x100020df
    // 0x100020df
    return v4 | 0xffff;
}

int32_t VISA_SendCommand(int32_t deviceId, int16_t a2, int32_t a3, int32_t a4) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t v2 = 0; // bp-20
    function_100010e1(deviceId, 0);
    int32_t v3;
    int16_t v4;
    int16_t v5;
    if (a2 >= 0) {
        // 0x10001d1f
        g7 = a2;
        if (a2 <= 16) {
            // 0x10001d34
            v3 = 0x10000 * a3;
            v4 = 0;
            int16_t v6 = 3;
            // branch -> 0x10001d34
            while (true) {
                // 0x10001d34
                v5 = v6;
                // branch -> 0x10001d34
              lab_0x10001d34_3:
                while (true) {
                  lab_0x10001d34:
                    // 0x10001d34
                    if (v5 != 3) {
                        // 0x10001d41
                        if (v5 != 4) {
                            // 0x10001e1d
                            return (int32_t)v2 | function_100016c8(deviceId) & -0x10000;
                        }
                    }
                    // 0x10001d53
                    VISA_SendWord(deviceId, a2);
                    int32_t v7; // 0x10001da2
                    if (v3 > 0) {
                        int32_t v8 = 0;
                        VISA_SendWord(deviceId, *(int16_t *)(2 * v8 + a4));
                        while (v8 + 1 < v3 / 0x10000) {
                            // 0x10001d84
                            g5 = g5 & -0x10000 | v8 + 1 & 0xffff;
                            v8++;
                            VISA_SendWord(deviceId, *(int16_t *)(2 * v8 + a4));
                            // continue -> 0x10001d84
                        }
                        // 0x10001d9e
                        v7 = VISA_CheckSWStatus(deviceId);
                        v2 = v7;
                        if ((v7 & 0xffff) != 1) {
                            // break -> 0x10001dc6
                            break;
                        }
                        v5 = 0;
                        // continue -> 0x10001d34
                        continue;
                    }
                    // 0x10001d9e
                    v7 = VISA_CheckSWStatus(deviceId);
                    v2 = v7;
                    if ((v7 & 0xffff) != 1) {
                        // break -> 0x10001dc6
                        break;
                    }
                    v5 = 0;
                    // continue -> 0x10001d34
                }
                // 0x10001dc6
                if (v4 >= 10) {
                    // 0x10001de6
                    v2 = 0;
                    v5 = 1;
                    // branch -> 0x10001d34
                    goto lab_0x10001d34;
                }
                int16_t v9 = v4 + 1; // 0x10001dd3
                g7 = g7 & -0x10000 | (int32_t)v9;
                v4 = v9;
                v6 = 4;
                // branch -> 0x10001d34
            }
        }
        // 0x10001d28
        v2 = 17;
        // branch -> 0x10001d34
        // 0x10001d34
        v3 = 0x10000 * a3;
        v4 = 0;
        // branch -> 0x10001d34
        while (true) {
            // 0x10001d34
            v5 = 1;
            // branch -> 0x10001d34
            goto lab_0x10001d34_3;
        }
    }
    // 0x10001d28
    v2 = 17;
    // branch -> 0x10001d34
    // 0x10001d34
    v3 = 0x10000 * a3;
    v4 = 0;
    // branch -> 0x10001d34
    while (true) {
        // 0x10001d34
        v5 = 1;
        // branch -> 0x10001d34
        goto lab_0x10001d34_3;
    }
}

int32_t VISA_SendWord(int32_t deviceId, int16_t command) {
    int16_t v1 = -2; // bp-8
    g2 = deviceId;
    // DD: 0x7f00 = VXI_ENGINECOMMAND
    int32_t v2 = function_10001a0a(deviceId, 0x7f00); // 0x100019db
    g2 = v2;
    if (v2 != 0) {
        // 0x10001a02
        return (int32_t)v1 | v2 & -0x10000;
    }
    int32_t v3 = function_10001a0a(deviceId, command); // 0x100019f0
    if (v3 == 0) {
        // 0x100019fc
        v1 = 0;
        // branch -> 0x10001a02
    }
    // 0x10001a02
    return (int32_t)v1 | v3 & -0x10000;
}

int32_t dd_WriteCommand(int32_t deviceId, int16_t command) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int16_t response; // bp-12
    int32_t v3; // 0x1000133c
    if ((int16_t)function_10001354(deviceId, command, 1, (int32_t)&response) > -1) {
        // 0x100012fa
        v3 = 0;
        // branch -> 0x1000133c
    } else {
        // 0x1000132f
        response = 0;
        v3 = 1;
        // branch -> 0x1000133c
    }
    // 0x1000133c
    g3 = v1;
    return (int32_t)response | SetErrorStatus(deviceId, v3) & -0x10000;
}

int32_t function_100016c8(int32_t deviceId) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = RdTimeoutWait(deviceId); // 0x100016d2
    int16_t v3; // bp-20
    if ((0x10000 * function_100011fc(deviceId, (int32_t)&v3) || 0xffff) >= 0x1ffff) {
        // 0x100016f9
        g5 = deviceId;
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe; // 0x10001707
        // branch -> 0x100017dd
        // 0x100017dd
        g3 = v1;
        return result;
    }
    int32_t v4 = v3; // 0x10001710
    int32_t v5 = v4 & -0xff01 | g7 & -0x10000 | v4 & 0xfd00 | 512; // 0x10001714
    v3 = v5;
    int32_t v6 = 0x10000 * v5 / 0x10000; // 0x1000171b
    g2 = v6;
    int32_t result2; // 0x100017e0
    if ((0x10000 * function_10001249(deviceId, (int16_t)v6, v6, 0) || 0xffff) < 0x1ffff) {
        // 0x1000174f
        InitTimeoutLoop(0);
        // branch -> 0x10001754
        int32_t v7;
        while (true) {
            int32_t v8 = 0x10000 * function_100017e1(deviceId, &v3); // 0x10001764
            if ((v8 || 0xffff) < 0x1ffff) {
                // 0x10001794
                // branch -> 0x100017bf
                // 0x100017bf
                v7 = v8 / 0x10000;
                g5 = v7;
                SetErrorStatus(deviceId, v7);
                // branch -> 0x100017dd
                // 0x100017dd
                g3 = v1;
                return -2;
            }
            // 0x10001781
            if ((0x10000 * _TestTimeoutDone(v2) || 0xffff) >= 0x1ffff) {
                // break -> 0x1000179c
                break;
            }
            // continue -> 0x10001754
        }
        int32_t v9 = 0x10000 * function_100017e1(deviceId, &v3); // 0x100017ac
        // branch -> 0x100017bf
        // 0x100017bf
        v7 = v9 / 0x10000;
        g5 = v7;
        SetErrorStatus(deviceId, v7);
        result2 = -2;
        // branch -> 0x100017dd
    } else {
        // 0x10001738
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe;
        // branch -> 0x100017dd
    }
    // 0x100017dd
    g3 = v1;
    return result2;
}


int32_t function_10001354(int32_t deviceId, uint16_t command, int32_t a3, int32_t response) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    // DD: 468 is an offset into a struct
    int32_t v2 = *(int32_t *)(deviceId + 468); // 0x1000136a
    int16_t v3; // bp-24
    int32_t v4 = &v3; // 0x10001373
    g5 = deviceId;
    int32_t v5 = function_100015d0(deviceId, 100, 512, v4); // 0x10001384
    int32_t v6 = 0x10000 * v5 / 0x10000; // 0x10001390
    if ((int16_t)v6 <= -1) {
        // 0x1000139e
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v6 & -0x10000 | v5 & 0xffff;
    }
    // 0x100013a7
    g5 = v2;
    // DD: _imported_function_ord_262 1st parameter is not deviceId but <struct>+468
    int32_t v7 = _imported_function_ord_262(v2, 1, 14, v6 & -0x10000 | (int32_t)command); // 0x100013b4
    if (v7 != 0) {
        // 0x100013c2
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v7 & -0x10000 | 0x8000;
    }
    // 0x100013cb
    g5 = deviceId;
    int32_t v8 = function_100015d0(deviceId, 100, 512, v4); // 0x100013dc
    int32_t v9 = 0x10000 * v8 / 0x10000; // 0x100013e8
    if ((int16_t)v9 <= -1) {
        // 0x100013f6
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v9 & -0x10000 | v8 & 0xffff;
    }
    int32_t v10 = (int32_t)v3 & 2048; // 0x10001407
    int32_t v11;
    if (v10 != 0) {
        v11 = 1;
        if ((a3 & 0xffff) != 0) {
            // 0x1000157e
            g5 = v2;
            int32_t v12 = _imported_function_ord_261(v2, 1, 14, v4); // 0x1000158a
            if (v12 == 0) {
                int16_t v13 = v3; // 0x100015a1
                *(int16_t *)response = v13;
                v10 = (int32_t)v13 | v12 & -0x10000;
                v11 = 1;
                // branch -> 0x100015b0
            } else {
                v10 = v12;
                v11 = 0x8020;
            }
        }
        // 0x100015b0
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v10 & -0x10000 | v11;
    }
    // 0x10001414
    g5 = v2;
    int32_t v14 = _imported_function_ord_262(v2, 1, 14, 0xcdff); // 0x10001421
    if (v14 != 0) {
        // 0x1000142f
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v14 & -0x10000 | 0x8400;
    }
    // 0x10001438
    g5 = deviceId;
    int32_t v15 = function_100015d0(deviceId, 100, 512, v4); // 0x10001449
    int32_t v16 = 0x10000 * v15 / 0x10000; // 0x10001455
    if ((int16_t)v16 <= -1) {
        // 0x10001463
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v16 & -0x10000 | v15 & 0xffff;
    }
    // 0x1000146c
    if (((int32_t)v3 & 512) == 0) {
        // 0x1000147d
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return 0x8000;
    }
    // 0x10001486
    g5 = v4;
    int32_t v17 = function_100015d0(deviceId, 100, 1024, v4); // 0x10001497
    int32_t v18 = 0x10000 * v17 / 0x10000; // 0x100014a3
    int32_t v19 = v18 & 0x8000; // 0x100014a7
    g5 = v19;
    if (v19 != 0) {
        // 0x100014b1
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v18 & -0x10000 | v17 & 0xffff;
    }
    // 0x100014ba
    if ((v3 & 1024) == 0) {
        // 0x100014cd
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v18 & -0x10000 | 0x8000;
    }
    // 0x100014d6
    g5 = v2;
    int32_t v20 = _imported_function_ord_261(v2, 1, 14, v4); // 0x100014e8
    if (v20 != 0) {
        // 0x100015b0
        // branch -> 0x100015b4
        // 0x100015b4
        g3 = v1;
        return v20 & -0x10000 | 0x8000;
    }
    int32_t v21 = (int32_t)v3 - 0xfff8; // 0x10001505
    g5 = v21;
    v10 = v21;
    v11 = 0x8000;
    switch (v3) {
        case -8: {
            // 0x1000155e
            g5 = 0xc000;
            v10 = 0;
            v11 = 0xc000;
            // branch -> 0x100015b0
            break;
        }
        case -7: {
            // 0x10001551
            v10 = 0xa000;
            v11 = 0xa000;
            // branch -> 0x100015b0
            break;
        }
        case -6: {
            // 0x10001544
            v10 = 2;
            v11 = 0x9000;
            // branch -> 0x100015b0
            break;
        }
        case -5: {
            // 0x10001537
            g5 = 0x8800;
            v10 = 3;
            v11 = 0x8800;
            // branch -> 0x100015b0
            break;
        }
        case -4: {
            // 0x1000152a
            v10 = 0x8200;
            v11 = 0x8200;
            // branch -> 0x100015b0
            break;
        }
        case -3: {
            // 0x1000151d
            v10 = 5;
            v11 = 0x8040;
            // branch -> 0x100015b0
            break;
        }
    }
    // 0x100015b0
    // branch -> 0x100015b4
    // 0x100015b4
    g3 = v1;
    return v10 & -0x10000 | v11;
}

int32_t function_100011fc(int32_t deviceId, int32_t a2) {
    int32_t v1 = *(int32_t *)(deviceId + 468); // 0x1000120d
    g7 = v1;
    int32_t v2 = _imported_function_ord_261(v1, 1, 4, a2) != 0;
    return SetErrorStatus(deviceId, v2) & -0x10000 | v2;
}

int32_t function_10001249(int32_t deviceId, uint16_t a2, int32_t a3, int32_t a4) {
    int32_t v1 = *(int32_t *)(deviceId + 468); // 0x1000125b
    int32_t v2 = _imported_function_ord_262(v1, 1, 4, g2 & -0x10000 | (int32_t)a2) != 0;
    g5 = deviceId;
    return SetErrorStatus(deviceId, v2) & -0x10000 | v2;
}

int32_t function_100017e1(int32_t deviceId, int16_t * a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2; // 0x10001834
    if ((0x10000 * function_100011fc(deviceId, (int32_t)a2) || 0xffff) >= 0x1ffff) {
        // 0x10001803
        // branch -> 0x1000182b
        // 0x1000182b
        v2 = SetErrorStatus(deviceId, 1);
        g3 = v1;
        return (int32_t)1 | v2 & -0x10000;
    }
    // 0x1000180b
    int16_t v3; // bp-12
    int32_t v4; // 0x1000182b
    if ((*a2 & 256) != 0) {
        // 0x10001825
        v3 = 0;
        v4 = 0;
        // branch -> 0x1000182b
    } else {
        // 0x1000181d
        v3 = 3;
        v4 = 3;
        // branch -> 0x1000182b
    }
    // 0x1000182b
    v2 = SetErrorStatus(deviceId, v4);
    g3 = v1;
    return (int32_t)v3 | v2 & -0x10000;
}

int32_t function_100015d0(int32_t deviceId, int32_t a2, int16_t a3, int32_t a4) {
    int32_t v1 = g3; // 0x100015d0
    InitTimeoutLoop(v1);
    g3 = v1;
    return 0x10000 * function_10001654(deviceId, a3, a4) / 0x10000;
}

int32_t function_10001654(int32_t deviceId, int16_t a2, int32_t a3) {
    // 0x10001654
    g5 = deviceId;
    // DD: instead of deviceId, the _imported_function_ord_261 gets <unknown struct>+468 !
    if (_imported_function_ord_261(*(int32_t *)(deviceId + 468), 1, 10, a3) != 0) {
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0x8020; // 0x10001686
        // branch -> 0x100016c4
        // 0x100016c4
        return result;
    }
    // 0x1000168c
    g5 = a3;
    int32_t result2; // 0x100016c7
    if (((int32_t)*(int16_t *)a3 & (int32_t)a2) != 0) {
        // 0x100016b2
        result2 = SetErrorStatus(deviceId, 0) & -0x10000 | 1;
        // branch -> 0x100016c4
    } else {
        // 0x1000169e
        g5 = deviceId;
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0x8004;
        // branch -> 0x100016c4
    }
    // 0x100016c4
    return result2;
}

int32_t VISA_CheckSWStatus(int32_t deviceId) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = function_1000108e(deviceId); // 0x10001bd6
    int16_t v3 = v2; // bp-20
    int32_t v4 = v2 & 0xffff; // 0x10001be27
    g5 = v4;
    if (v4 != 1) {
        // 0x10001bf0
        v3 = function_1000108e(deviceId);
        // branch -> 0x10001c00
    }
    int32_t v5 = RdTimeoutWait(deviceId); // 0x10001c04
    int32_t v6 = IeTimer(v5); // 0x10001c0f
    int32_t v7 = v6; // 0x10001c496
    // branch -> 0x10001c17
    int32_t v8; // 0x10001c38
    while (true) {
        int16_t v9 = v3; // 0x10001c17
        g5 = v9;
        if (v9 != 0) {
            // 0x10001c49
            g3 = v1;
            return (int32_t)v9 | v7 & -0x10000;
        }
        int32_t v10 = function_1000108e(deviceId); // 0x10001c28
        v3 = v10;
        v8 = IeTimerFrom(v6, 0x10000 * v10 / 0x10000);
        if (v8 > v5) {
            // break -> 0x10001c24
            break;
        }
        v7 = v8;
        // continue -> 0x10001c17
    }
    // 0x10001c24
    // branch -> 0x10001c49
    // 0x10001c49
    g3 = v1;
    return (int32_t)v3 | v8 & -0x10000;
}

int32_t function_1000108e(int32_t deviceId) {
    // 0x1000108e
    function_100010e1(deviceId, 0x10000 * g5 / 0x10000);
    g5 = deviceId;
    // DD: 0x7e00 = VXI_GETSTATUS
    int32_t v1 = dd_WriteCommand(deviceId, 0x7e00); // 0x100010a7
    function_100016c8(deviceId);
    g7 = deviceId;
    return SetEngineReplyCode(deviceId, g5 & -0x10000 | v1 & 255);
}

int32_t function_100010e1(int32_t deviceId, int32_t a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2 = RdTimeoutWait(deviceId); // 0x100010eb
    int16_t v3; // bp-20
    if ((0x10000 * function_100011fc(deviceId, (int32_t)&v3) || 0xffff) >= 0x1ffff) {
        int32_t result = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe; // 0x10001120
        // branch -> 0x100011f8
        // 0x100011f8
        g3 = v1;
        return result;
    }
    int16_t v4 = v3 & -513; // 0x1000112d
    v3 = v4;
    int32_t v5 = v4; // 0x10001136
    g2 = v5;
    int32_t v6 = 0x10000 * function_10001249(deviceId, v4, v5, 0); // 0x10001147
    g7 = v6 / 0x10000;
    int32_t result2; // 0x100011fb
    if ((v6 || 0xffff) < 0x1ffff) {
        // 0x1000116a
        InitTimeoutLoop(0);
        // branch -> 0x1000116f
        while (true) {
            int32_t v7 = 0x10000 * function_10001297(deviceId, &v3); // 0x1000117f
            if ((v7 || 0xffff) < 0x1ffff) {
                // 0x100011af
                // branch -> 0x100011da
                // 0x100011da
                g7 = deviceId;
                SetErrorStatus(deviceId, v7 / 0x10000);
                // branch -> 0x100011f8
                // 0x100011f8
                g3 = v1;
                return -2;
            }
            // 0x1000119c
            if ((0x10000 * TestTimeoutDone(v2) || 0xffff) >= 0x1ffff) {
                // break -> 0x100011b7
                break;
            }
            // continue -> 0x1000116f
        }
        int32_t v8 = 0x10000 * function_10001297(deviceId, &v3); // 0x100011c7
        // branch -> 0x100011da
        // 0x100011da
        g7 = deviceId;
        SetErrorStatus(deviceId, v8 / 0x10000);
        result2 = -2;
        // branch -> 0x100011f8
    } else {
        // 0x10001153
        result2 = SetErrorStatus(deviceId, 1) & -0x10000 | 0xfffe;
        // branch -> 0x100011f8
    }
    // 0x100011f8
    g3 = v1;
    return result2;
}

int32_t function_10001a0a(int32_t deviceId, int16_t command) {
    // 0x10001a0a
    int32_t result;
    if ((int16_t)function_10001354(deviceId, command, 0, 0) > -1) {
        // 0x10001a42
        g5 = deviceId;
        SetErrorStatus(deviceId, 0);
        result = 0;
        // branch -> 0x10001a52
    } else {
        // 0x10001a2f
        SetErrorStatus(deviceId, 1);
        result = -1;
        // branch -> 0x10001a52
    }
    // 0x10001a52
    return result;
}

int32_t function_10001297(int32_t deviceId, int16_t * a2) {
    int32_t v1 = g3; // bp-4
    g3 = &v1;
    int32_t v2; // 0x100012ea
    if ((0x10000 * function_100011fc(deviceId, (int32_t)a2) || 0xffff) >= 0x1ffff) {
        // 0x100012b9
        // branch -> 0x100012e1
        // 0x100012e1
        v2 = SetErrorStatus(deviceId, 1);
        g3 = v1;
        return (int32_t)1 | v2 & -0x10000;
    }
    // 0x100012c1
    int16_t v3; // bp-12
    int32_t v4; // 0x100012e1
    if ((*a2 & 256) == 0) {
        // 0x100012db
        v3 = 0;
        v4 = 0;
        // branch -> 0x100012e1
    } else {
        // 0x100012d3
        v3 = 3;
        v4 = 3;
        // branch -> 0x100012e1
    }
    // 0x100012e1
    v2 = SetErrorStatus(deviceId, v4);
    g3 = v1;
    return (int32_t)v3 | v2 & -0x10000;
}

int32_t _imported_function_ord_129(int32_t a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5, int32_t a6) {
	return 0;
}
int32_t _imported_function_ord_130(int32_t a1, int32_t a2) {
	return 0;

}
int32_t _imported_function_ord_131(int32_t a1, int32_t a2, int32_t a3, int32_t a4, int32_t a5) {
	return 0;

}
int32_t _imported_function_ord_132(int32_t a1) {
	return 0;

}
int32_t _imported_function_ord_133(int32_t a1, int32_t a2, int32_t a3) {
	return 0;

}
int32_t _imported_function_ord_134(int32_t a1, int32_t a2, int32_t a3) {
	return 0;

}
int32_t _imported_function_ord_141(int32_t a1) {
	return 0;

}
int32_t _imported_function_ord_261(int32_t a1, int32_t a2, int32_t a3, int32_t a4) {
	return 0;

}
int32_t _imported_function_ord_262(int32_t a1, int32_t a2, int32_t a3, int32_t a4) {
	return 0;

}
int32_t _imported_function_ord_267(int32_t a1, int32_t a2, int32_t a3) {
	return 0;

}


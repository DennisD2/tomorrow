#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr90xx.h>

static int32_t g3 = 0; // ebp
static int32_t g5 = 0; // ecx
static int32_t g4 = 0; // esi
static int32_t g6 = 0; // edi
static int32_t g7 = 0; // edx
static int32_t g8 = 0; // esi

static int32_t g35 = 1;
static int32_t g37; // 0x1000eef4

static int32_t g40 = 0;

static SET9052 *g_sa9054_data = 0;

static int32_t g59 = 0;
static int32_t g60 = 0;
static int32_t g62 = 0;
static int32_t g63 = 0;

static int32_t g93 = 0;
static int32_t g94 = 0;
//static int32_t g95 = 0;
static int32_t g96 = 0;
static int32_t g97 = 0;
static int32_t g98 = 0;

int32_t mr90xx_init(char* session_string, int32_t query_flag, int32_t reset_flag, void** session_id);
int32_t mr90xx_SetEngineModel(int32_t a1, int16_t a2, int32_t a3);

int32_t mapVisaErrorToAPIError(int16_t errorCode);
int32_t function_10006643(char a1);
int32_t function_1000655f(char a1, int32_t a2);
int32_t function_10009277(int32_t a1, int32_t a2, char a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8);

void *AllocGlobal(void *a1);

int32_t __amsg_exit(int32_t a1) {
	return 0;
}
int32_t __nh_malloc(int32_t a1, int32_t a2) {
	return 0;
}
//HGLOBAL GlobalAlloc(_In_ UINT uFlags, _In_ SIZE_T dwBytes);
//HGLOBAL GlobalFree(HGLOBAL hMem);
//LPVOID GlobalLock(_In_ HGLOBAL hMem);
//BOOL GlobalUnlock(_In_ HGLOBAL hMem);
//VOID InitializeCriticalSection(_Out_ LPCRITICAL_SECTION lpCriticalSection);
//VOID EnterCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection);
//VOID LeaveCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection);

#define SESSION_STRING_IS_NULL 0xbffc0001
#define SESSION_STRING_IS_NULO 0xbffc0801ZZ

int32_t mr90xx_init(char* session_string, int32_t query_flag, int32_t reset_flag, void** session_id) {
	printf("mr90xx_init\n");

	void *v1 = session_id;
	*session_id = NULL;
	if (session_string == NULL) {
		return MR90XX_IE_ERROR; // -0x4003ffff = 0xbffc0002
	}
	int32_t v2 = query_flag & 0xffff; // 0x10002fc2
	if (v2 != IE_TRUE) {
		// 0x10002fcd
		if (v2 != IE_FALSE) {
			return MR90XX_IE_ERR_VALS; // -0x4003fffe = 0xbffc0003
		}
	}
	int32_t v3 = reset_flag & 0xffff; // 0x10002fe7
	if (v3 != IE_TRUE) {
		// 0x10002ff1
		if (v3 != IE_FALSE) {
			return MR90XX_IE_ERR_AUTO; // -0x4003fffd; ) = 0xbffc0004
		}
	}
	int32_t result = mr90xx_OpenSession(session_string, session_id); // 0x10003020
	if (result != MR90XX_IE_SUCCESS) {
		return result;
	}
	void* v4 = *session_id; // 0x10003041
	g7 = v4;
	int32_t result2 = mr90xx_SetEngineModel(v4, 256, 0); // 0x10003044
	if (result2 != 0) {
		mr90xx_CloseSession(*session_id);
		return result2;
	}
	g7 = v1;
	int32_t result3 = mr90xx_InitEngine(*session_id, 0); // 0x10003071
	if (result3 != 0x3ffc0811) {
		int32_t v5 = *session_id; // 0x10003088
		g7 = v5;
		mr90xx_CloseSession(v5);
		return result3;
	}
	int32_t result5; // 0x10003118
	int32_t result4; // 0x100030ef
	int32_t v6; // 0x10003103
	if (v2 == 0) {
		g5 = v3;
		if (v3 != 0) {
			g7 = v1;
			result4 = mr90xx_reset(*session_id);
			if (result4 < 0) {
				v6 = *session_id;
				g7 = v6;
				mr90xx_CloseSession(v6);
				return result4;
			}
		}
		result5 = MR90XX_IE_SUCCESS; // 0
	} else {
		g7 = v1;
		int16_t v7; // bp-8
		if (function_100037d0(*session_id, (int32_t) &v7, 0x3ffc0811) == 0) {
			if (v7 != 0) {
				g5 = v3;
				if (v3 != 0) {
					g7 = v1;
					result4 = mr90xx_reset(*session_id);
					if (result4 < 0) {
						v6 = *session_id;
						g7 = v6;
						mr90xx_CloseSession(v6);
						return result4;
					}
				}
				return MR90XX_IE_SUCCESS; // 0
			}
		}
		g7 = v1;
		mr90xx_CloseSession(*session_id);
		result5 = MR90XX_ERROR_BADHANDLE; // -0x4003f7f3; 0xbffc080e
	}
	return result5;
}

// Address range: 0x100046f3 - 0x1000495f
int32_t mr90xx_OpenSession(char* session_string, int32_t * session_id) {
	int32_t v1 = g3; // bp-4
	g3 = &v1;
	SET9052 *v2 = AllocGlobal(-1); // 0x1000470f
	if (v2 == NULL) {
		g3 = v1;
		return -1;
	}
	ClearFuncStatusCode(v2);
	int32_t v3; // bp-280
	int32_t v4 = &v3; // 0x10004770
	int32_t v5 = 0; // 0x1000475512
	while (true) {
		int32_t * v6 = (int32_t *) (4 * v5 + (int32_t) &g60); // 0x10004764
		if (*v6 != NULL) {
			RdSessionString(*v6, v4);
			g5 = v4;
			if (function_1000a4b0((char *) &v3, session_string) == 0) {
				function_1000498f(v2);
				g3 = v1;
				return MR90XX_ERROR_NOSESSION; // -0x4003f7f4;
			}
		}
		int32_t v7 = v5 + 1; // 0x1000474c
		if ((int16_t) v7 >= 100) {
			break;
		}
		v5 = 0x10000 * v7 / 0x10000;
	}
	if ((0x10000 * InitInstrData(v2) || 0xffff) >= 0x1ffff) {
		function_1000498f(v2);
		g3 = v1;
		return MR90XX_IE_ERROR; // -0x4003f7ff;
	}
	int16_t status = OpenSession(v2, session_string, 1); // 0x100047fb
	int32_t result; // 0x1000495f
	if (status == 0) {
		*session_id = RdSessionHandle(v2);
		int32_t v9 = 0; // 0x1000486810
		int16_t v10 = 0;
		while (true) {
			if (*(int32_t *) (4 * v9 + (int32_t) &g60) != 0) {
				int32_t v11 = v9 + 1; // 0x1000485f
				int16_t v12 = v11; // 0x10004862
				if (v12 >= 100) {
					break;
				}
				v9 = 0x10000 * v11 / 0x10000;
				v10 = v12;
				continue;
			}
			if (v10 == -1) {
				function_1000498f(v2);
				g3 = v1;
				return MR90XX_IE_ERROR; // -0x4003f7ff;
			}
			int32_t v13 = 0; // 0x100048d38
			while (true) {
				int32_t * v14 = (int32_t *) (4 * v13 + (int32_t) &g60); // 0x100048e2
				if (*v14 != 0) {
					if (*session_id == RdSessionHandle(*v14)) {
						function_1000498f(v2);
						g3 = v1;
						return MR90XX_ERROR_NOSESSION; //-0x4003f7f4;
					}
				}
				int32_t v15 = v13 + 1; // 0x100048ca
				if ((int16_t) v15 >= 100) {
					break;
				}
				v13 = 0x10000 * v15 / 0x10000;
			}
			int32_t v16 = 4 * (int32_t) v10; // 0x10004930
			*(int32_t *) (v16 + (int32_t) &g60) = v2;
			*(int32_t *) (v16 + (int32_t) &g59) = g_sa9054_data;
			ClearFuncStatusCode(v2);
			g3 = v1;
			return 0;
		}
	} else {
		function_1000498f(v2);
		result = mapVisaErrorToAPIError(status);
	}
	g3 = v1;
	return result;
}

// Address range: 0x100025dd - 0x1000262f
int32_t mr90xx_SetEngineModel(int32_t a1, int16_t a2, int32_t a3) {
	g5 = a1;
	int32_t v1 = 0; // bp-16
	int32_t v2 = function_10004310(a1, &v1); // 0x100025eb
	int32_t result; // 0x1000262f
	if (v2 == 0) {
		result = mapVisaErrorToAPIError(
				(int16_t) SetEngineModel(function_10004402(v1)));
	} else {
		result = v2;
	}
	return result;
}

// Address range: 0x10004a21 - 0x10004a81
int32_t mr90xx_CloseSession(int32_t a1) {
	int32_t v1 = 0; // bp-8
	int32_t v2 = function_10004310(a1, &v1); // 0x10004a2f
	int32_t result = v2;
	if (v2 == 0) {
		int32_t v3 = *(int32_t *) (4 * v1 + (int32_t) &g60); // 0x10004a48
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
		result = mapVisaErrorToAPIError((int16_t) InitEngine(function_10004402(v1)));
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
		result = mapVisaErrorToAPIError(
				(int16_t) ResetEngine(function_10004402(v1)));
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
		result = mapVisaErrorToAPIError(
				(int16_t) SetTimeoutWait(function_10004402(v1)));
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
		result = mapVisaErrorToAPIError((int16_t) IdQuery(function_10004402(v1)));
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
void *AllocGlobal(void *a1) {
	// DD: GlobalAlloc(_In_ UINT uFlags, _In_ SIZE_T dwBytes)
	// See https://technet.microsoft.com/de-de/library/aa366574(v=vs.85).aspx
	// 0x2000 is 'no flag'
	// 736 = 0x2e0
	void *hMem = GlobalAlloc(0x2000, 40736); // 0x1000496e
	g_sa9054_data = (void *) hMem;
	return (void *) GlobalLock(hMem);
}

int32_t function_1000a4b0(char * a1, int32_t a2) {
	int32_t v1 = g6; // 0x1000a4b3
	int32_t v2 = g8; // 0x1000a4b4
	int32_t v3 = g4; // 0x1000a4b5
	g8 = a2;
	int32_t v4 = (int32_t) a1; // 0x1000a4b9
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
			unsigned char v10 = *(char *) v9; // 0x1000a538
			g8 = v9 + 1;
			int32_t v11 = g6; // 0x1000a53b
			unsigned char v12 = *(char *) v11; // 0x1000a53b
			g6 = v11 + 1;
			result2 = (int32_t) v10 | v8;
			int32_t v13 = (int32_t) v12 | v7 & -256; // 0x1000a53b30
			if (v10 != v12) {
				// 0x1000a542
				g4 = 0x1000000 * function_10006643(v12) / 0x1000000;
				int32_t v14 = function_10006643(v12); // 0x1000a54e
				int32_t v15 = g4; // 0x1000a556
				unsigned char v16 = (char) v15; // 0x1000a556
				unsigned char v17 = (char) v14; // 0x1000a556
				if (v16 != v17) {
					int32_t v18 = v16 < v17 ? 2 : 1; // 0x1000a55c
					int32_t result = (int32_t) (v16 < v17
							& (v14 != -1 | v14 < (int32_t) (v16 < v17))) + v18; // 0x1000a55c
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
			if ((char) result2 == 0) {
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
	int32_t v19 = (int32_t) &g93 & -256; // 0x1000a4cc24
	// branch -> 0x1000a4d0
	while (true) {
		unsigned char v20 = *(char *) a2; // 0x1000a4d0
		int32_t v21 = v20; // 0x1000a4d0
		unsigned char v22 = *(char *) v4; // 0x1000a4d3
		int32_t v23 = 256 * (int32_t) v22 | v21 | v19 & -0x10000; // 0x1000a4d3
		uint32_t v24 = v23 / 256; // 0x1000a4d6
		unsigned char v25 = (char) v24; // 0x1000a4d6
		if (v25 != v20) {
			uint32_t v26 = 256 * v21 | v19 & -0x10000; // 0x1000a4e7
			g5 &= -256;
			unsigned char v27 = (char) (v26 / 256); // 0x1000a4f6
			if (v25 != v27) {
				int32_t v28 = v25 < v27 ? 2 : 1; // 0x1000a4fc
				int32_t v29 = (int32_t) (v25 < v27
						& (v25 != -1 | v25 < (char) (v25 < v27))) + v28 | v26; // 0x1000a4fc
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
		if ((char) v23 == 0) {
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
		if (*(int32_t *) (4 * v2 + (int32_t) &g60) != a1) {
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
			GlobalUnlock((int32_t *) g_sa9054_data);
			hMem = g_sa9054_data;
			g5 = hMem;
			int32_t result = (int32_t) GlobalFree((int32_t *) hMem); // 0x10004a17
			// branch -> 0x10004a1d
			// 0x10004a1d
			return result;
		}
		// 0x100049c4
		hMem2 = *(int32_t *) (4 * v3 + (int32_t) &g59);
		GlobalUnlock((int32_t *) hMem2);
		hMem3 = *(int32_t *) (4 * v1 + (int32_t) &g59);
		v5 = GlobalFree((int32_t *) hMem3);
		v4 = v1;
		g5 = v4;
		*(int32_t *) (4 * v4 + (int32_t) &g59) = 0;
		*(int32_t *) (4 * v1 + (int32_t) &g60) = 0;
		// branch -> 0x10004a1d
		// 0x10004a1d
		return (int32_t) v5;
	}
	// 0x100049be
	int32_t result2; // 0x10004a20
	if (v3 < 100) {
		// 0x100049c4
		hMem2 = *(int32_t *) (4 * v3 + (int32_t) &g59);
		GlobalUnlock((int32_t *) hMem2);
		hMem3 = *(int32_t *) (4 * v1 + (int32_t) &g59);
		v5 = GlobalFree((int32_t *) hMem3);
		v4 = v1;
		g5 = v4;
		*(int32_t *) (4 * v4 + (int32_t) &g59) = 0;
		*(int32_t *) (4 * v1 + (int32_t) &g60) = 0;
		result2 = (int32_t) v5;
		// branch -> 0x10004a1d
	} else {
		// 0x10004a04
		GlobalUnlock((int32_t *) g_sa9054_data);
		hMem = g_sa9054_data;
		g5 = hMem;
		result2 = (int32_t) GlobalFree((int32_t *) hMem);
		// branch -> 0x10004a1d
	}
	// 0x10004a1d
	return result2;
}

int32_t mapVisaErrorToAPIError(int16_t errorCode) {
	// looks like offset in an array???
// DD XXX
#ifdef NOT
	unsigned char v1 = *(char *) ((0x10000 * (int32_t) errorCode + 0x150000) / 0x10000
			+ 0x10004648); // 0x10004437
#endif
	unsigned char v1 = 0x0;
// DD XXX

	g7 = v1;
	int32_t result; // 0x100045a3
	switch (v1) {
	default: {
		result = MR90XX_ERROR_SESSIONINUSE|_VI_ERROR; // -0x4003f7f5; // 0xbffc.080c
		break;
	}
	case 0: {
		result = -0x4003f7d1;// 0xbffc.0830
		break;
	}
	case 1: {
		result = MR90XX_IE_ENG_BAD_PARM5|_VI_ERROR; // -0x4003f7e1;
		break;
	}
	case 2: {
		result = MR90XX_IE_UNKNOWN|_VI_ERROR; // -0x4003f7f6;
		break;
	}
	case 3: {
		result = MR90XX_IE_ERR_ENGMOD|_VI_ERROR; //-0x4003f7f7;
		break;
	}
	case 4: {
		result = MR90XX_IE_ERR_NULLPTR|_VI_ERROR; //-0x4003f7f8;
		break;
	}
	case 5: {
		result = MR90XX_IE_ERR_DIFDTEC|_VI_ERROR; // -0x4003f7f9;
		break;
	}
	case 6: {
		result = MR90XX_IE_ERR_DWELL; // -0x4003f7fa;
		break;
	}
	case 7: {
		result = MR90XX_IE_ERR_STEP|_VI_ERROR; //-0x4003f7fb;
		break;
	}
	case 8: {
		result = MR90XX_IE_ERR_SPAN|_VI_ERROR; // -0x4003f7fc;
		break;
	}
	case 9: {
		result = MR90XX_IE_ERR_AUTO|_VI_ERROR; // -0x4003f7fd;
		break;
	}
	case 10: {
		result = MR90XX_IE_ERR_VALS|_VI_ERROR; // -0x4003f7fe;
		break;
	}
	case 11: {
		result = MR90XX_IE_ERROR|_VI_ERROR; // -0x4003f7ff;
		break;
	}
	case 12: {
		result = MR90XX_IE_SUCCESS|_VI_ERROR; // 0;
		break;
	}
	case 13: {
		result = MR90XX_IE_WARN_VALS; // 0x3ffc0801;
		break;
	}
	case 14: {
		result = MR90XX_IE_WARN_OBSOL; // 0x3ffc0802;
		break;
	}
	case 15: {
		result = MR90XX_IE_WARN_SPAN; // 0x3ffc0803;
		break;
	}
	case 16: {
		result = MR90XX_IE_ENG_BUSY; // 0x3ffc0810;
		break;
	}
	case 17: {
		result = MR90XX_IE_ENG_ACK; // 0x3ffc0811;
		break;
	}
	case 18: {
		result = MR90XX_IE_ENG_NOMAIN; // 0x3ffc0812;
		break;
	}
	case 19: {
		result = MR90XX_IE_ENG_NODSP; // 0x3ffc0813;
		break;
	}
	case 20: {
		result = MR90XX_IE_ENG_ERASE; // 0x3ffc0815;
		break;
	}
	case 21: {
		result = MR90XX_IE_ENG_FLASH; // 0x3ffc0816;
		break;
	}
	case 22: {
		result = MR90XX_IE_ENG_NYBYTES; // 0x3ffc0817;
		break;
	}
	case 23: {
		result = MR90XX_IE_ENG_CKSUM; // 0x3ffc0818;
		break;
	}
	case 24: {
		result = MR90XX_IE_ENG_COLON; // 0x3ffc0819;
		break;
	}
	case 25: {
		result = MR90XX_IE_ENG_BAD_CMD; // 0x3ffc081a;
		break;
	}
	case 26: {
		result = MR90XX_IE_ENG_BAD_PARM1; // 0x3ffc081c;
		break;
	}
	case 27: {
		result = MR90XX_IE_ENG_BAD_PARM2; // 0x3ffc081d;
		break;
	}
	case 28: {
		result = MR90XX_IE_ENG_BAD_PARM3; // 0x3ffc081e;
		break;
	}
	case 29: {
		result = MR90XX_IE_ENG_BAD_PARM4; // 0x3ffc081f;
		break;
	}
	case 30: {
		result = MR90XX_IE_ENG_BAD_PARM5; // 0x3ffc0820;
		break;
	}
	case 31: {
		result = MR90XX_IE_ENG_BAD_PARM6; // 0x3ffc0821;
		break;
	}
	case 32: {
		result = MR90XX_IE_ENG_BAD_PARM7; // 0x3ffc0822;
		break;
	}
	case 33: {
		result = MR90XX_IE_ENG_BAD_PARM8; // 0x3ffc0823;
		break;
	}
	case 34: {
		result = MR90XX_IE_ENG_BAD_PARM9; // 0x3ffc0824;
		break;
	}
	case 35: {
		result = MR90XX_IE_ENG_ERR_DTEC; // 0x3ffc0828;
		break;
	}
	case 36: {
		result = MR90XX_IE_ENG_ERR_TRIG; // 0x3ffc0829;
		break;
	}
	case 37: {
		result = MR90XX_IE_ENG_INWEEDS; // 0x3ffc0827;
		break;
	}
	case 38: {
		result = MR90XX_IE_ENG_INBOOT; // 0x3ffc0826;
		break;
	}
	case 39: {
		result = MR90XX_IE_ENG_INMAIN; // 0x3ffc0825;
		break;
	}
	}
	return result;
}

int32_t function_10004310(int32_t a1, int32_t * a2) {
	int32_t v1 = (int32_t) a2;
	if (a2 == NULL) {
		return MR90XX_IE_WARN_SPAN; // -0x4003f7fe;
	}
	// 0x1000432d
	if (a1 == 0) {
		return MR90XX_IE_ENG_BUSY; // -0x4003f7f1;
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
			int32_t * v5 = (int32_t *) (4 * v4 + (int32_t) &g60); // 0x10004374
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
			v3 = *(int32_t *) (4 * v2 + (int32_t) &g60);
			g7 = v3;
			g5 = a1;
			if (*(int32_t *) (v3 + 468) != a1) {
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
	v3 = *(int32_t *) (4 * v2 + (int32_t) &g60);
	g7 = v3;
	g5 = a1;
	int32_t result; // 0x10004401
	if (*(int32_t *) (v3 + 468) == a1) {
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
	return *(int32_t *) (4 * a1 + (int32_t) &g60);
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
			v15 = (int32_t) *(char *) (g37 + 2 * result) & 1;
			// branch -> 0x1000669c
		}
		// 0x1000669c
		if (v15 != 0) {
			// 0x1000669c
			v8 = result;
			// branch -> 0x100066a4
			// 0x100066a4
			v13 = v8 / 256;
			if (*(char *) ((2 * (v13 & 255) || 1) + g37) > -1) {
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
			v12 = function_10009277(g94, v6, (char) (int32_t) &v1, v11, v3, 3,
					0, v10);
			if (v12 != 0) {
				// 0x100066f2
				if (v12 != g8) {
					// 0x100066fc
					v14 = v2;
					g5 = v14;
					result2 = v14 | 256 * (int32_t) v7;
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
		if (*(char *) ((2 * (v13 & 255) || 1) + g37) > -1) {
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
		v12 = function_10009277(g94, v6, (char) (int32_t) &v1, v11, v3, 3, 0,
				v10);
		if (v12 != 0) {
			// 0x100066f2
			if (v12 != g8) {
				// 0x100066fc
				v14 = v2;
				g5 = v14;
				result2 = v14 | 256 * (int32_t) v7;
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
	int32_t lpCriticalSection2 = 4 * a1 + (int32_t) &g40; // 0x10007240
	g8 = lpCriticalSection2;
	if (*(int32_t *) lpCriticalSection2 != 0) {
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
		if (*(int32_t *) g8 != 0) {
			// 0x10007280
			function_100073ec(lpCriticalSection);
			// branch -> 0x10007286
		} else {
			// 0x10007276
			InitializeCriticalSection(
					(struct _RTL_CRITICAL_SECTION *) lpCriticalSection);
			*(int32_t *) g8 = lpCriticalSection;
			// branch -> 0x10007286
		}
		// 0x10007286
		function_1000729a(17);
		g5 = 17;
		g6 = (int32_t) (struct _RTL_CRITICAL_SECTION *) v2;
		lpCriticalSection2 = g8;
		// branch -> 0x1000728f
	}
	// 0x1000728f
	EnterCriticalSection(
			(struct _RTL_CRITICAL_SECTION *) *(int32_t *) lpCriticalSection2);
	g8 = v1;
	int32_t * v3;
	return (int32_t) &v3;
}

int32_t function_1000729a(int32_t a1) {
	int32_t lpCriticalSection = *(int32_t *) (4 * a1 + (int32_t) &g40); // 0x100072a0
	LeaveCriticalSection((struct _RTL_CRITICAL_SECTION *) lpCriticalSection);
	int32_t * v1;
	return (int32_t) &v1;
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
		char v8 = *(char *) (g37 + (2 * v7 | 1)); // 0x1000658c
		v3 = v8 > -1 ? v4 : v6;
		int32_t result = function_1000912e((char *) 1, (int32_t) &v3,
				2 - (int32_t) (v8 > -1), (int32_t) &v1, 0, 0, 1); // 0x100065bd
		if (result == 0) {
			// 0x100065c9
			g3 = v2;
			return result;
		}
		v5 = v1;
		// branch -> 0x100065cf
	} else {
		// 0x10006571
		v5 = (int32_t) *(int16_t *) (g37 + 2 * v4);
		// branch -> 0x100065cf
	}
	// 0x100065cf
	int32_t v9;
	return v5 & v9;
}

// Address range: 0x10009277 - 0x1000949a
int32_t function_10009277(int32_t a1, int32_t a2, char a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8) {
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

int32_t function_1000912e(char * a1, int32_t a2, int32_t a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7) {
	// 0x1000912e
	abort();
	// UNREACHABLE
}


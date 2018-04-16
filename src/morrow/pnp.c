#include <math.h>
#include <stdlib.h>

#include <stdio.h>

#include <sapform.h>
#include <sa_defin.h>
#include <str_9052.h>

#include <mr90xx.h>

#include "pnp.h"

#include "helper.h"

static int32_t g3 = 0; // ebp
static int32_t g5 = 0; // ecx
//static int32_t g4 = 0; // esi
static int32_t g6 = 0; // edi
static int32_t g7 = 0; // edx
static int32_t g8 = 0; // esi

static int32_t g35 = 1;
static int32_t g37; // 0x1000eef4

static int32_t g40 = 0;

static SET9052 *g_sa9054_data = 0;

/*
 * session and session2:
 * These are arrays with index = session_handle (e.g. from VXI) of pointers to SET9052
 * structs. The lib obviously supports multiple sessions. The value 100 used below at
 * many places shows that this is the maximum number of sessions.
 */
#define PNP_MAXSESSIONS 100

static SET9052 *session2[PNP_MAXSESSIONS];
static SET9052 *session[PNP_MAXSESSIONS];

//static int32_t g62 = 0;
//static int32_t g63 = 0;

//static int32_t g93 = 0;
static int32_t g94 = 0;
//static int32_t g95 = 0;
//static int32_t g96 = 0;
//static int32_t g97 = 0;
//static int32_t g98 = 0;


static int32_t mapVisaErrorToAPIError(int16_t errorCode);
static SET9052 *sessionForId(int32_t sessionId);
static int32_t freeMemory(SET9052 *a1) ;

static int32_t function_10006643(char a1);
static int32_t function_1000655f(char a1, int32_t a2);
static int32_t function_10009277(int32_t a1, int32_t a2, char a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8);
static int32_t function_100037d0(int32_t a1, int32_t a2, int32_t a3) ;
static int32_t sessionForId2(int32_t sessionId, int32_t *returnId);
static int32_t function_1000729a(int32_t a1);
static int32_t function_100074d5(int32_t a1);

static int32_t function_100073ec(int32_t a1); /* abort1 */
static int32_t function_1000912e(char * a1, int32_t a2, int32_t a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7); /* abort 2 */

static void *AllocGlobal(void *a1);

#define SESSION_STRING_IS_NULL 0xbffc0001
#define SESSION_STRING_IS_NULO 0xbffc0801ZZ

int32_t mr90xx_init(char* session_string, int32_t query_flag,
		int32_t reset_flag, int32_t* session_id) {
	dlog( LOG_DEBUG, "mr90xx_init\n");

	void *v1 = session_id;
	*session_id = NULL;
	if (session_string == NULL) {
		return MR90XX_IE_ERROR;
	}
	int32_t v2 = query_flag & 0xffff;
	if (v2 != IE_TRUE) {
		if (v2 != IE_FALSE) {
			return MR90XX_IE_ERR_VALS; // -0x4003fffe = 0xbffc0003
		}
	}
	int32_t v3 = reset_flag & 0xffff;
	if (v3 != IE_TRUE) {
		if (v3 != IE_FALSE) {
			return MR90XX_IE_ERR_AUTO; // -0x4003fffd; ) = 0xbffc0004
		}
	}
	int32_t result = mr90xx_OpenSession(session_string, session_id);
	if (result != MR90XX_IE_SUCCESS) {
		return result;
	}
	int32_t v4 = *session_id;
	g7 = v4;
	dlog( LOG_DEBUG, "mr90xx_init, session_id got: %d\n", v4);
	int32_t result2 = mr90xx_SetEngineModel(v4, SA9052 /*256*/);
	if (result2 != 0) {
		mr90xx_CloseSession(*session_id);
		return result2;
	}
	g7 = v1;
	int32_t result3 = mr90xx_InitEngine(*session_id, 0);
	dlog( LOG_DEBUG, "mr90xx_init, mr90xx_InitEngine returned: 0x%x\n",
			result3);
// DD XXX
	result3 = 0x3ffc0811;
// DD XXX
	if (result3 != 0x3ffc0811) {
		int32_t v5 = *session_id;
		g7 = v5;
		mr90xx_CloseSession(v5);
		return result3;
	}
	int32_t result5;
	int32_t result4;
	int32_t v6;
// DD XXX
	v2 = 0;
// DD XXX
	if (v2 == 0) {
		g5 = v3;
		if (v3 != 0) {
			g7 = v1;
			result4 = mr90xx_reset(*session_id);
			dlog( LOG_DEBUG, "mr90xx_init, mr90xx_reset returned: 0x%x\n",
					result4);
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
	dlog( LOG_DEBUG, "mr90xx_init --> 0x%x\n", result5);
	return result5;
}

int32_t mr90xx_OpenSession(char* session_string, int32_t *session_id) {
	dlog( LOG_DEBUG, "mr90xx_OpenSession\n");
	int32_t v1 = g3; // bp-4
	g3 = &v1;
	SET9052 *newSession = AllocGlobal(-1);
	if (newSession == NULL) {
		g3 = v1;
		return -1;
	}
	ClearFuncStatusCode(newSession);
	char *v3; // bp-280
	int32_t v4 = &v3;
	int32_t v5 = 0;
#ifdef ORIG
	while (true) {
		//int32_t * v6 = (int32_t *) (4 * v5 + (int32_t) &session); // 0x10004764
		int32_t *v6 = session[v5];
		if (*v6 != NULL) {
			RdSessionString(*v6, v4);
			g5 = v4;
			if (compareStrings((char *) &v3, session_string) == 0) {
				freeMemory(newSession);
				g3 = v1;
				return MR90XX_ERROR_NOSESSION; // -0x4003f7f4;
			}
		}
		int32_t v7 = v5 + 1; // 0x1000474c
		if ((int16_t) v7 >=PNP_MAXSESSIONS) {
			break;
		}
		//v5 = 0x10000 * v7 / 0x10000;
		v5 = v7;
	}
#else
	int i;
	for (i = 0; i < PNP_MAXSESSIONS; i++) {
		SET9052 *s = session[i];
		if (s != NULL) {
			RdSessionString(s, v4);
			g5 = v4;
			if (compareStrings(&v3, session_string) == 0) {
				// For this session_string, we already have a session
				freeMemory(newSession);
				g3 = v1;
				return MR90XX_ERROR_NOSESSION;
			}
		}
	}
#endif
	if ((0x10000 * InitInstrData(newSession) || 0xffff) >= 0x1ffff) {
		// Init failed
		freeMemory(newSession);
		g3 = v1;
		return MR90XX_IE_ERROR;
	}
	int16_t status = OpenSession(newSession, session_string, 1);
	int32_t result;
	if (status == 0) {
		dlog( LOG_DEBUG, "mr90xx_OpenSession, using session id: 0x%x\n",
				RdSessionHandle(newSession));
		*session_id = RdSessionHandle(newSession);
		int32_t v9 = 0;
		int16_t v10 = 0;
#ifdef ORIG
		while (true) {
			if (*(int32_t *) (4 * v9 + (int32_t) &session) != 0) {
				int32_t v11 = v9 + 1; // 0x1000485f
				int16_t v12 = v11;// 0x10004862
				if (v12 >= PNP_MAXSESSIONS) {
					break;
				}
				v9 = 0x10000 * v11 / 0x10000;
				v10 = v12;
				continue;
			}
			if (v10 == -1) {
				freeMemory(newSession);
				g3 = v1;
				return MR90XX_IE_ERROR; // -0x4003f7ff;
			}
			int32_t v13 = 0; // 0x100048d38
			while (true) {
				int32_t * v14 = (int32_t *) (4 * v13 + (int32_t) &session); // 0x100048e2
				if (*v14 != 0) {
					if (*session_id == RdSessionHandle(*v14)) {
						freeMemory(newSession);
						g3 = v1;
						return MR90XX_ERROR_NOSESSION; //-0x4003f7f4;
					}
				}
				int32_t v15 = v13 + 1; // 0x100048ca
				if ((int16_t) v15 >= PNP_MAXSESSIONS) {
					break;
				}
				v13 = 0x10000 * v15 / 0x10000;
			}
			int32_t v16 = 4 * (int32_t) v10; // 0x10004930
			*(int32_t *) (v16 + (int32_t) &session) = newSession;
			*(int32_t *) (v16 + (int32_t) &session2) = g_sa9054_data;
			ClearFuncStatusCode(newSession);
			g3 = v1;
			return 0;
		}

		/*
		 * Code replacement close to original
		 for (i = 0; i < PNP_MAXSESSIONS; i++) {
		 if (session[i] == NULL) {
		 break;
		 }
		 }
		 dlog( LOG_DEBUG, "mr90xx_OpenSession, free index at %d\n", i);

		 if (i == PNP_MAXSESSIONS) {
		 // All full
		 freeMemory(newSession);
		 return MR90XX_IE_ERROR;
		 }

		 int j;
		 for (j = 0; j < PNP_MAXSESSIONS; j++) {
		 SET9052 *v14 = session[j];
		 if (v14 != NULL) {
		 if (*session_id == RdSessionHandle(v14)) {
		 dlog( LOG_ERROR,
		 "mr90xx_OpenSession, session already open for %s.\n",
		 session_string);
		 freeMemory(newSession);
		 return MR90XX_IE_ERROR;
		 }
		 }
		 }
		 */
#else
		if (session[*session_id] != NULL) {
			dlog( LOG_ERROR,
					"mr90xx_OpenSession, session already open for session_id %d.\n",
					*session_id);
			freeMemory(newSession);
			return MR90XX_IE_ERROR;
		}
		// All fine
		dlog( LOG_INFO, "mr90xx_OpenSession, session added to position %d.\n",
				*session_id);
		session[*session_id] = newSession;
		session2[*session_id] = g_sa9054_data;
		ClearFuncStatusCode(newSession);
		g3 = v1;
		return 0;
#endif
	} else {
		freeMemory(newSession);
		result = mapVisaErrorToAPIError(status);
	}
	g3 = v1;
	return result;
}

// DD function ORIG does not use model parameter -> seems to be decompiled wrong.
int32_t mr90xx_SetEngineModel(int32_t sessionId, int16_t model) {
	dlog( LOG_DEBUG, "mr90xx_SetEngineModel(0x%x)\n", model);
#ifdef ORIG
	g5 = sessionId;
	int32_t modelFound = SAUNKNOWN; // bp-16
	// This seems to lookup
	int32_t ret = sessionForId2(sessionId, &modelFound);// 0x100025eb
	int32_t result;// 0x1000262f
	if (ret == 0) {
		// function_10004402 seems to map the looked up engine value to a value usable by SetEngineModel().
		result = mapVisaErrorToAPIError(
				(int16_t) SetEngineModel(sessionForId(modelFound)));
	} else {
		result = ret;
	}
#else
	int32_t result;

	// DD this function was reimplemented different from original. Because
	// I could not find out how to reproduce. It looks decompiled wrong.
	result = mapVisaErrorToAPIError(
			SetEngineModel(sessionForId(sessionId), model));
#endif
	dlog( LOG_DEBUG, "mr90xx_SetEngineModel --> 0x%x\n", result);
	return result;
}

int32_t mr90xx_CloseSession(int32_t a1) {
	dlog( LOG_DEBUG, "mr90xx_CloseSession\n");
	int32_t v1 = 0; // bp-8
	int32_t v2 = sessionForId2(a1, &v1); // 0x10004a2f
	int32_t result = v2;
	if (v2 == 0) {
		//int32_t v3 = *(int32_t *) (4 * v1 + (int32_t) &session); // 0x10004a48
		SET9052 *v3 = sessionForId(v1);
		CloseSession(v3, 0x10000 * RdInterfaceType(v3) / 0x10000);
		freeMemory(v3);
		result = 0;
	}
	return result;
}

int32_t mr90xx_InitEngine(void *session_id, int32_t a2) {
	dlog( LOG_DEBUG, "mr90xx_InitEngine\n");
	int32_t v1 = 0; // bp-16
	int32_t v2 = sessionForId2(session_id, &v1); // 0x10003830
	int32_t result; // 0x1000386f
	if (v2 == 0) {
		result = mapVisaErrorToAPIError((int16_t) InitEngine(sessionForId(v1)));
	} else {
		result = v2;
	}
	dlog( LOG_DEBUG, "mr90xx_InitEngine --> 0x%x\n", result);
	return result;
}

int32_t mr90xx_reset(int32_t a1) {
	dlog( LOG_DEBUG, "mr90xx_reset\n");
	int32_t result = mr90xx_ResetEngine(a1, g5); // 0x10003121
// DD XXX
	result = 0x3ffc0811;
// DD XXX
	if (result != 0x3ffc0811) {
		dlog( LOG_DEBUG, "mr90xx_reset 1 --> 0x%x\n", result);
		return result;
	}
	int32_t v1 = mr90xx_InitEngine(a1, 0x3ffc0811); // 0x1000313e
	int32_t result2; // 0x1000316d
	// DD XXX
		v1 = 0x3ffc0811;
	// DD XXX
	if (v1 == 0x3ffc0811) {
		g7 = a1;
		mr90xx_SetTimeoutWait(a1, 300, 0x3ffc0811);
		result2 = 0;
	} else {
		result2 = v1;
	}
	dlog( LOG_DEBUG, "mr90xx_reset 2 --> 0x%x\n", result2);
	return result2;
}

int32_t mr90xx_ResetEngine(int32_t a1, int32_t a2) {
	dlog( LOG_DEBUG, "mr90xx_ResetEngine\n");
	int32_t v1 = 0; // bp-16
	int32_t v2 = sessionForId2(a1, &v1); // 0x1000387e
	int32_t result; // 0x100038bd
	if (v2 == 0) {
		result = mapVisaErrorToAPIError(
				(int16_t) ResetEngine(sessionForId(v1)));
	} else {
		result = v2;
	}
	dlog( LOG_DEBUG, "mr90xx_ResetEngine --> 0x%x\n", result);
	return result;
}

int32_t mr90xx_SetTimeoutWait(int32_t a1, int32_t a2, int32_t a3) {
	dlog( LOG_DEBUG, "mr90xx_SetTimeoutWait\n");
	g5 = a1;
	int32_t v1 = 0; // bp-16
	int32_t v2 = sessionForId2(a1, &v1); // 0x10004c2f
	int32_t result; // 0x10004c72
	if (v2 == 0) {
		result = mapVisaErrorToAPIError(
				(int16_t) SetTimeoutWait(sessionForId(v1)));
	} else {
		result = v2;
	}
	return result;
}

static int32_t function_100037d0(int32_t session_handle, int32_t a2, int32_t a3) {
	g5 = session_handle;
	int32_t v1 = 0; // bp-16
	int32_t v2 = sessionForId2(session_handle, &v1); // 0x100037de
	int32_t result; // 0x10003821
	if (v2 == 0) {
		result = mapVisaErrorToAPIError((int16_t) IdQuery(sessionForId(v1)));
	} else {
		result = v2;
	}
	return result;
}

// Address range: 0x10004960 - 0x1000498e
static void *AllocGlobal(void *a1) {
	// DD: GlobalAlloc(_In_ UINT uFlags, _In_ SIZE_T dwBytes)
	// See https://technet.microsoft.com/de-de/library/aa366574(v=vs.85).aspx
	// 0x2000 is 'no flag'
	// 736 = 0x2e0
	void *hMem = GlobalAlloc(0x2000, 40736); // 0x1000496e
	g_sa9054_data = (void *) hMem;
	return (void *) GlobalLock(hMem);
}

int32_t compareStrings(char * a1, char *a2) {
#ifdef ORIG
	int32_t v1 = g6; // 0x1000a4b3
	int32_t v2 = g8;// 0x1000a4b4
	int32_t v3 = g4;// 0x1000a4b5
	g8 = a2;
	int32_t v4 = (int32_t) a1;// 0x1000a4b9
	g6 = v4;
	if (g94 != 0) {
		int32_t v5 = g98; // 0x1000a503
		g98 = v5 + 1;
		int32_t v6;
		if (g97 >= 1) {
			g98 = v5;
			function_10007239(19);
			v6 = 1;
		} else {
			v6 = 0;
		}
		int32_t v7 = 0; // 0x1000a53b
		int32_t v8 = 0;// 0x1000a53414
		int32_t result2;// 0x1000a534
		while (true) {
			int32_t v9 = g8; // 0x1000a538
			unsigned char v10 = *(char *) v9;// 0x1000a538
			g8 = v9 + 1;
			int32_t v11 = g6;// 0x1000a53b
			unsigned char v12 = *(char *) v11;// 0x1000a53b
			g6 = v11 + 1;
			result2 = (int32_t) v10 | v8;
			int32_t v13 = (int32_t) v12 | v7 & -256;// 0x1000a53b30
			if (v10 != v12) {
				g4 = 0x1000000 * function_10006643(v12) / 0x1000000;
				int32_t v14 = function_10006643(v12); // 0x1000a54e
				int32_t v15 = g4;// 0x1000a556
				unsigned char v16 = (char) v15;// 0x1000a556
				unsigned char v17 = (char) v14;// 0x1000a556
				if (v16 != v17) {
					int32_t v18 = v16 < v17 ? 2 : 1; // 0x1000a55c
					int32_t result = (int32_t) (v16 < v17
							& (v14 != -1 | v14 < (int32_t) (v16 < v17))) + v18;// 0x1000a55c
					if (v6 != 0) {
						function_1000729a(19);
						g4 = v3;
						g8 = v2;
						g6 = v1;
						return result;
					}
					g98--;
					g4 = v3;
					g8 = v2;
					g6 = v1;
					return result;
				}
				result2 = v14;
				v13 = v15;
			}
			if ((char) result2 == 0) {
				break;
			}
			v7 = v13;
			v8 = result2 & -256;
		}
		if (v6 != 0) {
			function_1000729a(19);
		} else {
			g98--;
		}
		g4 = v3;
		g8 = v2;
		g6 = v1;
		return result2;
	}
	int32_t v19 = (int32_t) &g93 & -256; // 0x1000a4cc24
	while (true) {
		unsigned char v20 = *(char *) a2; // 0x1000a4d0
		int32_t v21 = v20;// 0x1000a4d0
		unsigned char v22 = *(char *) v4;// 0x1000a4d3
		int32_t v23 = 256 * (int32_t) v22 | v21 | v19 & -0x10000;// 0x1000a4d3
		uint32_t v24 = v23 / 256;// 0x1000a4d6
		unsigned char v25 = (char) v24;// 0x1000a4d6
		if (v25 != v20) {
			uint32_t v26 = 256 * v21 | v19 & -0x10000; // 0x1000a4e7
			g5 &= -256;
			unsigned char v27 = (char) (v26 / 256);// 0x1000a4f6
			if (v25 != v27) {
				int32_t v28 = v25 < v27 ? 2 : 1; // 0x1000a4fc
				int32_t v29 = (int32_t) (v25 < v27
						& (v25 != -1 | v25 < (char) (v25 < v27))) + v28 | v26;// 0x1000a4fc
				g4 = v3;
				g8 = v2;
				g6 = v1;
				return 0x1000000 * v29 / 0x1000000;
			}
			v23 = v24 & 255 | v26;
		}
		if ((char) v23 == 0) {
			g4 = v3;
			g8 = v2;
			g6 = v1;
			return 0x1000000 * v23 / 0x1000000;
		}
		v4++;
		a2++;
		v19 = v23 & -256;
	}
#else
	int b = strcmp(a1, a2);
	return b;
#endif
}

static int32_t freeMemory(SET9052 *a1) {
	dlog( LOG_DEBUG, "freeMemory\n");
	int32_t v1 = 0; // bp-8
	int32_t v2 = 0; // 0x1000499c
	int32_t hMem; // 0x10004a10
	int32_t v3; // 0x100049c4
	int32_t v4; // 0x100049e6
	int32_t hMem2; // 0x100049c7
	int32_t hMem3; // 0x100049d8
	int32_t * v5; // 0x100049e0
	while (true) {
		v3 = v2;
		// Iterate starting at g60... search for a1 pointer
		if (*(int32_t *) (4 * v2 + (int32_t) &session) != a1) {
			int32_t v6 = v2 + 1; // 0x1000499f
			v1 = v6;
			if (v6 >= PNP_MAXSESSIONS) {
				v3 = PNP_MAXSESSIONS;
				break;
			}
			v2 = v6;
			continue;
		}
		if (v3 >= PNP_MAXSESSIONS) {
			GlobalUnlock((int32_t *) g_sa9054_data);
			hMem = g_sa9054_data;
			g5 = hMem;
			int32_t result = (int32_t) GlobalFree((int32_t *) hMem); // 0x10004a17
			return result;
		}
		hMem2 = *(int32_t *) (4 * v3 + (int32_t) &session2);
		GlobalUnlock((int32_t *) hMem2);
		hMem3 = *(int32_t *) (4 * v1 + (int32_t) &session2);
		v5 = GlobalFree((int32_t *) hMem3);
		v4 = v1;
		g5 = v4;
		*(int32_t *) (4 * v4 + (int32_t) &session2) = 0;
		*(int32_t *) (4 * v1 + (int32_t) &session) = 0;
		return (int32_t) v5;
	}
	int32_t result2; // 0x10004a20
	if (v3 < PNP_MAXSESSIONS) {
		hMem2 = *(int32_t *) (4 * v3 + (int32_t) &session2);
		GlobalUnlock((int32_t *) hMem2);
		hMem3 = *(int32_t *) (4 * v1 + (int32_t) &session2);
		v5 = GlobalFree((int32_t *) hMem3);
		v4 = v1;
		g5 = v4;
		*(int32_t *) (4 * v4 + (int32_t) &session2) = 0;
		*(int32_t *) (4 * v1 + (int32_t) &session) = 0;
		result2 = (int32_t) v5;
	} else {
		GlobalUnlock((int32_t *) g_sa9054_data);
		hMem = g_sa9054_data;
		g5 = hMem;
		result2 = (int32_t) GlobalFree((int32_t *) hMem);
	}
	return result2;
}

static int32_t mapVisaErrorToAPIError(int16_t errorCode) {
	dlog( LOG_DEBUG, "mapVisaErrorToAPIError(0x%x)\n", errorCode);
	// looks like offset in an array???
// DD XXX
#ifdef NOT
	unsigned char v1 = *(char *) ((0x10000 * (int32_t) errorCode + 0x150000) / 0x10000
			+ 0x10004648); // 0x10004437
#endif
	unsigned char v1 = 0x0;

	if (errorCode == 0) {
		return 0;
	}
// DD XXX

	g7 = v1;
	int32_t result; // 0x100045a3
	switch (v1) {
	default: {
		result = MR90XX_ERROR_SESSIONINUSE | _VI_ERROR; // -0x4003f7f5; // 0xbffc.080c
		break;
	}
	case 0: {
		result = -0x4003f7d1; // 0xbffc.0830
		break;
	}
	case 1: {
		result = MR90XX_IE_ENG_BAD_PARM5 | _VI_ERROR; // -0x4003f7e1;
		break;
	}
	case 2: {
		result = MR90XX_IE_UNKNOWN | _VI_ERROR; // -0x4003f7f6;
		break;
	}
	case 3: {
		result = MR90XX_IE_ERR_ENGMOD | _VI_ERROR; //-0x4003f7f7;
		break;
	}
	case 4: {
		result = MR90XX_IE_ERR_NULLPTR | _VI_ERROR; //-0x4003f7f8;
		break;
	}
	case 5: {
		result = MR90XX_IE_ERR_DIFDTEC | _VI_ERROR; // -0x4003f7f9;
		break;
	}
	case 6: {
		result = MR90XX_IE_ERR_DWELL; // -0x4003f7fa;
		break;
	}
	case 7: {
		result = MR90XX_IE_ERR_STEP | _VI_ERROR; //-0x4003f7fb;
		break;
	}
	case 8: {
		result = MR90XX_IE_ERR_SPAN | _VI_ERROR; // -0x4003f7fc;
		break;
	}
	case 9: {
		result = MR90XX_IE_ERR_AUTO | _VI_ERROR; // -0x4003f7fd;
		break;
	}
	case 10: {
		result = MR90XX_IE_ERR_VALS | _VI_ERROR; // -0x4003f7fe;
		break;
	}
	case 11: {
		result = MR90XX_IE_ERROR | _VI_ERROR; // -0x4003f7ff;
		break;
	}
	case 12: {
		result = MR90XX_IE_SUCCESS | _VI_ERROR; // 0;
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

// returns an id in *returnId; looks like a kind of id mapping
static int32_t sessionForId2(int32_t sessionId, int32_t *returnId) {
	dlog( LOG_DEBUG, "sessionForId2\n");
#ifdef ORIG
	int32_t v1 = (int32_t) returnId;
	if (returnId == NULL) {
		return MR90XX_IE_WARN_SPAN; // -0x4003f7fe;
	}
	if (sessionId == 0) {
		return MR90XX_IE_ENG_BUSY; // -0x4003f7f1;
	}
	int32_t v2; // 0x100043e3
	int32_t v3;// 0x100043c4
	if (g63 != sessionId) {
		int32_t v4 = 0;
		// This looks like a loop.
		// iterator is v4/v6, incremented by 1, ending by PNP_MAXSESSIONS
		while (true) {
			g5 = v4;
			// v5 points into array of 32bit-sized values, base = g60
			// v5 = uint32_t session[v4]
			int32_t * v5 = (int32_t *) (4 * v4 + (int32_t) &session);// 0x10004374
			int32_t v6;
			if (*v5 != 0) {
				// v5 has some value != 0
				g7 = v4;
				if (*v5 != sessionId) {
					// v5 does not equal sessionId
					g5 = v4;
					int32_t v7 = *v5;// 0x10004394
					g7 = v7;
					// Here they are using v7=*v5 suddenly as a SET9052 pointer....
					if (RdSessionHandle(v7) != sessionId) {
						// Loop increment
						v6 = v4 + 1;
						g7 = (g7 | v4) & -0x10000 | v6;
						if (v6 >= PNP_MAXSESSIONS) {
							break;
						}
						v4 = v6;
						continue;
					}
				}
				v2 = v4;
			} else {
				v6 = v4 + 1;
				g7 = (g7 | v4) & -0x10000 | v6;
				if (v6 >= PNP_MAXSESSIONS) {
					break;
				}
				v4 = v6;
				continue;
			}
			if (v2 == -1) {
				return -0x4003f7ff;
			}
			v3 = *(int32_t *) (4 * v2 + (int32_t) &session);
			g7 = v3;
			g5 = sessionId;
			if (*(int32_t *) (v3 + 468) != sessionId) {
				return -0x4003f7f2;
			}
			g62 = v2;
			g63 = sessionId;
			g5 = v1;
			g7 = v2;
			*returnId = v2;
			return 0;
		}
		v2 = -1;
	} else {
		int32_t v8 = g62; // 0x10004348
		g5 = v8;
		v2 = v8;
	}
	if (v2 == -1) {
		return -0x4003f7ff;
	}
	v3 = *(int32_t *) (4 * v2 + (int32_t) &session);
	g7 = v3;
	g5 = sessionId;
	int32_t result; // 0x10004401
	if (*(int32_t *) (v3 + 468) == sessionId) {
		g62 = v2;
		g63 = sessionId;
		g5 = v1;
		g7 = v2;
		*returnId = v2;
		result = 0;
	} else {
		result = -0x4003f7f2;
	}
#else
	// mapping is 1:1
	int32_t result = 0;
	*returnId = sessionId;
#endif
	return result;
}

static SET9052 *sessionForId(int32_t sessionId) {
	// Array, base = g60. a1 = index. WORD size.
	// return g60[a1];
	// idea: why not just returning a1 ?
	// g60 has index "session_id" from VXI. It keeps pointers to SET9052 structs.
	//return *(int32_t *) (4 * a1 + (int32_t) &session);
	return session[sessionId];
}

// Schrott
static int32_t function_10006643(char a1) {
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
static int32_t function_10007239(int32_t a1) {
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


static int32_t function_1000729a(int32_t a1) {
	int32_t lpCriticalSection = *(int32_t *) (4 * a1 + (int32_t) &g40); // 0x100072a0
	LeaveCriticalSection((struct _RTL_CRITICAL_SECTION *) lpCriticalSection);
	int32_t * v1;
	return (int32_t) &v1;
}

static int32_t function_1000655f(char a1, int32_t a2) {
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
static int32_t function_10009277(int32_t a1, int32_t a2, char a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7, int32_t a8) {
	// 0x10009277
	abort();
	// UNREACHABLE
}

static int32_t function_100074d5(int32_t a1) {
	// 0x100074d5
	return 0;
}

static int32_t function_100073ec(int32_t a1) {
	// 0x100073ec
	abort();
	// UNREACHABLE
}

static int32_t function_1000912e(char * a1, int32_t a2, int32_t a3, int32_t a4,
		int32_t a5, int32_t a6, int32_t a7) {
	// 0x1000912e
	abort();
	// UNREACHABLE
}


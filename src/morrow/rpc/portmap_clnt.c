/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include <memory.h> /* for memset */
#include "portmap.h"

#include <rpc/pmap_prot.h>

/* Default timeout can be changed using clnt_control() */
static struct timeval TIMEOUT = { 25, 0 };

void *
pmap2_null_2(void *argp, CLIENT *clnt)
{
	static char clnt_res;

	memset((char *)&clnt_res, 0, sizeof(clnt_res));
	if (clnt_call (clnt, PMAP2_NULL,
		(xdrproc_t) xdr_void, (caddr_t) argp,
		(xdrproc_t) xdr_void, (caddr_t) &clnt_res,
		TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return ((void *)&clnt_res);
}

uint32_t *
pmap2_set_2(PMAP2SETargs *argp, CLIENT *clnt)
{
	static uint32_t clnt_res;

	memset((char *)&clnt_res, 0, sizeof(clnt_res));
	if (clnt_call (clnt, PMAP2_SET,
		(xdrproc_t) xdr_PMAP2SETargs, (caddr_t) argp,
		(xdrproc_t) xdr_uint32_t, (caddr_t) &clnt_res,
		TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&clnt_res);
}

uint32_t *
pmap2_unset_2(PMAP2UNSETargs *argp, CLIENT *clnt)
{
	static uint32_t clnt_res;

	memset((char *)&clnt_res, 0, sizeof(clnt_res));
	if (clnt_call (clnt, PMAP2_UNSET,
		(xdrproc_t) xdr_PMAP2UNSETargs, (caddr_t) argp,
		(xdrproc_t) xdr_uint32_t, (caddr_t) &clnt_res,
		TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&clnt_res);
}

uint32_t *
pmap2_getport_2(PMAP2GETPORTargs *argp, CLIENT *clnt)
{
	static uint32_t clnt_res;

	memset((char *)&clnt_res, 0, sizeof(clnt_res));
	if (clnt_call (clnt, PMAP2_GETPORT,
		(xdrproc_t) xdr_PMAP2GETPORTargs, (caddr_t) argp,
		(xdrproc_t) xdr_uint32_t, (caddr_t) &clnt_res,
		TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&clnt_res);
}

PMAP2DUMPres *
pmap2_dump_2(void *argp, CLIENT *clnt)
{
	static PMAP2DUMPres clnt_res;

	memset((char *)&clnt_res, 0, sizeof(clnt_res));
	if (clnt_call (clnt, PMAP2_DUMP,
		(xdrproc_t) xdr_void, (caddr_t) argp,
		(xdrproc_t) xdr_PMAP2DUMPres, (caddr_t) &clnt_res,
		TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&clnt_res);
}

PMAP2CALLITres *
pmap2_callit_2(PMAP2CALLITargs *argp, CLIENT *clnt)
{
	static PMAP2CALLITres clnt_res;

	memset((char *)&clnt_res, 0, sizeof(clnt_res));
	if (clnt_call (clnt, PMAP2_CALLIT,
		(xdrproc_t) xdr_PMAP2CALLITargs, (caddr_t) argp,
		(xdrproc_t) xdr_PMAP2CALLITres, (caddr_t) &clnt_res,
		TIMEOUT) != RPC_SUCCESS) {
		return (NULL);
	}
	return (&clnt_res);
}
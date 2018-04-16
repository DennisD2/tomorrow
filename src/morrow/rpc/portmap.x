
const PMAP_PORT = 111;      /* portmapper port number */

struct pmap2_mapping {
       unsigned int prog;
       unsigned int vers;
       unsigned int prot;
       unsigned int port;
};

struct pmap2_call_args {
       unsigned int prog;
       unsigned int vers;
       unsigned int proc;
       opaque args<>;
};

struct pmap2_call_result {
	unsigned int port;
	opaque res<>;
};

struct pmap2_mapping_list {
       pmap2_mapping map;
       pmap2_mapping_list *next;
};

struct pmap2_dump_result {
       struct pmap2_mapping_list *list;
};

typedef pmap2_mapping     PMAP2SETargs;
typedef pmap2_mapping     PMAP2UNSETargs;
typedef pmap2_mapping     PMAP2GETPORTargs;
typedef pmap2_call_args   PMAP2CALLITargs;
typedef pmap2_call_result PMAP2CALLITres;
typedef pmap2_dump_result PMAP2DUMPres;

program PMAP_PROGRAM {
	version PMAP_V2 {
        	void
		PMAP2_NULL(void)              = 0;

		uint32_t
		PMAP2_SET(PMAP2SETargs)       = 1;

		uint32_t
		PMAP2_UNSET(PMAP2UNSETargs)   = 2;

		uint32_t
		PMAP2_GETPORT(PMAP2GETPORTargs) = 3;

		PMAP2DUMPres
		PMAP2_DUMP(void)               = 4;

		PMAP2CALLITres
		PMAP2_CALLIT(PMAP2CALLITargs)  = 5;
	} = 2;
} = 100000;


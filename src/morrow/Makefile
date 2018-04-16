
# check if we have SICL library available
ifeq ($(OSTYPE),linux)
   HAVE_SICL_LIBS=no
endif
ifeq ($(OSTYPE),hpux)
   HAVE_SICL_LIBS=yes
endif

ifeq ($(HAVE_SICL_LIBS),yes)
   OFLAGS=-lsicl
   EXTRA_OBJS=
else
   OFLAGS=
   EXTRA_OBJS=wsfake.o
endif

CFLAGS=-I ./include -w -g
WCFLAGS=-I ./include -g

morrow : main.o sa.o pnp.o visa.o helper.o ws.o wsfake.o
	gcc -o morrow sa.o pnp.o visa.o main.o helper.o ws.o $(EXTRA_OBJS) $(OFLAGS)

main1: main1.o helper.o visa.o sa.o ws.o
	gcc -o main1 main1.o ws.o helper.o visa.o sa.o $(OFLAGS)

sa.o : sa.c
	gcc $(CFLAGS) -c sa.c

pnp.o : pnp.c
	gcc $(CFLAGS) -c pnp.c

visa.o : visa.c
	gcc $(CFLAGS) -c visa.c

main.o : main.c
	gcc $(CFLAGS) -c main.c

helper.o : helper.c
	gcc $(WCFLAGS) -c helper.c

ws.o : ws.c
	gcc $(WCFLAGS) $(WSFLAGS) -c ws.c

main1.o : main1.c
	gcc $(WCFLAGS) -c main1.c

wsfake.o : wsfake.c
	gcc $(WCFLAGS) -c wsfake.c

clean:
	rm *.o morrow

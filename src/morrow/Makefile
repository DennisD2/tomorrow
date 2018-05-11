
# check if we have SICL library available
ifeq ($(OSTYPE),linux)
   HAVE_SICL_LIBS=no
endif
ifneq ($(OSTYPE),linux)
   HAVE_SICL_LIBS=yes
endif

ifeq ($(HAVE_SICL_LIBS),yes)
   OFLAGS=-lsicl
   EXTRA_OBJS=vximorrow.o
else
   OFLAGS=
   EXTRA_OBJS=vximorrow_mock.o
endif

CFLAGS=-I ./include -w -g
WCFLAGS=-I ./include -g

morrow : main.o sa.o pnp.o visa.o helper.o $(EXTRA_OBJS)
	gcc -o morrow main.o sa.o pnp.o visa.o helper.o $(EXTRA_OBJS) $(OFLAGS)

main1: main1.o helper.o visa.o sa.o $(EXTRA_OBJS)
	gcc -o main1 main1.o sa.o visa.o helper.o $(EXTRA_OBJS) $(OFLAGS)

main2: main2.o helper.o pnp.o visa.o sa.o $(EXTRA_OBJS)
	gcc -o main2 main2.o pnp.o sa.o visa.o helper.o $(EXTRA_OBJS) $(OFLAGS)

sa.o : sa.c sa.h
	gcc $(CFLAGS) -c sa.c

pnp.o : pnp.c pnp.h
	gcc $(CFLAGS) -c pnp.c

visa.o : visa.c dvisa.h
	gcc $(CFLAGS) -c visa.c

main.o : main.c 
	gcc $(WCFLAGS) -c main.c

helper.o : helper.c
	gcc $(WCFLAGS) -c helper.c

vximorrow.o : vximorrow.c vximorrow.h
	gcc $(WCFLAGS) $(WSFLAGS) -c vximorrow.c

main1.o : main1.c
	gcc $(WCFLAGS) -c main1.c

main2.o : main2.c
	gcc $(WCFLAGS) -c main2.c

vximorrow_mock.o : vximorrow_mock.c vximorrow.h
	gcc $(WCFLAGS) -c vximorrow_mock.c

clean:
	rm *.o morrow

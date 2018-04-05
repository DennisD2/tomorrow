
CFLAGS=-I ../include -w -g
#OFLAGS=-lsicl
OFLAGS=

morrow : main.o sa.o pnp.o visa.o helper.o
	gcc -o morrow sa.o pnp.o visa.o main.o helper.o $(OFLAGS)

sa.o : sa.c
	gcc $(CFLAGS) -c sa.c

pnp.o : pnp.c
	gcc $(CFLAGS) -c pnp.c

visa.o : visa.c
	gcc $(CFLAGS) -c visa.c

main.o : main.c
	gcc $(CFLAGS) -c main.c

helper.o : helper.c
	gcc $(CFLAGS) -c helper.c

clean:
	rm *.o morrow

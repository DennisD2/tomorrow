
morrow : main.o sa.o pnp.o visa.o
	gcc -o morrow sa.o pnp.o visa.o main.o

CFLAGS=-I ../include -w -g

sa.o : sa.c
	gcc $(CFLAGS) -c sa.c

pnp.o : pnp.c
	gcc $(CFLAGS) -c pnp.c

visa.o : visa.c
	gcc $(CFLAGS) -c visa.c

main.o : main.c
	gcc $(CFLAGS) -c main.c

clean:
	rm *.o morrow

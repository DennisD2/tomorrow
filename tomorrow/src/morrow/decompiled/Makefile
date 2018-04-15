
CFLAGS=-I ../include -w -g
#OFLAGS=-lsicl
OFLAGS=

morrow : main.o sa.o pnp.o visa.o helper.o ws.o wsfake.o
	gcc -o morrow sa.o pnp.o visa.o main.o helper.o ws.o wsfake.o $(OFLAGS)

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
	gcc $(CFLAGS) -c helper.c

ws.o : ws.c
	gcc $(CFLAGS) $(WSFLAGS) -c ws.c

main1.o : main1.c
	gcc $(CFLAGS) -c main1.c

wsfake.o : wsfake.c
	gcc $(CFLAGS) -c wsfake.c

clean:
	rm *.o morrow

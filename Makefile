
all: calc test-mini test-mini2 caller

test-mini: test.c mini.c
	gcc test.c mini.c -Wall -o test-mini

test-mini2: test.c mini_mod.S
	gcc -Wall -c -o test.o test.c
	as -o mini_mod.o mini_mod.S
	gcc test.o mini_mod.o -o test-mini2

calc: mystery.o calc.o
	gcc mystery.o calc.o -o calc

mystery.o: mystery.S
	as -o mystery.o mystery.S

calc.o: calc.c
	gcc -Wall -c -o calc.o calc.c

caller: caller.c
	gcc -Wall caller.c -o caller

clean:
	rm -f *.o
	rm -f calc
	rm -f caller
	rm -f test-mini
	rm -f test-mini2
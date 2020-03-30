all: fib2.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o fib2.o fib2.asm 
	gcc -m64 -no-pie -o fib2.out fib2.o

clean:
	rm *.out
	rm *.o

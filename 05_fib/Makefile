all: fib.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o fib.o fib.asm 
	gcc -m64 -no-pie -o fib.out fib.o

clean:
	rm *.out
	rm *.o

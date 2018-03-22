all: fib_func.asm
	nasm -f elf64 -F dwarf -g -o fib_func.o fib_func.asm
	gcc -m64 -o fib_func fib_func.o

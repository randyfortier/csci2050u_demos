all: fibonacci.asm
	nasm -f elf64 -F dwarf -g -o fibonacci.o fibonacci.asm
	gcc -m64 -o fibonacci fibonacci.o

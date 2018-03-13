all: libc.asm
	nasm -f elf64 -F dwarf -g -o libc.o libc.asm
	gcc -m64 -o libc libc.o

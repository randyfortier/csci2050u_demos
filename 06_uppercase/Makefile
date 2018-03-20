all: uppercase.asm
	nasm -f elf64 -F dwarf -g -o uppercase.o uppercase.asm
	gcc -m64 -o uppercase uppercase.o

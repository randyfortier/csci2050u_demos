all: uppercase_fgets.asm
	nasm -f elf64 -F dwarf -g -o uppercase_fgets.o uppercase_fgets.asm
	gcc -m64 -o uppercase_fgets uppercase_fgets.o

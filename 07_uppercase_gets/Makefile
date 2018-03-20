all: uppercase_gets.asm
	nasm -f elf64 -F dwarf -g -o uppercase_gets.o uppercase_gets.asm
	gcc -m64 -o uppercase_gets uppercase_gets.o

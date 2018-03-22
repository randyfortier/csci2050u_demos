all: stack.asm
	nasm -f elf64 -F dwarf -g -o stack.o stack.asm
	gcc -m64 -o stack stack.o

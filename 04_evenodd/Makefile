all: evenodd.asm
	nasm -f elf64 -F dwarf -g -o evenodd.o evenodd.asm
	gcc -m64 -o evenodd evenodd.o

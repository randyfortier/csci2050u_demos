all: print_num.asm
	nasm -f elf64 -F dwarf -g -o print_num.o print_num.asm 
	gcc -m64 -no-pie -o print_num.out print_num.o

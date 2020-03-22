all: helloworld.asm
	nasm -f elf64 -F dwarf -g -o helloworld.o helloworld.asm 
	gcc -m64 -no-pie -o helloworld.out helloworld.o

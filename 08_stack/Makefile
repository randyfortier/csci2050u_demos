all: stack.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o stack.o stack.asm 
	gcc -m64 -no-pie -o stack.out stack.o

clean:
	rm *.out
	rm *.o

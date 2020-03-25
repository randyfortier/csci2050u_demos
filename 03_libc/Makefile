all: libc.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o libc.o libc.asm 
	gcc -m64 -no-pie -o libc.out libc.o

clean:
	rm *.out
	rm *.o
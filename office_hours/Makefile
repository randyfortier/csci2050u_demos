all: tryout.asm
	nasm -f elf64 -F dwarf -g -o tryout.o tryout.asm 
	gcc -m64 -no-pie -o tryout.out tryout.o

clean:
	rm *.out
	rm *.o
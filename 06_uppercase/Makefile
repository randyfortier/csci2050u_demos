all: uppercase.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o uppercase.o uppercase.asm 
	gcc -m64 -no-pie -o uppercase.out uppercase.o

clean:
	rm *.out
	rm *.o

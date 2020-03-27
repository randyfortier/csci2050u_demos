all: evenodd.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o evenodd.o evenodd.asm 
	gcc -m64 -no-pie -o evenodd.out evenodd.o

clean:
	rm *.out
	rm *.o
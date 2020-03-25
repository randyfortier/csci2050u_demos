all: helloworld.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o helloworld.o helloworld.asm 
	gcc -m64 -no-pie -o helloworld.out helloworld.o

clean:
	rm *.out
	rm *.o
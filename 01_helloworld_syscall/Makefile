all: helloworld_syscall.asm
	nasm -f elf64 -F dwarf -g -o helloworld.o helloworld_syscall.asm 
	gcc -m64 -no-pie -o helloworld.out helloworld.o

clean:
	rm *.out
	rm *.o

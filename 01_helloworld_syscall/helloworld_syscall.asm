; this example will be a simple hello world example, using Linux system calls
; more info about Linux system calls:  http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64

global main

section .data
    ; this is where your global variables go
    message db "Hello from Linux!", 0ah, 0dh  ; 19 bytes/characters


section .text 
    ; this is where your instructions go

main:
    ; output our message, using sys_write()
    mov rax, 1          ; sys_write()
    mov rdi, 1          ; standard output (cout)
    mov rsi, message    ; pointer to our message
    mov rdx, 19         ; how many bytes to write
    syscall             ; jump to the kernel to execute sys_write()

    ; exit from the program
    mov rax, 60         ; sys_exit()
    mov rdi, 0          ; return 0 (C++), exit(0) (C)
    syscall

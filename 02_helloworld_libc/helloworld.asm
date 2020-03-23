; this example is another hello world example, but this time using the C library (libc)

extern printf
extern exit

global main

section .text

main:
    ; printf("Hello from LibC!")   <- basically, this
    ; printf("%s", message)        <- more accurately, this
    ; arguments:  rdi, rsi, rax
    ; return value: rax
    mov rdi, format 
    mov rsi, message 
    mov rax, 0
    call printf
    sub rsp, 8

    ; exit(0)
    mov rax, 0
    call exit

section .data
    format db "%s", 0ah, 0dh, 0
    message db "Hello from LibC!", 0
    courseCode dq 2050

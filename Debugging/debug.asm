extern printf
extern exit

global main

section .text

main:
    mov rdi, format
    mov rsi, message
    mov rax, 0
    push rbx
    call printf
    pop rbx

    mov rax, 0
    call exit

section .data
    format     db "%s", 0ah, 0dh, 0
    message    db "Hello from LibC!", 0
    courseCode dq 2050
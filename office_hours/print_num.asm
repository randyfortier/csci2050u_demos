extern printf
extern exit

global main

section .text

main:
    mov rdx, 0

    ; printf("There are %d students.", numStudents);
    mov rdi, outputFormat
    mov rsi, [numStudents]
    mov rax, 0
    push rdx
    call printf
    pop rdx 

    ; exit(0)
    mov rax, 0
    call exit

section .data
    outputFormat db "There are %d students.", 0ah, 0dh, 0
    numStudents dq 131

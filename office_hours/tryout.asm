extern printf
extern exit

global main

section .text

main:

    mov r14, [num1]
    mov r15, [num2]

    ; let's test using JL (jump if less than)

    cmp r14, r15 
    jl lessThan

    mov rdi, notLessThanFormat
    jmp printResult1

lessThan:
    mov rdi, lessThanFormat

printResult1:
    mov rsi, r14
    mov rdx, r15
    mov rax, 0
    push rdx
    call printf
    pop rdx 

    ; now, let's test using JB (jump if below)

    cmp r14, r15 
    jb below

    mov rdi, notBelowFormat
    jmp printResult2

below:
    mov rdi, belowFormat

printResult2:
    mov rsi, r14
    mov rdx, r15
    mov rax, 0
    push rdx
    call printf
    pop rdx 

    ; exit(0)
    mov rax, 0
    call exit

section .data
    num1 dq 5
    num2 dq -5
    lessThanFormat db "%d is less than %d", 0ah, 0dh, 0
    notLessThanFormat db "%d is NOT less than %d", 0ah, 0dh, 0
    belowFormat db "%d is below %d", 0ah, 0dh, 0
    notBelowFormat db "%d is NOT below %d", 0ah, 0dh, 0
    

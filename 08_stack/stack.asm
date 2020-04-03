; stack.asm

extern printf
extern exit 

global main

section .text
add4:

    ; this is not System V ABI compliant, just for demonstration purposes

    mov rax, [rsp + 8]
    add rax, [rsp + 16]
    add rax, [rsp + 24]
    add rax, [rsp + 32]

    cmp rax, 50
    jl returnValue

    mov rax, 0

returnValue:
    ret 32

main:

    ; rax = add4(4, 3, 2, 1);
    mov rbx, 0
    push rbx  ; for stack alignment purposes only

    mov rax, 1
    push rax
    mov rax, 2
    push rax 
    mov rax, 3
    push rax 
    mov rax, 4
    push rax 

    call add4
    pop rbx

    ; printf(outputFormat, rax);
    mov rdi, outputFormat 
    mov rsi, rax
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; exit(0)
    mov rax, 0
    call exit

section .data

    outputFormat db "The sum is %d.", 0ah, 0dh, 0
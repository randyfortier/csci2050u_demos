; fib2.asm

extern printf 
extern scanf
extern exit 

global main

section .text

fib:
    ; calculate the nth Fibonacci number

    mov rdx, 0   ; rdx:  fib(n-2)/previous
    mov rcx, 1   ; rcx:  fib(n-1)/current
    mov rbx, 1   ; i = 1

fibLoop:

    ; do {
    ;   temp = current;
    ;   current += previous;
    ;   previous = temp;
    ;   i++;
    ; } while(i < n);

    mov rsi, rcx    ; temp = current;
    add rcx, rdx    ; current += previous;
    mov rdx, rsi    ; previous = temp;

    inc rbx         ; i++;

    cmp rbx, rdi    ; while (i < n);
    jl fibLoop

endLoop:

    mov rax, rcx    ; return rcx/current
    ret

main:

    ; printf(prompt);
    mov rdi, prompt 
    mov rax, 0
    mov rbx, 12345
    push rbx
    call printf 
    pop rbx

    ; scanf(inputFormat, &n);
    mov rdi, inputFormat
    mov rsi, n
    mov rax, 0
    push rbx
    call scanf
    pop rbx

    ; rax = fib(n);
    mov rdi, [n]
    push rbx
    call fib
    pop rbx

    ; printf(outputFormat, n, rax);
    mov rdi, outputFormat 
    mov rsi, [n]
    mov rdx, rax
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; exit(0)
    mov rax, 0
    call exit

section .data

    prompt db "Enter a value for n: ", 0
    inputFormat db "%ld", 0
    n dq 0
    outputFormat db "Fibonacci #%ld is %ld.", 0ah, 0dh, 0

extern printf
extern scanf
extern exit

global main

section .text

main:

    ; printf("Enter a number: ");
    mov rdi, prompt
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; scanf("%d", number);
    mov rdi, inputFormat 
    mov rsi, number
    mov rax, 0
    push rbx 
    call scanf
    pop rbx 

    ; calculate the number-th Fibonacci number (into rcx)
    mov rdx, 0      ; fib(0) = 0
    mov rcx, 1      ; fib(1) = 1
    mov rbx, 1      ; i = 1

fibLoop:
    ; add the previous two numbers to calculate the next Fibonacci number
    mov rsi, rcx    ; temp = fib1
    add rcx, rdx    ; fib1 = fib1 + fib0
    mov rdx, rsi    ; fib0 = temp (the old fib1)

    inc rbx         ; i++

    cmp rbx, [number]   ; if (i != number)
    jne fibLoop         ;   repeat

    ; printf("The %dth Fibonacci number is %d\n", number, result);
    mov rdi, outputFormat
    mov rsi, [number]
    mov rdx, rcx
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; exit(0)
    mov rax, 0
    call exit

section .data

    prompt db "Enter a number: ", 0
    inputFormat db "%d", 0

    number dq 0

    outputFormat db "The %dth Fibonacci number is %d", 0ah, 0dh, 0
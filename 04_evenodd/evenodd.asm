; evenodd.asm

; if age < 18:
;     print('You can not vote yet')
; else:
;     print('You can vote')

; while counter < 10:
;     print('Hello')
;     counter += 1
    
; char *ptr = ...;
; char c = *ptr;

extern printf
extern scanf
extern exit

global main

section .text

main:

    ; printf(prompt);   or  printf("%s", prompt);
    mov rdi, prompt 
    mov rax, 0
    push rax
    call printf
    pop rax

    ; scanf("%d", &number)
    mov rdi, inputFormat
    mov rsi, number
    mov rax, 0
    push rax
    call scanf
    pop rax

    ; divide the number by two
    ; number /= 2;
    mov rdx, 0 
    mov rax, [number]
    mov rcx, 2
    idiv rcx

    ; (number % 2) == 0
    cmp rdx, 0
    jne oddNumber

    ; print(evenMessage, number)
    mov rdi, evenMessage
    mov rsi, [number]
    mov rax, 0
    push rax
    call printf
    pop rax

    jmp endOfProgram

oddNumber:
    ; print(oddMessage, number)
    mov rdi, oddMessage
    mov rsi, [number]
    mov rax, 0
    push rax
    call printf
    pop rax

endOfProgram:
    ; exit(0)
    mov rax, 0
    call exit

section .data
    prompt db "Enter a number: ", 0
    inputFormat db "%d", 0
    
    number dq 0

    evenMessage db "%d is an even number.", 0ah, 0dh, 0
    oddMessage db "%d is an odd number.", 0ah, 0dh, 0
    
; libc.asm

; sample uses of printf:
; printf("Hello world!");
; printf("Your total is %d.", total);
; printf("%d + %d = %d.", a, b, sum);

; sample uses of scanf:
; scanf("%d", &age);
; scanf("%d,%d", &x, &y);

; calling functions using the System V ABI
;   rdi - first parameter
;   rsi - second parameter

extern printf 
extern scanf 
extern exit

global main

section .text

main:
    mov rdx, 0x0123456789ABCDEF

    ; printf("%s", prompt);
    mov rdi, outputFormat
    mov rsi, prompt 
    mov rax, 0
    push rdx
    call printf
    pop rdx

    ; scanf("%d", &num);
    mov rdi, inputFormat
    mov rsi, num 
    mov rax, 0
    push rdx
    call scanf
    pop rdx

    ; square the number
    mov rax, [num]       ; rax = *num
    mul rax              ; rax *= rax

    ; printf("The result is %d.", num * num);
    mov rdi, outputFormat2
    mov rsi, rax
    mov rax, 0
    push rdx
    call printf
    pop rdx

    ; exit(0)
    mov rax, 0
    call exit

    ; sub rax, rbx     rax = rax - rbx   (zero flag - if result is zero, sign flag - if result was negative)
    ; cmp rax, rbx     rax - rbx

section .data

    prompt        db "Enter a number: ", 0
    outputFormat  db "%s", 0
    inputFormat   db "%d", 0
    outputFormat2 db "The result is %d.", 0ah, 0dh, 0
    num           dq 0
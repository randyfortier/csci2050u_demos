; this example is another hello world example, but this time using the C library (libc)

extern printf
extern exit

global main

section .text

main:
    ; printf(message)              <- basically, this
    ; printf("%s", message)        <- more accurately, this
    ; arguments:  rdi, rsi
    ; return value: rax
    mov rdi, format             ; argument #1 ("%s")
    mov rsi, message            ; argument #2 ("Hello from LibC!")
    mov rax, 0                  ; how many floating point arguments are there to printf()?
    push rbx                    ; must be 16-byte aligned (more on this later)
    call printf                 ; adds return address (8-bytes, 64-bits) to the stack
    pop rbx                     ; remove the unnecessary value pushed to the stack before printf()

    ; exit(0)
    mov rax, 0
    call exit

section .data
    format     db "%s", 0ah, 0dh, 0
    message    db "Hello from LibC!", 0
    courseCode dq 2050

; uppercase.asm

extern printf
extern scanf
extern exit

global main

section .text

uppercase:

    ; to make debugging a bit cleaner
    mov rax, 0
    mov rbx, 0

    ; al <- 'a'
    ; ah <- 'z'
    ; bl <- 'A'
    mov al, [a]
    mov ah, [z]
    mov bl, [capA]

    ; rdi <- address of the user-entered string

nextChar:

    mov rdx, 0
    mov dl, [rdi]

    ; check for the null terminator
    cmp dl, 0
    je endOfString

    ; check if the character is before 'a' in the ASCII table
    cmp dl, al
    jb skipChar

    ; check if the character is after 'z' in the ASCII table
    cmp dl, ah
    ja skipChar

    ; the character is a lowercase letter
    ; convert the character to uppercase
    sub dl, al    ; the position within the lowercase alphabet
    add dl, bl    ; the uppercase equivalent ASCII value
    mov [rdi], dl

skipChar:
    ; don't process this character any more
    inc rdi       ; rdi++
    jmp nextChar

endOfString:

    ; go back to where we were
    ret     ; removes return address from stack, and jumps to that location

main:

    ; printf(prompt);
    mov rdi, prompt 
    mov rax, 0
    push rbx         ; rbx can contain anything - we aren't using this value    
    call printf
    pop rbx 

    ; scanf("%s", string);
    mov rdi, inputFormat
    mov rsi, string 
    mov rax, 0
    push rbx
    call scanf
    pop rbx

    ; convert to uppercase (jump to the uppercase code)
    mov rdi, string
    push rbx
    call uppercase      ; push the return address onto the stack, and jumps to uppercase    
    pop rbx

    ; printf("The resulting string is %s.\n", string);
    mov rdi, outputFormat 
    mov rsi, string
    mov rax, 0
    push rbx
    call printf
    pop rbx 

    ; exit(0)
    mov rax, 0
    call exit

section .data
    prompt db "Enter a message: ", 0
    inputFormat db "%s", 0
    outputFormat db "The resulting string is %s.", 0ah, 0dh, 0

    a db 'a'
    z db 'z'
    capA db 'A'

section .bss 
    string resb 100

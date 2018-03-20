extern printf
extern scanf
extern gets

global main

section .text

uppercase:
  ; this is a function that converts a string to uppercase
  ; al <- 'a'
  ; ah <- 'z'
  ; bl <- 'A'
  mov al, [a]
  mov ah, [z]
  mov bh, 0      ; just to clean up debugging
  mov bl, [capA]

nextChar:
  mov dh, 0      ; debugging only
  mov dl, [rdi]

  ; check for null terminator
  ;cmp byte [rdi], 0
  cmp dl, 0
  je endOfString

  ; check if it is before 'a' in the ascii table
  ;cmp [rdi], al
  cmp dl, al
  jb skipThisChar

  ; check if it is after 'z' in the ascii table
  ;cmp [rdi], ah
  cmp dl, ah
  ja skipThisChar

  ; the current character is a lowercase letter
  ;sub [rdi], al
  ;add [rdi], bl
  sub dl, al
  add dl, bl
  mov [rdi], dl

skipThisChar:
  ; move to the next character's position
  inc rdi
  jmp nextChar

endOfString:
  ; all done
  ; return
  ret

main:
  ; printf(prompt);
  mov rdi, prompt
  mov rax, 0
  call printf

  ; scanf("%s", string);
  ; mov rdi, inputFormat
  ; mov rsi, string
  ; mov rax, 0
  ; call scanf

  ; fgets(string, 100, stdin);
  mov rdi, string
  mov rax, 0
  call gets

  ; Convert the string to uppercase
  ; uppercase(string);
  mov rdi, string
  mov rax, 0
  call uppercase

  ; printf("The resulting string is %s.\n", string);
  mov rdi, outputFormat
  mov rsi, string
  mov rax, 0
  call printf

endOfProgram:
  ; exit(0)
  mov rax, 0
  ret

section .data
  prompt       db "Enter a message: ", 0
  inputFormat  db "%s", 0
  outputFormat db "The resulting string is %s.", 0ah, 0dh, 0
  a            db 'a'
  z            db 'z'
  capA         db 'A'

section .bss
  string:      resb 100

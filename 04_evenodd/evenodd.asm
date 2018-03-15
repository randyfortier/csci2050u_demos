extern printf
extern scanf

global main

section .text

main:
  ; printf(prompt);
  mov rdi, prompt
  mov rax, 0
  call printf

  ; scanf("%d", &number);
  mov rdi, inputFormat
  mov rsi, number
  mov rax, 0
  call scanf

  ; divide the number by 2
  mov rax, [number]
  mov rdx, 0            ; xor rdx, rdx
  mov rcx, 2
  idiv rcx

  ; (number % 2) == 0
  cmp rdx, 0
  jne oddNumber

  ; the number is even

  ; printf("%d is an even number.", number);
  mov rdi, evenMessage
  mov rsi, [number]
  mov rax, 0
  call printf

  jmp endOfProgram

oddNumber:
  ; the number is odd

  ; printf("%d is an odd number.", number);
  mov rdi, oddMessage
  mov rsi, [number]
  mov rax, 0
  call printf

endOfProgram:
  ; exit(0)
  mov rax, 0
  ret

section .data
  prompt       db "Enter a number: ", 0
  inputFormat  db "%d", 0
  number       dq 0
  oddMessage   db "%d is an odd number.", 0ah, 0dh, 0
  evenMessage  db "%d is an even number.", 0ah, 0dh, 0

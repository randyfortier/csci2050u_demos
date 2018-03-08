extern printf

global main

section .text

main:
  ; printf("%s", "Hello from LibC!")
  mov rdi, format
  mov rsi, message
  mov rax, 0
  call printf

  ; exit(0)
  mov rax, 0
  ret

section .data
  message db "Hello from LibC!", 0
  format db "%s", 0ah, 0dh, 0
  courseCode dq 2050

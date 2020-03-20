global main

section .data
  ; data goes here
  message db "Hello from Linux!", 0ah, 0dh
  ; 19 chars

section .text
  ; code goes here
main:
  ; printf("Hello from Linux!\n")
  mov rax, 1        ; 1 -> sys_write()
  mov rdi, 1        ; 1 -> stdout (cout)
  mov rsi, message  ; address of the string
  mov rdx, 19
  syscall

  ; exit(0)
  mov rax, 60       ; 60 -> sys_exit()
  mov rdi, 0
  syscall

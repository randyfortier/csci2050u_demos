extern printf

global main

section .text

add4:

  mov rax, [rsp + 8]
  add rax, [rsp + 16]
  add rax, [rsp + 24]
  add rax, [rsp + 32]

  ret 32

main:

  push qword 1
  push qword 2
  push qword 3
  push qword 4
  call add4

  ; printf("The sum is %d.\n", sum);
  mov rdi, outputFormat
  mov rsi, rax
  mov rax, 0
  call printf


endOfProgram:
  ; exit(0)
  mov rax, 0
  ret

section .data
  outputFormat db "The sum is %d.", 0ah, 0dh, 0

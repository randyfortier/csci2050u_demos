extern printf
extern scanf

; int num;
; scanf("%d", &num);
; printf("%d", num);

global main

section .text

main:
  ; printf("%s", prompt);
  mov rdi, outputFormat
  mov rsi, prompt
  mov rax, 0
  call printf

  ; scanf("%d", &num);
  mov rdi, inputFormat
  mov rsi, num
  mov rax, 0
  call scanf

  ; square the number
  mov rax, [num]
  mul rax

  ; printf("The result is %d.", num*num);
  mov rdi, outputFormat2
  mov rsi, rax
  mov rax, 0
  call printf


  ; exit(0)
  mov rax, 0
  ret

section .data
  prompt       db "Enter a number: ", 0
  outputFormat db "%s", 0
  inputFormat  db "%d", 0
  outputFormat2 db "The result is %d.", 0ah, 0dh, 0
  num          dq 0

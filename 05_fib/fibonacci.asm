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

  ; calculate the number-th fibonacci num
  mov rdx, 0       ; fib(0) = 0
  mov rcx, 1       ; fib(1) = 1
  mov rbx, 1       ; i = 1

fibLoop:
  mov rsi, rcx     ; temp = rcx
  add rcx, rdx     ; rcx += rdx
  mov rdx, rsi     ; rdx = temp

  inc rbx          ; rbx++  (add rbx, 1)
  ; Note:  My error was right here, number ---should-be---> [number]
  cmp rbx, [number]  ; while (i < number)
  jne fibLoop

  ; print the result
  ; printf("The %dth Fibonacci number is %d.\n", number, rcx)
  mov rdi, outputFormat
  mov rsi, [number]
  mov rdx, rcx
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
  outputFormat db "The %dth Fibonacci number is %d.", 0ah, 0dh, 0

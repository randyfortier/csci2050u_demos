extern printf
extern scanf

global main

section .text

fib:
  mov rdx, 0    ; fib(i-1)
  mov rcx, 1    ; fib(i)
  mov rbx, 1    ; i = 1

fibLoop:        ; do {
  mov rsi, rcx  ;   temp = current;
  add rcx, rdx  ;   current += previous;
  mov rdx, rsi  ;   previous = temp;

  inc rbx       ;   i++;
  cmp rbx, rdi
  jne fibLoop   ; } while (i != n);

  mov rax, rcx  ; return current
  ret

main:
  ; printf(prompt);
  mov rdi, prompt
  mov rax, 0
  call printf

  ; scanf("%d", n);
  mov rdi, inputFormat
  mov rsi, n
  mov rax, 0
  call scanf

  ; calculate the Fibonacci number
  mov rdi, [n]
  call fib

  ; printf("Fibonacci #%d is %d.\n", n, rax);
  mov rdi, outputFormat
  mov rsi, [n]
  mov rdx, rax
  mov rax, 0
  call printf

endOfProgram:
  ; exit(0)
  mov rax, 0
  ret

section .data
  prompt       db "Enter a value for n: ", 0
  inputFormat  db "%d", 0
  n            dq 0
  outputFormat db "Fibonacci #%d is %d.", 0ah, 0dh, 0

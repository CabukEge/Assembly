SECTION .data
						
message: db `Hello world!\n`
messageLen: equ $ - message


SECTION .text
global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, messageLen
	syscall
	
	mov rax, 60
	mov rdi, 0
	syscall

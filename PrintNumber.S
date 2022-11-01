SECTION .bss
   spaceNum resb 100 ;reserve 100 bytes
   posSpaceNum resb 8; reserve 8 bytes


SECTION .text
global _start

_exit:
    mov rax, 60
    mov rdi, 0
    syscall

_start:

   mov rax, 1337    ;number we want to print
   call _printNumber

   call _exit

_printNumber:
    mov rcx, spaceNum
    mov rbx, 10
    mov [spaceNum], rbx
    inc rcx
    mov [posSpaceNum], rcx

_printRAX:
    mov rdx, 0
    mov rbx, 10
    div rbx
    push rax
    add rdx, 48

    mov rcx, [posSpaceNum]
    mov [rcx], dl
    inc rcx
    mov [posSpaceNum] , rcx

    pop rax
    cmp rax, 0
    jne _printRAX

_printRaxbackwards:
    mov rcx, [posSpaceNum]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
    mov rcx, [posSpaceNum]
    dec rcx
    mov[posSpaceNum], rcx
    cmp rcx, spaceNum
    jge _printRaxbackwards
    call _exit

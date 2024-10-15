section .data

message: db "Hello, World!", 10
length: equ $ - message

section .text

global _start

_start:
    mov rcx, 3

.loop:
    dec rcx
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    push rcx
    syscall
    pop rcx
    test rcx, rcx
    jnz .loop
    mov rax, 60
    xor rdi, rdi
    syscall

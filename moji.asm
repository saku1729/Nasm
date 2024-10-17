section .data
    strings: db "Hello, World!"
    newline: db 10
    number: equ $ - strings
section .text
global _start
print_strings:
    mov rax, 1
    mov rdi, 1
    lea rsi, [strings+rcx]
    mov rdx, 1
    push rcx
    syscall
    pop rcx
    ret
print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    push rcx
    syscall
    pop rcx
    ret
exit:
    mov rax, 60
    xor rdi, rdi
    syscall
_start:
    mov rcx, 0
.loop:
    call print_strings
    call print_newline
    inc rcx
    cmp rcx, number-1
    jl .loop
    call exit


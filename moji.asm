section .data
    strings: db "Hello, World!"
    newline: db 10
    number: equ $ - strings
section .text
global _start
print_strings_inc:
    mov rax, 1
    mov rdi, 1
    lea rsi, [strings]
    mov rdx, rcx
    push rcx
    syscall
    pop rcx
    inc rcx
    ret
print_strings_dec:
    mov rax, 1
    mov rdi, 1
    lea rsi, [strings]
    mov rdx, rcx
    push rcx
    syscall
    pop rcx
    dec rcx
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
    mov rcx, 1
.loop1:
    call print_strings_inc
    call print_newline
    cmp rcx, number-1
    jne .loop1
.loop2:
    call print_strings_dec
    call print_newline
    cmp rcx, 0
    jne .loop2
    call exit


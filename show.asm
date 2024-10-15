section .data
    numbers: db "0123456789"
    newline: db 10
    length: equ $ - numbers
section .text
global _start

print_number:
    mov rax, 1
    mov rdi, 1
    lea rsi, [numbers + rcx]
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
    call print_number
    call print_newline
    inc rcx
    cmp rcx, 9
    jle .loop
    call exit

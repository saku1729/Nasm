section .data
    numbers: db "0123456789"
    newline: db 10
section .text
global _start
check_three:
    mov rax, rcx
    mov rdx, 0
    mov rbx, 3
    div rbx
    cmp rdx, 0
    ret
check_five:
    mov rax, rcx
    mov rdx, 0
    mov rbx, 5
    div rbx
    cmp rdx, 0
    ret
print_number:
    mov rax, rcx
    mov rdx, 0
    mov rbx, 10
    div rbx
    cmp rax, 3
    je .fn
    cmp rdx, 3
    je .fn
    call print_rax_number
    .fn:
    ret
print_rax_number:
    cmp rax, 0
    je .zero
    lea rsi, [numbers + rax]
    mov rax, 1
    mov rdi, 1
    push rdx
    mov rdx, 1
    push rcx
    syscall
    pop rcx
    pop rdx
    .zero:
    lea rsi, [numbers + rdx]
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    push rcx
    syscall
    pop rcx
    call print_newline
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
.loop:
    call check_three
    je .final
    call check_five
    je .final
    call print_number
    .final:
    inc rcx
    cmp rcx, 99
    jle .loop
    call exit

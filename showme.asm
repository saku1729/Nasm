section .data
    numbers: db "0123456789"
    newline: db 10
section .text
global _start

check_three:
    mov rax, rcx
    cmp rax, 3
    jl .not_three
    xor rdx, rdx
    mov rbx, 3
    div rbx
    ret
.not_three:
    xor rax, rax
    ret

check_five:
    mov rax, rcx
    cmp rax, 5
    jl .not_five
    xor rdx, rdx
    mov rbx, 5
    div rbx
    ret
.not_five:
    xor rax, rax
    ret

print_number:
    mov rax, rcx
    mov rdx, 0
    mov rbx, 10
    push rcx
    xor rdx, rdx
.loop_div:
    xor rdx, rdx
    div rbx
    push rdx
    test rax, rax
    jnz .loop_div
.next_digit:
    pop rdx
    lea rsi, [numbers + rdx]
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    test rsp, rsp
    jnz .next_digit
    ret

print_newline:
    mov rax, 1
    mov rdi, 1
    lea rsi, [newline]
    mov rdx, 1
    syscall
    ret

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

_start:
    mov rcx, 1
.loop:
    call check_three
    cmp rax, 0
    je .final
    call check_five
    cmp rax, 0
    je .final
    call print_number
    call print_newline
.final:
    inc rcx
    cmp rcx, 99
    jle .loop
    call exit

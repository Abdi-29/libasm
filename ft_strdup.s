section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    push rdx
    mov rsi, rdi ;make a copy

    call ft_strlen
    inc rax
    push rsi
    mov rdi, rax
    call malloc wrt ..plt ;protect malloc
    mov rdi, rax
    pop rsi
    cmp rax, 0
    je end
    call ft_strcpy

    pop rdx
    ret

end:
    pop rdx
    ret
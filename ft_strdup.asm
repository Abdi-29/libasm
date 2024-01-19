section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy

ft_strdup:
    push rax
    xor rax, rax

    call ft_strlen
    inc rax
    call malloc wrt ..plt
    call ft_strcpy

    pop rax
    ret
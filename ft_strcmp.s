section .text
    global ft_strcmp

ft_strcmp:
    push rdx
    xor rdx, rdx

    loop:
        mov cl, BYTE [rsi + rdx]
        cmp cl, BYTE [rdi + rdx]
        jne end

        cmp cl, 0x0
        je end
        inc rdx
        jmp loop

    end:
        movzx rax, BYTE [rdi + rdx]
        movzx rdx, cl
        sub rax, rdx
        pop rdx
        ret
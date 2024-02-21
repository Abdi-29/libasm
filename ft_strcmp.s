section .text
    global ft_strcmp

ft_strcmp:
    push rdx
    xor rdx, rdx

    loop:
        mov bl, BYTE [rsi + rdx]
        cmp bl, BYTE [rdi + rdx]
        jne end

        cmp bl, 0x0
        je end
        inc rdx
        jmp loop

    end:
        movzx rax, BYTE [rdi + rdx]
        movzx rdx, bl
        sub rax, rdx
        pop rdx
        ret
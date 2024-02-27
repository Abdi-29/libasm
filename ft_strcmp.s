section .text
    global ft_strcmp

ft_strcmp:
    push rdx
    xor rdx, rdx

    loop:
        mov ah, BYTE [rsi + rdx]
        cmp ah, BYTE [rdi + rdx]
        jne end

        cmp ah, 0x0
        je end
        inc rdx
        jmp loop

    end:
        movzx rax, BYTE [rdi + rdx]
        movzx rdx, ah
        sub rax, rdx
        pop rdx
        ret
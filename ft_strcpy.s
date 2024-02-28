section .text
    global ft_strcpy

ft_strcpy:
    push rdx
    xor rdx, rdx

    loop:
        mov cl, BYTE [rsi + rdx]
        mov BYTE [rdi + rdx], cl
        cmp cl, 0
        je end

        inc rdx
        jmp loop

    end:
        pop rdx
        ret
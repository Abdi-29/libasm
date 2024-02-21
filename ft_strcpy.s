section .text
    global ft_strcpy

ft_strcpy:
    push rdx
    xor rdx, rdx
    mov rax, rdi

    loop:
        mov bl, BYTE [rsi + rdx]
        mov BYTE [rdi + rdx], bl
        cmp bl, 0x0
        je end

        inc rdx
        jmp loop

    end:
        pop rdx
        ret
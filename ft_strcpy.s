section .text
    global ft_strcpy

ft_strcpy:
    push rdx
    xor rdx, rdx
    mov rax, rdi

    loop:
        mov ah, BYTE [rsi + rdx]
        mov BYTE [rdi + rdx], ah
        cmp ah, 0x0
        je end

        inc rdx
        jmp loop

    end:
        pop rdx
        ret
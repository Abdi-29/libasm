section .text
    global ft_strlen

ft_strlen:
    xor rax, rax     ;i = 0

    loop:
        mov dl, BYTE [rdi+rax]
        cmp dl, 0
        je end

        inc rax
        jmp loop

    end:
        ret



;   A B | A XOR B
;   0 0 | 0
;   1 0 | 1
;   0 1 | 1
;   1 1 | 0

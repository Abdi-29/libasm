section .text
    global ft_strlen

ft_strlen:
    push rdi         ;preserve the value of rbx
    mov rdi, rbx     ;setup the stack frame
    xor rax, rax     ;i = 0

    loop:
        xor rdx, rdx
        mov dl, BYTE [rdi+rax]
        cmp dl, 0x0
        je end

        inc rax
        jmp loop

    end:
        pop rdi ;restore original rbx

        ret



;   A B | A XOR B
;   0 0 | 0
;   1 0 | 1
;   0 1 | 1
;   1 1 | 0

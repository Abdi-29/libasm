section .text
    [global ft_strlen:]

ft_strlen:
    push rdi         ;preserve the value of rbx
    mov rdi, esp     ;setup the stack frame
    xor rax, rax     ;i = 0

    loop:
        xor rdx, rdx
        mov rdx, BYTE[rbx+rax]
        cmp rdx, 0x0
        je end

        inc rax
        jmp loop

    end:
        pop rbx ;restore original rbx

        ret



;   A B | A XOR B
;   0 0 | 0
;   1 0 | 1
;   0 1 | 1
;   1 1 | 0

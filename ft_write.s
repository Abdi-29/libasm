section .text
    global ft_write
    extern __errno_location

ft_write:
	mov rax, 1

	syscall
	cmp rax, 0
	jl error
	ret

error:
	push r12
	neg rax
	mov r12, rax
	call __errno_location wrt ..plt
	mov [rax], r12
	pop r12
	mov rax, -1
	ret

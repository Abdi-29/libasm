section .text
    global ft_read
    extern __errno_location

ft_read:
	mov rax, 0

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


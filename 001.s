	.file	"001.c"
	.intel_syntax noprefix
	.text
	.globl	j
	.section	.rodata
.LC0:
	.string	"Hello World"
	.section	.data.rel.local,"aw"
	.align 8
	.type	j, @object
	.size	j, 8
j:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"%d\n"
	.align 8
.LC2:
	.string	"The value of n now gives the byte : %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

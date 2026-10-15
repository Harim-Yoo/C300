	.file	"012.c"
	.intel_syntax noprefix
	.text
	.globl	j
	.section	.rodata
.LC0:
	.string	"HELLO"
	.section	.data.rel.local,"aw"
	.align 8
	.type	j, @object
	.size	j, 8 # size j is in 8 bytes. 
j:
	.quad	.LC0 # Get me 4 word -> 8 bytes. Put the address for .LC0.
	.section	.rodata
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	mov	rax, QWORD PTR j[rip]
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

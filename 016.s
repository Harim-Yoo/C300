	.file	"016.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Your score:"
.LC1:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -4[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 89
	jle	.L2
	mov	edi, 65
	call	putchar@PLT
	jmp	.L5
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 79
	jle	.L4
	mov	edi, 66
	call	putchar@PLT
	jmp	.L5
.L4:
	mov	edi, 67
	call	putchar@PLT
.L5:
	nop
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

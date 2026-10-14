	.file	"004.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"x is greater than y."
.LC1:
	.string	"x is not greater than y."
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -8[rbp], 10
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, 5
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jle	.L2
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L3
.L2:
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
.L3:
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"002.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"The value z turns out be %d.\n"
.LC1:
	.string	"The size of char is %ld\n"
.LC2:
	.string	"The size of short is %ld\n"
.LC3:
	.string	"The size of int is %ld\n"
.LC4:
	.string	"The size of long is %ld\n"
	.align 8
.LC5:
	.string	"The size of long long is %ld.\n"
.LC6:
	.string	"The size of float is %ld\n"
.LC7:
	.string	"The size of double is %ld.\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -12[rbp], 1
	mov	DWORD PTR -8[rbp], 2
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	eax, edx
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	BYTE PTR -13[rbp], 97
	mov	esi, 1
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	esi, 2
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	esi, 4
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	esi, 8
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	esi, 8
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	esi, 4
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	esi, 8
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

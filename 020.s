	.file	"020.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%p\n"
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	lea	rax, -12[rbp] // Score s, and load the address of it.
	mov	QWORD PTR -24[rbp], rax // *score = &s because it is also 8-byte long. Why moving 24 down? because it jumped 4 bytes down.
	lea	rax, -12[rbp] // get the address of s 
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp] // go below 24-bytes from rbp, get the value in rax.
	mov	rsi, rax 
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT

	// member access via score offset 0, 4, 8.
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], 90
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 4[rax], 91
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 8[rax], 100
	lea	rax, -24[rbp] // go below 24 bytes from rbp and get that address. Why 12 byte below &s??
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
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

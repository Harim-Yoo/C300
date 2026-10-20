	.file	"019.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%llx \n"
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
	
	// set score
	mov	DWORD PTR -12[rbp], 90
	mov	DWORD PTR -8[rbp], 91
	mov	DWORD PTR -4[rbp], 100

	mov	rax, QWORD PTR -12[rbp] // go down 12 bytes below rbp, get 8-byte long data and put the value into rax. 
	mov	QWORD PTR -24[rbp], rax // this is basically memcpy. (lines 23-24 is the full memcpy process.)
	mov	rax, QWORD PTR -24[rbp] // get the raw value
	mov	rsi, rax 
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -8[rbp]
	add	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
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

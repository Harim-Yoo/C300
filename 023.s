	.file	"023.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Turn it into ASCII"
.LC1:
	.string	"Character %c\n ASCII %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 0
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
.L2:
	call	getchar@PLT // store that value in eax
	mov	DWORD PTR -4[rbp], eax // put eax in 4-byte value
	mov	edx, DWORD PTR -4[rbp] // do the third params.
	mov	eax, DWORD PTR -4[rbp] // now do the second params.
	mov	esi, eax // put eax in the second params.
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	cmp	DWORD PTR -4[rbp], 10 // compare ch with ENTER
	jne	.L2 // not equal, then go back to L2. Interesting. Do while statement must walk through do statement.
	nop // why nop twice?
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

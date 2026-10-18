	.file	"015.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Print the number:"
.LC1:
	.string	"%d"
.LC2:
	.string	"It is even."
.LC3:
	.string	"It is odd"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16

	// Printf
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT

	//load the address for the first four bytes, which means the first four bytes are int number initialized. Compiler is smart...

	lea	rax, -4[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT //Interesting, this is how os.scanf works. 

	mov	eax, DWORD PTR -4[rbp] // Get the number 
	and	eax, 1 // Do AND operator with eax with 1. Other digits with 0 will appear 0, so we only get the result for the unit's digit.
	test	eax, eax // test means compute AND eax, eax, so we just get eax. 
	jne	.L2
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L4
.L2:
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L4:
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

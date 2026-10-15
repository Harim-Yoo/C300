	.file	"010.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	"10>5 is true"
.LC2:
	.string	"10>5 is false"
.LC3:
	.string	"10>20 is true"
.LC4:
	.string	"10>20 is false"
.LC5:
	.string	"-1 is true"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16 # 4 + 4 = 8, but we should use 16 bytes because that happens in a multiple of 16. 

	mov	eax, DWORD PTR -8[rbp] # put garbage value into b.
	mov	esi, eax # put it inside printf second params.
	lea	rax, .LC0[rip] # Load the effective address of "%d\n" into rax
	mov	rdi, rax # put it inside printf first params.
	mov	eax, 0 # float-argument none. 
	call	printf@PLT

	/* printf("%d\n",j) */
	mov	eax, DWORD PTR -4[rbp] # Get the garbage value of j.
	mov	esi, eax # repeat the same process.
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	
	/* get the integer values into b or j. Interesting thing is that 10 > 5 is automatically computed as true by GCC and puts the value as 1. Interesting... */

	mov	DWORD PTR -8[rbp], 1
	mov	DWORD PTR -4[rbp], 0
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT

	cmp	DWORD PTR -8[rbp], 0 # Very interesting that we compare 1 with 0. 
	je	.L2 # Jump if Equal
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L3 # Interesting. We go to L3 to deal with j == 0.
.L2:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L3:
	cmp	DWORD PTR -4[rbp], 0
	je	.L4
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L5
.L4:
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L5:
	lea	rax, .LC5[rip] # Interesting. It goes to true directly. Compiler does not even bother setting up the if-else statements.
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

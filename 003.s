	.file	"003.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"The size of PI is %d.\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 8 # int size = sizeof(PI);
	mov	eax, DWORD PTR -4[rbp] # put size into eax.
	mov	esi, eax # second params in printf.
	lea	rax, .LC0[rip] # get the address of "The size of PI is..."
	mov	rdi, rax # first params in printf
	mov	eax, 0 # no floating-arguments.
	call	printf@PLT # call function
	mov	eax, 0 # make eax = 0
	leave	
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

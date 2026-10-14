	.file	"008.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d\n" # Very interesting take away is that the address for this string kept getting overused.
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	BYTE PTR -3[rbp], -56
	mov	BYTE PTR -2[rbp], -56 # Interesting take away. j is unsigned but it has been written as -56. 
	mov	BYTE PTR -1[rbp], 97 # ASCII value for 'a' is 97.
	movsx	eax, BYTE PTR -3[rbp] # Move with Sign-Extend
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movzx	eax, BYTE PTR -2[rbp] # Move with Zero-Extend
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsx	eax, BYTE PTR -1[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

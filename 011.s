	.file	"011.c"
	.intel_syntax noprefix
	.text
	.globl	j
	.section	.rodata
.LC0:
	.string	"HELLO" # 5 bytes
	.section	.data.rel.local,"aw"
	.align 8
	.type	j, @object
	.size	j, 8
j:
	.quad	.LC0
	.section	.rodata
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	mov	esi, 100 # Compiler knows exactly what value to put inside the second params. Probably performant. 
	
	lea	rax, .LC1[rip] # load effective address of &(.LC1[rip]) into rax. 
	mov	rdi, rax # rdi = rax; the first param is the address val of "%d\n"
	mov	eax, 0 # no floating value. 
	call	printf@PLT

	mov	rax, QWORD PTR j[rip] # Go to addess at j, store that address to rax. 
	mov	rdi, rax # put rax to first params already?
	call	puts@PLT #Now, we skip printf??? We just put string directly? Compiler thing??
	
	mov	rax, QWORD PTR j[rip] # Get the address, store the address. 
	movzx	eax, BYTE PTR [rax] # Go to that address and get the first value!!!! THIS IS H!!!!!! Move with zero extend. Since H is 1 byte char, we put it in 4-byte eax and fill the upper bits with 0. This is what we call as Move with Zero Extend. 

	movsx	eax, al # The value stored in al(rax->eax->ax->al), which is 'H', will be safely converted to int (4-bytes) by Sign Extend. If this is positive int, then put everything 0 in upper bits. Otherwise, put 1 in the upper bits. 
	mov	esi, eax # Put that in second params.
	lea	rax, .LC1[rip] # Load Effective Address of LC1 HELLO address.
	mov	rdi, rax # Store that thing in rdi
	mov	eax, 0 # No float-argument
	call	printf@PLT # Call printf.
	nop # No operation because this is void.
	pop	rbp # We pop rbp, because we did not move rsp down. Interesting....
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

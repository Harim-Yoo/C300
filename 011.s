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

	mov	rax, QWORD PTR j[rip] # 8 byte pointer 
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR j[rip]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

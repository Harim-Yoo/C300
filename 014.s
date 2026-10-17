	.file	"014.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Ptr address:%p\n Dereferenced value:%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -12[rbp], 0 // int i  = 0;
	lea	rax, -12[rbp] // rax = &i;
	mov	QWORD PTR -8[rbp], rax // ptr = rax;
	mov	edx, DWORD PTR -12[rbp] // get the i value in edx
	mov	rax, QWORD PTR -8[rbp] // get the pointer address in rax
	mov	DWORD PTR [rax], edx // Go to the address pointed at rax and put edx as the value.
	mov	rax, QWORD PTR -8[rbp] // rax = &i
	mov	edx, DWORD PTR [rax] // edx = *(&i) --> *ptr
	mov	rax, QWORD PTR -8[rbp] // rax = &i
	mov	rsi, rax // second params = rax;
	lea	rax, .LC0[rip] // get ready for the first params
	mov	rdi, rax // handle the first params
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

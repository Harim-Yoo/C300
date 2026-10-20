	.file	"018.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"abcde"
.LC1:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	length // As it popped at .L3, eax contains the count.
	mov	DWORD PTR -4[rbp], eax // store eax at 4 bytes below at main func.
	mov	eax, DWORD PTR -4[rbp] // Get the actual value at put it in eax.
	mov	esi, eax // This handles len at printf
	lea	rax, .LC1[rip] // Get the address
	mov	rdi, rax // Do the first params.
	mov	eax, 0 // No float argument. 
	call	printf@PLT // Call printf
	nop
	leave
	ret
	.size	main, .-main
	.globl	length
	.type	length, @function
length:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi // copy str into 24 rbp;
	mov	DWORD PTR -4[rbp], 0 // int count = 0;
	jmp	.L3 // begin while statement
.L4:
	add	QWORD PTR -24[rbp], 1 // add 1 to the address.
	add	DWORD PTR -4[rbp], 1 // add 1 to the count.
.L3:
	mov	rax, QWORD PTR -24[rbp] // get the current string address and put in rax.
	movzx	eax, BYTE PTR [rax] // get the value at the current stringa ddress and put it in eax
	test	al, al // set ZF = 1 if al == 0 (end of string flag)
	jne	.L4 // if not 0, go to L4.
	mov	eax, DWORD PTR -4[rbp] // get the count value at eax.
	pop	rbp // pop rbp.
	ret
	.size	length, .-length
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

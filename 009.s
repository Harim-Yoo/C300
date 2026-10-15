	.file	"009.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC3:
	.string	"%f\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	movss	xmm0, DWORD PTR .LC0[rip]
	movss	DWORD PTR -20[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR -8[rbp], xmm0
	pxor	xmm1, xmm1 # do bit operation on xmm1 register.
	cvtss2sd	xmm1, DWORD PTR -20[rbp] # convert 3.141592 in float into double. Didn't ask for it but it did.
	movq	rax, xmm1 # xmm register to register(rax, eax).
	movq	xmm0, rax # register to xmm register. This is in fact, prepping for printf(... , d);
	lea	rax, .LC3[rip] # Go down to .LC3 to get the address of the string "%f\n" and Load Effective Address into rax. 
	mov	rdi, rax
	mov	eax, 1 # There is float-argument.
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	movq	xmm0, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -8[rbp]
	movq	xmm0, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	nop # no operation. Interesting that void main() {} results in this feature. 
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1078530008
	.align 8
.LC1:
	.long	-1073741824
	.long	1097305129
	.align 8
.LC2:
	.long	0
	.long	1079558144
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

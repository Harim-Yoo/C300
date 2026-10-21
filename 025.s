	.file	"025.c"
	.intel_syntax noprefix
	.text
	.globl	total_elevation_change
	.type	total_elevation_change, @function
total_elevation_change:
	endbr64
	push	rbp
	mov	rbp, rsp // no RSP moving. Interesting. We are still locked in the first 32 bytes in the stack. 
	mov	QWORD PTR -24[rbp], rdi // store the address of a[]
	mov	DWORD PTR -28[rbp], esi // store 3 inside 28 bytes below rbp. Notice that count is an int type.
	cmp	DWORD PTR -28[rbp], 0 // compare 3 with 0.
	jne	.L2 // if not equal, go to L2.
	mov	eax, 0 // if equal, return 0;
	jmp	.L3 // go to .L3
.L2:
	mov	DWORD PTR -4[rbp], 0 // current = 0;
	mov	DWORD PTR -8[rbp], 0 // result = 0;
	jmp	.L4 
.L5:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	add	DWORD PTR -8[rbp], eax
	add	QWORD PTR -24[rbp], 4
	add	DWORD PTR -4[rbp], 1
.L4:
	mov	eax, DWORD PTR -4[rbp] 
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	mov	eax, DWORD PTR -8[rbp]
.L3:
	pop	rbp // pop rbp
	ret // go back to the main func. 
	.size	total_elevation_change, .-total_elevation_change
	.section	.rodata
.LC0:
	.string	"Failed"
.LC1:
	.string	"Failed again"
.LC2:
	.string	"All passed"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -4[rbp], 0 // int failed = 0;
	mov	DWORD PTR -20[rbp], 12 // a[0]
	mov	DWORD PTR -16[rbp], -5 // a[1];
	mov	DWORD PTR -12[rbp], 8 // a[2];
	lea	rax, -20[rbp] // get the adddress
	mov	esi, 3 // put 3 in second params;
	mov	rdi, rax // put the address in the first param;
	call	total_elevation_change // get the eax because that is the return value for total_elevation_change.
	mov	DWORD PTR -8[rbp], eax // store this value 8 bytes below rbp. 
	cmp	DWORD PTR -8[rbp], 15 // compare this with 15.
	je	.L7 // if equal, go to L7.
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	esi, 0 // second params 0
	mov	edi, 0 // NULL address
	call	total_elevation_change
	mov	DWORD PTR -8[rbp], eax
	cmp	DWORD PTR -8[rbp], 0
	je	.L8
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	add	DWORD PTR -4[rbp], 1 // failed ++;
.L8:
	cmp	DWORD PTR -4[rbp], 0 // comparing failed with 0. 
	jne	.L9
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT 
.L9:
	mov	eax, DWORD PTR -4[rbp] // return failed. 
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

	.file	"026.c"
	.intel_syntax noprefix
	.text
	.globl	sell_items
	.type	sell_items, @function
sell_items:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -8[rbp], rdi // 8-byte long address for inventory
	mov	DWORD PTR -12[rbp], esi // 4-byte long requested;
	mov	rax, QWORD PTR -8[rbp] // get the address;
	mov	eax, DWORD PTR [rax] // go to the address and get the value; Interesting thing is that it catches stock first. I think the compiler knows that stock, then sold order in the data.
	cmp	DWORD PTR -12[rbp], eax // compare requested with eax.
	jle	.L2
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 4[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	add	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 4[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], 0
	jmp	.L1
.L2:
	mov	rax, QWORD PTR -8[rbp] // get the address of the pointer 
	mov	eax, DWORD PTR [rax] // store the stock.
	sub	eax, DWORD PTR -12[rbp] // subtract.
	mov	edx, eax // eax to edx; 
	mov	rax, QWORD PTR -8[rbp] // get the address again.
	mov	DWORD PTR [rax], edx // store the subtracted value into the stock. 
	mov	rax, QWORD PTR -8[rbp] // Repeat the same process for inventory->sold += requested. 
	mov	edx, DWORD PTR 4[rax]
	mov	eax, DWORD PTR -12[rbp]
	add	edx, eax // edx = edx + eax;
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 4[rax], edx
	nop
.L1:
	pop	rbp
	ret
	.size	sell_items, .-sell_items
	.section	.rodata
.LC0:
	.string	"Success"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -8[rbp], 3 // inventory.stock = 3;
	mov	DWORD PTR -4[rbp], 5 // inventory.sold = 5;
	lea	rax, -8[rbp] // &inventory into rax because it is a 8-byte address.
	mov	esi, 2 // second params = 2;
	mov	rdi, rax 
	call	sell_items
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, 1
	jne	.L4 // Interesting AND operator checks it linearly one at a time.
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, 7
	jne	.L4
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
.L4:
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

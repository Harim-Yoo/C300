	.file	"005.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Happiness is currently %d.\n"
.LC1:
	.string	"Sadness is currently %d.\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -8[rbp], 1 # 순서대로 안 가네. 신기하네. happiness = 1
	mov	DWORD PTR -12[rbp], 0 # int i=0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -12[rbp] # eax = happiness
	add	DWORD PTR -8[rbp], eax # i + happiness
	add	DWORD PTR -12[rbp], 1 # i+1
.L2:
	cmp	DWORD PTR -12[rbp], 9 # compare i and 9.
	jle	.L3 # if i<=9

	/*
	printf("Happness is currently...")
	*/
	mov	eax, DWORD PTR -8[rbp] # eax = happiness
	mov	esi, eax # second params
	lea	rax, .LC0[rip] # get the address
	mov	rdi, rax # get that address to first param
	mov	eax, 0 # no floating-argument
	call	printf@PLT #call printf -> eax = n
	mov	DWORD PTR -4[rbp], 0 # 4-byte sadness = 0
	mov	eax, DWORD PTR -4[rbp] # eax = 0
	mov	edi, eax # edi = eax
	call	compute # compute AND GET eax = sadness from .L6 return value
	mov	DWORD PTR -4[rbp], eax # store sadness = eax
	mov	eax, DWORD PTR -4[rbp] # we put this in printf
	mov	esi, eax # second params gets eax;
	lea	rax, .LC1[rip] # go get the string and put the address in rax.
	mov	rdi, rax # rax goes to rdi
	mov	eax, 0 # no floating-argument
	call	printf@PLT #printf
	mov	eax, 0 # put eax back to 0.
	leave
	ret
	.size	main, .-main
	.globl	compute
	.type	compute, @function
compute:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi # Not using rsp? weird..?
	mov	DWORD PTR -4[rbp], 0 # set up j=0
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -4[rbp] # eax = j;
	add	DWORD PTR -20[rbp], eax # sadness = sadness + eax
	add	DWORD PTR -4[rbp], 1 # j = j+1;
.L6:
	cmp	DWORD PTR -4[rbp], 9 # compare j with 9
	jle	.L7 # if j<=9, go to .L7
	mov	eax, DWORD PTR -20[rbp] # eax = sadness;
	pop	rbp # pop rbp??
	ret # returning sadness back
	.size	compute, .-compute
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

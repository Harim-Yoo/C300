# C300

## What I am doing in this repo

Getting used to C from scratch. I originally followed one of the Korean books I bought in the bookstore, but as I study more of it, it is simply just an explanation of libc, which I don't get help much about. So, I have switched to studying in different modes.

> First, I find syscall for each libc function that I would normally use.
> I write codes that are similar to syscall-wrappers.
> See how it works, and move on.

I am using GCC compiler to run programs written in C, and I am also using some of the basic examples for study materials to read Assembly code.

I currently use intel syntax(```-masm=intel```).

```gcc -S -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -masm=intel FILENAME.c```

- -S means, "stop after writing assembly code."
- -O0 means, no optimization done.
- -fno-stack-protector or -fno-asynchronous-unwind-tables means, get rid of unnecessary metadata.

## Types of Lines

There are four types of lines

main: # This is label with colon. This gives the position.
.string "%d\n" # A directive that begins with a dot. This begins the direction to the Assembler.
mov eax, 0 # This is the instruction to the CPU
#This is a comment.

- Label is a signature for the position to be called with the given label.
- .string, .align, .section, .globl indicates the instruction for batching, such as "put a string here", "align this as a mutiple of 8".
- Instruction is indented and there is no dot. CPU runs it.

The instruction follows the following steps.

ex) instruction - destination - start
mov eax, 5 # In plain C code, eax = 5;

## Common Operands

There are three operands - number, register, memory

Numbers are plain-old numbers.

Registers have different names per sizes. If it starts with **r**, then it's a 8-byte register. Else, it is a 4-byte register.

- rax : whole 8 bytes. Normally, this is the return value for a function call. But, when we do the syscall, this is the syscall number.
- eax : lower 4 bytes
- rdi : the first param of the function
- rsi : the second param of the function
- edx : the third param, if there is any
- rax/eax : the return value (or for place-holder) : Accumulator
- rbp : the current pointer of my function (for local constant position calculation) : Base Pointer
- rsp : the end of current stack : Stack Pointer

Params are plugged in, according to the following order.

- rdi, rsi, rdx, rcx, r8, r9.
Here, rcx is the same rcx in the GCC symbol explanation. Normally, this is where rip is stored.

There are three words for memory:

- BYTE : 1 byte (char in C)
- DWORD : 4 bytes (int in C)
- QWORD : 8 bytes (pointer or long in C)

Examples:
- mov a, b # a = b
- lea a, name # a = &name // lea stands for load effective address.
- sub a, b # a= a-b
- push a # store a in the stack // Have not seen this yet much.
- call fn # fn() // normally the return values are stored in eax or rax depending on the size of it.
- leave # roll back what was ready when function call.
- ret # return;

# GCC Symbol

- "a" : rax
- "b" : rbx
- "c" : rcx
- "d" : rdx
- "S" : rsi
- "D" : rdi

Inside the 64-bit CPU, we have rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp, r8, r9, r10, r11, r12, r13, r14, r15. There are 16 registers.

I
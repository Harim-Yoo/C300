# C300

Getting used to C from scratch. Following instructions and examples in the book called "초보자를 위한 C언어 300제" written by 김은철. (Kudos to the author!)

I am using GCC compiler to run programs written in C, and I am also using the basic examples for study materials to read Assembly code.

I currently use intel syntax(```-masm=intel```).

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

There are three operands - number, register, memory

Numbers are plain-old numbers.

Registers have different names per sizes. If it starts with **r**, then it's a 8-byte register. Else, it is a 4-byte register.

- rax : whole 8 bytes
- eax : lower 4 bytes
- rdi : the first param of the function
- rsi : the second param of the function
- rax/eax : the return value (or for place-holder) : Accumulator
- rbp : the current pointer of my function (for local constant position calculation) : Base Pointer
- rsp : the end of current stack : Stack Pointer

There are three words for memory:

- BYTE : 1 byte (char in C)
- DWORD : 4 bytes (int in C)
- QWORD : 8 bytes (pointer or long in C)

Examples:
- mov a, b # a = b
- lea a, name # a = &name
- sub a, b # a= a-b
- push a # store a in the stack
- call fn # fn()
- leave # roll back what was ready when function call.
- ret # return;




/*
implement int argc, char *argv[] using intel assembly
*/

__asm__ (
  ".intel_syntax noprefix\n" // turn at&t into intel.
  ".global _start\n"// let linker know its starting position
  "_start:\n"
  "xor rbp, rbp\n" //clean rbp
  "mov rdi, [rsp]\n" // get the address of argc and put it in the first param.
  "lea rsi, [rsp+8]\n"// get the address of *argv[], which is the pointer to the array, so its address is going to be the address of (*argv[0]). Get the value and put it inside the rsi.
  "and rsp, -16\n"
  "call main\n"
  "mov rdi, rax\n"
  "mov rax, 60\n" //syscall
  "syscall\n"
  ".att_syntax prefix\n"//turn back to at&t. To what I know, gcc does not get intel-syntax.
);


int main(int argc, char *argv[]) {
  return 42;
}
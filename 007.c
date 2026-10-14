#include <stdio.h>

int main() {
  int x;
  x=2;
  printf("%d\n",x);
}

/*
  
  ';' is not required for #include statement.
  Also, it is not required for #define statement.
  No need to use it in main() func. I guess, it means that main(){}; is not required.
  if ( conditionals ) -> conditionals do not use ';' inside the expression.
  for ( initial; condition; incremental condition ) -> we don't need to use ';' right next to the ending parantheses.
  
  if (x>0) { printf("Hello");} -> This is correct.
  if (x>0) { printf("Hello");}; -> This does not produce error, but should'nt do it?

  Here is the reason why we should'nt do it.
  
  if (x>0) {
    printf("Hello")
  }; else {
    printf("No way...")
  }
  We get compiler error.

  Source code --> Compiler --> Object Code --> Linker --> Executable binaries
  
  Before compiler writes object code (in 0's and 1's), we can write down the assembly code and get the file.
  1) gcc -S 007.c does produce the assembly code.
  2) gcc -S -fno-asynchronous-unwind-tables -fcf-protection=none -fverbose-asm 007.c

*/

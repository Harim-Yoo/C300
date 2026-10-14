#include <stdio.h> // calling standard input output header
const char *j = "Hello World"; 
int main() {
  int n;
  
  printf("%d\n",n);

  n = printf("Hello World"); 
  
  printf("The value of n now gives the byte : %d\n",n);
  
  return 0;
}

/*
26.10.13
Initializing n originally gives 0 in Odin, now look what happens in C.
Garbage value will be spitted out. This is why I want to study Odin later on.
Printf function does produce the byte used in the given string.
I didn't know this before, but the NULL is not part of the count of the bytes.
*/
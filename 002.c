#include <stdio.h>

int main() {

  //initialize the variables nicely.
  int x = 0;
  int y = 0;
  int z = 0;

  x = 1;
  y = 2;

  z = x + y;

  printf("The value z turns out be %d.\n",z);
  
  //1. Char takes one byte(8-bits, meaning that it can store at most 256 numbers).

  char ch = 'a';
  printf("The size of char is %ld\n",sizeof ch);
  
  //2. Short takes two bytes(16-bits, meaning that it can store a lot.)
  short srt;
  printf("The size of short is %ld\n",sizeof srt);

  //3. int takes four bytes(32-bits, meaning that it can store A LOT.)
  int i;
  printf("The size of int is %ld\n", sizeof i);

  //4. This part is weird. I get 8 bytes, even though I expected to have 4 bytes. Linux uses LP64 data model, whereas Windows uses LLP64. What is this...??

  long l;
  printf("The size of long is %ld\n", sizeof(l)); // sizeof is not a function but an operator. So, this indicates that we can use it without the parantheses. Now, if I put the type itself without initializing the variable, we get error.

  printf("The size of long long is %ld.\n", sizeof(long long)); // This is fine, but without it, we get error.
  //printf("The size of long long is %ld.\n",sizeof long long);

  //5. Float takes four bytes as well.
  float f;
  printf("The size of float is %ld\n",sizeof f);

  //6. Double takes eight bytes.
  double df;
  printf("The size of double is %ld.\n",sizeof df);

  return 0;


}

/*
Otherwise, we would have produced garbage values.
Just like in any other languages, we see that the right-hand values goes inside the left-hand value.

*/
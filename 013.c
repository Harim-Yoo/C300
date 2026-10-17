#include <stdio.h>

void main(void) {
  int i = 0;
  int j = 1;

  printf("The value is %d\n, and the memory address is %p\n", i, &i);
  printf("The value is %d\n, and the memory address is %p\n", j, &j);
}
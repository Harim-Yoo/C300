#include <stdio.h>

void main() {

  int i = 0;
  int *ptr;

  ptr = &i;
  *ptr = i;

  printf("Ptr address:%p\n Dereferenced value:%d\n", ptr, *ptr);
}
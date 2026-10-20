#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int three;
  int two;
} Score;

void main() {
  Score *score = malloc(sizeof(Score)); // address always ends in ...2a0: OS randomizes only the page number (4KB units), so the offset within the page stays fixed.

  if (score == NULL) {
    return;
  } // cmp QWORD PTR -8[rbp], 0  -> je .L4 -> nop or keep going.

  score -> three = 3;
  score -> two = 2;

  printf("%p\n", score);
  printf("%d\n", score->three);
  printf("%d\n", score->two);
  free(score);
  score = NULL;
  return;
}

/*
When do we need malloc?

First, we need it when we deal with dynamic array. Stack has its size set when compiled. Look at sub rsp, 16, in line 16 at the assembly code.

Second, we need it when the data must survive when the function is returned. The variables on the stack disappear when leave/ret at lines 54, 55.
*/
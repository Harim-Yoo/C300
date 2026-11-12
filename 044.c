/*
make stack using array in C.
1. define max_capacity, define cur, define init_stack()
2. is_empty(), is_full().
3. push(), pop(), peek()

*/
#include <stdio.h>

#define max_capacity 100
typedef int element;

element data[max_capacity];
int cur;

void init_stack() {
  cur = -1;
}

int is_empty() {
  if (cur == -1) return 1;
  return 0;
}

int is_full() {
  return cur == max_capacity -1 ? 1 : 0;
}

void push(element e) {
  if (is_full()) {
    perror("stack overflow");
  } else {
    cur ++;
    data[cur] = e;
  }
}

element pop() {
  if (is_empty()) {
    perror("underflow");
  }
  return data[cur--];
}

element peek() {
  if (is_empty()) {
    perror("underflow");
  }
  return data[cur];
}

int main() {
  int A[5] = {0,1,2,3,4};

  init_stack();

  for (int j=0;j<5;j++) {
    printf("%d",A[j]);
    push(A[j]);
  }
  printf("\n");

  for (int i=0;i<5;i++) {
    printf("%d",pop());
  }
  printf("\n");
}


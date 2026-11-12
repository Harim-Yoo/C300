/*
make stack and use stack
*/
#include <stdio.h>

#define capacity 100
typedef int element;

element data[capacity];
int current;

void init_stack() {
  current = -1;
}

int is_empty() {

  return current != -1 ? 0 : 1;
}

int is_full() {
  return current != capacity -1 ? 0 :1;
}

void push(element e) {
  if (is_full()) {printf("stack overflow"); return;}
  current++;
  data[current] = e;
}

element pop() {
  if (is_empty()) {printf("stack underflow");}
  return data[current--];
}

element peek() {
  if (is_empty()) {printf("stack underflow");}
  return data[current];
}

void main() {
  char str[100] = "Hello World";
  init_stack();

  for (int i=0;i<100;i++) {
    printf("%c",str[i]);
    push(str[i]);
  }

  printf("\n");

  /*
  for (int j=0;j<100;j++) {
    printf("%c",pop());
  }
  */

  while (!is_empty()) {
    putchar(pop());
  }
  printf("\n");

  

}
/*
make stack struct
*/

#include <stdio.h>
#include <stddef.h>

#define max_cap 1024

struct CallInfo {
  char name[32];
  int param;
};
typedef struct CallInfo Element;

Element data[max_cap];
int cur;

void init_stack() {
  cur = -1;
}

int is_empty() {
  return cur == -1 ? 1 : 0;
}

int is_full() {
  return cur == max_cap-1 ? 1 : 0;
}

void push(Element e) {
  if (is_full()) {
    printf("stack overflow");
  }
  cur ++;
  data[cur] = e;
  return;
}

Element pop() {
  if (is_empty()) {
    printf("underflow");
  }
  return data[cur--];
}

Element peek() {
  if (is_empty()) {
    printf("underflow");
  }
  return data[cur];
}

void main() {

  Element calls[4] = {
    { "main()" },
    { "factorial()",3},
    { "factorial()",2},
    { "factorial()",1}
  };

  init_stack();

  for (int i=0;i<4;i++) {
    push(calls[i]);
    printf("\t %s %d\n", calls[i].name, calls[i].param);
  }
  printf("\n");
  while(!is_empty()) {
    Element call = pop();
    printf("%s %d\n", call.name, call.param);
  }

}


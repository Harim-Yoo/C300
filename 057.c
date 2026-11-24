/*
Application of Stack : Reverse Polish Notation 
*/
#include <stdio.h>

#define MAX 1024
typedef char element;

element data[MAX];
int pos;

void init_stack() {
  pos = -1;
}

int is_empty() {
  return pos == -1 ? 1 : 0;
}

int is_full() {
  return pos == MAX -1 ? 1 : 0;
}

void push(element el) {
  if (is_full()) {
    perror("stack overflow");
  }
  pos++;
  data[pos] = el;
  return;
}

element pop() {
  if (is_empty()) {
    perror("Stack underflow");
  }
  return data[pos--];
}

element peek() {
  if (is_empty()) {
    perror("stack underflow");
  }
  return data[pos];
}

int str_len(const char *expr) {
  int count = 0;
  while (*expr != '\0') {
    count++;
    expr++;
  }
  return count;
}

char reverse_polish_notation(const char *expr) {

  init_stack();
  while (*expr != '\0') {
    switch (*expr) {
      case '+' : {
        element second = pop();
        element first = pop();
        push((element)(first+second));
        break;
      }
      case '-' : {
        element second = pop();
        element first = pop();
        push((element)(first-second));
        break;
      }
      default : {
        push(*expr - '0');
      }
    }
    
    expr++;
  }
  return pop();
}

int main() {
  const char *input = "34+2-";
  char res = reverse_polish_notation(input);
  printf("%d\n",res);
  return 0;
}

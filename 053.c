#include <stdio.h>

#define MAX_CAPACITY 100
typedef char Element;

Element data[MAX_CAPACITY];
int cur;

void init_stack() {
  cur = -1;
}

int is_empty() {
  return cur == -1 ? 1 : 0;
}

int is_full() {
  return cur == MAX_CAPACITY-1 ? 1 : 0;
}

void push(Element el) {
  if (is_full()) {
    perror("Stack Overflow");
  }
  cur++;
  data[cur] = el;
  return;
}

Element pop() {
  if (is_empty()) {
    perror("Stack underflow");
  }
  return data[cur--];
}

Element peek() {
  if (is_empty()) {
    perror("Stack underflow");
  }
  return data[cur];
}

int check_matching(char expr[]) {

  int i = 0;
  int prev;

  init_stack();

  while(expr[i] != '\0') {
    char ch = expr[i];
    
    if (ch == '[' || ch == '(' || ch == '{') {
      push(ch);
    } 
    
    else if (ch == ']' || ch == '}' || ch == ')') {
      if (is_empty()) {
        return 2;
      }
      prev = pop();
      if (ch == ']' && prev != '[') { return 3;}
      if (ch == ')' && prev != '(') { return 3;}
      if (ch == '}' && prev != '{') { return 3;}
    }
    
    i ++;
  }

  if (!is_empty()) {return 1;}
  return 0;  
}

int main() {
  char expr[2][80] = {"{A[i+1]=0;}","(Hello[)]"};

  int err_code;
  for (int j=0;j<2;j++) {
    err_code = check_matching(expr[j]);
    if (err_code == 0) { printf("No error\n");}
    else if (err_code != 0) { printf("Some error\n");}
  }
  return 0;
}

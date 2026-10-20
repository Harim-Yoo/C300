#include <stdio.h>
#include <stdlib.h>

void print_x(int x);
void print_gx(void);

int x = 10;

void main() {
  int x = 5;
  printf("%d\n",x);

  print_x(10);
  print_gx();
}

void print_x(int x) {
  printf("%d\n",x);
}

void print_gx() {
  printf("%d\n",x);
}
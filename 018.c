#include <stdio.h>

int length (char *str);

void main() {
  int len = length("abcde");
  printf("%d\n",len);
}

int length (char *str) {
  int count = 0;
  while (*str) {
    str ++;
    count++;
  }
  return count;
}
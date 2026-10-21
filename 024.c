#include <stdio.h>

int print(char *string);

void main() {
  int res = 0;

  res = print("This is putchar function");
  printf("The length is %d\n",res);

}

int print(char *string) {
  int len = 0;

  while (*string != '\0') {
    putchar(*string);
    string++;
    len++;
  }
  putchar('!');
  putchar('\n');
  return len;
}
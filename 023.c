#include <stdio.h>

#define ENTER 10

void main() {
  int ch = 0;
  printf("Turn it into ASCII\n");
  do {
    ch = getchar();
    printf("Character %c\n ASCII %d\n",ch, ch);
  } while (ch != ENTER);
}

#include <stdio.h>

void main() {
  int b;
  int j;

  printf("%d\n",b);
  printf("%d\n",j);

  b = 10 > 5;
  j = 10 > 20;

  printf("%d\n",b);
  printf("%d\n",j);

  if (b) {
    printf("10>5 is true");
  } else {
    printf("10>5 is false");
  }

  if (j) {
    printf("10>20 is true");
  } else {
    printf("10>20 is false");
  }

  if (-1) {
    printf("-1 is true");
  } else {
    printf("-1 is false");
  }
}
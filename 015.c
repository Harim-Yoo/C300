#include <stdio.h>

void main() {
  int number;
  printf("Print the number:");
  scanf("%d", &number);

  if ( number%2 == 0) {
    printf("It is even.");
  } else {
    printf("It is odd");
  }

}
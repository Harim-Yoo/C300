#include <stdio.h>

void main() {
  int score;
  
  printf("Your score:");
  scanf("%d",&score);

  if (score >= 90) {
    printf("A");
  } else if (score >=80) {
    printf("B");
  } else {
    printf("C");
  }
}
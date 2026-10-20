#include <stdio.h>

void main(){
  int year;

  printf("Current year:");
  scanf("%d", &year);

  if ((year%4==0 && year%100 !=0) || year%400 == 0) {
    printf("Lunar year\n");
  } else {
    printf("Not a lunar year\n");
  }
} 
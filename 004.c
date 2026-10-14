#include <stdio.h>

int main() {

  int x;
  int y;
  
  x=10;
  y=x-5;

  if (x>y) {
    printf("x is greater than y.\n"); //within the scope you must put semicolon;
  } else {
    printf("x is not greater than y.\n");
  }

  // if-else statement only runs one scope of the two. 

  return 0;
}
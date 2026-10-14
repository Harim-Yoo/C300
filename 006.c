#include <stdio.h>

int main() {
  int n;
  n = printf("대한민국\n");
  printf("%d\n",n); // Seems like each Korean word takes 3 bytes because the number of bytes shows up as 13, including the line break.
  return 0;
}

/*

As I searched up, this is true for Linux because each Korean word is encoded in UTF-8, and this method saves a korean char in 3-byte.

*/
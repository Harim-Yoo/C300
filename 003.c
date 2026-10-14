#include <stdio.h>

#define X 2
#define PI 3.141592

int main() {
  // Since I have not learned about Macro, I will deduce the size of PI from sizeof.
  int size = sizeof(PI);
  printf("The size of PI is %d.\n",size); // It comes out as 8 bytes. It must be double.

  return 0;
}
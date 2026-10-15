#include <stdio.h>

void main() {
  float d; // 4 bytes
  double d1; // 8 bytes
  double d2; // 8 bytes 

  d = 3.141592;
  d1 = 12345678;
  d2 = 'c';

  printf("%f\n",d);
  printf("%f\n",d1);
  printf("%f\n",d2);
}
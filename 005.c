#include <stdio.h>

int compute(int sadness); // acting like a header.

int main() {
  int i;
  int happiness = 1;

  for (i=0;i<10;i++) {
    happiness = happiness + i;
  }

  printf("Happiness is currently %d.\n",happiness);

  int sadness = 0;

  sadness = compute(sadness);

  printf("Sadness is currently %d.\n",sadness);

  return 0;
}

// compute has its params input and results in int as well.

int compute(int sadness) {
  //just wrote this example because you may initialize j inside the loop, not outside.
  //Also, you mak increase j by using ++ operator.
  for (int j=0;j<10;j=j+1) {
    sadness = sadness+j;
  }

  return sadness;
}
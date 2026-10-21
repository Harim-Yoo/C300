#include <stdio.h>
#include <stddef.h>
#include "025_exercise.h"

int total_elevation_change(const int *changes, int count) {
  if (count == 0) {
    return 0;
  }
  int current = 0;
  int result = 0;

  while (current < count) {
    result += *changes;
    changes++;
    current++;
  }
  return result;
}


int main(void) {
  int failed = 0;

  const int a[] = {12, -5, 8};
  int actual = total_elevation_change(a, 3);
  if (actual != 15) {
    printf("Failed\n");
    failed++;
  }

  actual = total_elevation_change(NULL,0);
  if (actual != 0) {
    printf("Failed again\n");
    failed++;
  }
  if (failed==0) {
    printf("All passed\n");
  }
  return failed;
}
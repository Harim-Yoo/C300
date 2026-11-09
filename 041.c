/*
O(n^2) algorithm
*/

#include <stdio.h>

int duplicate_check(int arr[], int n) {
  for (int i=0;i<n;i++) {
    for (int j=i+1;j<n;j++) {
      if (arr[i] != arr[j]) {
        continue;
      } else {
        return 1;
      }
    }
  }
  return 0;
}

int main(void) {
    int a[5] = {1,2,3,4,5};
    int b[5] = {1,2,3,5,5};
    int contains_duplicate;
    contains_duplicate = duplicate_check(a,5);
    printf("%d",contains_duplicate);
    contains_duplicate = duplicate_check(b,5);
    printf("%d",contains_duplicate);
}
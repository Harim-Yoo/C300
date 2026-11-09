/*
Make a transpose matrix
M = {{1,2,3},{4,5,6},{7,8,9}} is given.
Produce its transpose.
*/
#include <stdio.h>
#define ROWS 3
#define COLS 3

void print_matrix(int m[ROWS][COLS]) {
  for (int i=0;i<ROWS;i=i+1) {
    for (int j=0;j<COLS;j=j+1) {
      printf("%d",m[i][j]);
    }
    printf("\n");
  }
}

void transpose_matrix(int m[ROWS][COLS]) {
  for (int i=0;i<ROWS;i++) {
    for (int j=i+1;j<COLS;j++) {
      int tmp = m[i][j];
      m[i][j] = m[j][i];
      m[j][i] = tmp;
    }
  }
}

int main() {

  int mat[ROWS][COLS] = {1,2,3,4,5,6,7,8,9};
  print_matrix(mat);
  
  transpose_matrix(mat);
  print_matrix(mat);
}
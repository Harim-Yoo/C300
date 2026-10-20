#include <stdio.h>

typedef struct {
  int kor;
  int eng;
  int math;
} Score;

void main() {
  Score s;
  Score *score = &s;

  printf("%p\n", &s);
  printf("%p\n",score);

  score -> kor = 90;
  score -> eng = 91;
  score -> math = 100;

  printf("%p\n",&score); // -24[rbp] because, S eats up 12 bytes, there is a 4-byte padding, so the 8-byte pointer lands on a multiple of 8.
  printf("%d\n",score->kor);

}
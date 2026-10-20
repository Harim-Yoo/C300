#include <stdio.h>
#include <string.h>

struct Score {
  int kor;
  int eng;
  int math;
};

void main() {
  struct Score score;

  score.kor = 90;
  score.eng = 91;
  score.math = 100;

  unsigned long long raw;
  memcpy(&raw, &score, sizeof raw);
  printf("%llx \n", raw); // score is of size 12 bytes, but it can't be written in int size only.
  printf("%d\n",score.kor+score.eng+score.math);
}
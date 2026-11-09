/*
make a struct
make typedef struct
use pointer-arithmetic
*/

#include <stdio.h>

struct Student {
  int id;
};

typedef struct Student_t {
  int id;
} Student;

typedef struct {
  double real;
  double imaginary;
} Complex;

Complex add_complex(Complex *z, Complex *w) {
  Complex result;
  result.real = z->real + w->real;
  result.imaginary = z->imaginary + w->imaginary;
  return result;
}

int main(void) {
  Complex z;
  Complex w;
  z.real = 3;
  z.imaginary = 4;
  w.real = 2;
  w.imaginary = 3;

  Complex result = add_complex(&z,&w);
  printf("%f",result.real);
  printf("%f",result.imaginary);
}
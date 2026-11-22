/*
make my_scanf

Let's look at its signature

int scanf(const char *format [,argument]...);

*/

#include <stdio.h>

typedef char* my_va_list; // current memory address
#define _SLOT_SIZE(type) ((sizeof(type) + sizeof(void*) -1) & ~(sizeof(void*) -1)) // bit arithmetic for fixing the size of 4

//ap = argument pointer
#define my_va_args(ap, type) (*(type*)(((ap) += _SLOT_SIZE(type)) - _SLOT_SIZE(type)))

#define my_va_start(ap, last_param) ((ap) = (my_va_list)&(last_param) + _SLOT_SIZE(last_param))
#define my_va_end(ap) ((ap)= (my_va_list)0)

int my_scanf(const char *format, ...) {
  my_va_list args;
  my_va_start(args,format);

  int count = 0;
  for (const char *p = format; *p != '\0';p++) {
    if (*p == '#' && *(p+1) == 'd') {
      p++;
      int *target = my_va_args(args, int*);

      if (scanf("%d",target) == 1) {
        count++;
      }
      
    }
  }
  my_va_end(args);
  return count;

}

int main() {
  int a = 0, b = 0;
  printf("Enter number");
  my_scanf("#d #d",&a, &b);
  printf("Read %d and %d",a,b);
  return 0;
}
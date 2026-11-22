/*
make putch
int putch(int ch)
*/
#include <stdlib.h>
#include <unistd.h>

int my_putch(int *ch) {
  write(1, ch, 4);  
}

// int main() {
//   int *ch = malloc(sizeof(int));
//   *ch = 'a';
//   my_putch(ch);
//   free(ch);
//   return 0;
// }

int main() {
  int ch = 'a';
  my_putch(&ch);
  return 0;
}
#include <stdio.h>

const unsigned char *j = "HELLO"; 

/*
Here *j is 'H' = 01001000, so it prints 72.

Because j is unsigned char, GCC converts *j to int with movzx (zero extend): upper 3 bytes are always filled with 0.

ex) if the byte were 11001000:
00000000/00000000/00000000/11001000 = 200

On x86-64 Linux GCC, plain char is signed, so in 011.c it used movsx (sign extend): upper 3 bytes are filled with the top bit of the byte.

ex) if the byte were 11001000:
11111111/11111111/11111111/11001000 = -56
('H' has top bit 0, so 011.c still printed 72.)
*/

void main() {
  printf("%d\n",*j);
}
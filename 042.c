/*
make strlen(const char *s)
*/

#include <stdio.h>

size_t str_len(const char *s) {
  size_t count;
   while (*s != '\0') {
    count++;
    s++;
   }
   return count;
}

int main(void) {
  size_t length;
  char s[12] = "Hello World";
  length = str_len(s);
  printf("%ld",length);  
}
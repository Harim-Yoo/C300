/*
replicate the behavior of strchr(string, char)
*/

#include <stddef.h>
#include <stdio.h>

char* str_chr(char *string, char *key_char) {
  while (*string != '\0') {
    if (*string == *key_char) {
      return string;
    }
    string++;
  }
  return NULL;
}

int main() {
  char *str = "Hello World";
  char *ret;

  ret = str_chr(str,"e");
  if (ret == NULL) {
    printf("No char found\n");
    return 1;
  }
  printf("%c\n",*ret);
  return 0;
}
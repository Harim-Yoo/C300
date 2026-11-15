/*
replicate the behavior of strstr(char *string, char *search)
*/

#include <stdio.h>
#include <stddef.h>

char *str_str(char *string, char *search) {
  while (*string != '\0') {
    char *s = string;
    char *p = search;
    while (*p != '\0') {
      if (*p != *s) {
        break;
      }
      p++;
      s++;
    }
    if (*p == '\0') {
      return string;
    }
    string++;
  }
  return NULL;
}

int main() {
  char *str = "Hello World\n";
  char *ret;

  ret = str_str(str,"ell");
  if (ret == NULL) {
    return 1;
  }
  printf("%s",ret);
  return 0;
}
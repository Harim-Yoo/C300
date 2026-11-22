/*
replicate strstr
*/

#include <stdio.h>

char *my_strstr(const char *haystack, const char *needle) {
  
  if (*needle == '\0') {
    return (char *)haystack;
  }

  while (*haystack != '\0') {

   if (*haystack == *needle) {
    const char *cNeedle = needle;
    const char *cHaystack = haystack;
      
    while (*cNeedle != '\0') {
      if (*cNeedle != *cHaystack) {
        break;
      }
        cNeedle++;
        cHaystack++;
    }
    
    if (*cNeedle == '\0') {
     return (char *)haystack;
    }
  }
    haystack++;
  }

  return NULL;
}

int main() {
  const char *word = "Hello World";
  const char *msg = "ell";
  char *result = my_strstr(word,msg);
  printf("%s",result);
  return 0;
}
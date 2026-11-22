/*
replicate strstr

char *strstr (const char *haystack, const char *needle)

*/

#include <stddef.h>
#include <stdio.h>

char *my_strstr (const char *haystack, const char *needle) {
  
  if (*needle == '\0') {
    return (char *)haystack;
  }
  

  while (*haystack != '\0') {
    
    // if the first letter is equal to the copied. Begin the search.

    if (*needle == *haystack) {
      
      const char *needleCopy = needle;
      const char *copied = haystack;

      while (*needleCopy != '\0') {
        if (*needleCopy != *copied) {
          break;
        }
        needleCopy++;
        copied++;
      }
      if (*needleCopy == '\0') {
        return (char *)haystack;
      }

    } 
    haystack++;

  }
  return NULL; // what to return as null value?  
}





int main() {

  const char *haystack = "Hello World";
  const char *needle = "ell";

  char *result = my_strstr(haystack, needle);
  printf("%s", result);
  return 0;
}
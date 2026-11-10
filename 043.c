/*
make memcpy
*/
#include <stdio.h>
#include <stddef.h>

size_t str_len(const char *given_string) {
  size_t count = 0;
  while (*given_string !='\0') {
    count++;
    given_string++;
  }
  return count;
}

void *mem_cpy(void *restrict dest, const void *restrict src, size_t n) {
  
  // can't dereference for void * or const void *. 

  char *d = (char *)dest;
  const char *s = (const char *)src;
  for (int i=0;i<n;i++) {
    d[i] = s[i];
  }
  return d;
}

int main(){
  char src[] = "Hello World";
  char dest[15];

  mem_cpy(dest,src,str_len(src)+1);
  
  for (int i=0;i<str_len(src);i++) {
    printf("%c",dest[i]);
  }
  printf("\n");
  return 0;
}


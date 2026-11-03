/*
pwd : print working directory
*/

#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  char buf[1024];
  char *cwd = getcwd(buf,sizeof(buf));
  
  if (!cwd) {
    perror("Error");
    return 1;
  }

  while (*cwd != '\0') {
    putchar(*cwd);
    cwd ++;
  }
  putchar('\n');
  return 0;
}
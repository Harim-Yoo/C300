/*
replicating rmdir
*/

#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    char *err_msg = "rmdir: missing operand\n";
    while (*err_msg != '\0') {
      putchar(*err_msg);
      err_msg++;
    }
    return 1;
  }
  
  for (int j=1;j<argc;j++) {
    if (rmdir(argv[j])==-1) {
      char *rm_err = "rmdir: There is at least one file in the folder.\n";
      while (*rm_err != '\0') {
        putchar(*rm_err);
        rm_err++;
      }
      return 1;
    }
  }
  return 0;
}
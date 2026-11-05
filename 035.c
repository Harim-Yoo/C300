/*
make rename
*/

#include <stdio.h>

int main(int argc, char *argv[]) {
  if (argc ==1) {
    char *err_msg = "No input found.\n";
    while(*err_msg !='\0') {
      fputc(*err_msg, stderr);
      err_msg++;
    }    
    return 1;
  }
  else if (argc == 3) {
    const char *old_path = argv[1];
    const char *new_path = argv[2];

    if (rename(old_path, new_path) == -1) {
      char *fail_msg = "Rename failed.\n";
      while (*fail_msg !='\0') {
        fputc(*fail_msg, stderr);
        fail_msg++;
      }
      return 1;
    }
  }
  else {
    char *final_err = "Something went wrong.\n";
    while (*final_err != '\0') {
      fputc(*final_err, stderr);
      final_err++;
    }
    return 1;
  }
  return 0;
}
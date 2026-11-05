/*

make cat using fopen, fgetc, putchar

*/

#include <stdio.h>

void main(int argc, char *argv[]) {
  if (argc == 1) {
    char *err_msg = "No file to load.\n";
    while ( *err_msg != '\0') {
      putchar(*err_msg);
      err_msg ++;
    }
    return;
  } 
  
  FILE *file;
  int read;

  for (int j=1; j<argc; j++) {
    file = fopen(argv[j], "r");
    if (file == NULL) {
      const char *open_err = "No such file to open.\n";
      while ( *open_err != '\0') {
        putchar(*open_err);
        open_err++;
      }
      return;
    }
    read = fgetc(file);
    while (read != EOF) {
      putchar(read);
      read = fgetc(file);
    }
    putchar('\n');
    fclose(file);
  }
}
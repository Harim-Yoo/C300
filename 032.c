/*
make ls behavior, without any input
*/

#include <unistd.h>
#include <dirent.h>
#include <stdio.h>

#define buf_size 4096

int main(int argc, char *argv[]) {
  char buf[buf_size];
  char *cwd;
  struct dirent *file;
  if (argc == 1) {
    cwd = getcwd(buf,buf_size);
    DIR *dirp = opendir(cwd);
    file = readdir(dirp);
    while ( file != NULL ) {
      char *file_name = file->d_name;
      while (*file_name != '\0') {
        putchar(*file_name);
        file_name++;
      }
      putchar(' ');
      file = readdir(dirp);
    }
    putchar('\n');  
    closedir(dirp);
  } else {
    for (int j=1;j<argc;j++) {
      DIR *dirp = opendir(argv[j]);
      if (dirp == NULL) {
        char *err_msg = "No such directory.\n";
        while (*err_msg != '\0') {
          putchar(*err_msg);
          err_msg++;
        }
        return 1;
      }
      file = readdir(dirp);
      while (file != NULL) {
        char *file_name = file->d_name;
        while (*file_name != '\0') {
          putchar(*file_name);
          file_name++;
        }
        putchar(' ');
        file=readdir(dirp);
      }
      putchar('\n');
      closedir(dirp);
    }
  }
  return 0;

  
}
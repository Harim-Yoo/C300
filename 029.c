#include <stdio.h>

/* 
create touch behavior
*/

int main(int argc, char *argv[]) {
  if (argc == 1) {
    printf("Need path\n");
    return 0;
  }
  for (int j=1; j<argc;j++) {
    char *path = argv[j];
    FILE *file;
    file = fopen(path,"w");
    if (!file) {
      perror("Error");
      return 1;
    }
  }
  return 0;
}
/*
make echo
*/
#include <stdio.h>
#include <unistd.h>

size_t str_size(char *strings) {
  size_t count = 0;
  while (*strings != '\0') {
    count ++;
    strings++;
  }
  return count;
}

int main(int argc, char *argv[]) {
  if (argc == 1) {
    fputc('\n',stderr);
    return 1;
  }

  for (int j=1;j<argc;j++) {
    if (j==argc-1) {
      write(1, argv[j], str_size(argv[j]));
      break;
    }
    write(1, argv[j], str_size(argv[j]));
    char space = ' ';
    write(1,&space,1);
    
  }
  putchar('\n');
  return 0;
}
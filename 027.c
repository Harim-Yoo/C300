#include <fcntl.h>
#include <unistd.h>

/*
create cat behavior
*/

#define BUFFER_SIZE 4096

int str_len(char *strings) {
  int count = 0;
  while (*strings != '\0') {
    count ++;
    strings++;
  }
  return count;
}

int main(int argc, char *argv[]) {
  char buffer[BUFFER_SIZE] = {0};
  ssize_t bytes_read;

  if (argc == 1) {
    bytes_read = read(0, buffer, sizeof(buffer));
    while (bytes_read > 0) {
      write(1, buffer, bytes_read);
      bytes_read = read(0, buffer, sizeof(buffer));
    }

    if (bytes_read == -1) {
      char *str_no_input = "Failed at reading the input.\n";
      write(2,str_no_input,str_len(str_no_input));  
    }
    return 0;
  }

  
  int failure = 0;
  for (int i=1;i<argc;i++) {
    int fd = open(argv[i],O_RDONLY);
    
    if (fd == -1) {
      char *err_msg = "Failed to load the file.\n";
      write(2, err_msg, str_len(err_msg));
      failure = 1;
      continue;
    }
    
    bytes_read = read(fd, buffer, sizeof(buffer));
    
    while (bytes_read > 0) {
      write(1,buffer, bytes_read);
      bytes_read = read(fd, buffer, sizeof(buffer));
    }
    
    if (bytes_read == -1) {
      char *err_no_more = "Failed at reading.\n";
      write(2,err_no_more,str_len(err_no_more));
      failure = 1;
    }
    close(fd);
  }
  if (failure != 0) {
    return 1;
  }
  return 0;
}
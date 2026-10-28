#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>


#define BUFFER_SIZE 4096

int str_len (char *strings) {
  int count = 0;
  while (*strings != '\0') {
    count ++;
    strings ++;
  }
  return count;
}

void int_to_str (int n) {
  if (n<0) {
    write(1,"-",1);
    n = -n;
  }

  if (n>=10) {
    int_to_str(n/10);
  }
  
  char digit = (n%10)+'0';
  write(1, &digit, 1);
}

int main(int argc, char *argv[]) {
  char buffer[BUFFER_SIZE] = {0};

  if (argc == 1) {
    char *err_msg = "No file read.\n";
    write(2, err_msg, str_len(err_msg));
    return 0;
  }
  ssize_t bytes_read;

  int fd = open(argv[1],O_RDONLY);
  bytes_read = read(fd,buffer,BUFFER_SIZE);
  int count = 0;
  while (bytes_read > 0) {
    for (ssize_t j=0; j<bytes_read;j++) {
      if( buffer[j] == '\n') {
        count ++;
      }
    }
    bytes_read = read(fd, buffer, BUFFER_SIZE);
  }
  if (bytes_read == -1) {
    char *read_err = "Reading failed.\n";
    write(2,read_err, str_len(read_err));
  }
  close(fd);
  int_to_str(count);
  write(1,"\n",1);
  return 0;
}
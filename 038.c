/*
make cp using open(), creat(), write(), close()
*/

#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#define buf_size 4096


int main(int argc, char *argv[]) {
  // handle the case when there is no argument added.
  if (argc == 1) {
    char *err_msg = "No file to copy";
    while (*err_msg != '\0') {
      fputc(*err_msg,stderr);
      err_msg++;      
    }
    return 1;
  }

  char *copy_from = argv[1];
  char *copy_to = argv[2];
  char buf[buf_size];
  int read_file;
  int write_file;

  ssize_t read_upto;

  read_file = open(copy_from,O_RDONLY); 

  if (read_file == -1) {
    return 1;
  }
  
  read_upto = read(read_file,buf,buf_size);

  write_file = creat(copy_to, 0644);
  if (write_file ==-1) {
    close(read_file); 
    return 1;
  }

  while (read_upto >0) {
    write(write_file,buf,read_upto);
    read_upto=read(read_file,buf,buf_size);
  }
  close(read_file);
  close(write_file);
  return 0; 

}
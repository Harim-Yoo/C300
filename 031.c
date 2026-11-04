/*
make mkdir 
*/

#include <sys/stat.h>
#include <unistd.h>

int str_len(char *str_given) {
  int count = 0;
  while (*str_given != '\0') {
    count++;
    str_given++;
  }
  return count;
}


int main(int argc, char *argv[]) {
   if (argc == 1) {
    char * err_msg = "No path provided.\n";
    write(2,err_msg,str_len(err_msg));
    return 1;
   }

   for (int j = 1; j < argc ; j++) {
    char * copied_list = NULL;
    copied_list = argv[j];
     if (*copied_list != '\0') {
      if (mkdir(argv[j],0700)==-1) {
        char * make_err = "Can't make such directory.\n";
        write(2, make_err, str_len(make_err));
        return 1;
      }
    }    
   }
   return 0;

}
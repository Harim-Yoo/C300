#include <stdlib.h>
#include <unistd.h>

int main(void) {
  char arr[4] = {'a','b','c','d'};

  char *pArr;
  pArr = (char *)malloc(sizeof(char)*4);

  for (int j=0;j<4;j=j+1) pArr[j] = arr[j];

  char empty = (char)' ';
  char new_line = (char)'\n';
  for (int i=0;i<4;i++) {
    write(1,&pArr[i],1);
    write(1,&empty,1);
    write(1,&new_line,1);
  }

  free(pArr);
  return 0;
}
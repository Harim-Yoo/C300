/*
replicate strspn

size_t strspn(const char *s, const char *accept)
*/

typedef unsigned long size_t;

/*
string = "Hello"
accept = "el"

H -> compare with e and l, nothing's equal. Stop.

*/
size_t my_str_spn(const char *string, const char *accept) {
  size_t result = 0;

  while (*string != '\0') {

    const char *copy_accept = accept;
    
    while (*copy_accept != '\0') {
      if (*string == *copy_accept) {
        break;
      }
      copy_accept++;
    }
    
    if (*copy_accept == '\0') {
      break;
    }
    
    result++;
    string++;
  }

  return result;
}

long my_write(int fd, const char *buf, long len) {
  long ret_val;

  __asm__ volatile (
    "syscall"
    : "=a"(ret_val)
    : "a"(1), "D"(fd), "S"(buf), "d"(len)
    : "rcx", "r11", "memory"
  );

  return ret_val;
}

int main() {
  const char *msg = "aaaabb";
  const char *accept = "a";
  size_t res = my_str_spn(msg, accept);
  char c = '0'+res;
  my_write(1,&c, 1);
  return 0;  
}
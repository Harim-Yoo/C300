/*
write my_write(fd, buf, len) in GCC assembly code.
*/

long str_len(const char *string) {
  long result = 0;
  while (*string !='\0') {
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
  const char *msg = "Hello World\n";
  my_write(1, msg, str_len(msg));
  return 0;
}
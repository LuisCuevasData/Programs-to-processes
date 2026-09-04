#include <unistd.h>
#include <sys/syscall.h>
#include <string.h>

int main() {
    char *out_msg = "hello STDOUT\n";
    syscall(SYS_write, 1, out_msg, strlen(out_msg));

    char *err_msg = "ERROR: this is an error";
    syscall(SYS_write, 2, err_msg, strlen(err_msg));   
}
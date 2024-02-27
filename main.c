#include "libasm.h"
#include <assert.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <limits.h>

#include <stdio.h>

#include "libasm.h"
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

#define PRINT(str) printf("----------------%s----------------\n", str);

static void test_strlen() {
    PRINT("empty string");
    assert(ft_strlen("") == 0);
    PRINT("normal string");
    assert(ft_strlen("normal string") == strlen("normal string"));
    PRINT("string with null")
    assert(ft_strlen("hello\0world") == 5);
}

static void test_strcpy() {
    PRINT("normal string")
    char src[1024];
    char dst[1024];

    memset(src, 0, sizeof src);
    memset(dst, 0, sizeof dst);
    assert(ft_strcpy(src, "") == src);
    assert(memcmp(src, dst, sizeof src) == 0);

    PRINT("empty string")
    char src2[] = "";
    char dst2[5];
    ft_strcpy(dst2, src2);
    assert(memcmp(src2, dst2, strlen(dst2) + 1) == 0);

    PRINT("string with null terminator")
    char src3[] = "hello\0world";
    char dst3[20];
    ft_strcpy(dst3, src3);
    assert(memcmp(src3, dst3, strlen(dst3) + 1) == 0);
}

static void test_strcmp() {
    assert(ft_strcmp("hello", "hello") == 0);
    assert(ft_strcmp("hello\200", "hello\300") < 0);
    assert(ft_strcmp("hello\300", "hello\200") > 0);
}

static void strdup_helper(const char *str) {
    char *c = ft_strdup(str);
    assert(ft_strcmp(str, c) == 0);
    free(c);
}
static void test_strdup() {
    strdup_helper("");
}

static void check_read()
{
  char a[1024], b[1024];

  memset(a, 0, sizeof a);
  memset(b, 0, sizeof b);
  assert(ft_read(-1, NULL, 0) == -1);
  assert(errno == EBADF);

  int dev = open("/", O_RDONLY);
  assert(dev >= 0);
  assert(ft_read(dev, a, sizeof a) == -1);
  assert(errno == EISDIR);
  assert(!close(dev));

  int make = open("Makefile", O_RDONLY);
  ssize_t theirs = read(make, a, sizeof a);

  assert(theirs != -1);
  assert(lseek(make, 0, SEEK_SET) != -1);

  assert(ft_read(make, b, sizeof b) == theirs);
  assert(!strncmp(a, b, sizeof a));

  assert(!close(make));
}

static void check_write()
{
  assert(ft_write(-1, "hallo", 5) == -1);
  assert(errno == EBADF);

  int dev = open("/", O_RDONLY);
  assert(dev >= 0);
  assert(ft_read(dev, "hallo", 5) == -1);
  assert(errno == EISDIR);
  assert(!close(dev));

  char str[] = "Hello world!";
  int fd = open("tmp", O_RDWR | O_CREAT | O_EXCL);
  assert(fd != -1);

  assert(ft_write(fd, str, sizeof str) == sizeof str);
  assert(lseek(fd, 0, SEEK_SET) != -1);

  char buf[128];
  assert(read(fd, buf, sizeof buf) == sizeof str);
  assert(!memcmp(str, buf, sizeof buf > sizeof str ? sizeof str : sizeof buf));
  assert(!close(fd));

  assert(unlink("tmp") != -1);
}


int main(void)
{
  test_strlen();
  test_strcpy();
  test_strcmp();
  test_strdup();
  check_read();
  check_write();
}
#include "libasm.h"
#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>

#define PRINT(str) printf("----------------%s----------------\n", str);

static void test_strlen() {
    PRINT("STRLEN");
    assert(ft_strlen("str") == 3);
    assert(ft_strlen("") == 0);
}

static void test_strcpy() {
    PRINT("STRCPY")
    char src[5] = "foo\200";
    char dst[5];
    ft_strcpy(dst, src);
    assert(memcmp(src, dst, 5) == 0);
}


int main(void) {
    test_strlen();
    test_strcpy();
//    printf("testing: %ld\n", ft_strlen("heffllo"));
//    test_strcpy("hello");
//    printf("test: %d\n", ft_strcmp("hi", "hi\200"));
//    char buff[100] = "hi";
//    char *test = ft_strdup(buff);
//    printf("test->>>> [%s] and len: %ld\n", test, ft_strlen(test));
//    int o = write(-1, "hello\n", 1);
//    int m = ft_write(-1, "hello\n", 1);
//    printf("mine %d and original %d\n", m, o);
//    assert(o == m);
}

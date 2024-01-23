#include "libasm.h"
#include <stdio.h>

void test_strcpy(char *str) {
    char buff[100] = "hi";
    char *ret = ft_strcpy(buff, str);
    printf("test %s\n", ret);
}

int main(void) {
    printf("testing: %ld\n", ft_strlen("heffllo"));
    test_strcpy("hello");
    printf("test: %d\n", ft_strcmp("hi", "hi\200"));
    char buff[100] = "hi";
    char *test = ft_strdup(buff);
    printf("test->>>> [%s] and len: %ld\n", test, ft_strlen(test));
}
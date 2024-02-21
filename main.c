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
    char src[] = "hello world!";
    char dst[20];
    ft_strcpy(dst, src);
    assert(memcmp(src, dst, strlen(src) + 1) == 0);

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
    char src[] = "hello world";
    char dst[] = "hello world";

    PRINT("same string")
    assert(ft_strcmp(src, dst) == 0);

    char src2[] = "hello world\200";
    char dst2[] = "hello world\300";

    PRINT("src smaller than dst")
    assert(ft_strcmp(src2, dst2) < 0);

    char src3[] = "hello world\300";
    char dst3[] = "hello world\200";

    PRINT("src bigger than dst")
    assert(ft_strcmp(src3, dst3) > 0);
}

static void test_strdup() {
    char str[] = "";
    char *copy;
    
    PRINT("copy empty string")
    copy = ft_strdup(str);
    printf("pointer %p\n", copy);
    assert(strcmp(str, copy) == 0);
    free(copy);

    // char str2[] = "hello world\0";
    // char *copy2;

    // copy2 = malloc(strlen(str2) + 1);
    // (void)copy2;
    // copy2 = ft_strdup(str2);
    // assert(memcmp(str2, copy2, strlen(copy2) + 1) == 0);
    // free(copy);
}


int main(void) {
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_strdup();
}

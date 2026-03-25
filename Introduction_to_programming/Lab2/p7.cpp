#include <stdio.h>

int main() {
    int x = 10;
    int *p = &x;
    int **q = &p;
    printf("x : %d\n", *p);
    printf("&x : %d\n", p);
    printf("x : %d\n", **q);
    printf("&x : %d\n", *q);
}

#include <stdio.h>

void thaydoi(int **p) {
    **p = 2 * **p;
}

int main() {
    int a = 5;
    int *p1 = &a;
    int **p2 = &p1;
    printf("a = %d \n", a);
    printf("*p1 = %d \n", *p1);
    printf("**p2 = %d \n", **p2);
    printf("dia chi cua a : %d\n", &a);
    printf("dia chi cua a thong qua p1 : %d\n", p1);
    printf("dia chi cua a thong qua p1 : %d\n", *p2);
    thaydoi(p2);
    printf("a = %d \n", a);
    printf("*p1 = %d \n", *p1);
    printf("**p2 = %d \n", **p2);
}

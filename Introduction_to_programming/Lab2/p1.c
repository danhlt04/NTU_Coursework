#include <stdio.h>

int main() {
    float a = 1.5;
    float *p = &a;
    printf("*p : %.1f\n", *p);
    printf("p : %d\n", p);
    *p = *p + 1;
    printf("a = %.1f", a);
    return 0;
}

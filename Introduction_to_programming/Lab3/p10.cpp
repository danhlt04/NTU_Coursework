#include <stdio.h>

int main() {
    int a[50];
    printf("%d\n", sizeof(a) / sizeof(a[0]));
    int b[5] = {1, 2, 3, 4, 5};
    int *p = b;
    printf("%d\n", *(p + 2));
    printf("int *p = arr\n");
    printf("ca a, b va c deu dung\n");
    int c[3] = {10, 20, 30};
    printf("%d\n", *(c + 1));
    printf("ca a, b va c deu dung\n");
    int d[10];
    int *p2 = d;
    printf("dia chi cua phan tu thu 3 (d[2]) co the duoc tinh : arr + 2, p + 2, &arr[2]\n");
    printf("lenh cho phep gan gia tri 5 vao phan tu thu 2 cua mang arr thong qua con tro p : ca a, b va c deu dung\n");

    return 0;
}

#include <stdio.h>

const int MAX = 30;

void nhap(float a[], int &n) {
    do scanf("%d", &n);
    while(n <= 2 || n > 30);
    for(int i = 0; i < n; i++) scanf("%f", &a[i]);
}

void in(float a[], int n) {
    for(int i = 0; i < n; i++) printf("%.1f ", a[i]);
}

int main() {
    int n;
    float a[MAX];
    nhap(a, n);
    in(a, n);
    printf("\n");
}

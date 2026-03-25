#include <stdio.h>

const int MAX = 30;

void nhap(float a[], int &n) {
    do scanf("%d", &n);
    while(n <= 3 || n > 30);
    for(int i = 0; i < n; i++) scanf("%f", &a[i]);
}

void in(float a[], int n) {
    for(int i = 0; i < n; i++) printf("%.2f ", a[i]);
}

void them(float a[], int n, float x, int p) {
    for(int i = 0; i < p; i++) printf("%.2f ", a[i]);
    printf("%.2f ", x);
    for(int i = p; i < n; i++) printf("%.2f ", a[i]);
}

void khong(float a[], int n, float b[], int &index) {
    for(int i = 0; i < n; i++) {
        if(a[i] != 0) {
            b[index] = a[i];
            ++index;
        }
    }
}

void tachchan(float a[], int n, float even[], int &x) {
    for(int i = 0; i < n; i++) {
        if((int) a[i] % 2 == 0) {
            even[x] = a[i];
            ++x;
        }
    }
}

void inchan(float even[], int x) {
    for(int i = 0; i < x; i++) printf("%.2f ", even[i]);
}

void tachle(float a[], int n, float odd[], int &y) {
    for(int i = 0; i < n; i++) {
        if((int) a[i] % 2 != 0) {
            odd[y] = a[i];
            ++y;
        }
    }
}

void inle(float odd[], int y) {
    for(int i = 0; i < y; i++) printf("%.2f ", odd[i]);
}

int main() {
    int n;
    float a[MAX];
    nhap(a, n);
    in(a, n); printf("\n");
    float x; scanf("%f", &x);
    int p;
    do scanf("%d", &p);
    while(p < 0 || p >= n);
    them(a, n, x, p); printf("\n");
    int index = 0;
    float b[MAX];
    khong(a, n, b, index);
    in(b, index); printf("\n");
    int i = 0, j = 0;
    float even[MAX], odd[MAX];
    tachchan(b, index, even, i);
    tachle(b, index, odd, j);
    inchan(even, i); printf("\n");
    inle(odd, j); printf("\n");

    return 0;
}

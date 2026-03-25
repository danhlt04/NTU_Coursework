#include <stdio.h>

#define ll long long

const int MAX = 40;

void nhap(int a[], int &n) {
    do scanf("%d", &n);
    while(n <= 2 || n > 40);
    for(int i = 0; i < n; i++) scanf("%d", &a[i]);
}

void in(int a[], int n) {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

void boi3(int a[], int n) {
    for(int i = 0; i < n; i++) {
        if(a[i] > 3 && a[i] % 3 == 0) a[i] = 5;
    }
}

double tb(int a[], int n) {
    ll sum = 0;
    for(int i = 0; i < n; i++) sum += a[i];
    double avg = 1.0 * sum / n;
    return avg;
}

void kq(int a[], int n) {
    double res = tb(a, n);
    int cnt = 0;
    for(int i = 0; i < n; i++) {
        if(a[i] > res) ++cnt;
    }
    printf("\n%d", cnt);
}

int main() {
    int n, a[MAX];
    nhap(a, n);
    in(a, n);
    boi3(a, n);
    printf("\n");
    in(a, n);
    printf("\n%.2lf", tb(a, n));
    kq(a, n);

    return 0;
}

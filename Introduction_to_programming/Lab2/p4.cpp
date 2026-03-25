#include <stdio.h>

const int MAX = 30;

void khoitao(int a[], int &n) {
    do scanf("%d", &n);
    while(n <= 2 || n >50);
    for(int i = 0; i < n; i++) scanf("%d", &a[i]);
}

void in(int a[], int n) {
    for(int i = n - 1; i >= 0; i--) printf("%d ", a[i]);
}

long long tong(int a[], int n) {
    long long sum = 0;
    for(int i = 0; i < n; i++) sum += a[i];
    return sum;
}

int timln(int a[], int n) {
    int m = a[0];
    for(int i = 1; i < n; i++) {
        if(m < a[i]) m = a[i];
    }
    return m;
}

int demchan(int a[], int n) {
    int cnt = 0;
    for(int i = 0; i < n; i++) {
        if(a[i] % 2 == 0) ++cnt;
    }
    return cnt;
}

int main() {
    int n, a[MAX];
    khoitao(a, n);
    in(a, n);
    long long sum = tong(a, n); printf("\n%lld", sum);
    int m = timln(a, n); printf("\n%d", m);
    int cnt = demchan(a, n); printf("\n%d", cnt);
}

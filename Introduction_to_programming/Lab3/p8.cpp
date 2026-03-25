#include <stdio.h>

const int MAX = 50;

void nhap(int a[], int &n) {
    do scanf("%d", &n);
    while(n <= 2 || n > 50);
    for(int i = 0; i < n; i++) scanf("%d", &a[i]);
}

void in(int a[], int n) {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

void xoa(int a[], int &n, int x, int b[], int &index) {
    for(int i = 0; i < n; i++) {
        if(x == a[i]) continue;
        b[index] = a[i];
        ++index;
    }
}

void them(int a[], int &n, int y) {
    ++n;
    for(int i = n - 1; i > 0; i--) a[i] = a[i -1];
    a[0] = y;
}

int cnt[1000001] = {0};

void xoatrung(int a[], int n, int &m) {
    for(int i = 0; i < n; i++) {
        ++cnt[a[i]];
        m = (m > a[i]) ? m : a[i];
    }
}

int main() {
    int n, a[MAX];
    nhap(a, n);
    in(a, n); printf("\n");
    int x; scanf("%d", &x);
    int b[MAX], index = 0;
    xoa(a, n, x, b, index);
    in(b, index); printf("\n");
    int y; scanf("%d", &y);
    them(b, index, y);
    in(b, index); printf("\n");
    int m = -1000000;
    xoatrung(b, index, m);
    for(int i = 0; i <= m; i++) {
        if(cnt[i]) printf("%d ", i);
    }

    return 0;
}

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

void sapxep(int a[], int n) {
    for(int i = 0; i < n - 1; i++) {
        for(int j = 0; j < n - i - 1; j++) {
            if(a[j] > a[j + 1]) {
                int t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
            }
        }
    }
}

void tron(int a[], int n, int b[], int m, int c[], int &index) {
    int i = 0, j = 0;
    while(i < n && j < m) {
        if(a[i] < b[j]) {
            c[index] = a[i];
            ++index;
            ++i;
        }
        else {
            c[index] = b[j];
            ++index;
            ++j;
        }
    }
    while(i < n) {
        c[index] = a[i];
        ++index;
        ++i;
    }
    while(j < m) {
        c[index] = b[j];
        ++index;
        ++j;
    }
}

int main() {
    int n, m, a[MAX], b[MAX];
    nhap(a, n); nhap(b, m);
    in(a, n); printf("\n"); in(b, m); printf("\n");
    sapxep(a, n); sapxep(b, m);
    in(a, n); printf("\n"); in(b, m); printf("\n");
    int index = 0, c[MAX * 2 + 1];
    tron(a, n, b, m, c, index);
    in(c, index);

    return 0;
}

#include <stdio.h>

const int MAX = 50;

void khoitao(int a[], int &n) {
    do scanf("%d", &n);
    while(n <= 3 || n > 50);
    for(int i = 0; i < n; i++) scanf("%d", &a[i]);
}

void in(int a[], int n) {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

int nto(int n) {
    for(int i = 2; i * i <= n; i++) {
        if(n % i == 0) return 0;
    }
    if(n > 1) return 1;
    return 0;
}

void innto(int a[], int n) {
    for(int i = 0; i < n; i++) {
        if(nto(a[i])) printf("%d ", a[i]);
    }
}

int demle(int a[], int n) {
    int cnt = 0;
    for(int i = 0; i < n; i++) {
        if(a[i] % 2 != 0) ++cnt;
    }
    return cnt;
}

int demtb(int a[], int n) {
    int cnt = 0;
    for(int i = 1; i < n - 1; i++) {
        if ((2 * a[i] - a[i + 1]) == a[i - 1]) ++cnt;
    }
    return cnt;
}

int timkiem(int a[], int n, int x) {
    int res = -1;
    for(int i = 0; i < n; i++) {
        if(a[i] == x) {
            res = i;
            break;
        }
    }
    return res;
}

int main() {
    int n, a[MAX];
    khoitao(a, n);
    in(a, n); printf("\n");
    innto(a, n); printf("\n");
    int cnt1 = demle(a, n); printf("%d\n", cnt1);
    int cnt2 = demtb(a, n); printf("%d\n", cnt2);
    int x; scanf("%d", &x);
    int tk = timkiem(a, n, x);
    if(tk == -1) printf("NO\n");
    else if(tk > -1) printf("YES\n");
}

#include <stdio.h>
#include <math.h>

const int MAX = 50;

void nhap(int a[], int &n) {
    do scanf("%d", &n);
    while(n <= 2 || n > 50);
    for(int i = 0; i < n; i++) scanf("%d", a + i);
}

void in(int a[], int n) {
    for(int i = 0; i < n; i++) printf("%d ", *(a + i));
}

int cp(int n) {
    int can = sqrt(n);
    if(can * can == n) return 1;
    return 0;
}

int mcp(int a[], int n) {
    for(int i = 0; i < n; i++) {
        if(!cp(a[i])) return 0;
    }
    return 1;
}

int snd(int a[], int n ) {
    for(int i = 1; i < n; i += 2) {
        if(a[i] < 0) return 0;
    }
    return 1;
}

int main() {
    int n, a[MAX];
    nhap(a, n);
    in(a, n);
    printf("\n%d", mcp(a, n));
    printf("\n%d", snd(a, n));

    return 0;
}

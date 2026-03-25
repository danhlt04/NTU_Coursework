#include <stdio.h>

int m, n, a[20][20];

void nhap() {
    do {
        printf("nhap so hang : ");
        scanf("%d", &m);
    } while(m < 2 || m > 10);
    do {
        printf("nhap so cot : ");
        scanf("%d", &n);
    } while(n < 2 || n > 10);
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void in() {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) printf("%d ", a[i][j]);
        printf("\n");
    }
}

int dk(int x) {
    int t = x / 100 - x % 10;
    int d = (x / 10) % 10;
    if(t == d) return 1;
    return 0;
}

void solve(int x) {
    int fl = 0;
    for(int i = 0; i < n; i++) {
        if(dk(a[x][i]) == 1) {
            fl = 1;
            printf("%d ", a[x][i]);
        }
    }
    if(!fl) printf("khong co so thoa man\n");
}

void xoa(int x) {
    for(int i = x; i < m - 1; i++) {
        for(int j = 0; j < n; j++) a[i][j] = a[i + 1][j];
    }
    --m;
}

int main() {
    nhap();
    in();
    int d;
    printf("nhap hang d : ");
    scanf("%d", &d);
    solve(d);
    xoa(d);
    in();

    return 0;
}

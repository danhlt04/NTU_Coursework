#include <stdio.h>

const int MAX = 51;

void nhap(float a[][MAX], int &m, int &n) {
    do {
        printf("nhap so hang : ");
        scanf("%d", &m);
    } while(m <= 1 || m > 10);
    do {
        printf("nhap so cot : ");
        scanf("%d", &n);
    } while(n <= 1 || n > 10);
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%f", &a[i][j]);
        }
    }
}

void in(float a[][MAX], int m, int n) {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) printf("%.2f ", a[i][j]);
        printf("\n");
    }
}

void inchuyenvi(float a[][MAX], int m, int n) {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) printf("%.2f ", a[j][i]);
        printf("\n");
    }
}

void xoa(float a[][MAX], int &m, int n, int &i) {
    do {
        printf("nhap hang can xoa : ");
        scanf("%d", &i);
    } while(i < 0 || i >= m);
    for(int j = i; j < m - 1; j++) {
        for(int k = 0; k < n; k++) a[j][k] = a[j + 1][k];
    }
    --m;
}

int main() {
    int m, n;
    float a[MAX][MAX];
    nhap(a, m, n);
    in(a, m, n);
    inchuyenvi(a, m, n);
    int i;
    xoa(a, m, n, i);
    in(a, m, n);

    return 0;
}

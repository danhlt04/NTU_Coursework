#include <stdio.h>

const int MAX = 51;

void nhap(int a[][MAX], int &m, int &n) {
    do {
        printf("nhap so hang : ");
        scanf("%d", &m);
    } while(m <= 2 || m > 10);
    do {
        printf("nhap so cot : ");
        scanf("%d", &n);
    } while(n <= 2 || n > 10);
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void in(int a[][MAX], int m, int n) {
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) printf("%d ", a[i][j]);
        printf("\n");
    }
}

int tongbien(int a[][MAX], int m, int n) {
    int sum = 0;
    for(int i = 0; i < n; i++) sum += a[0][i];
    for(int i = 1; i < m - 1; i++) sum += a[i][0] + a[i][n - 1];
    for(int i = 0; i < n; i++) sum += a[m - 1][i];
    return sum;
}

int gtln(int a[][MAX], int m, int p) {
    int res = a[0][p];
    for(int i = 0; i < m; i++) {
        if(a[i][p] > res) res = a[i][p];
    }
    return res;
}

void hoandoi(int a[][MAX], int m, int n, int j1, int j2) {
    do {
        printf("nhap cot mot : ");
        scanf("%d", &j1);
    } while(j1 < 0 || j1 >= n);
    do {
        printf("nhap cot mot : ");
        scanf("%d", &j2);
    } while(j2 < 0 || j2 >= n || j2 == j1);
    for(int i = 0; i < m; i++) {
        int tmp = a[i][j1];
        a[i][j1] = a[i][j2];
        a[i][j2] = tmp;
    }
}

int main() {
    int m, n, a[MAX][MAX];
    nhap(a, m, n);
    in(a, m, n);
    int sum = tongbien(a, m, n);
    printf("tong bien cua ma tran la : %d\n", sum);
    int p; scanf("%d", &p);
    int max_p = gtln(a, m, p);
    printf("gia tri lon nhat cua cot %d la %d\n", p, max_p);
    int j1, j2;
    int b[MAX][MAX];
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) b[i][j] = a[i][j];
    }
    hoandoi(b, m, n, j1, j2);
    in(b, m, n);

    return 0;
}

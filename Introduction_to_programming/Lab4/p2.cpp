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

int dem(float a[][MAX], int m, int n, float x) {
    int cnt = 0;
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            if(a[i][j] == x) ++cnt;
        }
    }
    return cnt;
}

void hoandoi(float a[][MAX], int m, int n, int i1, int i2) {
    do {
        printf("nhap hang mot : ");
        scanf("%d",&i1);
    } while(i1 < 0 || i1 >= m);
    do {
        printf("nhap hang hai : ");
        scanf("%d", &i2);
    } while(i2 < 0 || i2 >= m || i2 == i1);
    for(int i = 0; i < n; i++) {
        int tmp = a[i1][i];
        a[i1][i] = a[i2][i];
        a[i2][i] = tmp;
    }
}

double tong(float a[][MAX], int m, int n) {
    double sum = 0;
    for(int i = 0; i < n; i++) sum += a[m][i];
    return sum;
}

int main() {
    int n, m;
    float a[MAX][MAX];
    nhap(a, m, n);
    in(a, m, n);
    float x; scanf("%f", &x);
    int cnt = dem(a, m, n, x);
    printf("so luong phan tu giong voi %.2f la %d\n", x, cnt);
    float b[MAX][MAX];
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) b[i][j] = a[i][j];
    }
    int i1, i2;
    hoandoi(b, m, n, i1, i2);
    in(b, m, n);
    for(int i = 0; i < m; i++) {
        double sum = tong(a, i, n);
        printf("tong hang %d la %.2lf\n", i, sum);
    }

    return 0;
}

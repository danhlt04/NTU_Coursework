#include <stdio.h>

const int MAX = 51;

void nhap(int a[][MAX], int &n) {
    do {
        printf("nhap so hang va so cot : ");
        scanf("%d", &n);
    } while(n <= 1 || n > 10);
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void in(int a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) printf("%d ", a[i][j]);
        printf("\n");
    }
}

void inchan(int a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(a[i][j] % 2) printf("* ");
            else printf("%d ", a[i][j]);
        }
        printf("\n");
    }
}

void tamgiacnguoc(int a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(j < i) printf("  ");
            else printf("%d ", a[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int n, a[MAX][MAX];
    nhap(a, n);
    in(a, n);
    inchan(a, n);
    tamgiacnguoc(a, n);

    return 0;
}

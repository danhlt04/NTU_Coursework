#include <stdio.h>

const int MAX = 51;

void nhap(int a[][MAX], int &n) {
    do {
        printf("nhap so hang va so cot : ");
        scanf("%d", &n);
    } while(n <= 2 || n > 10);
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

void inle(int a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(a[i][j] % 2) printf("%d ", a[i][j]);
            else printf("? ");
        }
        printf("\n");
    }
}

void tamgiacduoi(int a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(j < n - i - 1) printf("  ");
            else printf("%d ", a[i][j]);
        }
        printf("\n");
    }
}

int tongchan(int a[][MAX], int n) {
    int sum = 0;
    for(int i = 0; i < n; i++) {
        if(a[i][i] % 2 == 0) sum += a[i][i];
    }
    return sum;
}

int main() {
    int n, a[MAX][MAX];
    nhap(a, n);
    in(a, n);
    inle(a, n);
    tamgiacduoi(a, n);
    int sum = tongchan(a, n);
    printf("%d\n", sum);

    return 0;
}

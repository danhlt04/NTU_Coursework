#include <stdio.h>

const int MAX = 51;

void nhap(float a[][MAX], int &n) {
    do {
        printf("nhap so hang va so cot : ");
        scanf("%d", &n);
    } while(n <= 1 || n > 10);
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%f", &a[i][j]);
        }
    }
}

void in(float a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) printf("%.2f ", a[i][j]);
        printf("\n");
    }
}

double trungbinhcong(float a[][MAX], int n) {
    double sum = 0;
    for(int i = 0; i < n; i++) sum += a[i][i];
    return sum / n;
}

int check(float a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(a[i][j] < 0) return 0;
        }
    }
    return 1;
}

int main() {
    int n;
    float a[MAX][MAX];
    nhap(a, n);
    in(a, n);
    double avg = trungbinhcong(a, n);
    printf("%.2lf\n", avg);
    if(check(a, n)) printf("mang toan so duong\n");
    else printf("mang co phan tu am\n");


    return 0;
}

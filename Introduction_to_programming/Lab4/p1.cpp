#include <stdio.h>

const int MAX = 51;
int n, m, a[MAX][MAX];

void nhap() {
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

int timmax() {
    int max_num = a[0][0];
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            if(a[i][j] > max_num) max_num = a[i][j];
        }
    }
    return max_num;
}

int main() {
    nhap();
    in();
    int res = timmax();
    printf("gia tri lon nhat cua ma tran la : %d", res);

    return 0;
}

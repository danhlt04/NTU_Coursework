#include <stdio.h>

const int MAX = 51;

void nhap(int a[][MAX], int &n) {
    do {
        printf("nhap so hang va so cot : ");
        scanf("%d", &n);
    } while(n < 3 || n > 10);
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

int check(int a[][MAX], int n) {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(i == j) {
                if(a[i][j] != 1) return 0;
            }
            if(a[i][j] != 0) return 0;
        }
    }
    return 1;
}

int palindrome(int a[][MAX], int n) {
    int b[MAX][MAX];
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) b[i][j] = a[j][j];
    }
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            if(b[i][j] != a[i][j]) return 0;
        }
    }
    return 1;
}

int main() {
    int n, a[MAX][MAX];
    nhap(a, n);
    in(a, n);
    if(check(a, n)) printf("ma tran vua nhap la ma tran don vi\n");
    else printf("ma tran vua nhap khong phai ma tran don vi\n");
    if(palindrome(a, n)) printf("ma tran vua nhap la ma tran doi xung\n");
    else printf("ma tran vua nhap khong phai ma tran doi xung\n");

    return 0;
}

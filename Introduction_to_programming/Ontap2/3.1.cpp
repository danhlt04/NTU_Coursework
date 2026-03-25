#include <stdio.h>

int n, a[10][10];

void nhap() {
    do {
        printf("nhap bac ma tran : ");
        scanf("%d", &n);
    } while(n < 2 || n > 10);
    
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            printf("a[%d][%d] : ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void in() {
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) printf("%d ", a[i][j]);
        printf("\n");
    }
}

void giao() {
    if(n % 2 == 0) printf("khong co phan tu phu hop\n");
    else {
        int cnt = 0;
        for(int i = 0; i < n; i++) {
            for(int j = 0; j < n; j++) {
                if(a[i][j] == a[n / 2][n / 2]) ++cnt;
                else continue;
            }
        }
        printf("phan tu nam o diem giao hai duong cheo va so lan xuat hien : %d %d\n", a[n / 2][n / 2], cnt);
    }
}

int check(int x) {
    int res = x / 100 + x % 10;
    int mid = (x / 10) % 10;
    if(res == mid) return 1;
    return 0;
}

void solve() {
    int d, cnt = 0; 
    do {
        printf("nhap d : ");
        scanf("%d", &d);
    } while(d < 0 || d >= n);
    
    for(int i = 0; i < n; i++) {
        if(check(a[d][i])) ++cnt;
    }
    printf("so phan tu tren hang %d theo yeu cau : %d\n", d, cnt);
}

int main()
{
    nhap();
    in();
    giao();
    solve();

    return 0;
}
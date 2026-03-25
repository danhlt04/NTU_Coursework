#include <stdio.h>

int m, n, a[10][10];

void nhap() {
    do {
        printf("nhap so hang : ");
        scanf("%d", &m);
    } while(m < 3 || m > 10);
    do {
        printf("nhap so cot : ");
        scanf("%d", &n);
    } while(n < 3 || m > 10);
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

double solve() {
    double avg = 0;
    int cnt = 0;
    for(int i = 0; i < n; i++) {
        ++cnt;
        avg += a[0][i];
    }
    for(int i = 0; i < n; i++) {
        ++cnt;
        avg += a[m - 1][i];
    }
    for(int i = 1; i < m - 1; i++) {
        cnt += 2;
        avg += a[i][0] + a[i][n - 1];
    }
    return avg / cnt;
}

int tonguoc(int x) {
    int res = 1;
    for(int i = 2; i * i <= x; i++) {
        if(x % i == 0) {
            res += i;
            if(x / i != i) res += x / i;
        }
    }
    return res;
}

void stt() {
    int c;
    do {
        printf("nhap cot c : ");
        scanf("%d", &c);
    } while (c < 0 || c >= n);
    for(int i = 0; i < m; i++) {
        for(int j = i + 1; j < m; j++) {
            if(tonguoc(a[i][c]) == a[j][c] && tonguoc(a[j][c]) == a[i][c]) {
                printf("%d %d\n", a[i][c], a[j][c]);
                return;
            }
        }
    }
    printf("khong co cap so than thiet trong cot %d\n", c);
}

int main() {
    nhap();
    in();
    printf("%.2lf\n", solve());
    stt();

    return 0;
}

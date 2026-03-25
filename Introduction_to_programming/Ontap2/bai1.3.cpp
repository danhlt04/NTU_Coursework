#include <stdio.h>
#include <math.h>

int n, a[50];

void nhap() {
    do {
        printf("nhap so phan tu cua mang : ");
        scanf("%d", &n);
    } while(n <= 3 || n > 50);
    for(int i = 0; i < n; i++) {
        printf("a[%d] : ", i);
        scanf("%d", &a[i]);
    }
}

void in() {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

int scp(int x) {
    int can = sqrt(x);
    if(can * can == x) return 1;
    return 0;
}

int minscp() {
    int res = 1e9;
    for(int i = 0; i < n; i++) {
        if(scp(a[i]) && a[i] < res) res = a[i];
    }
    return res;
}

void indk() {
    int cnt = 0;
    for(int i = 1; i < n - 1; i += 2) {
        if(a[i - 1] + a[i + 1] == a[i]) ++cnt;
    }
    printf("%d\n", cnt);
    for(int i = 1; i < n - 1; i += 2) {
        if(a[i - 1] + a[i + 1] == a[i]) printf("%d ", a[i]);
    }
}

int main() {
    nhap();
    in();
    if(minscp() == 1e9) printf("khong co so chinh phuong trong day so\n");
    else printf("%d\n", minscp());
    indk();

    return 0;
}

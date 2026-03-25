#include <stdio.h>

int n, a[50];

void nhap() {
    do {
        printf("nhap so phan tu co trong mang : ");
        scanf("%d", &n);
    } while(n < 3 || n > 50);
    for(int i = 0; i < n; i++) {
        printf("a[%d] : ", i);
        scanf("%d", &a[i]);
    }
}

void in() {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

int tongnam() {
    int res = 0;
    for(int i = 0; i < n; i++) {
        if(a[i] % 10 == 5) res += a[i];
    }
    return res;
}

void phantuam() {
    int cnt = 0, res = -1e9;
    for(int i = 0; i < n; i++) {
        if(a[i] < 0 && a[i] > res) res = a[i];
    }
    for(int i = 0; i < n; i++) {
        if(a[i] == res) ++cnt;
    }
    if(res == -1e9) printf("khong co phan tu am trong mang\n");
    else printf("phan tu am lon nhat trong mang va so lan xuat hien : %d %d\n", res, cnt);
}

int main() {
    nhap();
    in(); printf("\n");
    printf("tong gia tri cac phan tu co chu so tan cung la 5 : %d\n", tongnam());
    phantuam();

    return 0;
}

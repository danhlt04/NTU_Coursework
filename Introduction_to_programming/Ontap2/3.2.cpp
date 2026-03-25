#include <stdio.h>
#include <math.h>

int n, a[50];

void nhap() {
    do {
        printf("nhap so luong phan tu : ");
        scanf("%d", &n);
    } while(n < 2 || n > 50);
    
    for(int i = 0; i < n; i++) {
        printf("a[%d] : ", i);
        scanf("%d", &a[i]);
    }
}

void in() {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

void gtln() {
	int cnt = 0, max_num = a[0];
	for(int i = 1; i < n; i++) {
		if(max_num < a[i]) max_num = a[i];
	}
	
	for(int i = 0; i < n; i++) {
		if(a[i] == max_num) ++cnt;
	}
	printf("gia tri lon nhat trong mang va so lan xuat hien : %d %d\n", max_num, cnt);
}

int uocso(int x) {
	int can = sqrt(x);
	int res = 1;
	for(int i = 2; i <= can; i++) {
		if(x % i == 0) {
			res += i;
			if(x / i != i) res += x / i;
		}
	}
	
	return res;
}

void sothanthiet() {
	for(int i = 0; i < n- 1; i++) {
		for(int j = i + 1; j < n; j++) {
			if(uocso(a[i]) == a[j] && a[i] == uocso(a[j])) {
				printf("cap so than thiet dau tien trong mang la : %d %d\n", a[i], a[j]);
				return;
			}
		}
	}
	printf("khong co cap so than thiet nao trong mang\n");
}

int main()
{
    nhap();
    in(); printf("\n");
    gtln();
    sothanthiet();

    return 0;
}
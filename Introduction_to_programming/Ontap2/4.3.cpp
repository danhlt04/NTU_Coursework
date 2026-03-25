#include <stdio.h>
#include <math.h>

int n, a[50];

void nhap() {
	do {
		printf("nhap so luong phan tu mang : ");
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

int socp(int x) {
	if(x < 2) return 0;
	int can = sqrt(x);
	if(can * can == x) return 1;
	return 0;
}

void demcp() {
	int cnt = 0;
	for(int i = 0; i < n; i++) {
		if(socp(a[i])) ++cnt;
	}
	if(cnt == 0) printf("khong co so chinh phuong trong mang\n");
	else printf("so chinh phuong co trong mang la : %d\n", cnt);
}

void solve() {
	int cnt = 0;
	for(int i = 1; i < n; i++) {
		if(a[i] == a[i - 1] + a[i + 1]) ++cnt;
	}
	printf("so luong phan tu o vi tri le theo yeu cau : %d\n", cnt);
}

int main() {
	nhap();
	in(); printf("\n");
	demcp();
	solve();
	
	return 0;
}
#include <stdio.h> 

int n, a[10][10];

void nhap() {
	do {
		printf("nhap bac cua ma tran : ");
		scanf("%d", &n);
	} while(n < 2 || n > 10);
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			printf("a[%d][%d] = ", i, j);
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

int tongchan() {
	int sum = 0;
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			if(a[i][j] > 9 && a[i][j] < 100 && a[i][j] % 2 == 0) sum += a[i][j];
		}
	}	
	return sum;
}

int gtnn() {
	int res = 1e9;
	for(int i = 0; i < n; i++) {
		for(int j = i; j < n; j++) {
			if(a[i][j] < res) res = a[i][j];
		}
	}
	return res;
}

int main() {
	nhap();
	in();
	printf("tong cac phan tu co gia tri chan va la so co hai chu so : %d", tongchan());
	printf("\ngia tri nho nhat thuoc tam giac tren ma tran : %d", gtnn());
	
	return 0;
}

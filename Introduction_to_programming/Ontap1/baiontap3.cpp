#include <stdio.h> 

int n, a[50];

void nhap() {
	do {
		printf("nhap so phan tu cua mang : ");
		scanf("%d", &n);
	} while(n < 3 || n > 50);
	for(int i = 0; i < n; i++) {
		printf("a[%d] = ", i);
		scanf("%d", &a[i]);
	}
}

void in() {
	for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

int tong() {
	int sum = 0;
	for(int i = 0; i < n; i++) {
		if(a[i] % 10 == 3) sum += a[i];
	} 
	return sum;
}

int gtnn() {
	int min_value = 1e9;
	for(int i = 0; i < n; i++) {
		if(a[i] < min_value) min_value = a[i];
	}
	return min_value; 
}

int count() {
	int res = 0, tmp = gtnn();
	for(int i = 0; i < n; i++) {
		if(a[i] == tmp) ++res;
	}
	return res;
}

int main() {
	nhap();
	in();
	printf("\ntong cac phan tu co chu so tan cung la 3 : %d", tong());
	printf("\n");
	printf("gia tri nho nhat trong mang la %d va xuat hien %d lan", gtnn(), count());
	
	return 0;
}

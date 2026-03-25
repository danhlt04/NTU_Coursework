#include <stdio.h>
#include <math.h>

int n, m, a[10][10];

void nhap() {
	do {
		printf("nhap so hang : ");
		scanf("%d", &n);
	} while(n < 3 || n > 10);
	do {
		printf("nhap so cot : ");
		scanf("%d", &m);
	} while(m < 3 || m > 10);
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) {
			printf("a[%d][%d] = ", i, j);
			scanf("%d", &a[i][j]);
		}
	}
}

void in() {
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) printf("%d ", a[i][j]);
		printf("\n");
	}
}

int scp(int n) {
	int can = sqrt(n);
	if(can * can == n) return 1;
	return 0;
}

int solve1(int &d) {
	do {
		printf("nhap hang d : ");
		scanf("%d", &d);
	} while(d >= n || d < 0);
	int sum = 0;
	for(int i = 0; i < m; i++) {
		if(scp(a[d][i])) sum += a[d][i];
	}
	return sum;
}

int tonguoc(int n) {
	int res = 1;
	for(int i = 2; i <= sqrt(n); i++) {
		if(n % i == 0) {
			res += i;
			if(n / i != i) res += n / i;
		}
	}
}

int solve2(int &c) {
	do {
		printf("nhap cot c : ");
		scanf("%d", &c);
	} while(c >= m || c < 0);
	for(int i = 0; i < n - 1; i++) {
		for(int j = i + 1; j < n; j++) {
			if(tonguoc(a[i][c]) == a[j][c] && tonguoc(a[j][c]) == a[i][c]) return 1;
		}
	} 
	return 0;
}

int main() {
	nhap();
	in();
	int d;
	printf("tong so chinh phuong cua hang %d la : %d\n", d, solve1(d));
	int c; 
	if(solve2(c) == 1) printf("hang %d co cap so than thiet\n", c);
	else printf("hang %d khong co cap so than thiet\n");
	
	return 0;
}

#include <stdio.h>

const int MAX = 30;

void nhap(float a[], int &n) {
	do scanf("%d", &n);
	while(n <= 2 || n > 30);
	for(int i = 0; i < n; i++) scanf("%f", &a[i]);
}

void in(float a[], int n) {
	for(int i = 0; i < n; i++) printf("%.1f ", a[i]);
}

int tk(float a[], int n, float x) {
	for(int i = 0; i < n; i++) {
		if(x == a[i]) return i;
	}
	return -1;
}

void nhieupt(float a[], int n) {
	for(int i = 0; i < n; i++) {
		for(int j = i + 1; j < n; j++) {
			if(a[i] == a[j]) {
				printf("%.1f ", a[i]);
				break;
			}
		}
	}
}

void xoa(float a[], int n, int p) {
	for(int i = 0; i < p; i++) printf("%.1f ", a[i]);
	for(int i = p + 1; i < n; i++) printf("%.1f ", a[i]);
}

int main() {
	int n; 
	float a[MAX];
	nhap(a, n);
	in(a, n); printf("\n");
	float x; scanf("%f", &x);
	int res = tk(a, n, x);
	printf("%d\n", res);
	nhieupt(a, n); printf("\n");
	int p; scanf("%d", &p);
	xoa(a, n, p);
	
	return 0;
}
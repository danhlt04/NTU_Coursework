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

void tonglk(float a[], int n) {
	for(int i = 1; i < n - 1; i++) {
		if(a[i - 1] + a[i + 1] == a[i]) printf("%.1f ", a[i]);
	}
}

void nhieupt(float a[], int n) {
	int max_cnt = 0, current_cnt = 1;
	float first_num;
	for(int i = 0; i < n; i++) {
		for(int j = i + 1; j < n; j++) {
			if(a[j] == a[i]) ++current_cnt;
		}
		if(current_cnt > max_cnt) {
			max_cnt = current_cnt;
			first_num = a[i];
		}
		current_cnt = 1;
	}
	printf("%.1f %d\n", first_num, max_cnt);
}

void ptkhac(float a[], int n) {
	float b[MAX];
	for(int i = 0; i < n; i++) b[i] = a[i];
	for(int i = 0; i < n; i++) {
		for(int j = i + 1; j < n; j++) {
			if(a[j] == a[i]) {
				b[j] = 1000001;
			}
		}
	}
	int cnt = 0;
	for(int i = 0; i < n; i++) {
		if(b[i] < 1000000) ++cnt;
	}
	printf("%d\n", cnt);
	for(int i = 0; i < n; i++) {
		if(b[i] < 1000000) printf("%.1f ", b[i]);
	}
}

int main() {
	int n; 
	float a[MAX];
	nhap(a, n);
	in(a, n); printf("\n");
	tonglk(a, n); printf("\n");
	nhieupt(a, n);
	ptkhac(a, n); printf("\n");
}
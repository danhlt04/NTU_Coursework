#include <stdio.h>

#define MAX 50

void PrintArray(float a[], int n) {
	for(int i = 0; i < n; i++) printf("%.2f ", a[i]);
	printf("\n");
}

int Greater(float a[], int l, int r, float x) {
	if(l == r) return a[l] > x ? 1 : 0;
	int m = (l + r) / 2;
	return Greater(a, l, m, x) + Greater(a, m + 1, r, x);
}

float EvenPosition(float a[], int l, int r) {
	if(l == r) return (l & 1) ? a[l] : 0;
	int m = (l + r) / 2;
	return EvenPosition(a, l, m) + EvenPosition(a, m + 1, r);
}

int main() {
	float a[] = {3.5, 7.1, 9.5, 1.1, 2.4};
	int n = sizeof(a)/sizeof(a[0]);
	PrintArray(a, n);
	float x;
	scanf("%f", &x);
	printf("%d\n", Greater(a, 0, n - 1, x));
	printf("%.2f\n", EvenPosition(a, 0, n - 1));

	return 0;
}
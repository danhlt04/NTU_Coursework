#include <stdio.h>

#define MAX 50

void PrintArray(float a[], int n) {
	for(int i = 0; i < n; i++) printf("%.2f ", a[i]);
	printf("\n");
}

float MaxValue(float a[], int l, int r) {
	if(l == r) return a[l];
	int m = (l + r) / 2;
	return MaxValue(a, l, m) > MaxValue(a, m + 1, r) ? MaxValue(a, l, m) : MaxValue(a, m + 1, r);
}

float SumOfPositive(float a[], int l, int r) {
	if(l == r) return a[l] > 0 ? a[l] : 0;
	int m = (l + r) / 2;
	return SumOfPositive(a, l, m) + SumOfPositive(a, m + 1, r);
}

int main() {
	float a[] = {3.5, 7.1, 9.5, 1.1, 2.4};
	int n = sizeof(a)/sizeof(a[0]);
	PrintArray(a, n);
	printf("%.2f\n", MaxValue(a, 0, n - 1));
	printf("%.2f\n", SumOfPositive(a, 0, n - 1));

	return 0;
}
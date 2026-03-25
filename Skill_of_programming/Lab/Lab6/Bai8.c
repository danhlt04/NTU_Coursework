#include <stdio.h>

#define MAX 50

void PrintArray(int a[], int n) {
	for(int i = 0; i < n; i++) printf("%d ", a[i]);
	printf("\n");
}

int IncreaseArray(int a[], int l, int r) {
	if(l == r) return 1;
	int m = (l + r) / 2;
	if(!IncreaseArray(a, l, m)) return 0;
	if(!IncreaseArray(a, m + 1, r)) return 0;
	return a[m] < a[m + 1];
}

int main() {
	int a[] = {5, 7, 9, 11, 24, 10};
	int n = sizeof(a) / sizeof(a[0]);
	PrintArray(a, n);
	printf("%d\n", IncreaseArray(a, 0, n - 1));

	return 0;
}
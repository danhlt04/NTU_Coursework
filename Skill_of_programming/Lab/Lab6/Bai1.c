#include <stdio.h>

int a[20], n, k, m;

void PrintArray() {
	for(int i = 0; i < n; i++) printf("%d ", a[i]);
	printf("\n");
}

void Try(int i, int CountOne, int CountZero) {
	for(int j = 0; j < 2; j++) {
		CountOne += j;
		CountZero = (j == 0 ? CountZero + 1 : 0);
		if(CountZero == m) return;
		a[i] = j;
		if(i == n) {
			if(CountOne == k) PrintArray();
			return;
		} else Try(i + 1, CountOne, CountZero);
		CountOne -= j;
	}
}

int main() {
	scanf("%d%d%d", &n, &k, &m);
	Try(0, 0, 0);
	
	return 0;
}
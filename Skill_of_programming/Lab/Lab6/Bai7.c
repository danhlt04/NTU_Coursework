#include <stdio.h>

int a[20], n, cnt;
char x[20], ans[100005][20];

void PrintArray() {
	for(int i = 0; i < n; i++) ans[cnt][i] = x[i];
	++cnt;
}

void Try(int i, int sum) {
	if(i == n) {
		if(sum == 0) PrintArray();
		return;
	}
	x[i] = '+';
	Try(i + 1, sum + a[i]);
	x[i] = '-';
	Try(i + 1, sum - a[i]);
}

int main() {
	scanf("%d", &n);
	for(int i = 0; i < n; i++) scanf("%d", &a[i]);
	Try(1, a[0]);
	printf("%d\n", cnt);
	for(int i = 0; i < cnt; i++) {
		for(int j = 0; j < n; j++) printf("%d %c ", a[j], ans[i][j + 1]);
		printf("\n");
	}
	
	return 0;
}
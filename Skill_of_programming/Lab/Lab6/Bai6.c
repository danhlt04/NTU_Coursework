#include <stdio.h>

int a[50], n, cnt;
char x[50], ans[100005][50];

void PrintArray() {
	for(int j = 0; j < n; j++) ans[cnt][j] = x[j];
	++cnt;
}

void Try(int i, int s1, int s2) {
	if(i == n) {
		if(s1 == s2) PrintArray();
		return;
	}
	x[i] = 'A';
	Try(i + 1, s1 + a[i], s2);
	x[i] = 'B';
	Try(i + 1, s1, s2 + a[i]);
}

int main() {
	scanf("%d", &n);
	for(int i = 0; i < n; i++) scanf("%d", &a[i]);
	Try(0, 0, 0);
	for(int i = 0; i < cnt; i++) {
		for(int j = 0; j < n; j++) printf("%c ", ans[i][j]);
		printf("\n");
	}
	if(cnt == 0) printf("Khong chia duoc\n");
	
	return 0;
}
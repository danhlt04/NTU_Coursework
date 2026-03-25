#include <stdio.h>

int a[20], n, k, m, cnt;
char ans[100005][20];

void PrintArray() {
	for(int i = 0; i < n; i++) {
		if(a[i]) ans[cnt][i] = 'x';
		else ans[cnt][i] = '_';
	}
	++cnt;
}

void Try(int start, int i, int CountOne, int CountZero) {
	for(int j = 0; j < 2; j++) {
		CountOne += j;
		CountZero = (j == 0 ? CountZero + 1 : 0);
		if(CountZero == m && i + 1 != n && j) return;
		a[i] = j;
		if(i == n) {
			if(CountOne >= k) PrintArray();
			return;
		} else Try(start, i + 1, CountOne, CountZero);
		CountOne -= j;
	}
}

int main() {
	scanf("%d%d%d", &n, &m, &k);
	Try(0, 0, 0, 0);
	if(cnt) {
		printf("%d\n", cnt);
		for(int i = 0; i < cnt; i++) {
			for(int j = 0; j < n; j++) printf("%c", ans[i][j]);
			printf("\n");
		}
	} else printf("-1\n");
	
	return 0;
}
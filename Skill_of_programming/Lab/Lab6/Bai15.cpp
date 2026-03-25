#include <stdio.h>

long long max(long long a, long long b) { return a > b ? a : b; }

int main() {
	int w[30], v[30], n, m;
	scanf("%d%d", &n, &m);
	for(int i = 0; i < n; i++) scanf("%d", &w[i]);
	for(int i = 0; i < n; i++) scanf("%d", &v[i]);
	long long knapsack[30][30];
	for(int i = 0; i <= 30; i++) {
		for(int j = 0; j <= 30; j++) knapsack[i][j] = 0;
	}
	for(int i = 0; i < n; i++) {
		for(int j = w[i]; j <= m; j++) knapsack[i][j] = max(knapsack[i - 1][j], knapsack[i - 1][j - w[i]] + v[i]);
	}
	printf("%ld\n", knapsack[n][m]);
	
	return 0;
}
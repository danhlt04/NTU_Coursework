#include <stdio.h>

long long max(long long a, long long b) { return a > b ? a : b; }

int main() {
	int a[10005], n;
	scanf("%d", &n);
	for(int i = 0; i < n; i++) scanf("%d", &a[i]);
	long long lis[10005], ans = 0;
	for(int i = 0; i < n; i++) {
		lis[i] = 1;
		for(int j = 0; j < i; j++) {
			if(a[i] > a[j]) lis[i] = max(lis[i], lis[j] + 1);
		}
		ans = max(ans, lis[i]);
	}
	printf("%ld\n", ans);
	
	return 0;
}
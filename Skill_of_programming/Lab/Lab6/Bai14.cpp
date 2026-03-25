#include <stdio.h>

int main() {
	int a[10005], n, s;
	scanf("%d%d", &n, &s);
	for(int i = 0; i < n; i++) scanf("%d", &a[i]);
	int subsetsum[10005];
	for(int i = 0; i <= s; i++) subsetsum[i] = 0;
	subsetsum[0] = 1;
	for(int i = 0; i < n; i++) {
		for(int j = s; j >= a[i]; j--) subsetsum[j] = subsetsum[j] || subsetsum[j - a[i]];
	}
	printf("%ld\n", subsetsum[s]);
	
	return 0;
}
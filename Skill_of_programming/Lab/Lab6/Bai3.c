#include <stdio.h>

int a[20], s1[20], s2[20], n, k, h;

void Try(int i, int sum1, int sum2) {
	if(i == n) {
		if(sum1 == sum2) {
			for(int j = 0; j < k; j++) printf("%d ", s1[j]);
			printf("\n");
			for(int j = 0; j < h; j++) printf("%d ", s2[j]);
			printf("\n");
		}
		return;
	}
	if(i == 0) {
		s1[k++] = a[i];
		Try(i + 1, sum1 + a[i], sum2);
		--k;
	} else {
		s1[k++] = a[i];
		Try(i + 1, sum1 + a[i], sum2);
		--k;
		s2[h++] = a[i];
		Try(i + 1, sum1, sum2 + a[i]);
		--h;
	}
}

int main() {
	scanf("%d", &n);
	for(int i = 0; i < n; i++) scanf("%d", &a[i]);
	Try(0, 0, 0);
	
	return 0;
}
#include <stdio.h> 

int a[20], x[20], n, s;

void PrintArray(int i) {
	for(int j = 0; j < i; j++) printf("%d ", x[j]);
	printf("\n");
}

void Try(int start, int i, int sum) {
	for(int j = i; j < n; j++) {
		x[start++] = a[j];
		if(sum + a[j] == s) {
			PrintArray(start);
			return;
		} else if(sum + a[j] < s) Try(start, j + 1, sum + a[j]);
		--start;
	}
}

int main() {
	scanf("%d%d", &n, &s);
	for(int i = 0; i < n; i++) scanf("%d", &a[i]);
	Try(0, 0, 0);
	
	return 0;
}
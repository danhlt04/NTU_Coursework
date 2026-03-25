#include <stdio.h>

int main() {
	int n;
	do scanf("%d", &n);
	while(n <= 3 || n > 30);
	int a[n], *p = a;
	for(int i = 0; i < n; i++) scanf("%d", p + i);
	for(int i = 0; i < n; i++) printf("%d ", *(p + i));

	return 0;
}

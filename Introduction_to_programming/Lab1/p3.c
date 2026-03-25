#include <stdio.h>

int main()
{
	int n;

	do
	{
		scanf("%d", &n);
	}
	while (!(n > 0 && n < 30));

	for (int i = 0; i < n; i++)
	{
		if (i == 0)
			printf("%d ", 0);
		else if (i == 1)
			printf("%d ", 1);
		else
			printf("%d ",i - 1 + i - 2);
	}

	return 0;
}

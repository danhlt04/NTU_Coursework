#include <stdio.h>

int main()
{
	int h, s, t;

	do
	{
		scanf("%d", &h);
	}
	while (h < 0 || h > 24);

	do
    {
        scanf("%d", &s);
    }
    while(s < 1 || s > 50);

	if (h <= 8)
		t = s * h;
    else
        t = (h - 8) * 1.5 * s + s * 8;

    printf("%d", t);

	return 0;
}

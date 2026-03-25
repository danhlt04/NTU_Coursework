#include <stdio.h>
#include <math.h>

int check(int a, int b, int c)
{
	if (a > 0 && b > 0 && c > 0 && a + b > c && a + c > b && b + c > a)
		return 1;
	else
		return 0;
}

double dttamgiac(int a, int b, int c)
{
	double p = (a + b + c) * 0.5;
	double s = sqrt(p * (p - a) * (p - b) * (p - c));
	
	return s;
}

int main()
{
	int a, b, c;
	scanf("%d%d%d", &a, &b, &c);
	
	if (check(a, b, c))
	{
		double s = dttamgiac(a, b, c);
		printf("%.2lf\n", s);
	}
	else
		printf("INVALID\n");
	
	return 0;
}
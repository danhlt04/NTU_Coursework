#include <stdio.h>
#include <math.h>

int gcd(int x, int y)
{
	while(y)
	{
		int r = x % y;
		x = y;
		y = r;
	}
	
	return x;
}

int check(int x, int y)
{
	if (gcd(x, y) == 1)
		return 1;
	else
		return 0;
}

long long tongsonguyen(int x, int y)
{
	if (x > y)
		return 0;
		
	return ((long long) (y - x + 1) * (x + y) / 2);
}

long long luythua(int x, int y)
{
	/*
	long long t = (long long) x;
	
	for (int i = 1; i <= y; i++)
	{
		t *= x; 
	}
	
	return t; 
	*/
	
	return (long long) pow(x, y);
}

int socp(int x)
{
	int t = sqrt(x);
	
	return (t * t == x);
}

int main()
{
	int x, y;
	scanf("%d%d", &x, &y);
	
	if (check(x, y))
		printf("YES\n");
	else
		printf("NO\n");
		
	printf("%lld\n", tongsonguyen(x, y));
	printf("%lld\n", luythua(x, y));
	
	if (socp(x))
		printf("YES\n");
	else
		printf("NO\n");
	
	return 0;
}
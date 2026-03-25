#include <stdio.h>
#include <math.h>

int perfectnum(int n)
{
    int t = 1;

    for (int i = 2; i <= sqrt(n); i++)
    {
        if (n % i == 0)
        {
            if (n / i != i)
                t += n / i;

            t += i;
        }
    }

    return t == n;
}

int armstrongnum(int n)
{
    int t = 0;
    int r = n;

    while (n)
    {
        int x = n % 10;
        t += x * x * x;
        n /= 10;
    }

    return t == r;
}

int main()
{
    int n;
    scanf("%d", &n);

    if (perfectnum(n))
        printf("YES\n");
    else
        printf("NO\n");

    if (armstrongnum(n))
        printf("YES\n");
    else
        printf("NO\n");

    return 0;
}

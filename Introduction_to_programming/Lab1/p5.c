#include <stdio.h>

double chuoiso(int x, int n)
{
    double s = 0;
    long long m = 0;

    for (int i = 1; i <= n; i++)
    {
        x *= -1;
        m += i;
        s += 1.0 * x / m;
    }

    return s;
}

int main()
{
    int x, n;
    scanf("%d%d", &x, &n);
    double k = chuoiso(x, n);
    printf("%.2lf\n", k);

    return 0;
}

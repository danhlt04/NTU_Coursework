#include <stdio.h>

int ismultiple(int x, int y)
{
    return (x % y == 0);
}

void swap(int x, int y)
{
    int t = y;
    y = x;
    x = y;
}

int ispalindrome(int x, int y)
{
    return (x == -1 * y);
}

int gcd(int x, int y)
{
    while (y)
    {
        int r = x % y;
        x = y;
        y = r;
    }

    return x;
}

int lcm(int x, int y)
{
    return (x * y / caud(x, y));
}

int main()
{
    int x, y;
    scanf("%d%d", &x, &y);

    if (ismultiple(x, y))
        printf("YES\n");
    else
        printf("NO\n");

    swap(x, y);
    printf("%d %d \n", x, y);

    if (ispalindrome(x, y))
        printf("YES\n");
    else
        printf("NO\n");

    if (gcd(x, y))
        printf("%d\n", caud(x, y));
    else
        printf("%d\n", 1);

    if (lcm(x, y))
        printf("%d\n", caue(x, y));
    else
        printf("%d\n", 0);

    return 0;
}

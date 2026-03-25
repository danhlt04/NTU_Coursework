#include <stdio.h>

int main()
{
    for (int i = 1000; i < 10000; i++)
    {
        int x = i;
        long long tong = 0, tich = 1;

        while (x)
        {
            tong += (long long) x % 10;
            tich *= (long long) x % 10;
            x /= 10;
        }

        if (tong == tich)
            printf("%d ", i);
    }

    return 0;
}

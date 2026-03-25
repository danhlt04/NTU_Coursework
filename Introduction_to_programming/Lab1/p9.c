#include <stdio.h>
#include <math.h>

int main()
{
    int n, m;
    long long p;
    
    printf("so nam can tinh : ");
    scanf("%d", &n);
    
    printf("so dan hien tai : ");
    scanf("%lld", &p);
    
    printf("ti le tang dan moi nam (%%) : ");
    scanf("%d", &m);
    
    double r = 1 + 1.0 * m / 100;
    long long kq = p * pow(r, n);
    printf("so dan sau %d nam la %lld", n, kq);
    
    return 0;
}

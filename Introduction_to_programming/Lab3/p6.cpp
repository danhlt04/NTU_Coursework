#include <stdio.h>

const int MAX = 50;

void nhap(int a[], int &n) {
    do scanf("%d", &n);
    while(n <= 2 || n > 50);
    for(int i = 0; i < n; i++) scanf("%d", &a[i]);
}

void in(int a[], int n) {
    for(int i = 0; i < n; i++) printf("%d ", a[i]);
}

int isprime(int n) {
    if(n < 2) return 0;
    for(int i = 2; i * i <= n; i++) {
        if(n % i == 0) return 0;
    }
    return 1;
}

int primearr(int a[], int n) {
    for(int i = 0; i < n; i++) {
        if(!isprime(a[i])) return 0;
    }
    return 1;
}

int palindrome(int a[], int n) {
    for(int i = 0; i < n / 2; i++) {
        if(a[i] != a[n - i - 1]) return 0;
    }
    return 1;
}

int sohh(int n) {
    if(n < 2) return 0;
    int sum = 1;
    for(int i = 2; i * i <= n; i++) {
        if(n % i == 0) {
            sum += i;
            if(n / i != i) sum += n / i;
        }
    }
    if(sum == n) return 1;
    return 0;
}

int demsohh(int a[], int n) {
    int cnt = 0;
    for(int i = 0; i < n; i++) {
        if(sohh(a[i])) ++cnt;
    }
    return cnt;
}

int lastindex(int a[], int n, int x) {
    int index = -1;
    for(int i = 0; i < n; i++) {
        if(x == a[i]) index = i;
    }
    return index;
}

int main() {
    int n, a[MAX];
    nhap(a, n);
    in(a, n); printf("\n");
    printf("%d\n", primearr(a, n));
    printf("%d\n", palindrome(a, n));
    printf("%d\n", demsohh(a, n));
    int x; scanf("%d", &x);
    printf("%d\n", lastindex(a, n, x));

    return 0;
}

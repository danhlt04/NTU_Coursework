#include <stdio.h>
#include <stdlib.h>
#include <time.h>

const int MAX = 30;

void khoitao(int a[], int &n) {
    do {
        scanf("%d", &n);
    } while(n <= 2 || n > 30);
    srand(time(0));
    for(int i = 0; i < n; i++) a[i] = rand() % 100;
}

void dudoan(int a[], int n, int x) {
    scanf("%d", &x);
    int ok = 0;
    for(int i = 0; i < n; i++) {
        if(a[i] == x) {
            printf("YES\n");
            ok = 1;
            break;
        }
    }
    if(!ok) printf("NO\n");
}

void in(int a[], int n) {
    for(int i = 0; i < n; i++) printf("%d ", a[i]); printf("\n");
}

int main() {
    int n;
    int a[MAX];
    khoitao(a, n);
    int x;
    dudoan(a, n, x);
    in(a, n);
}

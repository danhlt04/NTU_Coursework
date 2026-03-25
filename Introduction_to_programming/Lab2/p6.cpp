#include <stdio.h>

const int MAX = 50;

void khoitao(float a[], int &n) {
    do scanf("%d", &n);
    while(n <= 3 || n > 50);
    for(int i = 0; i < n; i++) scanf("%f", &a[i]);
}

void in(float a[], int n) {
    for(int i = 0; i < n; i++) printf("%.1f ", a[i]);
}

void sapxep(float a[], int n) {
    for(int i = 0; i < n - 1; i++) {
        for(int j = 0; j < n - i - 1; j++) {
            if(a[j] > a[j + 1]) {
                float tmp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = tmp;
            }
        }
    }
}

float tong(float a[], int n) {
    float sum = 0;
    for(int i = 1; i < n; i += 2) sum += a[i];
    return sum;
}

int main() {
    int n;
    float a[MAX];
    khoitao(a, n);
    in(a, n); printf("\n");
    sapxep(a, n); in(a, n); printf("\n");
    float sum = tong(a, n); printf("%.1f\n", sum);
}

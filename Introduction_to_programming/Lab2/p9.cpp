#include <stdio.h>

const int MAX = 30;

void khoitao(float a[], int &n) {
    do scanf("%d", &n);
    while(n <= 3 || n > 50);
    for(int i = 0; i < n; i++) scanf("%f", &a[i]);
}

void sapxep(float a[], int n) {
    for(int i = 0; i < n - 1; i++) {
        for(int j = 0; j < n - i - 1; j++) {
            if(a[j] < a[j + 1]) {
                float tmp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = tmp;
            }
        }
    }
}

void in (float a[], int n) {
    for(int i = 0; i < n; i++) printf("%.1f ", a[i]);
}

float tbc(float a[], int n) {
    float sum = 0;
    for(int i = 0; i < n; i++) {
        if(a[i] > 0) sum += a[i];
    }
    return (sum / n);
}

float tong(float a[], int n) {
    float sum = 0;
    for(int i = 0; i < n; i += 2) sum += a[i];
    return sum;
}

double tich(float a[], int n) {
    double mul = 1;
    for(int i = 0; i < n; i += 2) mul *= (double) a[i];
    return mul;
}

int main() {
    int n;
    float a[MAX];
    khoitao(a, n);
    sapxep(a, n);
    in(a, n);
    float avg = tbc(a, n); printf("\n%.2f", avg);
    float sum = tong(a, n); printf("\n%.2f", sum);
    float mul = tich(a, n); printf("\n%.2f", mul);
}

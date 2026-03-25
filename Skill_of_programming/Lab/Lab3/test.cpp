#include <iostream>
#include <string>

int evensum(int n) {
    if(n < 2) return 0;
    return (n & 1) == 0 ? n + evensum(n - 2) : evensum(n - 1);
}

int sumofdigit(int n) {
    if(n / 10 == 0) return n;
    return n % 10 + sumofdigit(n / 10);
}

int sumr(int n, int a, int r, int mul = 1, int i = 0) {
    if(i > n) return 0;
    return a * mul + sumr(n, a, r, mul * r, i + 1);
}

int summodthree(int n) {
    if(n < 3) return 0;
    return n % 3 == 0 ? n + summodthree(n - 3) : summodthree(n - 1);
}

double sumoffraction(int n) {
    if(n == 0) return 0;
    return 1.0 / n + sumoffraction(n - 1);
}

void input(int a[], int *n) {
    do scanf("%d", n);
    while(*n < 2 || *n > 50);
    for(int i = 0; i < *n; i++) scanf("%d", &a[i]);
}

int countevennum(int a[], int n) {
    if(n == 0) return 0;
    return ((a[n - 1] & 1) == 0 ? 1 : 0) + countevennum(a, n - 1);
}

bool prime(int n) {
    if(n < 2) return 0;
    if(n == 2 || n == 3) return 1;
    for(int i = 2; i * i <= n; i++) {
        if(n % i == 0) return 0;
    }
    return 1;
}

int countprimenum(int a[], int n) {
    if(n == 0) return 0;
    return (prime(a[n - 1]) == 1 ? 1 : 0) + countprimenum(a, n - 1);
}

bool checkprime(int a[], int n) {
    return countprimenum(a, n);
}

int firstpos(int a[], int n, int x, int i = 0) {
    if(i == n) return -1;
    return (a[i] == x ? i : firstpos(a, n, x, i + 1));
}

void tower(int n, int src, int aux, int loc) {
    if(n == 0) return;
    tower(n - 1, src, loc, aux);
    printf("%d -> %d\n", src, loc);
    tower(n - 1, aux, src, loc);
}

void input(std::string &s) {
    do std::cin >> s;
    while (s.size() > 100);
}

int countcharacter(const std::string &s, int i = 0) {
    if(i == s.size()) return 0;
    return 1 + countcharacter(s, i + 1);
}

int countlowercharacter(const std::string & s, int i = 0) {
    if(i == s.size()) return 0;
    return ((s[i] >= 'a' && s[i] <= 'z') ? 1 : 0) + countlowercharacter(s, i + 1);
}

bool checkpalindrome(const std::string &s, int i = 0) {
    if(i == s.size() / 2) return (s[i] == s[s.size() - i - 1]) ? 1 : 0;
    return ((s[i] == s[s.size() - i - 1]) ? 1 : 0) & checkpalindrome(s, i + 1);
}

int sumofdigit(const std::string &s, int i = 0) {
    if(i == s.size()) return 0;
    return ((s[i] >= '0' && s[i] <= '9') ? s[i] - '0' : 0) + sumofdigit(s, i + 1);
}

int fact(int n) {
    if(n == 0 || n == 1) return 1;
    return n * fact(n - 1);
}

void dectobin(int n) {
    if(n == 0) return;
    dectobin(n / 2);
    printf("%d", n & 1);
}

int Pell(int n) {
    if(n == 0) return 0;
    if(n == 1) return 1;
    return 2 * Pell(n - 1) + Pell(n - 2);
}

double sumfract(int n) {
    if(n == 0) return 0;
    return 1.0 / n + sumfract(n - 1);
}

int pow(int n, int i = 0) {
    if(i > n) return 1;
    return n * pow(n, i + 1);
}

int sumpow(int n) {
    if(n == 0) return 0;
    return pow(n) + sumpow(n - 1);
}

int sumfact(int n) {
    if(n < 0) return 0;
    return fact(n) + sumfact(n - 1);
}

int fibo(int n) {
    if(n == 0) return 0;
    if(n == 1) return 1;
    return fibo(n - 1) + fibo(n - 2);
}

int sumfibo(int n) {
    if(n < 0) return 0;
    return fibo(n) + sumfibo(n - 1);
}

double sumofgreat(int n) {
    if(n == 0) return 0;
    return (1.0 * n) / (n + 1) + sumofgreat(n - 1);
}

int sumofmul(int n) {
    if(n == 0) return 0;
    return n * (n + 1) + sumofmul(n - 1);
}

void input(double a[], int *n) {
    do scanf("%d", n);
    while(*n < 2 || *n > 50);
    for(int i = 0; i < *n; i++) scanf("%lf", &a[i]);
}

double sumofoddpos(double a[], int n) {
    if(n == 0) return 0;
    return (((n - 1) & 1) == 1 ? a[n - 1] : 0) + sumofoddpos(a, n - 1);
}

double mulofarray(double a[], int n) {
    if(n == 0) return 1;
    return a[n - 1] * mulofarray(a, n - 1);
}

int countvalue(double a[], int n, double x) {
    if(n == 0) return 0;
    return (a[n - 1] == x ? 1 : 0) + countvalue(a, n - 1, x);
}

int fullofpositive(double a[], int n) {
    if(n == 0) return 1;
    return (a[n - 1] > 0 ? 1 : 0) & fullofpositive(a, n - 1);
}

void input(std::string &s) {
    do std::cin >> s;
    while(s.size() > 100);
}

int countdigit(const std::string &s, int i = 0) {
    if(i == s.size()) return 0;
    return ((s[i] >= '0' && s[i] <= '9') ? 1 : 0) + countdigit(s, i + 1);
}

int countupper(const std::string &s, int i = 0) {
    if(i == s.size()) return 0;
    return ((s[i] >= 'A' && s[i] <= 'Z') ? 1 : 0) + countupper(s, i + 1);
}

bool checkincrease(const std::string &s, int i = 0) {
    if(i + 1 == s.size()) return 1;
    return ((s[i] < s[i + 1]) ? 1 : 0) & checkincrease(s, i + 1);
}


int main() {



    return 0;
}

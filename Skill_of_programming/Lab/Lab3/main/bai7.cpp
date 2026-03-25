#include <iostream>

int sumOfOddPos(double a[], int n) {
	if(n == 0) return 0;
	return (((n - 1) & 1) == 0 ? 0 : a[n - 1]) + sumOfOddPos(a, n - 1);
}

int mul(double a[], int n) {
	if(n == 0) return 1;
	return a[n - 1] * mul(a, n - 1);
}

int countGreater(double a[], int n, double x) {
	if(n == 0) return 0;
	return (a[n - 1] > x ? 1 : 0) + countGreater(a, n - 1, x);
}

bool fullPositive(double a[], int n) {
	if(n == 0) return true;
	return (a[n - 1] > 0) & fullPositive(a, n - 1);
}

int main(void) {
	
	double a[50];
	int n; std::cin >> n;
	for(int i = 0; i < n; i++) std::cin >> a[i];
	std::cout << sumOfOddPos(a, n) << "\n";
	std::cout << mul(a, n) << "\n";
	double x; std::cin >> x;
	std::cout << countGreater(a, n, x) << "\n";
	std::cout << fullPositive(a, n) << "\n";
	
}
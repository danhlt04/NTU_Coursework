#include <iostream>

int countEvenNum(int a[], int n) {
	if(n == 0) return 0;
	return ((a[n - 1] & 1) == 0 ? 1 : 0) + countEvenNum(a, n - 1);
}

bool checkPrime(int n) {
	if(n < 2) return false;
	for(int i = 2; i * i <= n; i++) {
		if(n % i == 0) return false;
	}
	return true;
}

bool checkPrimeInArray(int a[], int n) {
	if(n == 0) return checkPrime(a[n]);
	return checkPrime(a[n - 1]) ? true : checkPrimeInArray(a, n - 1);
}

int firstPos(int a[], int n, int x, int i = 0) {
	if(i == n) return -1;
	return a[i] == x ? i : firstPos(a, n, x, i + 1);
}

void tower(int n, int a, int b, int c) {
	if(n == 0) return;
	tower(n - 1, a, c, b);
	std::cout << a << " -> " << c << "\n"; 
	tower(n - 1, b, a, c);
}

int main(void) {
	
	int n; std::cin >> n;
	int a[n];
	for(int i = 0; i < n; i++) std::cin >> a[i];
	std::cout << countEvenNum(a, n) << "\n";
	std::cout << checkPrimeInArray(a, n) << "\n";
	int x; std::cin >> x;
	std::cout << firstPos(a, n, x) << "\n";
	std::cout << (1 << n) - 1 << "\n";
	tower(n, 1, 2, 3);
	
}
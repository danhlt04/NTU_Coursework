#include <iostream>

int evenSum(int n) {
	if(n == 0) return n;
	return (n & 1) == 0 ? n + evenSum(n - 2) : evenSum(n - 1);
}

int sumOfDigit(int n) {
	if(n == 0) return n;
	return n % 10 + sumOfDigit(n / 10);
}

int sumOfCircle(int n, int a, const int &r, int s) {
	if(n == 0) return a;
	return a * s + sumOfCircle(n - 1, a, r, s * r); 
}

int sumOfDivideThree(int n) {
	if(n == 0) return n;
	return n % 3 == 0 ? n + sumOfDivideThree(n - 3) : sumOfDivideThree(n - 1);
}

double sumOfFraction(int n) {
	if(n == 1) return n;
	return 1.0 / n + sumOfFraction(n - 1);
}

int main(void) {
	
	int n; std::cin >> n;
	std::cout << evenSum(n) << "\n";
	std::cout << sumOfDigit(n) << "\n";
	int a, r; std::cin >> a >> r;
	std::cout << sumOfCircle(n, a, r, r) << "\n";
	std::cout << sumOfDivideThree(n) << "\n";
	std::cout << sumOfFraction(n) << "\n";
	
}
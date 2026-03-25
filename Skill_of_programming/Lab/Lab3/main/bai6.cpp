#include <iostream> 

int fact(int n) {
	if(n == 0 || n == 1) return 1;
	return n * fact(n - 1);
}

void convertDecToBin(int n) {
	if(n == 0) return;
	convertDecToBin(n / 2);
	std::cout << (n & 1);
}

int Pell(int n) {
	if(n == 0) return 0;
	if(n == 1) return 1;
	return 2 * Pell(n - 1) + Pell(n - 2);
}

double SumOfReverse(int n) {
	if(n == 0) return 0;
	return 1.0 / n + SumOfReverse(n - 1);
}

int Pow(int n, int i = 0) {
	if(i > n) return n;
	return n * Pow(n, i + 1); 
}

int sumOfPow(int n) {
	if(n == 1) return 1;
	return Pow(n) + sumOfPow(n - 1);
}

int gcd(int a, int b) {
	if(!b) return a;
	return gcd(b, a % b);
}

int sumOfFact(int n) {
	if(n == 0) return 0;
	return fact(n) + sumOfFact(n - 1); 
}

int fibo(int n) {
	if(n == 0) return 0;
	if(n == 1) return 1;
	return fibo(n - 1) + fibo(n - 2);
}

int sumOfFibo(int n) {
	if(n == 0) return 0;
	return fibo(n) + sumOfFibo(n - 1);
}

double sumOfFract(int n) {
	if(n == 0) return 0;
	return (1.0 * n) / (n + 1) + sumOfFract(n - 1);
}

int sumOfMul(int n) {
	if(n == 0) return 1;
	return n * (n + 1) + sumOfMul(n - 1);
}

int main(void) {
	
	int n; std::cin >> n;
	std::cout << fact(n) << "\n";
	convertDecToBin(n);
	std::cout << "\n";
	std::cout << Pell(n) << "\n";
	std::cout << SumOfReverse(n) << "\n";
	std::cout << sumOfPow(n) << "\n";
	std::cout << sumOfFact(n) << "\n";
	std::cout << sumOfFibo(n) << "\n";
	std::cout << sumOfFract(n) << "\n";
	std::cout << sumOfMul(n) << "\n";
	
}
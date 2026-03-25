#include <iostream>
#include <fstream>

void readFile(const std::string &fileName, double a[], int &n) {
	std::ifstream in;
	in.open(fileName);
	if(!in.is_open()) {
		std::cout << "Khong mo duco file\n";
		return;
	}
	in >> n;
	for(int i = 0; i < n; i++) in >> a[i];
}

double minNumUsingLoop(double a[], int n) {
	double ans = a[0];
	for(int i = 1; i < n; i++) {
		if(a[i] < ans) ans = a[i];
	}
	return ans;
}

double minNumUsingRecursion(double a[], int n) {
	if(n == 0) return a[n];
	return a[n - 1] < minNumUsingRecursion(a, n - 1) ? a[n - 1] : minNumUsingRecursion(a, n - 1);
}

double sumFirst(double a[], int n, int i = 0) {
	if(i == n) return 0;
	return a[i] + sumFirst(a, n, i + 1);
} 

double sumLast(double a[], int n) {
	if(n == 0) return 0;
	return a[n - 1] + sumLast(a, n - 1);
}

int main(void) {
	
	double a[50];
	int n;
	readFile("DaySo35.inp", a, n);
	for(int i = 0; i < n; i++) std::cout << a[i] << " ";
	std::cout << "\n";
	std::cout << minNumUsingLoop(a, n) << "\n";
	std::cout << minNumUsingRecursion(a, n) << "\n";
	std::cout << sumFirst(a, n) << "\n";
	std::cout << sumLast(a, n) << "\n";
	
}
#include <iostream>
#include <string>
#include <fstream>

void readFile(const std::string &fileName, int a[], int &n) {
	std::ifstream in;
	in.open(fileName);
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	in >> n;
	for(int i = 0; i < n; i++) in >> a[i];
}

void printArray(int a[], const int &n) {
	for(int i = 0; i < n; i++) std::cout << a[i] << " ";
	std::cout << "\n";
}

int maxNumInArrayUsingLoop(int a[], const int &n) {
	int ans = a[0];
	for(int i = 1; i < n; i++) ans = ans > a[i] ? ans : a[i];
	return ans;
}

int maxNumInArrayUsingRecursion(int a[], int n) {
	if(n == 0) return a[n];
	return a[n - 1] > maxNumInArrayUsingRecursion(a, n - 1) ? a[n - 1] : maxNumInArrayUsingRecursion(a, n - 1);
}

int main(void) {
	
	int a[50], n;
	readFile("Lab3_1.inp", a, n);
	printArray(a, n);
	std::cout << maxNumInArrayUsingLoop(a, n) << "\n";
	std::cout << maxNumInArrayUsingRecursion(a, n) << "\n";
	
}
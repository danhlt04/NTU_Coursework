#include <iostream>

void input(int a[], int &n) {
	do std::cin >> n; while(n <= 3 || n >= 50);
	for(int i = 0; i < n; i++) std::cin >> a[i];
}

int first_negative_nums(int a[], int n) {
	for(int i = 0; i < n; i++) {
		if(a[i] < 0) return a[i];
	}
	return 0;
}

bool find(int a[], int n, int x) {
	for(int i = 0; i < n; i++) {
		if(a[i] == x) return true;
	}
	return false;
}

bool decrease(int a[], int n) {
	for(int i = 1; i < n; i++) {
		if(a[i] >= a[i - 1]) return false;
	}
	return true;
}

bool all_positive_nums(int a[], int n) {
	for(int i = 0; i < n; i++) {
		if(a[i] <= 0) return false;
	}
	return true;
}

int main(void) {
	
	int a[50], n;
	input(a, n);
	std::cout << "So am dau tien trong mang la : " << first_negative_nums(a, n) << "\n";
	int x; std::cin >> x;
	std::cout << "Phan tu " << x << " co trong phan tu hay khong : " << (find(a, n, x) == true ? "Co\n" : "Khong\n");
	std::cout << (decrease(a, n) == true ? "Mang giam dan\n" : "Mang khong giam dan\n");
	std::cout << (all_positive_nums(a, n) == true ? "Mang toan so duong\n" : "Mang co so am\n");
	
	
}
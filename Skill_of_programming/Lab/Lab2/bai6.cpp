#include <iostream> 

void input(int a[], int &n) {
	do std::cin >> n; while(n <= 3 || n >= 50);
	for(int i = 0; i < n; i++) std::cin >> a[i];
}

int first_even_num(int a[], int n) {
	for(int i = 0; i < n; i++) {
		if((a[i] & 1) == 0) return a[i];
	}
	return -1;
}

bool decrease(int a[], int n) {
	for(int i = 1; i < n; i++) {
		if(a[i] >= a[i - 1]) return false;
	}
	return true;
}

int main(void) {
	
	int a[50], n;
	input(a, n);
	std::cout << first_even_num(a, n) << "\n";
	std::cout << (decrease(a, n) == true ? "Mang giam dan\n" : "Mang tang\n");
	
}
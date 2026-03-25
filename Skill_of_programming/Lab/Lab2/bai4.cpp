#include <iostream>
#include <fstream>
#include <iomanip>

void write(std::ofstream &out, int &n) {
	out.open("DaySo2_4.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	float x;
	do std::cin >> n; while(n < 3 || n > 40);
	out << "So luong phan tu mang : " << n << "\n";
	for(int i = 0; i < n; i++) {
		std::cin >> x;
		out << x << " ";
	}
	out.close();
}

void read(std::ifstream &in, float a[], int n) {
	in.open("DaySo2_4.txt");
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	std::string s;
	float *i = a, x;
	std::getline(in, s);
	while(in >> x) {
		if(i == a + n) break;
		*i = x;
		++i;
	}
	in.close();
}

void print(float a[], int n) {
	std::cout << "So luong phan tu trong mang la : " << n << "\n";
	for(int i = 0; i < n; i++) std::cout << std::fixed << std::setprecision(2) << a[i] << " ";
	std::cout << "\n";
}

int count_smaller_nums(float a[], int n, float x) {
	int cnt = 0;
	for(int i = 0; i < n; i++) {
		if(a[i] - x < 0) ++cnt;
	}
	return cnt;
}

int main(void) {
	
	int n;
	float a[40];
	std::ifstream in;
	std::ofstream out;
	write(out, n);
	read(in, a, n);
	print(a, n);
	float x; std::cin >> x;
	std::cout << count_smaller_nums(a, n, x);
}
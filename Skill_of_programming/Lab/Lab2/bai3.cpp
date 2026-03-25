#include <iostream>
#include <fstream>

void write(std::ofstream &out, int &n) {
	out.open("Matran.inp.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x; 
	do std::cin >> n; while(n < 2 || n > 20);
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) {
			std::cin >> x;
			out << x << " ";
		}
		out << "\n";
	}
	out.close();
}

void read(std::ifstream &in, int a[][20], int n) {
	in.open("Matran.inp.txt");
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x, i = 0, j = 0, *w = a[i];
	while(in >> x) {
		*w = x;
		++w;
		++j;
		if(j == n) {
			if(i + 1 == n) break;
			++i;
			w = a[i];
			j = 0;
		}
	}
	in.close();
}

void print(int a[][20], int n) {
	std::cout << "Ma tran co " << n << "x" << n << "\n";
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) std::cout << a[i][j] << " ";
		std::cout << "\n";
	}
}

int cross(int a[][20], int n) {
	int sum = 0;
	for(int i = 0; i < n; i++) sum += a[i][i];
	return sum;
}

void print_sum_of_cross(std::ofstream &out, int a[][20], int n) {
	out.open("KetQua.out.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	out << "Tong cac phan tu cua duong cheo chinh la : " << cross(a, n) << "\n";
	out.close();
}

int max_val(int a, int b) {
	return a > b ? a : b;
}

void print_max_value(std::ofstream &out, int a[][20], int n) {
	out.open("KetQua.out.txt", std::ios_base::app);
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int ans = a[0][0];
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < n; j++) ans = max_val(ans, a[i][j]);
	}
	out << "Gia tri lon nhat cua ma tran la : " << ans << "\n";
	out.close();
}

int main(void) {

	int n;
	std::ifstream in;
	std::ofstream out;
	write(out, n);
	int a[20][20];
	read(in, a, n);
	print(a, n);
	print_sum_of_cross(out, a, n);
	print_max_value(out, a, n);
	
}
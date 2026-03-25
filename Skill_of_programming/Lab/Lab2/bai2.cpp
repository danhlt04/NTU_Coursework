#include <iostream>
#include <fstream>

void write(std::ofstream &out) {
	out.open("DaySo.inp.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int n, x;
	do std::cin >> n; while(n < 2 || n > 30);
	for(int i = 0; i < n; i++) {
		std::cin >> x;
		out << x << " ";
	}
	out.close();
}

void read(std::ifstream &in) {
	in.open("DaySo.inp.txt");
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int n;
	while(in >> n) std::cout << n << " ";
	in.close();
}

int sum_odd_nums(std::ifstream &in) {
	int sum = 0;
	in.open("DaySo.inp.txt");
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return 0;
	}
	int n;
	while(in >> n) sum += n;
	return sum;
}

int main(void) {
	
	std::ifstream in;
	std::ofstream out;
	write(out);
	read(in);
	std::cout << sum_odd_nums(in);
	
}
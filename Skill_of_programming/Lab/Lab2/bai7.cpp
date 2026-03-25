#include <iostream> 
#include <fstream>

void write(std::ofstream &out, int &n) {
	out.open("DaySoNguyen.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x;
	do std::cin >> n; while(n < 2 || n >= 50);
	for(int i = 0; i < n; i++) {
		std::cin >> x;
		out << x << " ";
	}
	out.close();
}

void read(std::ifstream &in, int a[], int n) {
	in.open("DaySoNguyen.txt");
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x, i = 0;
	while(in >> x) {
		if(i == n) break;
		a[i++] = x;
	}
	in.close();
}

void print(int a[], int n) {
	for(int i = 0; i < n; i++) std::cout << a[i] << " ";
	std::cout << "\n";
}

int main(void) {
	
	int a[50], n;
	std::ifstream in;
	std::ofstream out;	
	write(out, n);
	read(in, a, n);
	print(a, n);
	
}
#include <iostream>
#include <algorithm>
#include <fstream>

int n, s, a[100];

void input(const std::string &fileName) {
	std::ifstream read;
	read.open(fileName, std::ios::in);
	if(!read.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x, i = 0;
	read >> x; n = x;
	read >> x; s = x;
	while(read >> x) {
		if(i == n) break;
		a[i++] = x;
	}
	read.close();
}

void output(const std::string &fileName) {
	std::ofstream write;
	write.open(fileName, std::ios::out);
	if(!write.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	if(n >= 2 && n <= 20) {
		std::sort(a, a + n, std::greater<int>());
		for(int i = 0; i < n; i++) {
			if(s - a[i] >= 0) {
				write << a[i] << " ";
				s -= a[i];
			}
		}
	} else write << "-1\n";
	write.close();
}

int main() {
	
	input("ATM.txt");
	output("atm_out.txt");
	
	return 0;
}
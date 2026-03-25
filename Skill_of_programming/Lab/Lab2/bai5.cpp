#include <iostream>
#include <fstream>
#include <string>

struct Subject {
	std::string id, name;
	int credit;
	
	Subject(std::string id, std::string name, int credit) : id(id), name(name), credit(credit) {
	}
};

void write(std::ofstream &out, int &n) {
	out.open("HocPhan.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	do std::cin >> n; while(n < 2 || n >= 50);
	out << "So luong hoc phan : " << n << "\n";
	std::string id, name;
	int credit;
	for(int i = 0; i < n; i++) {
		scanf("\n");
		std::getline(std::cin, id); out << id << "\n";
		std::getline(std::cin, name); out << name << "\n";
		std::cin >> credit; out << credit << "\n";
	}
	out.close();
}

void read(std::ifstream &in, Subject s[], int n) {
	in.open("HocPhan.txt");
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int i = 1, j = 0;
	std::string str;
	std::getline(in, str);
	while(std::getline(in, str)) {
		if(i % 3 == 1) s[j].id = str, ++i;
		else if(i % 3 == 2) s[j].name = str, ++i;
		else s[j].credit = stoi(str), ++i, ++j;
	}
	in.close();
}

void print(Subject s[], int n) {
	std::cout << "So hoc phan : " << n << "\n";
	for(int i = 0; i < n; i++) std::cout << s[i].id << "\n" << s[i].name << "\n" << s[i].credit << "\n";
	std::cout << "\n";
}

int main(void) {
	
	int n;
	std::ifstream in;
	std::ofstream out;
	write(out, n);
	Subject s[n];
	read(in, s, n);
	print(s, n);
	
}
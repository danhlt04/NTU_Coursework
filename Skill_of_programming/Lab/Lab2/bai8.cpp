#include <iostream> 
#include <fstream>

struct Student {
	std::string id, name, birthday;
};

void write(const std::string &fileName, int &n) {
	std::ofstream out(fileName, std::ios::binary);	
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	std::string id, name, birthday;
	do std::cin >> n; while(n < 2 || n >= 50);
	scanf("\n");
	out.write((char*) &n, sizeof(n));
	out.write("\n", 1);
	for(int i = 0; i < n; i++) {
		std::getline(std::cin, id);
		int idlen = id.size();
		out.write((char*) &idlen, sizeof(idlen));
		out.write(id.c_str(), idlen);
		out.write("\n", 1);
		std::getline(std::cin, name);
		int namelen = name.size();
		out.write((char*) &namelen, sizeof(namelen));
		out.write(name.c_str(), namelen);
		out.write("\n", 1);
		std::getline(std::cin, birthday);
		int birthdaylen = birthday.size();
		out.write((char*) &birthdaylen, sizeof(birthdaylen));
		out.write(birthday.c_str(), birthdaylen);
		out.write("\n", 1);
	}
	out.close();
}

void read(const std::string &fileName, Student *&st, int &n) {
	std::ifstream in(fileName, std::ios::binary);
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	in.read((char*) &n, sizeof(n));
	char tmp = '\n';
	in.read(&tmp, 1);
	st = new Student[n];
	for(int i = 0; i < n; i++) {
		int idlen;
		in.read((char*) &idlen, sizeof(idlen));
		st[i].id.resize(idlen);
		in.read(&st[i].id[0], idlen);
		in.read(&tmp, 1);
		int namelen;
		in.read((char*) &namelen, sizeof(namelen));
		st[i].name.resize(namelen);
		in.read(&st[i].name[0], namelen);
		in.read(&tmp, 1);
		int birthdaylen;
		in.read((char*) &birthdaylen, sizeof(birthdaylen));
		st[i].birthday.resize(birthdaylen);
		in.read(&st[i].birthday[0], birthdaylen);
		in.read(&tmp, 1);
	}
	in.close();
}

int main(void) {
	
	int n;
	write("SinhVien.inp.bin", n);
	Student* st = NULL;
	read("SinhVien.inp.bin", st, n);
	for(int i = 0; i < n; i++) std::cout << st[i].id << " " << st[i].name << " " << st[i].birthday << "\n";
	delete[] st;
}
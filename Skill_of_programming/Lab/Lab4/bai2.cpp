#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

void readFile(const std::string &fileName, int a[], int &n, int &s) {
	std::ifstream in;
	in.open(fileName);
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x, i = 0;
	in >> x; n = x;
	in >> x; s = x;
	while(in >> x) {
		if(i == n) break;
		a[i++] = x;
	}
	in.close();
}

void Try(int a[], int n, int s, std::vector<int> &v, std::vector<std::vector<int>> &ans, int i, int sum) {
	if(i == n) return;
	for(int j = i; j < n; j++) {
		v.push_back(a[j]);
		if(sum + a[j] == s) ans.push_back(v);
		else if(sum + a[j] < s) Try(a, n, s, v, ans, j + 1, sum + a[j]);
		v.pop_back();
	}
}

void writeAns(const std::string &fileName, int a[], int n, int s, std::vector<int> &v, std::vector<std::vector<int>> &ans) {
	std::ofstream out;
	out.open(fileName);
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	Try(a, n, s, v, ans, 0, 0);
	if(ans.empty()) out << "-1\n";
	else {
		for(auto &x : ans) {
			for(auto &y : x) out << y << " ";
			out << "\n";
		}
	}
	out.close();
}

int main() {
	
	std::vector<int> v;
	std::vector<std::vector<int>> ans;
	int a[20], n, s;
	readFile("ATM.inp.txt", a, n, s);
	writeAns("ATM_out.out.txt", a, n, s, v, ans);
	
	return 0;
}
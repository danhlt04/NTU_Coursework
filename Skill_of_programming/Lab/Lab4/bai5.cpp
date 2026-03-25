#include <iostream>
#include <vector>
#include <fstream>

int n, x[100], cost[100][100], min_cost = 1e9, res = 1e9;
bool visited[100];
std::vector<std::vector<int>> ans;

void readFile(const std::string &fileName) {
	std::ifstream in;
	in.open(fileName);
	if(!in.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x, i = 1, j = 1;
	in >> x;
	n = x;
	while(in >> x) {
		if(i == n + 1) break;
		cost[i][j] = x;
		if(j == n) {
			++i;
			j = 1;
		} else ++j;
	}
	in.close();
}

void Try(int i, int real_cost) {
	for(int j = 1; j <= n; j++) {
		if(!visited[j]) {
			x[i] = j;
			visited[j] = true;
			real_cost += cost[x[i - 1]][x[i]];
			if(i == n) {
				res = std::min(res, real_cost + cost[x[n]][1]);
				std::vector<int> v(x + 1, x + n + 1);
				v.push_back(*v.begin());
				ans.push_back(v);
			} else if(real_cost + min_cost * (n - i + 1) < res) Try(i + 1, real_cost);
			visited[j] = false;
			real_cost -= cost[x[i - 1]][x[i]];
		}
	}
}

void solve() {
	for(int i = 1; i <= n; i++) {
		for(int j = 1; j <= n; j++) {
			if(i != j) min_cost = std::min(min_cost, cost[i][j]);
		}
	}
	Try(1, 0);
}

void writeFile(const std::string &fileName) {
	std::ofstream out;
	out.open("Dulich_out.out.txt");
	if(!out.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	solve();
	for(auto &x : ans) {
		for(auto &y : x) out << y << " ";
		out << "\n";
	}
	out << res << "\n";
	out.close();
}

int main() {
	
	readFile("Dulich.inp.txt");
	writeFile("Dulich_out.out.txt");
	
	return 0;
}
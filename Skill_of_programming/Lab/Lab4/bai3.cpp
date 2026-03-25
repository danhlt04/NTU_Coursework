#include <iostream>
#include <vector>

std::vector<int> v;

void Try(int i, int sum, const int &n) {
	for(int j = i; j <= n; j++) {
		v.push_back(j);
		if(sum + j == n) {
			for(int id = 0; id < (int) v.size(); id++) std::cout << v[id] << (id == (int) v.size() - 1 ? "\n" : " + ");
		} else if(sum + j < n) Try(j, sum + j, n);
		v.pop_back();
	}
}

int main() {
	
	int n; std::cin >> n;
	Try(1, 0, n);
	
	return 0;
}
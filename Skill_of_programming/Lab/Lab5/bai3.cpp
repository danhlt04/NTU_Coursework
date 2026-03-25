#include <iostream>
#include <algorithm>
#include <vector>

int n, m, a[20], ans = 1e9;
std::vector<int> cur, v;

void Try(int i, int s = 0) {
	if(s == m) {
		if(ans > (int) v.size()) {
			cur = v;
			ans = (int) v.size();
		}
	}
	for(int j = i; j < n; j++) {
		if(s + a[j] <= m) {
			v.push_back(a[j]);
			Try(j + 1, s + a[j]);
			v.pop_back();
		}
	}
}

int main() {
	
	do std::cin >> n; while(n < 2 || n > 20);
	std::cin >> m;
	for(int i = 1; i <= n; i++) std::cin >> a[i];
	std::sort(a + 1, a + n + 1, std::greater<int>());
	Try(1);
	if(ans != 1e9) {
		std::cout << ans << "\n";
		for(int &x : cur) std::cout << x << " ";
	} else std::cout << "Khong chon duoc\n";
	
	return 0;
}
#include <iostream>

int n, a[100];

void input() {
	do std::cin >> n; while(n <= 5 || n >= 100);
	for(int i = 0; i < n; i++) std::cin >> a[i];
}

int sum(int l, int r) {
	if(l > r) return 0;
	if(l == r) return a[l];
	int m = (l + r) >> 1;
	return sum(l, m) + sum(m + 1, r);
}

int count(int l, int r, int x) {
	if(l > r) return 0;
	if(l == r) return (a[l] == x ? 1 : 0);
	int m = (l + r) >> 1;
	return count(l, m, x) + count(m + 1, r, x);
}

int min_value(int l, int r, int ans) {
	if(l > r) return ans;
	if(l == r) return std::min(ans, a[l]);
	int m = (l + r) >> 1;
	return std::min(min_value(l, m, ans), min_value(m + 1, r, ans));
}

int main() {
	
	input();
	std::cout << sum(0, n - 1) << "\n";
	int x; std::cin >> x;
	std::cout << count(0, n - 1, x) << "\n";
	std::cout << min_value(0, n - 1, 1e9) << "\n";
	
	return 0;
}
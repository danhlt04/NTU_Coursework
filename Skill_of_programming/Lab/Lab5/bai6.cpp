#include <iostream>
#include <algorithm>

void input(int a[], int &n) {
	do std::cin >> n; while(n <= 5 || n >= 100);
	for(int i = 0; i < n; i++) std::cin >> a[i];
}

int count_value(const int a[], const int &n, const int &x, const int &l, const int &r) {
	if(l == r) return a[l] == x ? 1 : 0;
	int m = (l + r) >> 1;
	return count_value(a, n, x, l, m) + count_value(a, n, x, m + 1, r);	
}

int max_value(const int a[], const int &n, const int &l, const int &r, int ans) {
	if(l == r) return std::max(a[l], ans);
	int m = (l + r) >> 1;
	return std::max(max_value(a, n, l, m, ans), max_value(a, n, m + 1, r, ans));
}

int max_sum(const int a[], const int &n) {
	int ans = 0, cur = 0;
	for(int i = 0; i < n; i++) {
		cur = std::max(a[i], cur + a[i]);
		ans = std::max(ans, cur);
	}
	return ans;
} 

int main() {
	
	int n, a[100];
	input(a, n);
	int x; std::cin >> x;
	std::cout << count_value(a, n, x, 0, n - 1);
	std::cout << max_value(a, n, 0, n - 1, 0);
	std::cout << max_sum(a, n);
	
	return 0;
}
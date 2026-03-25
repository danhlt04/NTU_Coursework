#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>

const long long INF = 1e18;

void readFile(const std::string &fileName, int a[], int &n, int &s) {
	std::ifstream r;
	r.open(fileName, std::ios::in);
	if(!r.is_open()) {
		std::cout << "Khong mo duoc file\n";
		return;
	}
	int x, i = 0;
	r >> x; n = x;
	r >> x; s = x;
	while(r >> x) {
		if(i == n) break;
		a[i++] = x;
	}
	r.close();
}

int main() {
	
	int a[30], n, s;
	readFile("ATM.txt", a, n, s);
	long long dp[s + 1] = {INF};
	dp[0] = 0;
	for(int i = 0; i < n; i++) {
		for(int j = a[i]; j <= s; j++) {
			long long take = dp[j - a[i]], notake = INF;
			if(take != INF) ++take;
			if(i + 1 < n) notake = dp[j];
			dp[j] = std::min(take, notake);
		}
	}
	std::cout << dp[s];
	
	return 0;
}
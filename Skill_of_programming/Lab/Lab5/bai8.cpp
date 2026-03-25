#include <iostream>
#include <algorithm>
#include <cstring>

int main() {
	int n, m; std::cin >> n >> m;
	int w[n + 1], v[n + 1];
	for(int i = 1; i <= n; i++) std::cin >> w[i];
	for(int i = 1; i <= n; i++) std::cin >> v[i];
	long long F[n + 1][m + 1];
	std::memset(F, 0, sizeof(F));
	for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= m; j++) {
            F[i][j] = F[i - 1][j];
            if(j >= w[i]) F[i][j] = std::max(F[i][j], F[i - 1][j - w[i]] + v[i]);
        }
	}
	int j = m;
	for(int i = n; i > 0; i--) {
		if(F[i][j] != F[i - 1][j]) {
			std::cout << i << " " << w[i] << " " << v[i] << "\n";
			j -= w[i];
		}
	}

	return 0;
}

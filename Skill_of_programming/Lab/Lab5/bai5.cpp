#include <iostream>
#include <string>
#include <algorithm>

int main() {

	std::string s1 = "ABCBDAB", s2 = "BDCABA";
	int m = s1.size(), n = s2.size();
	long long F[m + 1][n + 1];
	for(int i = 0; i <= m; i++) F[i][0] = 0;
	for(int i = 0; i <= n; i++) F[0][i] = 0;
	for(int i = 1; i <= m; i++) {
        for(int j = 1; j <= n; j++) {
            if(s1[i - 1] == s2[j - 1]) F[i][j] = F[i - 1][j - 1] + 1;
            else F[i][j] = std::max(F[i - 1][j], F[i][j - 1]);
        }
	}
	int id = F[m][n];
	std::string ans = "";
	int i = m, j = n;
	while(i > 0 && j > 0) {
        if(s1[i - 1] == s2[j - 1]) {
            ans = s1[i - 1] + ans;
            --i;
            --j;
        } else if(F[i - 1][j] > F[i][j - 1]) --i;
        else --j;
	}
	std::cout << F[m][n] << "\n";
	std::cout << ans << "\n";

	return 0;
}

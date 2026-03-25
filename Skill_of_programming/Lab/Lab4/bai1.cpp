#include <iostream>

void Try(int n, int i = 0, std::string s = "") {
	if(i == n) {
		std::cout << s << "\n";
		return;
	}
	for(int j = 0; j < 2; j++) {
		s += j + '0';
		Try(n, i + 1, s);
		s.pop_back();
	}
}

int main() {
	
	int n; std::cin >> n;
	Try(n);
	
	return 0;
}
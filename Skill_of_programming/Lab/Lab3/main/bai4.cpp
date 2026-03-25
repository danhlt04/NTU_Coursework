#include <iostream>
#include <string>

int countCharacter(const std::string &s, int i = 0) {
	if(i == s.size()) return 0;
	return 1 + countCharacter(s, i + 1);
}

int countLowerCharacter(const std::string &s, int i = 0) {
	if(i == s.size()) return 0;
	return ((s[i] >= 'a' && s[i] <= 'z') ? 1 : 0) + countLowerCharacter(s, i + 1);
}

bool checkPalindrome(const std::string &s, const int &n, int i = 0) {
	if(i > n / 2) return 1;
	return (s[i] == s[n - i - 1]) & checkPalindrome(s, n, i + 1);
}

int sumOfDigit(const std::string &s, int i = 0, int r = 0) {
	if(i == s.size()) return 0;
	if(s[i] >= '1' && s[i] <= '9') r = r * 10 + s[i] - '0';
	else r = 0;
	return r + sumOfDigit(s, i + 1, r);
}

int main(void) {
	
	std::string s; std::cin >> s;
	std::cout << countCharacter(s) << "\n";
	std::cout << countLowerCharacter(s) << "\n";
	std::cout << checkPalindrome(s, s.size()) << "\n";
	std::cout << sumOfDigit(s) << "\n";
	
}
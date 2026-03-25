#include <iostream>
#include <string>

int countDigitOfString(const std::string &s, int i = 0) {
	if(i == s.size()) return 0;
	return (s[i] >= '0' && s[i] <= '9' ? 1 : 0) + countDigitOfString(s, i + 1);
}

int countUpperCharacter(const std::string &s, int i = 0) {
	if(i == s.size()) return 0;
	return (s[i] >= 'A' && s[i] <= 'Z' ? 1 : 0) + countUpperCharacter(s, i + 1); 
}

bool checkIncrease(const std::string &s, int i = 0) {
	if(i == s.size() - 1) return true;
	return (s[i] < s[i - 1]) & checkIncrease(s, i + 1);
}

int main(void) {
	
}
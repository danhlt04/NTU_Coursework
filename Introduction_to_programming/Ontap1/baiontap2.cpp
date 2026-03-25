#include <stdio.h> 
#include <string.h>

void nhap(char s[]) {
	fgets(s, 100, stdin);
}

void solve1(char s[]) {
	char na[] = {'u', 'e', 'o', 'a', 'i'};
	for(int i = 0; i < strlen(s); i++) {
		for(int j = 0; j < strlen(na); j++) {
			if(s[i] == na[j] || (s[i] + 32) == na[j]) s[i] = '*';
		}
	}
	puts(s);
}

void solve2(char s[]) {
	char t[100][100];
	int cnt = 0, max_len = 0;
	char *tk = strtok(s, " \n");
	while(tk != NULL) {
		strcpy(t[cnt], tk);
		int len = strlen(tk);
		if(len > max_len) max_len = len;
		++cnt;
		tk = strtok(NULL, " \n");
	}
	for(int i = 0; i < cnt; i++) {
		if(strlen(t[i]) == max_len) {
			int tmp = 0;
			for(int j = 0; j < i; j++) {
				if(strlen(t[j]) == max_len && strcmp(t[i], t[j]) == 0) {
					tmp = 1;
					break;
				}
			}
			if(!tmp) {
				int k = 1;
				for(int j = i + 1; j < cnt; j++) {
					if(strcmp(t[i], t[j]) == 0) ++k;
				}
				printf("%s %d ", t[i], k);
			}
		}
	}
}

int main() {
	char s[100];
	nhap(s);
	char tmp[100];
	strcpy(&tmp[0], &s[0]);
	solve1(s);
	solve2(tmp);
	
	return 0;
}

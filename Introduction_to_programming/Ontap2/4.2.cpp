#include <stdio.h>
#include <string.h>

char s[100];

void nhap() {
	printf("nhap chuoi : ");
	fgets(s, 100, stdin);
}

void in() {
	puts(s);
}

void incuoi() {
	int i = strlen(s) - 1;
	while(s[i] != ' ') --i;
	++i;
	while(s[i] != '\0') {
		printf("%c", s[i]);
		++i;
	}
}

void thayna() {
	char na[] = {"ueoai"};
	for(int i = 0; i < strlen(s); i++) {
		for(int j = 0; j < strlen(na); j++) {
			if(s[i] == na[j]) {
				s[i] = '*';
				continue;
			}
		}
	}
}

void sotu() {
	int cnt = 0;
	for(int i = 0; i < strlen(s); i++) {
		if(s[i] == ' ') ++cnt;
	}
	printf("so tu co trong chuoi la : %d\n", cnt + 1);
}

int main() {
	nhap();
	in();
	incuoi();
	thayna();
	in();
	sotu();
	
	return 0;
}
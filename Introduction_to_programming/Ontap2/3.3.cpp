#include <stdio.h> 
#include <string.h>

char s[50];

void nhap() {
	printf("nhap chuoi : ");
	fgets(s, 50, stdin);
}

void in() {
	puts(s);
}

void viethoa() {
	char tmp[100];
	strcpy(&tmp[0], &s[0]);
	if(tmp[0] >= 'a' && tmp[0] <= 'z') tmp[0] -= 32;
	for(int i = 1; i < strlen(tmp); i++) {
		if(tmp[i] == ' ' && tmp[i + 1] >= 'a' && tmp[i + 1] <= 'z') tmp[i + 1] -= 32;
	}
	puts(tmp);
}

void dem() {
	char x;
	printf("nhap ki tu x : ");
	scanf("%c", &x);
	int cnt = 0;
	for(int i = 0; i < strlen(s); i++) {
		if(s[i] == x) ++cnt;
	}
	printf("co %d ky tu %c trong chuoi\n", cnt, x);
}

int check() {
	for(int i = 0; i <= strlen(s) / 2; i++) {
		if(s[i] != s[strlen(s) - 1 - i - 1]) return 0;
	}
	return 1;
}

void solve() {
	if(check() == 1) printf("day la chuoi doi xung\n");
	else printf("day khong phai chuoi doi xung\n"); 
}

int main() {
	nhap();
	in();
	viethoa();
	dem();
	solve();
	
	return 0;
}
#include <stdio.h>
#include <string.h>

char s[200];

void nhap() {
    fgets(s, 100, stdin);
}

void in(char tmp[]) {
    puts(tmp);
}

int demso() {
    int cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] >= '0' && s[i] <= '9') ++cnt;
    }
    return cnt;
}

void thaydoi(char tmp[]) {
    char nguyenam[] = {'u', 'e', 'o', 'a', 'i'};
    for(int i = 0; i < strlen(tmp); i++) {
        for(int j = 0; j < strlen(nguyenam); j++) {
            if(tmp[i] == nguyenam[j]) tmp[i] = '0';
        }
    }
}

int palindrome() {
    for(int i = 0; i < strlen(s) / 2; i++) {
        if(s[i] != s[strlen(s) - i - 1]) return 0;
    }
    return 1;
}

int main() {
    nhap();
    in(s);
    int dem = demso();
    printf("%d\n", dem);
    char tmp[200];
    for(int i = 0; i < strlen(s); i++) tmp[i] = s[i];
    thaydoi(tmp);
    in(tmp);
    if(palindrome()) printf("s la chuoi doi xung\n");
    else printf("s khong phai chuoi doi xung\n");

    return 0;
}

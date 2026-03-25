#include <stdio.h>
#include <string.h>

char s[100];

void nhap() {
    fgets(s, 100, stdin);
}

void in() {
    puts(s);
}

void incuoi() {
    int len = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] != ' ') ++len;
        else len = 0;
    }
    for(int i = strlen(s) - len; i < strlen(s); i++) printf("%c", s[i]);
}

void thaythe() {
    char na[] = {"ueoai"};
    for(int i = 0; i < strlen(s); i++) {
        for(int j = 0; j < strlen(na); j++) {
            if(s[i] == na[j]) s[i] = '*';
        }
    }
}

int cnt() {
    int res = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == ' ') ++res;
    }
    return res + 1;
}

int main() {
    nhap();
    incuoi();
    thaythe();
    in();
    printf("so tu co trong chuoi la : %d\n", cnt());

    return 0;
}

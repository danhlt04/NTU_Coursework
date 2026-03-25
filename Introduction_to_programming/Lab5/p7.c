#include <stdio.h>
#include <string.h>

char s[200];

void nhap() {
    fgets(s, 100, stdin);
}

void in() {
    puts(s);
}

void chuanhoachuoi() {
    while(s[0] == ' ') strcpy(&s[0], &s[1]);
    while(s[strlen(s) - 1] == ' ') s[strlen(s) - 1] = '\0';
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == ' ' && s[i + 1] == ' ') {
            strcpy(&s[i], &s[i + 1]);
            i--;
        }
    }
}

void tudainhat() {
    int pos = -1, res = 0, cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        ++cnt;
        if(s[i] == ' ') {
            if(res < cnt) {
                res = cnt;
                pos = i - res;
            }
            cnt = 0;
        }
    }
    if(res < cnt) {
        res = cnt;
        pos = strlen(s) - res;
    }
    for(int i = pos; i < pos + res; i++) printf("%c", s[i]);
}

int main() {
    nhap();
    chuanhoachuoi();
    in();
    tudainhat();

    return 0;
}

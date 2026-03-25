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
    while(s[strlen(s) - 1] == ' ') s[strlen(s)-1] = '\0';
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == ' ' && s[i+1] == ' '){
            strcpy(&s[i], &s[i+1]);
            i--;
        }
    }
}

void viethoadau(){
    strlwr(s);
    s[0] = s[0]-32;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == ' ') s[i+1] = s[i+1] - 32;
    }
}

void inthutu() {
    char res[200];
    for(int i = 0; i < strlen(s); i++) res[i + 1] = s[i];
    res[0] = ' ';
    int cnt = 1;
    for(int i = 0; i < strlen(res); i++) {
        if(res[i] == ' ' && i == 0) printf("%d.", cnt);
        else if(res[i] == ' ') {
            ++cnt;
            printf("\n%d.", cnt);
        }
        printf("%c", res[i]);

    }
}

int main() {
    nhap();
    in();
    chuanhoachuoi();
    in();
    viethoadau();
    in();
    inthutu();

    return 0;
}

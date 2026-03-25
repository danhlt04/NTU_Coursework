#include <stdio.h>
#include <string.h>

char s[100];

void nhap() {
    fgets(s, 100, stdin);
}

void indau() {
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == ' ') break;
        printf("%c", s[i]);
    }
}

int demso() {
    int cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] >= '0' && s[i] <= '9') ++cnt;
    }
    return cnt;
}

int main() {
    nhap();
    indau(); printf("\n");
    printf("so luong ki tu so co trong chuoi la : %d\n", demso());
    char t[50];
    printf("nhap chuoi can tim : ");
    fgets(t, 50, stdin);
    if(strstr(s, t)) printf("t co xuat hien trong s\n");
    else printf("khong tim thay\n");

    return 0;
}

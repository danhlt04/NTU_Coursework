#include <stdio.h>
#include <string.h>

char s[200];

void nhap() {
    fgets(s, 100, stdin);
}

int kiemtrachuoi(char tmp[]) {
    int cnt = 0, j = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == tmp[j]) {
            ++cnt;
            ++j;
        }
        else {
            cnt = 0;
            j = 0;
        }
    }
    if(cnt == strlen(tmp)) return 1;
    return 0;
}

void kiemtrakitu(char tmp) {
    int check = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == tmp) {
            check = 1;
            printf("%d ", i);
        }
    }
    printf("\n");
    if(!check) printf("khong co ki tu %c trong chuoi\n", tmp);
}

int demkitu() {
    int cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] >= '0' && s[i] <= '9') continue;
        else if(s[i] >= 'a' && s[i] <= 'z') continue;
        else if(s[i] >= 'A' && s[i] <= 'Z') continue;
        else if(s[i] == ' ') continue;
        else ++cnt;
    }
    return cnt - 1;
}

int main() {
    nhap();
    char tmp[100];
    printf("chuoi can kiem tra : "); fgets(tmp, 100, stdin);
    if(kiemtrachuoi(tmp)) printf("chuoi vua nhap co trong chuoi %s\n", s);
    else printf("chuoi vua nhap khong co trong chuoi %s\n", s);
    char kt; printf("ki tu can kiem tra : "); scanf("%c", &kt);
    kiemtrakitu(kt);
    int dem = demkitu();
    printf("%d\n", dem);

    return 0;
}

#include <stdio.h>
#include <string.h>

char s[200];

void nhap() {
    fgets(s, 200, stdin);
}

void in() {
    puts(s);
}

int demtu() {
    int cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == ' ') ++cnt;
    }
    return cnt + 1;
}

void intucuoi() {
    char tmp[200];
    int i = 0, j = strlen(s) - 1;
    while(s[j] != ' ') {
        tmp[i] = s[j];
        ++i;
        --j;
    }
    strrev(tmp);
    puts(tmp);
}

int dem(char x) {
    int cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == x) ++cnt;
    }
    return cnt;
}

int main() {
    nhap();
    in();
    int cnt = demtu();
    printf("%d\n", cnt);
    intucuoi();
    char x; printf("nhap ki tu can dem : "); scanf("%c", &x);
    int demx = dem(x);
    printf("%d\n", demx);

    return 0;
}

#include <stdio.h>
#include <string.h>

char s[200];

void nhap() {
    fgets(s, 100, stdin);
}

void in() {
    puts(s);
}

int demnguyenam() {
    char tmp[] = {'u', 'e', 'o', 'a', 'i'};
    int cnt = 0;
    for(int i = 0; i < strlen(s); i++) {
        for(int j = 0; j < strlen(tmp); j++) {
            if(s[i] == tmp[j] || s[i] + 32 == tmp[j]) ++cnt;
        }
    }
    return cnt;
}

void thaydoi() {
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] >= '0' && s[i] <= '9') s[i] = '*';
    }
}

int main() {
    nhap();
    in();
    int dem = demnguyenam();
    printf("%d\n", dem);
    thaydoi();
    in();

    return 0;
}

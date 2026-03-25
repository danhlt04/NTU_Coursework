#include <stdio.h>
#include <string.h>

char s[200];

void nhap() {
    fgets(s, 200, stdin);
}

void in() {
    puts(s);
}

void innguoc() {
    for(int i = strlen(s) - 1; i >= 0; i--) printf("%c", s[i]);
}

int main() {
    nhap();
    in();
    innguoc();

    return 0;
}

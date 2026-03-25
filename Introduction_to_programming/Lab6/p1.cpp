#include <stdio.h>

struct sach {
	char tensach[100];
	char tacgia[100];
	char nhaxuatban[100];
	int namxuatban;
	int giaban;
};

void nhap(sach &s) {
	printf("ten sach : ");
	gets(s.tensach);
	printf("tac gia : ");
	gets(s.tacgia);
	printf("nha xuat ban : ");
	gets(s.nhaxuatban);
	printf("nam xuat ban : ");
	scanf("%d", &s.namxuatban);
	printf("gia ban (dong) : ");
	scanf("%d", &s.giaban);
}

void in(sach s) {
	printf("thong tin sach : ");
	printf("\nten sach : %s", s.tensach);
	printf("\ntac gia : %s", s.tacgia);
	printf("\nnha xuat ban : %s", s.nhaxuatban);
	printf("\nnam xuat ban : %d", s.namxuatban);
	printf("\ngia ban : %d\n", s.giaban);
}

int main() {
	sach s;
	nhap(s);
	in(s);
	
	return 0;
}

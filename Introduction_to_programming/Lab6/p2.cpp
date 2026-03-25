#include <stdio.h>

struct sach {
	char tensach[100];
	char tacgia[100];
	char nhaxuatban[100];
	int namxuatban;
	int giaban;
};

int n;
sach a[50];

void nhap() {
	do {
		printf("nhap so luong sach : ");
		scanf("%d", &n);
	} while(n <= 1 || n >= 30);
	for(int i = 0; i < n; i++) {
		fflush(stdin);
		printf("ten sach : ");
		gets(a[i].tensach);
		printf("tac gia : ");
		gets(a[i].tacgia);
		printf("nha xuat ban : ");
		gets(a[i].nhaxuatban);
		printf("nam xuat ban : ");
		scanf("%d", &a[i].namxuatban);
		printf("gia ban (dong) : ");
		scanf("%d", &a[i].giaban);
	}
}

void in() {
	for(int i = 0; i < n; i++) {
		printf("thong tin sach %d : ", i + 1);
		printf("\nten sach : %s", a[i].tensach);
		printf("\ntac gia : %s", a[i].tacgia);
		printf("\nnha xuat ban : %s", a[i].nhaxuatban);
		printf("\nnam xuat ban : %d", a[i].namxuatban);
		printf("\ngia ban : %d\n", a[i].giaban);
	}
}

void sapxepgia() {
	for(int i = 0; i < n - 1; i++) {
		for(int j = 0; j < n - i - 1; j++) {
			if(a[j].giaban < a[j + 1].giaban) {
				sach tmp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = tmp;
			}
		}
	}
}

int main() {
	nhap(); 
	in();
	sapxepgia();
	in();
	printf("sach co nam xuat ban truoc nam 2022 : ");
	for(int i = 0; i < n; i++) {
		if(a[i].namxuatban < 2022) {
			printf("thong tin sach : ");
			printf("\nten sach : %s", a[i].tensach);
			printf("\ntac gia : %s", a[i].tacgia);
			printf("\nnha xuat ban : %s", a[i].nhaxuatban);
			printf("\nnam xuat ban : %d", a[i].namxuatban);
			printf("\ngia ban : %d\n", a[i].giaban);
		}
	}
	
	return 0;
}

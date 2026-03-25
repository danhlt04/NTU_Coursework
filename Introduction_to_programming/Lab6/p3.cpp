#include <stdio.h> 

struct sinhvien {
	char msv[20];
	char hoten[50];
	char lop[20];
	double dtb;
};

void nhap(sinhvien &s) {
	printf("ma sinh vien : ");
	gets(s.msv);
	printf("ho va ten : ");
	gets(s.hoten);
	printf("lop : ");
	gets(s.lop);
	printf("diem trung binh : ");
	scanf("%lf", &s.dtb);
}

void in(sinhvien s) {
	printf("thong tin sinh vien : ");
	printf("\nma sinh vien : %s", s.msv);
	printf("\nho va ten : %s", s.hoten);
	printf("\nlop : %s", s.lop);
	printf("\ndiem trung binh : %.2lf\n", s.dtb);
}

int main() {
	sinhvien s;
	nhap(s);
	in(s);
	
	return 0;
}

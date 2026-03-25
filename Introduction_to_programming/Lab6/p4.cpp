#include <stdio.h> 

struct sinhvien {
	char msv[20];
	char hoten[50];
	char lop[20];
	double dtb;
};

int n;
sinhvien a[50];

void nhap() {
	do {
		printf("nhap so luong sinh vien : ");
		scanf("%d", &n);
	} while(n <= 2 || n >= 50);
	for(int i = 0; i < n; i++) {
		fflush(stdin);
		printf("ma sinh vien : ");
		gets(a[i].msv);
		printf("ho va ten : ");
		gets(a[i].hoten);
		printf("lop : ");
		gets(a[i].lop);
		printf("diem trung binh : ");
		scanf("%lf", &a[i].dtb);
	}
}

void in() {
	for(int i = 0; i < n; i++) {
		printf("thong tin sinh vien %d : ", i + 1);
		printf("\nma sinh vien : %s", a[i].msv);
		printf("\nho va ten : %s", a[i].hoten);
		printf("\nlop : %s", a[i].lop);
		printf("\ndiem trung binh : %.2lf\n", a[i].dtb);
	}
}

void sapxepdiem() {
	for(int i = 0; i < n - 1; i++) {
		for(int j = 0; j < n - i - 1; j++) {
			if(a[j].dtb < a[j + 1].dtb) {
				sinhvien tmp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = tmp;
			}
		}
	}
}

double avg() {
	double res = 0;
	for(int i = 0; i < n; i++) res += a[i].dtb;
	return res / n;
}

int main() {
	nhap();
	in();
	sapxepdiem();
	in();
	printf("diem trung binh cua %d sinh vien : %.2lf", n, avg);
	
	return 0;
}

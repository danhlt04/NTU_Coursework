#include "sv.h"
#include "string.h"
#include<stdio.h>

// Cai dat chi tiet cac ham
void NhapSV(SV &s)
{
	printf("Nhap MSSV: ");
	gets(s.MSSV);
	printf("Nhap ho ten: ");
	gets(s.HoTen);
	printf("Nhap DTB: ");
	scanf("%f", &s.DTB);
}

// Cai dat ham xuat thong tin sinh vien
void XuatSV(SV s)
{
	printf("%s\t%s\t%5.2f\n", s.MSSV, s.HoTen, s.DTB);
}


/* Bai tap 16:
1.Viet chuong trinh doc mang 1 chieu tu 1 file cho truoc. 
2.Sap xep mang tang dan.
3.Ghi mang da sap xep vao 1 file khac.

Biet: cau truc cua file gom 2 dong: dong thu nhat chua so phan tu cua mang,
dong thu hai chua cac phan tu.
Vi du:

5
3 1 2 6 4

*/
#include <stdio.h>
#include "mylib.h" // Khai bao thu vien tu dinh nghia

int main() 
{
	int a[MAX];
	int n;
	// Doc mang tu file
	NhapMangTuFile("d:\\mang1chieu.txt", a, n);
	printf("Mang vua nhap:\n");
	XuatMang(a, n);
	// sap xep tang dan
	SapXepTangDan(a,n);
	printf("\nMang da sap xep tang dan:\n");
	XuatMang(a, n);
	// Ghi mang vao file
	GhiMangVaoFile("d:\\sorted_array.txt", a, n);
}

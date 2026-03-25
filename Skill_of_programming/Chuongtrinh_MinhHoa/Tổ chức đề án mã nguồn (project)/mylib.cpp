// Cai dat chi tiet cac ham tu xay dung
#include"mylib.h"

void NhapMang(int a[], int &n)
{
	do{
		printf("Nhap so phan tu:");
		scanf("%d",&n);
	}while(!(n > 0 && n <= MAX));
	for(int i = 0; i < n; i++)
		{
			printf("a[%d]=", i);
			scanf("%d", &a[i]);
		}
}

void XuatMang(int a[], int n)
{
	for(int i=0; i < n; i++)
		printf("%d  ", a[i]);
}

// Ham doc mang tu file
void NhapMangTuFile(char fname[], int a[], int &n)
{
	FILE *fp = fopen(fname, "rt"); // Mo file van ban (t), chi doc (r)
	if(fp == NULL)
		printf("Khong mo duoc file!");
	else
	{
		// Doc so phan tu cua mang
		fscanf(fp, "%d\n", &n);
		// Doc n phan tu cua mang tu dong thu 2
		for(int i=0; i < n; i++)
			fscanf(fp, "%d", &a[i]);
		// Dong file lai sau khi xu ly xong
		fclose(fp);
	}
}

// Ham sap xep mang tang dan
void SapXepTangDan(int a[], int n)
{
	for(int i=0; i < n - 1; i++)
		for(int j=i+1; j < n; j++)
			if(a[i] > a[j])
				{
					int t = a[i]; a[i] = a[j]; a[j] = t;
				}
}

// Ham ghi mang vao file
void GhiMangVaoFile(char fname[], int a[], int n)
{
	FILE *fp = fopen(fname,"wt"); // Mo file van ban (t), chi ghi (w)
	if(fp == NULL)
		printf("Khong mo duoc file.");
	else
	{
		// Ghi n len file
		fprintf(fp, "%d\n", n);
		// Ghi n phan tu len dong 2
		for(int i=0; i < n; i++)
			fprintf(fp, "%d  ", a[i]);
		// dong file
		fclose(fp);
	}
}



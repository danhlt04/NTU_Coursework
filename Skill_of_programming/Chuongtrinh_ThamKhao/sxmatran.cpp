// Sap xep ma tran sao cho moi hang tang dan
#include<stdio.h>
#define MAX 20

void SapXep(int a[][MAX], int m, int n)
{
	// Xet tung hang cua ma tran
	for(int i=0; i<m; i++)
	{
		// Mot hang cua ma tran chinh la mang 1 chieu
		// Sap xep hang tang dan
		for(int j=0; j < n-1; j++)
			for(int k=j+1; k<n; k++)
				if(a[i][j] > a[i][k])
				{
					int tmp = a[i][j]; a[i][j] = a[i][k]; a[i][k] = tmp; 
				}
	}
}

void XuatMT(int a[][MAX], int m, int n)
{
	for(int i=0; i<m; i++)
	{
		for(int j=0; j<n; j++)
			printf("%5d", a[i][j]);
		printf("\n");
	}
}


void NhapMT(int a[MAX][MAX], int &m, int &n)
{
	printf("Nhap so dong, so cot:");
	scanf("%d%d", &m, &n);
	for(int i=0; i<m; i++)
		for(int j=0; j<n; j++)
		{
			printf("a[%d][%d] = ", i, j);
			scanf("%d", &a[i][j]);
		}
}

int main()
{
	int a[MAX][MAX] ;
	int m,n;
	NhapMT(a,m,n);
	printf("Ma tran ban dau:\n");
	XuatMT(a,m,n);
	SapXep(a,m,n);
	printf("\nMa tran sau khi sap xep:\n");
	XuatMT(a,m,n);
	
}

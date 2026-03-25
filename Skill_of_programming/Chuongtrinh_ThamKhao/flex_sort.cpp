/*
Viet ham sap xep mang, cho phep lua chon xep tang/giam
*/
#include<stdio.h>

void Sort(int a[], int n, int sxtd=1)
{
	if(sxtd)  // Sap xep tang dan
	{
		for(int i=0; i<n-1; i++)
			for(int j=i+1; j < n; j++)
				if(a[i] > a[j])
				{
					int t = a[i]; a[i] = a[j]; a[j] = t;
				}
	}	
	else // Sap xep giam dan
	{
		for(int i=0; i<n-1; i++)
			for(int j=i+1; j < n; j++)
				if(a[i] < a[j])
				{
					int t = a[i]; a[i] = a[j]; a[j] = t;
				}
	}	
}

void XuatMang(int a[], int n)
{
	for(int i=0; i < n; i++)
		printf("%d  ", a[i]);
}
// Main prog
int main()
{
	int a[6] =  {3,1,2,8,6,5};
	int n = 6;
	Sort(a,n,0);
	XuatMang(a,n);
}

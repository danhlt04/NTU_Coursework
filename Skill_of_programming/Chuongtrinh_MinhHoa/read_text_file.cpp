/* Chuong trinh hien thi file van ban len man hinh.
*/

#include<stdio.h>

// Ham mo 1 file van ban -> hien thi len man hinh
void ReadTextFile(char fname[])
{
	FILE *fp; // Khai bao con tro file	
	fp = fopen(fname, "rt"); // r = readonly, t = text
	if(fp == NULL)
		printf("Khong mo duoc file %s.", fname);
	else
	{   // Doc tung ky tu -> in ra man hinh
		while(!feof(fp)) 
		{
			printf("%c", fgetc(fp));
		}
	}
}

int main()
{
	char fname[] = "d:\\tiengthu.txt";
	ReadTextFile(fname);
}

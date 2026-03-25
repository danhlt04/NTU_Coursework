#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[])
{
	if(argc != 4)
		printf("Truyen doi so sai. Vi du: Compute 4 * 5");
	else
	{
		int a,b;
		char op;
		a = atoi(argv[1]);
		b = atoi(argv[3]);
		op = argv[2][0];
		switch(op)
		{
			case '+': printf("%d + %d = %d\n", a,b,a+b); break;
			case '-': printf("%d - %d = %d\n", a,b,a-b); break;
			case '*': printf("%d * %d = %d\n", a,b,a*b); break;
			case '/':
				{
					if(b==0) printf("Loi chia cho 0!");
					else printf("%d / %d = %f", a, b, float(a)/b);
				}
			default:
				printf("Khong thuc hien duoc!");
		}
	}
}

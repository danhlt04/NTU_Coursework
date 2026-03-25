#include <stdio.h>

int main()
{
	char kt;
	
	while (1)
	{
		printf("Cu phap khai bao 1 bien so nguyen trong C :\n");
		printf("A. int    1a;\n");
		printf("B. float  n;\n");
		printf("C. long   b1;\n");
		printf("D. double c;\n");
		printf("Ban lua chon dap an : ");
		scanf(" %c", &kt);
		
		if (kt == 'c' || kt == 'C')
			printf("Chuc mung ban da chon dung!\n");
		else
			printf ("Lua chon khong dung\n");
	}	
	
	return 0;
}
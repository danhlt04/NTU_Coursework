#include <stdio.h>

int main()
{
	for (int i = 0; i < 26; i++)
	{
		printf("%c ", 'a' + i);
	}
	
	printf("\n");
	
	for (int i = 0; i < 26; i++)
	{
		printf("%c ", 'a' + i - 32);
	}
	
	printf("\n");
	
	for (int i = 0; i < 26; i++)
	{
		printf("%c ", 'z' - i);
	}
	
	printf("\n");
	
	for (int i = 0; i < 26; i++)
	{
		printf("%c ", 'z' - i - 32);
	}
	
	return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <ctype.h>
int main(int argc, char *argv[]) 
{
	if (argc < 3) {
        printf("Use: %s <characters> <text>\n", argv[0]);
        return 1;
    }
	char *characters = argv[1];
	char input;
	char *text = argv[2];
	while (1)
	{
		int i=0;
		printf("%s\n", text);
		input = getch();
		putchar(input);
		printf("\n");
		for (i=0; i < strlen(characters); i++)
		{
			if (tolower(input) == tolower(characters[i]))
			{
				//printf("%d", i+1);
				exit(i+1);	
			}
		}
		printf("Error: %c wasn't found \n", input);
		printf("Elections: %s\n", characters);
	}
}

#include <stdio.h>

int main(int argc,char** argv)
{
	int c;
	for(int i=1;i<argc;i++)
{
	fprintf(stderr,"%d-%s\n",i,argv[i]);
/*	continue;*/
	FILE* fread=fopen(argv[i],"r");
		while ((c=getc(fread))!=EOF)
		{
			if (c=='\n')
				printf("\t%d\n",i);
			else
				putchar(c);
		}
}
return 0;
}


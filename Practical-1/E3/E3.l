%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int val;
char c[100];
%}
%%
[a-zA-Z0-9]* {strcpy(c,yytext);}
%%
void main(){
yyin = fopen("E3.txt","r");
yylex();
char ch;
int i=0,j,s=0,w=0,ndig[10],len=0;
for(i=0;i<10;i++)
	ndig[i]=0;
i=0;
while(c[i]!=EOF)
{
	if(s==1)
		len++;
	if(c[i]==' '||c[i]=='\n'||c[i]=='\t')
	{
		s=0;
		if(len<10)
			++ndig[len];
		len=0;
	}
	else if(s==0)
	{
		s=1;
		w++;
	}
i++;
}
for(i=0;i<10;i++)
{
	printf("%d =\t %d",i,ndig[i]);
	printf("\n");
}
}
int yywrap(){return 1;}

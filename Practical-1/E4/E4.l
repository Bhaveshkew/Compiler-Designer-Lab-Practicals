%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<ctype.h>
char c[100];
int i;
%}
symbol [,|;|&|%|(|)|"|'|{|}|<|>|!|@|#|$|^]
letter[a-zA-Z]
digit [0-9]
%%
[a-zA-Z] {	strcpy(c,yytext);
		for(i=0;c[i]!='\0';i++)
		{
			if(c[i]>='A' && c[i]<='Z')
			{
				c[i]=c[i]+32;
			}
		}
		printf("%s",c);
	   }
[0-9]* {printf("\n Digit: %s",yytext);}
"//".*\n {      printf("\n Single Line Comment \t");
	 	strcpy(c,yytext);
		for(i=0;c[i]!='\0';i++)
		{
			if(c[i]>='A' && c[i]<='Z')
			{
				c[i]=c[i]+32;
			}
			if(c[i]=='/')
			{
				c[i]=' ';
			}
		}
		printf("%s",c);
	 }
"/*"[^*/]*"*/" {printf("\n Multi-Line Comment \n");
		strcpy(c,yytext);
		for(i=0;c[i]!='\0';i++)
		{
			if(c[i]>='A' && c[i]<='Z')
			{
				c[i]=c[i]+32;
			}
			if(c[i]=='/' || c[i]== '*')
			{
				c[i]=' ';
			}
		}
		printf("%s",c);
	       }
{symbol}+ {printf("\n \n Special Character: %s",yytext);}
%%
void main(){
yyin = fopen("E4.txt","r");
yylex();
}
int yywrap(){return 1;}
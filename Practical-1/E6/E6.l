%{
#include<stdio.h>
#include<string.h>
int lines=0,words=0,smallchar=0,capitalchar=0,digits=0,specialchar=0,questions=0;
char ch[100];
int i,j,k;
%}
%%
\n {lines++; words++;}
([0-2][0-9]|3[0-1])\/(0[1-9]|1[0-2])\/([1-2][0-9][0-9][0-9]) {printf("\n Date of Examination : %s",yytext);}
[a-zA-Z0-9]*"College "[a-zA-Z0-9]* {printf("\n College Name : %s",yytext);
				    strcpy(ch,yytext);
				    for(i=0;ch[i]!='\0';i++)
				    {
					if(ch[i]>='a' && ch[i]<='z')
					{
						smallchar++;
					}
					if(ch[i]>='A' && ch[i]<='Z')
					{
						capitalchar++;
					}
					if(ch[i]>='0' && ch[i]<='9')
					{
						digits++;
					}
				    }
				    lines++;	
}
"Sem:".*\n {
		strcpy(ch,yytext);
		for(i=0;ch[i]!='\0';i++)
		{
			if(ch[i]>='a' && ch[i]<='z')
			{
				smallchar++;
			}
			if(ch[i]>='A' && ch[i]<='Z')
			{
				capitalchar++;
			}
			if(ch[i]>='0' && ch[i]<='9')
			{
				digits++;
			}
			if(ch[i]==' ')
			{
				words++;
			}
			if(ch[i]>='S' && ch[i+1]<='e' && ch[i+2]=='m' && ch[i+3]==':')
			{
				ch[i]=' ';
				ch[i+1]=' ';
				ch[i+2]=' ';
				ch[i+3]=' ';
				i=i+3;
			}
	      }
	      printf("\n Semester : %s",ch);
	      lines++;
	}
"Question".*\n {questions++;
		strcpy(ch,yytext);
		for(i=0;ch[i]!='\0';i++)
		{
			if(ch[i]>='a' && ch[i]<='z')
			{
				smallchar++;
			}
			if(ch[i]>='A' && ch[i]<='Z')
			{
				capitalchar++;
			}
			if(ch[i]>='0' && ch[i]<='9')
			{
				digits++;
			}
			if(ch[i]==' ')
			{
				words++;
			}
			if(ch[i]>='S' && ch[i+1]<='e' && ch[i+2]=='m' && ch[i+3]==':')
			{
				ch[i]=' ';
				ch[i+1]=' ';
				ch[i+2]=' ';
				ch[i+3]=' ';
				i=i+3;
			}
	      }
	      lines++;
	      }
[\t' '] words++;
[a-z] smallchar++;
[A-Z] capitalchar++;
[0-9] digits++;
. specialchar++;
%%
void main()
{
yyin = fopen("E6.txt","r");
yylex();
printf("\n Number of Questions : %d",questions);
printf("\n File has %d lines",lines);
printf("\n File has %d words",words);
printf("\n File has %d small characters",smallchar);
printf("\n File has %d capital characters",capitalchar);
printf("\n File has %d digits",digits);
printf("\n File has %d special characters",specialchar);
printf("\n File has %d total characters in all",smallchar+capitalchar+digits+specialchar);
}
int yywrap(){ return 1;}
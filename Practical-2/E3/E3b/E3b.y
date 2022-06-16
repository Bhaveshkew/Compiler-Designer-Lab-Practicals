%{
#include<stdio.h>
#include<stdlib.h>
%}
%token DAYMON YEAR SP NL
%%
stmt: DAYMON SP DAYMON SP YEAR NL { 
				if(($1>=1 && $1<=31) && ($3==1 || $3==3 || $3==5 || $3==7 || $3==8 || $3==10 || $3==12))
				{
					printf("Valid Date");
					exit(0);
				}
				else if(($1>=1 && $1<=30) && ($3==4 || $3==6 || $3==9 || $3==11))
				{
					printf("Valid Date");
					exit(0);
				}
				else if(($1>=1 && $1<=28) && ($3==2))
				{
					printf("Valid Date");
					exit(0);
				}
				else if(($1==29) && ($3==2) && (($5%4==0) && (($5%400==0) || ($5%100!=0))))
				{
					printf("Valid Date");
					exit(0);
				}
				else
				{
					printf("Invalid Date");
					exit(0);
				}
} 
%%
int yyerror(char *msg)
{
printf("Invalid Date.\n");
exit(0);
}
void main()
{
printf("Enter An Expression \n");
yyparse();
}
int yywrap(){ return 1;}
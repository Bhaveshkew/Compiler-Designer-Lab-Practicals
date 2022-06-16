%{
#include<stdio.h>
#include<stdlib.h>
int res=0;
%}
%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt: exp1 NL {printf(" Given Expression is a Valid Expression.\n");
	       exit(0);}
;
exp1: exp1 '+' exp1 {printf("+");}
| exp1 '-' exp1 {printf("-");}
| exp1 '*' exp1 {printf("*");}
| exp1 '/' exp1 {printf("/");}
| '(' exp1 ')'
| ID {printf("%c",(char)yylval);}
;
%%
int yyerror(char *msg)
{
printf("Given Expression is an Invalid Expression.\n");
exit(0);
}
void main()
{
printf("Enter An Expression \n");
yyparse();
}
int yywrap(){ return 1;}
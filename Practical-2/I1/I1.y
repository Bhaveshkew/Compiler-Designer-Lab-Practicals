%{
#include<stdio.h>
#include<stdlib.h>
int res=0;
%}
%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt: exp NL {printf("Answer is %d \n",$1);
	      exit(0);}
|
exp1 NL {printf("Valid Expression. \n But Calculation Can Be Performed on Variables \n");
	 exit(0);}
;
exp: exp '+' exp {$$=$1+$3;}
| exp '-' exp {$$=$1-$3;}
| exp '*' exp {$$=$1*$3;}
| exp '/' exp {$$=$1/$3;}
| '(' exp ')' {$$=$1;}
| NUMBER
;
exp1: exp1 '+' exp1
| exp1 '-' exp1
| exp1 '*' exp1
| exp1 '/' exp1
| '(' exp1 ')'
| ID
;
%%
int yyerror(char *msg)
{
printf("Invalid Expression \n");
exit(0);
}
void main()
{
printf("Enter An Expression \n");
yyparse();
}
int yywrap(){ return 1;}
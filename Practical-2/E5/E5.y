%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B C NL
%%
stmt: A S B C NL {printf(" Given Expression is a Valid Expression. \n");
              exit(0);}
;
S: A S B
|
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
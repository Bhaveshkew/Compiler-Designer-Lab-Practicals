%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ID NUM SP1 SP2 NL
%%
stmt: ID SP1 ID SP2 ID NL {printf(" Given Expression is a Valid Expression. \n");exit(0);}
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
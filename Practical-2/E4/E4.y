%{
#include<stdio.h>
#include<stdlib.h>
%}
%token DO WHILE ID NUM LE GE EE NE AND OR PF NL
%right '='
%left AND OR
%left '<' '>' LE GE EE NE
%left '+' '-'
%left '*' '/'
%left '!'
%%
stmt: exp NL {printf(" Given Expression is a Valid Expression. \n");exit(0);}
;
exp: DO'{'exp1'}'WHILE'('exp2')'';'
;
exp1: exp1 exp1
|exp3';'
|exp1 PF
|PF
;
exp3: ID'='exp3
|exp3'+'exp3
|exp3'-'exp3
|exp3'*'exp3
|exp3'/'exp3
|exp3'<'exp3
|exp3'>'exp3
|exp3 LE exp3
|exp3 GE exp3
|exp3 EE exp3
|exp3 NE exp3
|exp3 OR exp3
|exp3 AND exp3
|ID
|NUM
;
exp2: exp3'<'exp3
|exp3'>'exp3
|exp3 LE exp3
|exp3 GE exp3
|exp3 EE exp3
|exp3 NE exp3
|exp3 OR exp3
|exp3 AND exp3
|ID
|NUM
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
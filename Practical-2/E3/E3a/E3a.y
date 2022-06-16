%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ID1 ID2 NUM SP1 SP2 SP3 NL
%%
stmt: ID2 SP1 ID1 SP3 NUM SP2 NUM NL {printf(" Given Expression is a Valid Expression. \n");
	               	              exit(0);}
|ID1 SP1 ID1 SP3 NUM SP2 NUM NL {printf(" Given Expression is a Valid Expression. \n");
	               	         exit(0);}
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
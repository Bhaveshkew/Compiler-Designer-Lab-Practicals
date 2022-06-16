%{
#include<stdio.h>
#include<stdlib.h>
%}
%token ZERO ONE NL
%%
stmt:  ZERO z NL {printf(" Given Expression Starts and Ends with Zero. \n");
	               exit(0);}
|ONE y NL {printf(" Given Expression Starts and Ends with One. \n");
               exit(0);}
;
z: a z
|ZERO
;
y: a y
|ONE
;
a: ZERO
|ONE
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
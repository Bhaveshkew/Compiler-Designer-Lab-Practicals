%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int val;
%}
digit [0-9]
%%
({digit})* {
	    val = atoi(yytext);
	    if(val%7==0)
		printf("\n %d \t %d",val,val+3);
	    else if(val%2==0)
		printf("\n %d \t %d",val,val+4);
	    else
		printf("\n %d",val);
	   }
%%
void main(){
yyin = fopen("E2.txt","r");
yylex();
}
int yywrap(){return 1;}

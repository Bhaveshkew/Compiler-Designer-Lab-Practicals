%{
#include<stdio.h>
#include<stdlib.h>
int val;
%}
%%
[0-9]+ {printf("\n Given Characters are Numbers");}
%%
void main(){
yyin = fopen("sample.txt","r");
yylex();
}
int yywrap(){return 1;}
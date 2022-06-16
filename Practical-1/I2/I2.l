%{
#include<stdio.h>
int lines=0,words=0,smallchar=0,capitalchar=0,digits=0,specialchar=0;
%}
%%
\n {lines++; words++;}
[\t' '] words++;
[a-z] smallchar++;
[A-Z] capitalchar++;
[0-9] digits++;
. specialchar++;
%%
void main()
{
yyin = fopen("I2.txt","r");
yylex();
printf("\n File has %d lines",lines);
printf("\n File has %d words",words);
printf("\n File has %d small characters",smallchar);
printf("\n File has %d capital characters",capitalchar);
printf("\n File has %d digits",digits);
printf("\n File has %d special characters",specialchar);
printf("\n File has %d total characters in all",smallchar+capitalchar+digits+specialchar);
}
int yywrap(){ return 1;}
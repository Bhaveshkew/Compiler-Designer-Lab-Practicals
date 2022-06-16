%{
#include<stdio.h>
%}
digit [0-9]
letter[a-zA-Z]
symbol [,|;|&|%|(|)|"|'|{|}|<|>]
string (\".*\")
%%
if|else|switch|while|do|void|main|printf|scanf|for {printf("\n %s is a KEYWORD",yytext);}
{letter}({letter}|{digit})* {printf("\n %s is an IDENTIFIER",yytext);}
{string}  {printf("\n %s is a STRING",yytext);}
"&&"|"=="|"="|"++"|"+"|"-"|"*"|"/"|"||"|"!" {printf("\n %s is an OPERATOR",yytext);}
({digit})* {printf("\n %s is a DIGIT",yytext);}
{symbol} {printf("\n %s is a SYMBOL",yytext);}
\n {printf("\n %s is a NEW LINE",yytext);}
\t {printf("\n %s is a TAB SPACE",yytext);}
%%
void main(){
yyin = fopen("S1.txt","r");
yylex();
}
int yywrap(){return 1;}
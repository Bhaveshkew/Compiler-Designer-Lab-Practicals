%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int val;
char c[100];
%}
digit [0-9]
letter [a-zA-Z]
symbol [,|;|&|%|(|)|"|'|{|}|<|>]
string (\".*\")
%%
if|else|switch|while|do|void|main|printf|scanf|for|int|bool|char|float|double {strcpy(c,yytext);strcat(c,"AAA");printf("\n KEYWORD: %s",c);}
{letter}({letter}|{digit})* {strcpy(c,yytext);strcat(c,"III");printf("\n IDENTIFIER: %s",c);}
({digit})* {val = atoi(yytext);printf("\n DIGIT: %d",val+2);}
%%
void main(){
yyin = fopen("E1.txt","r");
yylex();
}
int yywrap(){return 1;}

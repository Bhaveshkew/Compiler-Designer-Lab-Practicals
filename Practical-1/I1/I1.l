%{
#include<stdio.h>
%}
%%
[aeiouAEIOU][a-zA-Z0-9]* {printf("Word starts with a Vowel : \t%s\n",yytext);};
[a-zA-Z0-9]+ {printf("Word does not starts with a Vowel : \t%s\n",yytext);};
%%
int main(){
yyin = fopen("I1.txt","r");
yylex();
}
int yywrap() {return 1;}
%{
#include "y.tab.h"
#include<stdio.h>
%}
%%
[0-2][1-9]|[3][0-1]|[2][0] {yylval=atoi(yytext); return DAYMON;}
[1-2][0-9][0-9][0-9] {yylval=atoi(yytext); return YEAR;}
"-"|"/" {return SP;}
\n {return NL;}
. {return yytext[0];}
%%
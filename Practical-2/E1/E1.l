%{
#include"y.tab.h"
%}
%%
[a-zA-Z0-9] {yylval=int(yytext);return ID;}
\n {return NL;}
. {return yytext[0];}
%%
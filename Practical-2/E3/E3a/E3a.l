%{
#include "y.tab.h"
%}
%%
[a-zA-Z] {return ID1;}
[a-zA-Z]+ {return ID2;}
[0-9]+ {return NUM;}
"@" {return SP1;}
"-" {return SP2;}
"+" {return SP3;}
\n {return NL;}
. {return yytext[0];}
%%
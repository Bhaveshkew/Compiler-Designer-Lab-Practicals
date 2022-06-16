%{
#include "y.tab.h"
%}
%%
[a-zA-Z0-9]+ {return ID;}
"=" {return SP1;}
"*" {return SP2;}
\n {return NL;}
. {return yytext[0];}
%%
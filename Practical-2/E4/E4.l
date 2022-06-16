%{
#include "y.tab.h"
%}
chars [a-zA-Z]
digit [0-9]
a "%d"|"%f"|"%c"|"%s"
id [a-zA-Z][a-zA-Z0-9]*
%%
do {return DO;}
while {return WHILE;}
{digit}+ {return NUM;}
{chars}({chars}|{digit})* {return ID;}
"<=" {return LE;}
">=" {return GE;} 
"==" {return EE;} 
"!=" {return NE;} 
"&&" {return AND;}
"||" {return OR;} 
printf\((\"({a}*|.*)*\"(,{id})*\))\; {return PF;}
\n {return NL;}
. {return yytext[0];}
%%
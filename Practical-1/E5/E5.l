%{
#include<stdio.h>
#include<string.h>
char c[100];
int flagOL=0,flagUL=0,i=1,j,k;
%}
%%
"</br>" {printf("\n");}
"<p>".*\n {k=0;for(j=0;j<strlen(yytext)-5;j++)
	       {
	         if(yytext[j]=='<' && yytext[j+1]=='p')
		 {
			j=j+3;
		 }
		 if(yytext[j]=='<' && yytext[j+1]=='\\')
		 {
			j=j+4;
		 }
		 c[k]=yytext[j];
		 k++;
		 }
		 printf("\n %s ",c);
		 
}
"<ol>"  {flagOL=1;
	 flagUL=0;
}
"</ol>" {i=0,flagOL=0;}
"<li>".*"</li"> { if(flagOL==1 && flagUL==0)
		  {
			printf("\n %d \t",i);
			i++;
		  }
		  if(flagOL==0 && flagUL==1)
		  {
			printf("\n # \t");
		  }
		  for(j=4;j<strlen(yytext)-5;j++)
		  {
			printf("%c",yytext[j]);
		  }
}
"<ul>" {flagOL=0;
	flagUL=1;
}
"</ul>" {flagUL=0;}
%%
void main(){
yyin = fopen("E5.txt","r");
yylex();
}
int yywrap(){return 1;}
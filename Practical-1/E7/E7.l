%{
#include<stdio.h>
#include<string.h>
char ch[100];
int a=0,b=0,c=0,d=0,e=0,nf=0,nm=0,nc=0,ni=0,ne=0;
%}
%%
"TCS"|"Infosys"|"Wipro"|"Accenture"|"Informatica" {strcpy(ch,yytext);
					 printf("\n Company Name : %s",ch);
					 if(strcmp(ch,"TCS")==0) a++;
					 if(strcmp(ch,"Infosys")==0) b++;
					 if(strcmp(ch,"Wipro")==0) c++;
					 if(strcmp(ch,"Accenture")==0) d++;
					 if(strcmp(ch,"Informatica")==0) e++;
}
"CSE"|"IT"|"EC" {strcpy(ch,yytext);
	   printf("\n Branch : %s",ch);
	   if(strcmp(ch,"CSE")==0) nc++;
	   if(strcmp(ch,"IT")==0) ni++;
	   if(strcmp(ch,"EC")==0) ne++;
}
"Male"|"Female" {strcpy(ch,yytext);
	     printf("\n Gender : %s",ch);
	     if(strcmp(ch,"Female")==0) nf++;
	     if(strcmp(ch,"Male")==0) nm++;
}
[7-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] {printf("\n Mobile : %s",yytext);}
[1-9][0-9][0-9][0-9][0-9][0-9]* {printf("\n Package : %s",yytext);}
[a-z.0-9_]+@[a-z]+".com"|[a-z.0-9_]+@[a-z]+".in"|[a-z.0-9_]+@[a-z]+".edu" {printf("\n Mail id : %s",yytext);}
[0-9]"."[0-9]* {printf("\n CGPA : %s",yytext);}
[a-zA-Z]* {printf("\n Name of the student : %s",yytext);}
%%
void main()
{
yyin = fopen("E7.txt","r");
yylex();
printf("\n\n\n");
printf("\n Number Of students placed in TCS         : %d ",a);
printf("\n Number of students placed in Infosys     : %d ",b);
printf("\n Number of students placed in Wipro       : %d ",c);
printf("\n Number of students placed in Accenture   : %d ",d);
printf("\n Number of students placed in Informatica : %d ",e);
printf("\n Number of Female students                : %d ",nf);
printf("\n Number of Male students                  : %d ",nm);
printf("\n Number of CSE students placed            : %d ",nc);
printf("\n Number of IT students placed             : %d ",ni);
printf("\n Number of EC students placed             : %d ",ne);
}
int yywrap(){ return 1;}
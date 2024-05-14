%{
#include "y.tab.h"
#include<stdio.h>
#include<math.h>
//extern int yylval;
%}
%%
[0-9]+(\.[0-9]*)? 	{yylval.dval=atof(yytext); return NUMBER;}
[ \t]	;
\n	return 0;
.	return yytext[0];
sin	return SINE;
log     return nLOG;
sqrt    return SQRT;
%%
int yywrap()
{
return 1;
}

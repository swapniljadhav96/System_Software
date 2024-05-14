%{			
#include"y.tab.h"
#include"stdio.h"
#include"string.h"
int lineno=1;
%}

number [0-9]+|([0-9]*\.[0-9]+)	    
identifier [a-zA-Z][a-zA-Z0-9]*
%%

{identifier} {strcpy(yylval.var,yytext);
                return VAR;}

{number} {strcpy(yylval.var,yytext);
          return NUM;}

\n lineno++;

[\t ] ;

. {return yytext[0];}		
%%



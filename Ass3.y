%{
#include<stdio.h>
int yylex();
int yyerror();
%}

%token ID TYPE SC NL COMMA
%%
start:TYPE varlist SC NL    {printf("valid declarative statement");}
;

varlist:varlist COMMA ID|ID
;
%%
int yyerror()
{
printf("invalid declarative statement");
}
int yywrap()
{
return 1;
}
int main()
{
yyparse();
}

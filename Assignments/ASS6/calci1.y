%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int yylex();
int yyerror();
%}


%union
{
double dval;
}
%token <dval> NUMBER
%token NAME SINE nLOG SQRT
%left '+''-'
%left '*''/'
%left SINE nLOG SQRT
%right '^'
%type <dval> E
%%
S : NAME '=' E
  | E		        {printf("=%g\n",$1);}
  ;

E : E '+' E	{$$=$1+$3;}
  | E '-' E	{$$=$1-$3;}
  | E '*' E	{$$=$1*$3;}
  | E '/' E	{$$=$1/$3;}
  | NUMBER	{$$=$1;}
  ;

E : SINE E  	{$$=sin($2 * 3.14/180);}
  | nLOG E  	{$$=log($2);}
  | E '^' E	{$$=pow($1,$3);}
  | SQRT E      {$$=sqrt($2);}
  ; 
%%
int main()
{
yyparse();
return 0;
}
int yyerror()
{
printf("syntax error");
}


//lex calci1.l
//yacc -d calci1.y
//cc lex.yy.c y.tab.c -lm
//./a.out
//output:- maunllay
//10+20
//6*45

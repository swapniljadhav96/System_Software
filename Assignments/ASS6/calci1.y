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

/*
This code defines a Bison parser for mathematical expressions and a Flex lexer to provide the tokens for the parser. The parser can handle basic arithmetic operations, some mathematical functions (sine, logarithm, square root), and variable assignments. 
Below is the detailed explanation with comments for each part of the code:

Bison File (calci1.y)
Header Section
c
Copy code
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex();  // Function prototype for the lexer
int yyerror();  // Function prototype for error handling
%}
Includes: Includes standard input/output, standard library, and math library headers.
Function Prototypes: Declares the yylex and yyerror functions, which are implemented elsewhere (in the lexer and main program).
Bison Declarations
c
Copy code
%union
{
    double dval;  // Union member to hold numeric values
}

%token <dval> NUMBER  // Token definition for numeric values with associated `dval` value
%token NAME SINE nLOG SQRT  // Token definitions for variable names and functions

%left '+' '-'  // Precedence and associativity for addition and subtraction
%left '*' '/'  // Precedence and associativity for multiplication and division
%left SINE nLOG SQRT  // Precedence for functions
%right '^'  // Right associativity for exponentiation

%type <dval> E  // Non-terminal `E` produces `dval` values
%union: Defines a union to hold different types of semantic values (here, only dval for doubles).
%token: Defines tokens and their associated semantic values.
%left, %right: Specifies operator precedence and associativity.
%type: Specifies that non-terminal E has a semantic type of dval.
Grammar Rules and Actions
c
Copy code
%%
S : NAME '=' E
  | E { printf("=%g\n", $1); }
  ;

E : E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | NUMBER { $$ = $1; }
  ;

E : SINE E { $$ = sin($2 * M_PI / 180); }  // Convert degrees to radians for sin function
  | nLOG E { $$ = log($2); }
  | E '^' E { $$ = pow($1, $3); }
  | SQRT E { $$ = sqrt($2); }
  ;
Start Rule:
S : NAME '=' E handles variable assignment (not implemented fully here).
S : E evaluates an expression and prints the result.
Expression Rules:
Handles arithmetic operations (+, -, *, /), where each operation combines two sub-expressions.
Handles functions (sine, logarithm, square root) and exponentiation (^).
Main Function and Error Handling
c
Copy code
int main()
{
    yyparse();  // Start parsing
    return 0;
}

int yyerror()
{
    printf("syntax error\n");  // Print syntax error message
    return 0;
}
Main Function: Calls yyparse to start parsing input.
Error Handling: Defines yyerror to print a syntax error message.

*/

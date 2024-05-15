%{
#include<stdio.h>
int yylex();
int yyerror();

%}
%token ID TYPE SC NL COMMA
%%
start:TYPE varlist SC NL 	{printf("valid declarative statement");}
;

varlist:varlist COMMA ID
	|ID
;


%%
int yyerror()
{
printf("Invalid declarative statement");
}

int yywrap()
{
return 1;
}

int main()
{
yyparse();
}



//lex Var1.l
//yacc -d Var1.y
//cc lex.yy.c y.tab.c
// ./a.out

//output Screen:
//int a,b;
//valid declarative statementint 
//a=10,
//Invalid declarative statemen

/*
This Yacc (Bison) program defines a simple grammar for parsing declarative statements, specifically for variable declarations in a programming language. 
It also includes a Flex (Lex) file to provide token definitions and lexical analysis. Let's go through the Yacc file line by line, adding detailed comments to 
explain each part:


Explanation of Yacc File:
Header Section (%{ ... %}):

#include <stdio.h>: Includes the standard I/O library for input/output operations.
int yylex();: Declares the lexical analyzer function.
int yyerror();: Declares the error handling function.
Token Definitions (%token ...):

Defines tokens used by the parser: ID, TYPE, SC, NL, and COMMA.
Grammar Rules Section (%% ... %%):

Defines the grammar rules for parsing the input.
start: TYPE varlist SC NL { printf("valid declarative statement\n"); }: The start rule, which matches a type, a variable list, a semicolon, and a newline. When matched, it prints "valid declarative statement".
varlist: varlist COMMA ID | ID: Defines a variable list, which can be a recursive definition of varlist followed by a comma and an identifier, or just a single identifier.
Error Handling Function (int yyerror()):

Prints "Invalid declarative statement" when a parsing error occurs.
yywrap Function:

Indicates the end of input for the lexer by returning 1.
Main Function:

Calls yyparse() to start the parsing process.

*/

// Write a program using YACC specifications to implement syntax analysis phase of compiler to 
//validate type and syntax of variable declaration in C program. 

%{
#include<stdio.h>
#include "y.tab.h"
%}
letter 		[A-Za-z]
digit  		[0-9]
keyword 	int|float|char
identifier 	{letter}({letter}|{digit})*
%%
{keyword} 	return TYPE;
"," 		return COMMA;
";" 		return SC;
{identifier} 	return ID;
"\n" 		return NL;
%%

/*
%{
#include<stdio.h>      // Include the standard I/O library for any potential I/O operations
#include "y.tab.h"     // Include the header file generated by Bison (yacc) containing token definitions
%}
letter          [A-Za-z]     // Define a letter as any uppercase or lowercase English alphabet
digit           [0-9]        // Define a digit as any single numeral from 0 to 9
keyword         int|float|char // Define keywords as any of the words: int, float, or char
identifier      {letter}({letter}|{digit})* // Define an identifier starting with a letter followed by any combination of letters or digits
%%

{keyword}       return TYPE;   // Return the token TYPE when a keyword is matched
","             return COMMA;  // Return the token COMMA when a comma is matched
";"             return SC;     // Return the token SC (semicolon) when a semicolon is matched
{identifier}    return ID;     // Return the token ID when an identifier is matched
"\n"            return NL;     // Return the token NL (newline) when a newline character is matched

%%

/* main function and yywrap */

Explanation of Key Components:
Header Section (%{ ... %}):

This section contains C code that is copied verbatim into the generated C file.
#include <stdio.h>: Includes the standard I/O library for any potential input/output operations.
#include "y.tab.h": Includes the header file generated by Bison (or yacc), which contains definitions for tokens like TYPE, COMMA, SC, ID, and NL.
Definitions Section:

letter [A-Za-z]: Defines a letter as any uppercase or lowercase English alphabet character.
digit [0-9]: Defines a digit as any single numeral from 0 to 9.
keyword int|float|char: Defines keyword as any of the specified keywords (int, float, or char).
identifier {letter}({letter}|{digit})*: Defines an identifier as a sequence starting with a letter followed by any combination of letters and digits.
Rules Section (%% ... %%):

{keyword} return TYPE;: When a keyword is matched, return the token TYPE.
"," return COMMA;: When a comma is matched, return the token COMMA.
";" return SC;: When a semicolon is matched, return the token SC.
{identifier} return ID;: When an identifier is matched, return the token ID.
"\n" return NL;: When a newline character is matched, return the token NL.
Main Function and yywrap:

The main function and yywrap function are typically defined in the accompanying Bison file. The yywrap function is used by Flex to indicate the end of input.
Here's a more complete version of the Flex file including the main function and yywrap to ensure it compiles and runs correctly:

Explanation of Additional Components:
Main Function:

int main(void): The main function that calls yylex() to start the lexical analysis.
yylex(): This function, generated by Flex, processes the input and returns tokens as specified in the rules section.
yywrap Function:

int yywrap(): This function is called by Flex when it reaches the end of the input. Returning 1 indicates that the end of input has been reached.
This program defines and recognizes tokens for a simple language, making it a useful starting point for building a lexer to work in conjunction with a parser generated by Bison (or yacc).

*/

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


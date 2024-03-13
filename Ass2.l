%{
	int ccount=0,capcount=0,smalcount=0,lcount=0,numcount=0;
%}

cword [A-Z]+
sword [a-z]+
digit [0-9]+
num {digit}+(\.{digit}+)?
eol \n
%%

{cword} {capcount++;ccount+=yyleng;}
{sword} {smalcount++;ccount+=yyleng;}
{num} {numcount++; ccount+=yyleng;}
{eol} {ccount++;lcount++;}
. {ccount++;}
%%

int main(void) 	
{
	yylex();
	printf("\nNumber of characters: %d",ccount);
	printf("\nNumber of Capital case Characters : %d",capcount);
	printf("\nNumber of small Case Characters : %d",smalcount);
	printf("\nNumber of lines : %d\n",lcount);
	printf("\nThe numbers are: %d\n",numcount);
	return 0;
	}
	
int yywrap()
{
	return 1;
	}

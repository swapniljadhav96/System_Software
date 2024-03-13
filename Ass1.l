%{

%}

letter [A-Za-z]
digit [0-9]
identifier {letter}({letter}|{digit})*
number {digit}+(\.{digit}+)?
punctuation [;,."#(){}]
operators [+=*<>]
keywords if|else|for|int|while|do|void
headerfile "#",*
literal ["].*["]
comment "//".*
multicommnt "/*"(.|\n)*"*/"

%%


{headerfile} {printf("\n headerfile %s is found",yytext);}
{keywords} {printf("\n keywords %s if found",yytext);}
{identifier} {printf("\n identifier %s if found",yytext);}
{number} {printf("\n number %s if found",yytext);}
{punctuation} {printf("\n punctuation %s if found",yytext);}
{operators} {printf("\n operators %s if found",yytext);}
{literal} {printf("\n literal %s if found",yytext);}
{comment} {printf("\n comment %s if found",yytext);}
{multicommnt} {printf("\n multicommnt %s if found",yytext);}


%%


int main(void)
{
    yylex();
    return 0;

}

int yywrap()
{
    return 1;

}

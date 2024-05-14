%{ 
  
    int ccount=0,capcount=0,smalcount=0,lcount=0;
%}

cword [A-Z]+
sword [a-z]+
eol \n
%%

{cword} {capcount++;ccount+=yyleng;}
{sword} {smalcount++;ccount+=yyleng;}
{eol}  {ccount++;lcount++;}
 .  {ccount++;}
%%

int main(void)
{
  yylex();
  printf("\nNumber of characters : %d",ccount);
  printf("\nNumber of Capital Case Words : %d",capcount);
  printf("\nNumber of small Case Words : %d",smalcount);
  printf("\nNumber of Lines : %d",lcount);
  return 0;
}

int yywrap()
{
  return 1;
}


//lex File1.l
//cc lex.yy.c
//./a.out < Input1_txt.txt
//output is generated manullay




%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int i=0,index1=0,tindex=0;
void addqruple(char op[5],char arg1[10],char arg2[10],char result[10]);
int yylex();
int yyerror();
struct q
{
      char op[5];
      char arg1[10];
      char arg2[10];
      char result[10];
}q[30];

%}

%union
{
  char var[10];
}

%token <var>NUM VAR 
%type <var>EXPR ASSIGNMENT 
%left'-''+'
%left'*''/'
%nonassoc UMINUS
%left '('')'

%%

ASSIGNMENT:VAR'='EXPR {
           	strcpy(q[index1].op,"=");
           	strcpy(q[index1].arg1,$3);
           	strcpy(q[index1].arg2,"");
           	strcpy(q[index1].result,$1);
           	strcpy($$,q[index1++].result);
            	}
            ;
EXPR:EXPR'+'EXPR {addqruple("+",$1,$3,$$);}
    |EXPR'-'EXPR {addqruple("-",$1,$3,$$);}
    |EXPR'*'EXPR {addqruple("*",$1,$3,$$);}
    |EXPR'/'EXPR {addqruple("/",$1,$3,$$);}
    |'('EXPR')'EXPR {strcpy($$,$2);}
    |'-'EXPR {addqruple("uminus",$2,"",$$);}
    |VAR
    |NUM
    ;

%%

int main()
{

yyparse();
printf("\n\nthree address code");
for(i=0;i<index1;i++)
{
 printf("\n %s\t %c\t %s\t %s\t %s\n",q[i].result, '=', q[i].arg1,q[i].op,q[i].arg2);
}
printf("\n\nINDEX\t OP\t ARG1\t ARG2\t RESULT");
for(i=0;i<index1;i++)
{
 printf("\n%d\t %s\t %s\t %s\t %s\n",i,q[i].op,q[i].arg1,q[i].arg2,q[i].result);
}
return 0;
}
void addqruple(char op[5],char arg1[10],char arg2[10],char result[10])
 {
 strcpy(q[index1].op,op);
 strcpy(q[index1].arg1,arg1);
 strcpy(q[index1].arg2,arg2);
 sprintf(q[index1].result,"t%d",tindex++);
 strcpy(result,q[index1++].result);  
 }

int yyerror()
{ 
printf("syntax error");
}
int yywrap()
{
return 1;
}


//lex pmcd45.l
//yacc -d pmcd45.y
//cc lex.yy.c y.tab.c
//./a.out
//out put is type manullay 
//eg:- a=b+c*d $
//a=b+c*d;



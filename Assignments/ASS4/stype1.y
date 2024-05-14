%{
#include<stdlib.h>
#include<stdio.h>
int yylex();
int yyerror();

%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION NL

%%

sentence: simple_sentence NL  {printf("Parsed a simple sentence.\n"); exit(0);}
      | compound_sentence NL  {printf("Parsed a compound sentence.\n"); exit(0);}
      ;

simple_sentence: subject verb object
      |     subject verb object prep_phrase
      ;

compound_sentence: simple_sentence CONJUNCTION simple_sentence
      |     compound_sentence CONJUNCTION simple_sentence
      ;

subject:    NOUN
      |     PRONOUN
      |     ADJECTIVE subject
      ;

verb:       VERB
      |     ADVERB VERB
      |     verb VERB
      ;

object:           NOUN
      |     ADJECTIVE object
      ;

prep_phrase:     PREPOSITION NOUN
      ;

%%

int main()
{
yyparse();
}
       
int yyerror()
{
printf("invalid");
}

int yywrap()
{
return 1;
}



//lex stype1.l
//yacc -d stype1.y
//cc lex.yy.c y.tab.c
//./a.out
//Output manuly:-
//I am suraj
//Parsed a simple sentence.
//I am Suraj and he is Sumit
//Parsed a compound sentence.

// Write a program using YACC specifications to implement syntax analysis phase of compiler to
//recognize simple and compound sentences given in input file. 

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

/*
This Bison (Yacc) program defines a grammar for parsing simple and compound sentences in English. The corresponding Flex (Lex) file will provide token definitions and lexical analysis. 
Let's go through the Bison file line by line and add detailed comments to explain each part:

Explanation of Bison File:
Header Section (%{ ... %}):

Includes necessary headers and declarations.
int yylex(); declares the lexical analyzer function.
int yyerror(); declares the error handling function.
Token Definitions (%token ...):

Defines tokens used by the parser: NOUN, PRONOUN, VERB, ADVERB, ADJECTIVE, PREPOSITION, CONJUNCTION, and NL.
Grammar Rules Section (%% ... %%):

Defines grammar rules for parsing sentences, subjects, verbs, objects, and prepositional phrases.
sentence can be a simple_sentence or compound_sentence followed by a newline (NL).
simple_sentence consists of a subject, verb, and object, optionally followed by a prepositional phrase.
compound_sentence is formed by combining simple sentences with conjunctions.
subject can be a noun, pronoun, or an adjective followed by a subject.
verb can be a verb alone, an adverb followed by a verb, or a verb followed by another verb.
object can be a noun or an adjective followed by an object.
prep_phrase is a preposition followed by a noun.
Main Function:

Calls yyparse() to start the parsing process.
Error Handling Function (yyerror):

Prints "Invalid sentence." when a parsing error occurs.
yywrap Function:

Indicates the end of input for the lexer by returning 1.

%{
#include <stdlib.h>
#include <stdio.h>

int yylex(); // Declare the lexical analyzer function
int yyerror(); // Declare the error handling function

%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION NL // Token definitions

%%

sentence: simple_sentence NL { printf("Parsed a simple sentence.\n"); exit(0); }
        | compound_sentence NL { printf("Parsed a compound sentence.\n"); exit(0); }
        ;

simple_sentence: subject verb object
               | subject verb object prep_phrase
               ;

compound_sentence: simple_sentence CONJUNCTION simple_sentence
                 | compound_sentence CONJUNCTION simple_sentence
                 ;

subject: NOUN
       | PRONOUN
       | ADJECTIVE subject
       ;

verb: VERB
     | ADVERB VERB
     | verb VERB
     ;

object: NOUN
       | ADJECTIVE object
       ;

prep_phrase: PREPOSITION NOUN
           ;

%%

int main() {
    yyparse(); // Call the parser
    return 0;
}

int yyerror() {
    printf("Invalid sentence.\n");
    return 0;
}

int yywrap() {
    return 1; // Indicates the end of input for the lexer
}

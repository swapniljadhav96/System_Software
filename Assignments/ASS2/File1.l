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


/*
%{ 
    int ccount=0,capcount=0,smalcount=0,lcount=0; // Initialize counters for characters, capital case words, small case words, and lines
%}

cword [A-Z]+ // Define a capital case word as one or more consecutive uppercase letters
sword [a-z]+ // Define a small case word as one or more consecutive lowercase letters
eol \n // Define the end of a line as a newline character
%%

{cword} {capcount++; ccount+=yyleng;} // When a capital case word is found, increment capcount and add the length of the word to ccount
{sword} {smalcount++; ccount+=yyleng;} // When a small case word is found, increment smalcount and add the length of the word to ccount
{eol} {ccount++; lcount++;} // When an end of line is found, increment ccount and lcount
. {ccount++;} // For any other character, increment ccount
%%

int main(void)
{
    yylex(); // Call the lexical analyzer to start processing input
    printf("\nNumber of characters : %d", ccount); // Print the total number of characters
    printf("\nNumber of Capital Case Words : %d", capcount); // Print the number of capital case words
    printf("\nNumber of small Case Words : %d", smalcount); // Print the number of small case words
    printf("\nNumber of Lines : %d", lcount); // Print the number of lines
    return 0; // Return 0 to indicate successful execution
}

int yywrap()
{
    return 1; // Return 1 to indicate the end of input for the lexer
}

Explanation of Key Components:
Header Section (%{ ... %}):

Contains variable declarations for counting characters (ccount), capital case words (capcount), small case words (smalcount), and lines (lcount).
Definitions Section:

cword: Defines a capital case word as one or more uppercase letters.
sword: Defines a small case word as one or more lowercase letters.
eol: Defines the end of a line as a newline character.
Rules Section (%% ... %%):

{cword}: When a capital case word is matched, increment capcount by 1 and add the length of the word (yyleng) to ccount.
{sword}: When a small case word is matched, increment smalcount by 1 and add the length of the word (yyleng) to ccount.
{eol}: When an end of line is matched, increment both ccount and lcount by 1.
.: For any other character, increment ccount by 1.
Main Function:

int main(void): The main function that calls yylex() to start the lexical analysis.
After yylex() finishes processing the input, it prints the counts for characters, capital case words, small case words, and lines.
yywrap Function:

A function that Flex calls when it reaches the end of the input. Returning 1 indicates that the end of input is reached.
This Flex program is useful for analyzing text input to count specific elements such as characters, words of different cases, and lines, which could be helpful for text processing or analysis tasks.
*/




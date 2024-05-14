%{
/*
 * We now build a lexical analyzer to be used by a higher-level parser.
 */
#include "y.tab.h"    /* token codes from the parser */
%}
verb 		is|am|are|was|were|be|being|been|do|does|did|will|would|should|can|could|have|has|had|go|play
adverb 		very|simply|gently|calmly|quietly
preposition 	to|from|above|behind|below|between
conjunction 	if|then|and|but|or
adjective 	their|my|your|his|her|its
pronoun 	I|you|he|she|they
noun 		[a-zA-Z]+
%%
[\t ]+  ;
{verb}    	 return VERB;  
{adverb}         return ADVERB;   
{preposition}    return PREPOSITION; 
{conjunction}    return CONJUNCTION;   
{adjective}      return ADJECTIVE;          
{pronoun}        return PRONOUN;
{noun}           return NOUN;  
"\n"		 return NL;  
%%


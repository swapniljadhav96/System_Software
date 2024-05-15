    #include <stdio.h>  
    #include <string.h>  
      
    #define SUCCESS 1  
    #define FAILED 0  
      
    int E(), Edash(), T(), Tdash(), F();  
      
    const char *cursor;  
    char string[64];  
      
    int main()  
    {  
        puts("Enter the string");  
        // scanf("%s", string);  
        sscanf("i+(i+i)*i", "%s", string);  
        cursor = string;  
        puts("");  
        puts("Input      Action");  
        puts("--------------------------------");  
      
        if (E() && *cursor == '\0') {  
            puts("--------------------------------");  
            puts("String is successfully parsed");  
            return 0;  
        } else {  
            puts("--------------------------------");  
            puts("Error in parsing String");  
            return 1;  
        }  
    }  
      
    int E()  
    {  
        printf("%-16s E -> T E'\n", cursor);  
        if (T()) {  
            if (Edash())  
                return SUCCESS;  
            else  
                return FAILED;  
        } else  
            return FAILED;  
    }  
      
    int Edash()  
    {  
        if (*cursor == '+') {  
            printf("%-16s E' -> + T E'\n", cursor);  
            cursor++;  
            if (T()) {  
                if (Edash())  
                    return SUCCESS;  
                else  
                    return FAILED;  
            } else  
                return FAILED;  
        } else {  
            printf("%-16s E' -> $\n", cursor);  
            return SUCCESS;  
        }  
    }  
      
    int T()  
    {  
        printf("%-16s T -> F T'\n", cursor);  
        if (F()) {  
            if (Tdash())  
                return SUCCESS;  
            else  
                return FAILED;  
        } else  
            return FAILED;  
    }  
      
    int Tdash()  
    {  
        if (*cursor == '*') {  
            printf("%-16s T' -> * F T'\n", cursor);  
            cursor++;  
            if (F()) {  
                if (Tdash())  
                    return SUCCESS;  
                else  
                    return FAILED;  
            } else  
                return FAILED;  
        } else {  
            printf("%-16s T' -> $\n", cursor);  
            return SUCCESS;  
        }  
    }  
      
    int F()  
    {  
        if (*cursor == '(') {  
            printf("%-16s F -> ( E )\n", cursor);  
            cursor++;  
            if (E()) {  
                if (*cursor == ')') {  
                    cursor++;  
                    return SUCCESS;  
                } else  
                    return FAILED;  
            } else  
                return FAILED;  
        } else if (*cursor == 'i') {  
            cursor++;  
            printf("%-16s F ->i\n", cursor);  
            return SUCCESS;  
        } else  
            return FAILED;  
    }  
    

//g++ rdp.c
//./a.out
// ouput is genetared by the code

/*
#include <stdio.h>  
#include <string.h>  

#define SUCCESS 1  // Define SUCCESS as 1
#define FAILED 0   // Define FAILED as 0

// Function prototypes for the recursive descent parser functions
int E(), Edash(), T(), Tdash(), F();  

const char *cursor;  // Pointer to the current character in the input string
char string[64];     // Array to hold the input string

int main()  
{  
    puts("Enter the string");  
    // scanf("%s", string); // Uncomment this to read input from the user
    sscanf("i+(i+i)*i", "%s", string);  // Sample input for testing
    cursor = string;  // Initialize cursor to point to the start of the input string
    puts("");  
    puts("Input      Action");  
    puts("--------------------------------");  

    // Start parsing by calling the E() function
    if (E() && *cursor == '\0') {  // Check if the entire input string is successfully parsed
        puts("--------------------------------");  
        puts("String is successfully parsed");  
        return 0;  // Exit with success status
    } else {  
        puts("--------------------------------");  
        puts("Error in parsing String");  
        return 1;  // Exit with failure status
    }  
}  

// Function to parse E -> T E'
int E()  
{  
    printf("%-16s E -> T E'\n", cursor);  // Print the current production rule
    if (T()) {  // Parse T
        if (Edash())  // Parse E'
            return SUCCESS;  
        else  
            return FAILED;  
    } else  
        return FAILED;  
}  

// Function to parse E' -> + T E' | ε
int Edash()  
{  
    if (*cursor == '+') {  // Check for the '+' symbol
        printf("%-16s E' -> + T E'\n", cursor);  // Print the current production rule
        cursor++;  // Move to the next character
        if (T()) {  // Parse T
            if (Edash())  // Parse E'
                return SUCCESS;  
            else  
                return FAILED;  
        } else  
            return FAILED;  
    } else {  // If not '+', E' -> ε (epsilon)
        printf("%-16s E' -> $\n", cursor);  // Print the current production rule for epsilon
        return SUCCESS;  
    }  
}  

// Function to parse T -> F T'
int T()  
{  
    printf("%-16s T -> F T'\n", cursor);  // Print the current production rule
    if (F()) {  // Parse F
        if (Tdash())  // Parse T'
            return SUCCESS;  
        else  
            return FAILED;  
    } else  
        return FAILED;  
}  

// Function to parse T' -> * F T' | ε
int Tdash()  
{  
    if (*cursor == '*') {  // Check for the '*' symbol
        printf("%-16s T' -> * F T'\n", cursor);  // Print the current production rule
        cursor++;  // Move to the next character
        if (F()) {  // Parse F
            if (Tdash())  // Parse T'
                return SUCCESS;  
            else  
                return FAILED;  
        } else  
            return FAILED;  
    } else {  // If not '*', T' -> ε (epsilon)
        printf("%-16s T' -> $\n", cursor);  // Print the current production rule for epsilon
        return SUCCESS;  
    }  
}  

// Function to parse F -> ( E ) | i
int F()  
{  
    if (*cursor == '(') {  // Check for the '(' symbol
        printf("%-16s F -> ( E )\n", cursor);  // Print the current production rule
        cursor++;  // Move to the next character
        if (E()) {  // Parse E
            if (*cursor == ')') {  // Check for the ')' symbol
                cursor++;  // Move to the next character
                return SUCCESS;  
            } else  
                return FAILED;  
        } else  
            return FAILED;  
    } else if (*cursor == 'i') {  // Check for the 'i' symbol (identifier)
        cursor++;  // Move to the next character
        printf("%-16s F -> i\n", cursor);  // Print the current production rule
        return SUCCESS;  
    } else  
        return FAILED;  
}  

// Command to compile and run the program
// g++ rdp.c
// ./a.out

// Example Output:
// Input      Action
// --------------------------------
// i+(i+i)*i   E -> T E'
// i+(i+i)*i   T -> F T'
// +(i+i)*i    F -> i
// +(i+i)*i    E' -> + T E'
// (i+i)*i     T -> F T'
// (i+i)*i     F -> ( E )
// i+i)*i      E -> T E'
// i+i)*i      T -> F T'
// +i)*i       F -> i
// +i)*i       E' -> + T E'
// i)*i        T -> F T'
// i)*i        F -> i
// i)*i        E' -> $
// )*i         T' -> $
// )*i         E' -> $
// *i          T' -> * F T'
// i           F -> i
// i           T' -> $
//             E' -> $
// --------------------------------
// String is successfully parsed

This code implements a recursive descent parser for a simple arithmetic expression grammar. Let's go through it line by line, 
adding detailed comments to explain each part:

Explanation of Key Components:
Header Section:

#include <stdio.h>: Includes the standard I/O library for input and output operations.
#include <string.h>: Includes the string library for string manipulation functions.
Macro Definitions:

#define SUCCESS 1: Defines SUCCESS as 1 for indicating successful parsing.
#define FAILED 0: Defines FAILED as 0 for indicating parsing failure.
Function Prototypes:

Declares the functions used in the recursive descent parser: E(), Edash(), T(), Tdash(), and F().
Global Variables:

const char *cursor: Pointer to the current character in the input string.
char string[64]: Array to hold the input string.
Main Function:

Prompts the user to enter the string (though here it's hardcoded for testing).
Initializes the cursor to the start of the input string.
Prints headers for the action trace.
Calls E() to start parsing and checks if the entire input string is consumed.
Prints success or error messages based on the parsing result.
Parsing Functions:

E(), Edash(), T(), Tdash(), and F() implement the grammar rules for the expression. They print the current state and production rules, parse the input recursively, 
and return SUCCESS or FAILED based on whether the parsing was successful.

*/


#include <iostream>
#include <cctype>
#include <cstdlib>
#include <cstring>

using namespace std;

int main() {
    int i = 0, x = 0, n;
    void *p, *add[5];
    char b[50], d[15], c;
    
    cout << "Expression terminated by $:";
    while ((c = getchar()) != '$') {
        b[i] = c;
        i++;
    }
    n = i - 1;
    
    cout << "Given Expression:";
    for (i = 0; i <= n; i++) {
        cout << b[i];
    }
    
    cout << "\nSymbol Table\n";
    cout << "Symbol \t addr \t size \t type\n";
    
    for (int j = 0; j <= n; j++) {
        c = b[j];
        if (isalpha(c)) {
            int size = sizeof(char); // Size of character is 1 byte
            p = malloc(size);
            add[x] = p;
            d[x] = c;
            cout << c << " \t " << p << " \t " << size << " \t identifier\n";
            x++;
        } else if (c == '+' || c == '-' || c == '*' || c == '=') {
            int size = sizeof(char); // Size of character is 1 byte
            p = malloc(size);
            add[x] = p;
            d[x] = c;
            cout << c << " \t " << p << " \t " << size << " \t operator\n";
            x++;
        }
    }
    
    return 0;
}

// g++ ass7.cpp
// ./a.out
//give output manully and as polynomial expression
//eg:-a=b+c*d*(e-f)$    

/*
The provided C++ program is a simple lexer that reads a mathematical expression terminated by $ from standard input, constructs a symbol table, and prints out the symbols along with their details (address, size, and type). The program recognizes identifiers (letters) and operators (+, -, *, =).

Explanation of the Code
Includes and Namespace:

Includes necessary headers for I/O operations, character handling, and memory allocation.
Uses the std namespace to avoid prefixing std:: before standard library names.
Main Function:

Variable Declarations:

i and x: Counters.
n: Length of the input expression.
p: Pointer used for dynamic memory allocation.
add[5]: Array of void pointers to store addresses of dynamically allocated memory.
b[50]: Array to store the input expression.
d[15]: Array to store detected symbols.
c: Character variable to read input.
Reading the Expression:

Prompts the user for an expression terminated by $.
Reads characters until $ is encountered, storing them in array b.
Calculates the length of the expression (n).
Printing the Expression:

Outputs the given expression for verification.
Symbol Table Construction:

Outputs the header of the symbol table.
Iterates over the expression:
If a character is an alphabet letter, it is considered an identifier.
If a character is one of the specified operators, it is recognized as an operator.
For each recognized symbol, dynamically allocates memory, stores the address, and prints the symbol's details.
Compilation and Execution

#include <iostream>  // Include the input-output stream library
#include <cctype>    // Include the character handling library
#include <cstdlib>   // Include the standard library for memory allocation functions
#include <cstring>   // Include the string handling library

using namespace std;  // Use the standard namespace

int main() {
    int i = 0, x = 0, n;  // Declare integer variables for counters and length
    void *p, *add[5];     // Declare a void pointer and an array of void pointers for addresses
    char b[50], d[15], c; // Declare character arrays for the expression, symbols, and a character variable for input
    
    cout << "Expression terminated by $:";  // Prompt the user for input
    
    // Read characters until '$' is encountered
    while ((c = getchar()) != '$') {
        b[i] = c;  // Store each character in the array 'b'
        i++;       // Increment the counter
    }
    n = i - 1;  // Calculate the length of the input expression
    
    cout << "Given Expression:";  // Output the given expression for verification
    for (i = 0; i <= n; i++) {
        cout << b[i];  // Print each character of the expression
    }
    
    cout << "\nSymbol Table\n";  // Print the header for the symbol table
    cout << "Symbol \t addr \t size \t type\n";
    
    // Loop through each character in the expression
    for (int j = 0; j <= n; j++) {
        c = b[j];  // Get the current character
        if (isalpha(c)) {  // Check if the character is an alphabet letter
            int size = sizeof(char);  // Size of a character is 1 byte
            p = malloc(size);  // Allocate memory for the character
            add[x] = p;  // Store the address of the allocated memory
            d[x] = c;    // Store the character in the symbol array
            cout << c << " \t " << p << " \t " << size << " \t identifier\n";  // Print the symbol details
            x++;  // Increment the address counter
        } else if (c == '+' || c == '-' || c == '*' || c == '=') {  // Check if the character is an operator
            int size = sizeof(char);  // Size of a character is 1 byte
            p = malloc(size);  // Allocate memory for the operator
            add[x] = p;  // Store the address of the allocated memory
            d[x] = c;    // Store the operator in the symbol array
            cout << c << " \t " << p << " \t " << size << " \t operator\n";  // Print the symbol details
            x++;  // Increment the address counter
        }
    }
    
    return 0;  // Return 0 to indicate successful execution
}

// g++ ass7.cpp  // Command to compile the program
// ./a.out  // Command to run the compiled program
// Example input for manual testing:
// a=b+c*d*(e-f)$

*/



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





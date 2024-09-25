#include <cstdlib>
#include <iostream>
using namespace std;

int main()
{
    string input;
    cout << "x = ";
    getline(cin, input);
    int x = stoi(input);
    cout << "y = ";
    getline(cin, input);
    int y = stoi(input);
    cout << endl;
    cout << "1. " << ((x == 0) && (y == 0)) << endl; // AND
    cout << "2. " << ((x == 0) || (y == 0)) << endl; // OR
    cout << "3. " << ((x == 0) ^ (y == 0)) << endl;  // XOR
    cout << "4. " << ((x != 0) || (y != 0)) << endl; // NOT OR NOT

    return EXIT_SUCCESS;
}
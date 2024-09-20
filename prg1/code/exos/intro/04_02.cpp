#include <iostream>

using namespace std;

int main()
{
    int *ptr;
    int number = 42;
    ptr = &number;
    cout << *ptr << endl;
}
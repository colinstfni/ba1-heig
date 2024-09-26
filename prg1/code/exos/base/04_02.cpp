#include <cstdlib>
#include <iostream>
#include <math.h>
using namespace std;

int main()
{
    int var1 = 1;
    int var2 = 2;
    const int cste = 3;
    int *ptr1;
    int *ptr2 = &var2;

    ptr1 = &var1;
    *ptr1 = 2;

    cout << ((ptr1 == ptr2) ? "oui" : "non") << endl;
    cout << ((*ptr1 == *ptr2) ? "oui" : "non") << endl;

    cout << &var1 << endl;

    cout << ptr1 << endl;
    cout << &ptr1 << endl;

    // ptr1 = &cste;

    const int *ptr3 = &cste;

    return EXIT_SUCCESS;
}
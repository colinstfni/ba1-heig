#include <iostream>
#include <array>
#include <cstdlib>

using namespace std;

int main()
{
    std::array a{1, 2, 3};
    for (int i = 0; i < 10; ++i)
        a.at(i) = i;
    cout << "hello" << endl;
}
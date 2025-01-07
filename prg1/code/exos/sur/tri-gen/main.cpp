#include <iostream>
#include <string>
#include <vector>
#include <array>
#include <span>

using namespace std;

template <typename T>
void display_list(span<const T> list)
{
    cout << "[";
    for (int i = 0; i < list.size(); i++)
    {
        cout << list[i] << (i == list.size() - 1 ? "" : ", ");
    }
    cout << "]" << endl;
}

template <typename T>
vector<T> sort_list(span<T> list)
{
    vector<T> temp;
    temp.begin() = list.begin();
    for (T e : list)
    {
        for (int i = 0; i < temp.size(); i++)
        {
            if (e < temp[i])
            {
                temp.insert(i, e);
            }
        }
    }
}

int main()
{
    vector v{6, 2, 8, 7, 1, 3};
    array a{"chien"s, "chat"s, "souris"s, "poisson"s};
    double t[] = {6.1, 2.2, 8.3, 7.4, 1.5, 3.6};

    display_list<int>((v));
    v = sort_list<int>(v);
    display_list<int>(v);

    display_list<string>(a);
    a = sort_list<string>(a);
    display_list<string>(a);

    display_list<double>(t);
    t = sort_list<double>(t);
    display_list<double>(t);

    return EXIT_SUCCESS;
};
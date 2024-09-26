#include <cstdlib>
#include <iostream>
#include <math.h>
using namespace std;

float ask_float(string name)
{
    string input;
    cout << name << " = ";
    getline(cin, input);
    return stof(input);
}

const float cm3_to_liter_factor = 0.001;

int main()
{
    float r1 = ask_float("r1");
    float r2 = ask_float("r2");
    float h1 = ask_float("h1");
    float h2 = ask_float("h2");
    float h3 = ask_float("h3");

    float v_cy1 = M_PI * powf(r1, 2) * h1;
    float v_cy2 = M_PI * powf(r2, 2) * h2;

    float v_co1 = (powf(r1, 2) + powf(r2, 2) + r1 * r2) * h3 * (M_PI / 3);

    float v_tot = v_cy1 + v_cy2 + v_co1; // cm^3

    cout << "Volume total: " << v_tot * cm3_to_liter_factor << " litre(s)";
    return EXIT_SUCCESS;
}
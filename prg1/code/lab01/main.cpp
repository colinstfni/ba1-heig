/*
    Laboratoire: 01
    Auteur(s): Colin Stefani
    Date: 17/09/2024
    But: Me présenter via un programme cpp
    Remarque(s): -
*/
#include <iostream>
#include <cstdlib>
using namespace std;

const char *BANNER =
    "  ____      _ _         ____  _        __             _"
    "\n / ___|___ | (_)_ __   / ___|| |_ ___ / _| __ _ _ __ (_)"
    "\n| |   / _ \\| | | '_ \\  \\___ \\| __/ _ \\ |_ / _` | '_ \\| |"
    "\n| |__| (_) | | | | | |  ___) | ||  __/  _| (_| | | | | |"
    "\n \\____\\___/|_|_|_| |_| |____/ \\__\\___|_|  \\__,_|_| |_|_|";

const char *LANGS[4] = {"rust", "typescript", "kotlin", "csharp"};
const char *HOBBIES[4] = {"programme", "compose de la musique", "lis des livres", "bois des bières avec les amis (et avec modération)"};

void print_list(const char *list[], int size)
{
    for (int i = 0; i < size; i++)
    {
        cout << "  - " << list[i] << endl;
    }
}

int main()
{
    cout << BANNER << endl
         << endl;

    cout << "Je programme régulièrement en tant que passe-temps, notamment dans les langages suivants:" << endl;
    print_list(LANGS, 4);

    cout << endl
         << "Quand je ne suis pas à l'école ou au travail, je ..." << endl;
    print_list(HOBBIES, 4);

    cout << endl
         << "Selon moi, la programmation est présente partout de nos jours. Nous l'utilisons bien plus dans d'autres domaines que l'informatique lui même: médecine, finances, architecture, etc." << endl;

    return EXIT_SUCCESS;
}
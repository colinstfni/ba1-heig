#import "config.typ": conf

#show: doc => conf(
  title: [= PRG1 C++ - 2024 S1],
  title_color: color.lighten(color.blue, 70%),
  authors: [Colin Stefani],
  header: (
    [_Septembre 2024_],
    [PRG1 - C++],
    [_CS_]
  ),
  doc
)

== Introduction

=== Bref historique du C/C++

Langage originaire de FORTRAN, un bordel sans nom où tout le monde veut améliorer le langage de l'autre, 3 mecs (Thompson, Ritchie, Kernighan) finissent par créer B qui deviendra C après la "traduction" de UNIX qui a engendré des ajouts de fonctionnalités. 

Entrée dans le standard ANSI (American National STandards Institute), puis adopté par ISO.

Un mec super sympa de chez AT&T (Bjarne Stroustrup) ajoute des fonctionnalités de Simula (un des premiers langages de programmation OOP) à C++

Branching de C et et C++, mais C++ permet la programmation sous + de paradigmes (procédurale, orientée objet, générique), père de plein d'autres langages de haut niveau.

=== 1#super[er] programme en C++

Avec l'exemple suivant:

```c
#include <iostream>
#include <cstdlib>
using namespace std;

int main() {
  // intro
  cout << "Bienvenu(e)s au cours PRG1" << endl;
  // traitement ...
  // fin de programme
  cout << "fin de programme";
  return EXIT_SUCCESS;
}
```

Tout programme doit:

- Avoir une fonction `main()`
- Cette dernière doit retourner un entier `int`, représentant le statut de retour du programme (0 = success, anything else = error)

L'instruction `cout` permet d'écrire du texte sur le stream `stdout` du programme. L'instruction `endl` effectue un retour à la ligne. L'opérateur `<<` permet la transmission au flux (stream) ```c std::cout```

Des constantes de ```c <cstdlib>``` existent pour les valeurs de retour: `EXIT_SUCCESS` (0) ou `EXIT_FAILURE` (-1). Ces constantes sont notamment ici pour éviter les "magic numbers", ces valeurs constantes (numériques, strings) qui rendent le code illisible.

Les fichiers *d'en-têtes* permettent l'utilisation de librairies externes, comme par exemple `<iostream>` ou `<cstdlib>`.

Les espaces de nommage (`namespace`) existent pour éviter la collision des noms de fonctions ou constantes, il peut être importé avec le mot-clé `using namespace NOM_DU_BORDEL`

Les instructions d'une fonction, se terminant par un `;`, sont placées entre des accolades `{...}`, qui forment un *bloc de code*.

=== Compilation

Le compilateur génère du *code objet*, normalement compréhensible par la machine.

```sh
g++ -c main.cpp
```

Il va ensuite faire passer tout le bazar dans l'éditeur de lien ("linker", e.g. `ld`), qui va lier tous les fichiers, toutes les librairies, permettant enfin à la machine de lancer l'éxécutable produit.

```sh
g++ main.o -o main
```

Les deux commandes précédentes peuvent être combinées avec `g++`:

```sh
g++ main.cpp -o main
```

D'autres arguments comme `--pedantic` (normes ISO), `-Wxx` (warnings) ou `-std=c++20` (standard C++) peuvent être passés à `g++` pour configurer son comportement à la compilation et au _linkage_.
#import "config.typ"
#import "config.typ": *


#show: doc => conf(
  title: [= MAD1 Ensembles - 2024 S1],
  title_color: color.lighten(color.yellow, 30%),
  authors: [Colin Stefani],
  header: (
    [_Septembre 2024_],
    [MAD - Ensembles],
    [_CS_]
  ),
  doc
)

== Les ensembles

=== Ensembles et éléments

#definition[
  Un ensemble est un regroupement d'éléments formant un tout.
]

Dans les cas où notre ensemble est suffisamment petit, on peut l'écrire entre deux accolades: ${...}$ 

#example[
  L'ensemble des chiffres décimaux s'écrit: $E = {0,1,2,3,4,5,6,7,8,9}$
]

=== Appartenance

On dit que $x$ *appartient* à $E$ et on note:

$ x in E $

Si, au contraire $x$ n'appartient pas à $E$:

$ x in.not E $

#example[
  $2 in {1,2,3,4}$ ou $5 in.not {1,2,3,4}$
]

==== Description des ensembles

Lorsqu'un ensemble est trop grand pour être écrit élément par élément, on peut procéder à une *description en extension*:

#example[
  Pour écrire l'ensemble des nombres entiers de 0 à 100, on note: $ {0,1,2,3,...,99, 100} $
]

Cela fonctionne aussi avec l'infini:

$ {..., -1, 0, 1, 2, 3, ...} $

Cependant, en mathématiques, par soucis de clarté, on privilégie la *description en compréhension*, en spécifiant une propriété mathématique satisfaite par tous les éléments de l'ensemble:

Pour tout $x$ vérifiant $P(x)$, on note:

$ {x | P(x)} $ 

Qui se lit "$x$ tel que $P(x)$".

#example[
  L'ensemble de tous les $x$ dans $A$ vérifiant $P(x)$ se note ${x in A | P(x)}$
]

=== Ensembles égaux

#definition[
  Deux ensembles sont égaux si et seulement si tout élément de l’un est aussi élément de l’autre.
]

Si $A$ et $B$ sont égaux, on note: $A = B$ (wow).

Dans un ensembles, l'ordre et la répétition n'ont pas d'importance: *un ensemble est une liste non-ordonnée sans répétitions!*

Quelques ensembles sympas:

- $NN$: Entiers naturels
- $ZZ$: Entiers relatifs
- $QQ$: Rationels
- $RR$: Réels
- $CC$: Complexes

En ajoutant le suffixe $#super([\*])$, on exclut $0$ de l'ensemble

#example[
  $NN^* = {1,2,3,...}$
]

Les suffixes $+$ ou $-$ ajoutent une contrainte de signe à l'ensemble

#example[
  $ZZ_+ = NN$
]

==== Intervalles réels

#definition[
  Un intervalle réel est un ensemble défini par deux bornes, inférieure et supérieure, et formé de tous les nombres réels compris entre ces deux bornes.
]

On distingue trois types d'intervalles réels, notés entre deux bornes $[$ et/ou $]$:

- Intervalle *fermé*, lorsque les bornes sont *incluses* dans l'ensemble: $[-5; 10]$
  - $ [a; b] <==> {x in RR | a <= x <= b }$
- Intervalle *ouvert*, lorsque les bornes ne sont *pas incluses* dans l'ensemble: $]
-5; 10[$ ou $]-infinity; 10[$
  - $ ]a; b[ <==> {x in RR | a < x < b }$
- Intervalle *semi-ouvert*, lorsqu'une des deux bornes est incluse dans l'ensemble: $]-5; 10]$ ou $[-5; 10[$
  - $ ]a; b] <==> {x in RR | a < x <= b }$

==== Ensemble vide et ensemble universel

L'ensemble vide ne contient... ben rien. Il est noté ${}$ ou $nothing$.

#remark[
  À priori, les éléments d'un ensemble peuvent être de natures différentes, par exemple: $A= {1, "carrottes", -pi}$
]

En pratique, les éléments d'un ensemble universel, noté $Omega = {...}$, tout comme en probabilités avec les issues possibles d'une expérience aléatoire.
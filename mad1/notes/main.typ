#import "../../typst/config.typ": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-venn:0.1.2"
#import "@preview/cetz-plot:0.1.0"

#set text(lang: "fr")

#let main_color = color.lighten(color.yellow, 30%)

#show: doc => conf(
  title: [= MAD1 Ensembles - 2024 S1],
  title_color: main_color,
  authors: [Colin Stefani],
  header: (
    [_1#super[er] Semestre 2024_],
    [MAD - Ensembles],
    [_CS_],
  ),
  doc,
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
  - $[a; b] <==> {x in RR | a <= x <= b}$
- Intervalle *ouvert*, lorsque les bornes ne sont *pas incluses* dans l'ensemble: $]
-5; 10[$ ou $]-infinity; 10[$
  - $]a; b[ <==> {x in RR | a < x < b}$
- Intervalle *semi-ouvert*, lorsqu'une des deux bornes est incluse dans l'ensemble: $]-5; 10]$ ou $[-5; 10[$
  - $]a; b] <==> {x in RR | a < x <= b}$

==== Ensemble vide et ensemble universel

L'ensemble vide ne contient... ben rien. Il est noté ${}$ ou $nothing$.

#remark[
  À priori, les éléments d'un ensemble peuvent être de natures différentes, par exemple: $A= {1, "carrottes", -pi}$
]

En pratique, les éléments d'un ensemble universel, noté $Omega = {...}$, tout comme en probabilités avec les issues possibles d'une expérience aléatoire.

=== Sous-ensembles

#definition[
  L'ensemble $B$ est un sous-ensemble ou une partie de $A$ si tous les éléments de $B$ sont aussi des éléments de $A$. On dit aussi dans ces cas que $B$ est inclus dans $A$. On note: $B in A$
]

$ B in A <==> forall x in B, x in A $

1. Pour tout ensemble $A$, $A$ est un sous-ensemble de lui-même ($A subset A$)

2. L'ensemble vide est sous-ensemble de n'importe quel ensemble $A$ ($emptyset subset A$) Et donc $emptyset subset emptyset$

3. $A=B$ $<==>$ $A subset B$ #underline[et] $B subset A$ (principe de double inclusion)

#example[
  Pour $A = {1,2,3}$, $1 subset.not A$ mais $1 in A$, et ${1} subset A$ mais ${1} in.not A$
]

#definition[
  Si $B subset.eq A$ et $B != A$, alors ont dit que $B$ est *strictement inclus* dans $A$, noté $B subset A$ ou $B subset.neq A$. Aussi, $B subset A <==> B subset.eq A$
]

==== Visualisation d'ensembles

Le diagramme d'Euler (Venn) reflète les relations entre ensembles.

#figure(
  cetz.canvas({
    cetz-venn.venn2(name: "venn")
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
  }),
  caption: [Diagramme de Venn avec $A$ et $B$],
)

#figure(
  cetz.canvas({
    cetz-venn.venn3(name: "venn")
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
    content("venn.c", [C])
  }),
  caption: [Diagramme de Venn avec $A$, $B$ et $C$],
)


=== Opérations

#definition[
  L'intersection de $A$ et $B$, notée $A sect B$ est l'ensemble des éléments appartenant à $A$ #underline[et] $B$, soit $A sect B <==> {x | x in A and x in B}$
]

#figure(
  cetz.canvas({
    cetz-venn.venn2(
      name: "venn",
      ab-fill: main_color,
    )
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
  }),
  caption: [$A sect B$],
)

#definition[
  L'union ou la réunion de $A$ et $B$, notée $A union B$, correspond à l'ensemble des éléments se trouvant soit dans $A$, soit dans $B$.
]

#figure(
  cetz.canvas({
    cetz-venn.venn2(
      name: "venn",
      a-fill: main_color,
      b-fill: main_color,
      ab-fill: main_color,
    )
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
  }),
  caption: [$A union B$],
)

#definition[
  Le complément (ou complémentaire) de $A$ est l'ensemble des éléments de l'ensemble universel qui ne sont pas dans $A$, noté $overline(A) = {x | x in.not A}$.
]

#figure(
  cetz.canvas({
    cetz-venn.venn2(
      name: "venn",
      b-fill: main_color,
      not-ab-fill: main_color,
    )
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
  }),
  caption: [$overline(A)$],
)

#definition[
  La différence entre $A$ et $B$ notée $A without B$ ("$A$ sans $B$"), est l'ensemble des éléemtsn appartenant à $A$, mais pas $B$.
]

#figure(
  cetz.canvas({
    cetz-venn.venn2(
      name: "venn",
      a-fill: main_color,
    )
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
  }),
  caption: [$A without B$],
)

On note également les propriétés suivantes:

1. $overline(A) = Omega without A$
2. $A without B = A sect overline(B)$

#definition[
  La différence symmétrique de $A$ et $B$, notée $A xor B$ ($A triangle.t.small B$) est l'ensemble des éléments appartenants soit à $A$, soit $B$, *mais pas les deux* (XOR).
]


#figure(
  cetz.canvas({
    cetz-venn.venn2(
      name: "venn",
      a-fill: main_color,
      b-fill: main_color,
    )
    import cetz.draw: *
    content("venn.a", [A])
    content("venn.b", [B])
  }),
  caption: [$A xor B$],
)

On note aussi:
$ A xor B = (A without B) union (B without A) = (A union B) without (A sect B) $

#pagebreak()

=== Propriétés et Identités

==== Associativité

$ A union (B union C) = (A union B) union C $

$ A sect (B sect C) = (A sect B) sect C $

#remark[
  Ducoup, pas besoin de mettre des parenthèses.
]

==== Commutativité

$ A union B = B union A $
$ A sect B = B sect A $

==== Distributivité

$ A union (B sect C) = (A union B) sect (A union C) $
$ A sect (B union C) = (A sect B) union (A sect C) $

==== Lois de Boole-Morgan

$ overline(A union B) = overline(A) sect overline(B) $
$ overline(A sect B) = overline(A) union overline(B) $

#remark[
  Parallèles entre logique et ensembles:

  #align(center)[
    ```cpp A and B``` $<==> A sect B$

    ```cpp A or B``` $<==> A union B$

    ```cpp A xor B``` $<==> A xor B$

    ```cpp not A``` $<==> overline(A)$
  ]
]

#proof[
  1#super[ère] Loi:
  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
  )[$A$][$B$][$A union B$][$A union overline(B)$][$overline(A)$][$overline(B)$][$overline(A) sect overline(B)$][0][0][0][1][1][1][1][0][1][1][0][1][0][0][1][0][1][0][0][1][0][1][1][1][0][0][0][0]
  Les colonnes de $overline(A union B) $ et de $overline(A) sect overline(B)$ sont identiques, donc $overline(A union B) = overline(A) sect overline(B)$
  #figure(
    grid(columns: 2)[#cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          a-fill: main_color,
          b-fill: main_color,
          ab-fill: main_color,
        )
        import cetz.draw: *
        content("venn.a", [A])
        content("venn.b", [B])
        content("venn.not-ab", [$A union B$], anchor: "west")
      }) ][#cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          not-ab-fill: main_color,
        )
        import cetz.draw: *
        content("venn.a", [A])
        content("venn.b", [B])
        content("venn.not-ab", [$overline(A union B)$], anchor: "west")
      })][#cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          b-fill: main_color,
          not-ab-fill: main_color,
        )
        import cetz.draw: *
        content("venn.a", [A])
        content("venn.b", [B])
        content("venn.not-ab", [$overline(A)$], anchor: "west")
      })][#cetz.canvas({
        cetz-venn.venn2(
          name: "venn",
          a-fill: main_color,
          not-ab-fill: main_color,
        )
        import cetz.draw: *
        content("venn.a", [A])
        content("venn.b", [B])
        content("venn.not-ab", [$overline(B)$], anchor: "west")
      })],
  )



]

==== Loi d'absorption

$ A union (A sect B) = A $

$ A sect (A union B) = A $

$B$ est "absorbé" dans les deux cas.

=== Cardinal (pas la bière)

#definition[
  Un ensemble $A$ est *fini* si son nombre d'éléments distincts est un entier naturel. Sinon, $A$ est infini.
]

#definition[
  Si $A$ est fini, le *cardinal* ou la *cardinalité* de $A$, notée $|A| = \#A = "Card"(A)$ est égal au nombre d'éléments distincts de $A$.
]

#example[
  $|{a,b,c,...,z}| = 26$, $|emptyset| = |{}| = 0$
]

=== Ensemble des parties

#definition[
  Pour un ensemble $A$ donné, *l'ensemble des parties* de $A$, noté $cal(P)(A)$, est l'ensemble contenant tous les sous-ensembles de $A$:
  $ cal(P)(A) = {x | x subset.eq A} $
]

#example[
  $A = {"Oui", "Non"} <==> cal(P) = {emptyset, {"Oui"}, {"Non"}, {"Oui", "Non"}}$
]

Pour n'importe quel ensemble $A$, on a toujours que:

$ emptyset in cal(P)(A) "et" A in cal(P)(A) $

#theorem[
  Soit $A$ un ensemble fini, tel que $|A| = n "avec" n in NN$, alors $|cal(P)(A)| = 2^n$
]
#proof[
  On peut décomposer la création d'un ensemble de parties en une suite de $n$ choix indépendants entre "Je prends l'élément" ou "Je ne le prends pas", ce qui équivaut mathématiquement à $2^n$ possibilités.
]

#example[
  $A = {"Oui", "Non"}$, donc $|A| = 2 "et" |cal(P)(A)| = 4 = 2^2$
]


=== Produit cartésien

#definition[
  - Un *couple* $(a,b)$ est une liste *ordonnée* des deux éléments $a "et" b$.
  - Un *triplet* $(a,b,c)$ est une liste ordonnée de trois éléments $a "," b "et" c$.
  - Plus généralement un *$bold(n)$-uplet* ($a_0, a_1, ..., a_n$) est une liste ordonnée de n éléments appelés les *composantes*
]

#example[
  Le couple $(1, 2)$ est différent de $(2, 1)$, par exemple lorsqu'ils sont représentés sur un graphe.
]

#definition[
  Le *produit cartésien* $A times B$ de deux ensembles $A$ et $B$ est l'ensemgle de tous les couples $(a,b)$ tels que $a in A$ et $b in B$

  $ A times B = {(a, b) | a in A, b in B} $
]

#example[
  Pour $A = {0, 1}$ et $B = {x,y,z}$, on a:

  $ A times B = {(0,x), (0,y), (0,z), (1,x), (1,y), (1,z)} $
]

#theorem[
  Si $|A| = n$ et $|B| = m$, alors $|A times B| = |A| * |B| = n *m$
]

#proof[
  En posant un arbre des possibilités de choix de $a$ puis $b$ pour un couplet $(a,b)$, on a d'abord $n$ choix, puis $m$.
]

On peut généraliser le produit cartésien à $n$ ensembles: $A_1, A_2, ..., A_n$:

$ A_1 times A_2 times ... times A_n = {(a_1, a_2,..., a_n) | a_i in A_i, i in {1,2, ..., n}} $

#remark[
  Lorsque $A_1 = A_2 = ... = A_n$, alors $A_1 times A_2 times ... times A_n = A times A times ... times A = A^n$
]

#pagebreak()

== Les Relations

Les relations peuvent être des outils de comparaisons entre objets mathématiques, comme par exemple les nombres ($<$, $=$, ...), ou les ensembles ($in$, $subset.not$, ...)

#definition[
  Une relation de l'ensemble $A$ vers l'ensemble $B$ est un sous ensemble du produit cartésien $A times B$.

  Si $R$ est une relation de $A$ vers $B$, et si le couple $(a, b) in R$ tel que $a in A, b in B$, aussi noté $a R b$.
]

#example[
  $A = { "étudiant de l'école"}, B = { "cours dispensés ce semestre"}$

  L'ensemble $R = { (a, b) in A times B | "l'étudiant " a "suit le cours" b}$ est une relation de $A$ vers $B$.
]

#example[
  $ A = {"couleurs"}, B = {"pays"}$
  
  On peut définir la relation de correspondance entre une couleur et le drapeau du pays: $R = {(a, b) in A times B | "la couleur" a "dans drapeau du pays" b}$. 

  Ainsi: $("rouge", "Suisse") in R, ("vert", "Espagne") in.not R$
]

#example[
  $A = B = ZZ$

  On définit $R = {(a,b) in A times B | a <= b} = {(x,y) in ZZ^2 | x <= y}$.

  $(2,3) in R, (-2, -3) in.not R$
]


=== Graphes d'une relation

Pour $A$ et $B$ finis, on peut représenter une relation de $A$ vers $B$ par un graphe

- Les éléments de $A$ et $B$ constituent les *sommets* de graphe.

- Chaque couple $(a,b) in R$ est représentré par une flèche allant de $a$ vers $b$ (un *arc*)


=== Matrice d'une relation

Pour $A$ et $B$ finis, on peut représenter une relation de $A$ vers $B$ par une matrice $M(R)$ de taille $|A| times |B|$.

#example[
  $A = {1,2,3}, B = {x,y}$
  $R = {(2,x), (3,x), (3,y)} <==> M(R) = mat(
    0,0;
    1,0;
    1,1;
  )$
]

=== Relation sur un ensemble

#definition[
  Une relation *sur* un ensemble $A$ est une relation de $A$ sur $A$, c'est à dire un sous-ensemble de $A times A = A^2$.
]

#example[
  $A = {"pays"}$ et $R = {(a, b) | "les pays" a "et" b "sont voisins"}$ est une relation *sur $A$*. $("Suisse", "France") in R$, mais $("Italie", "Espagne") in.not R$
]

L'importance de l'ordre des composantes du couples dans une relation est importante. La ou les conditions de cette dernière ne sont pas toujorus intervertissables (pas toujours linéaire).

#remark[
  Dans le cas d'une relation sur $A^2$, on utilise plutôt un *graphe orienté* à la place d'un graphe biparti. Les éléments de $A$ sont alors les sommets du graphes et pour chaque $(a,b) in R$, on fait une flèche (arc) de $a$ vers $b$.
]

=== Complémentaires et inverses

#definition[
  La relation *complémentaire* d'une relation $R$ de $A$ vers $B$, est elle aussi une relation qui va de $A$ vers $B$, notée $overline(R)$, telle que:
  $ overline(R) = {(a,b) in A times B | (a, b) in.not R} = (A times B) without R $
]

#definition[
  La relation *inverse* d'une relation $R$ de $A$ vers $B$ est une relation de $B$ vers $A$, notée $R^(-1)$, telle que:
  $ R^(-1) = {(b,a) in B times A | (a, b) in R} $
]

#example[
  $A = {"personnes"}$ et $R = {(a,b) in A^2 | a "est enfant de" b}$
  
  Alors:
  -  $overline(R) = {(a,b) in A^2 | a "n'est pas enfant de" b}$ 
  
  - $R^(-1) = {(a,b) in A^2 | b "est parent de " a}$
]

=== Composition de relations

#definition[
  Soient $R$ une relation de $A$ vers $B$, et $S$ une relation de $B$ vers $C$, alors la *composition* de $R$ par $S$, notée $S compose R$, est la relation telle que:
  $ S compose R = {(a,c) in A times C | exists b in B "avec" (a,b) in R "et" (b,c) in S} $
]

#example[
  Soient $A = {"étudiants"}, B = {"cours"}, C ={"profs"}$
  
  On définit les relations $R = {(a,b) in A times B | "étudiant suit le cours"} "et" S={(b,c) in B times C | "cours donné par prof"}$.

  On peut alors dire que:
  
   $S compose R = {(a,c) in A times C | "édudiant" a "suit au moins 1 cours donné par le prof" c}$
]

==== Matrice d'une composition

Si $R$ est une relation de $A$ vers $B$ et $S$ une relation de $B$ vers $C$ de matrices $M(R)$ et $M(S)$, alors on peut déduire la matrice $M(S compose R)$ à partir du produit matriciel $M(R)dot M(S)$.

#remark[
  On multiplie les lignes par les colonnes ("Abraham Lincoln")
]

=== Propriétés d'une relation sur un ensemble

Les relations sur un ensemble peuvent être classifiés à l'aide de *quatre* propriétés principales:

- La *réflexivité*

- La *transitivité*

- La *symétrie*

- L'*antisymétrie*

Elles permettent en outre de définir deux types importants de relations: les relations *d'ordre* et *d'équivalence*.

==== Réflexivité

Une relation $R$ sur $A$ est réflexive si $(a,a) in R space forall a in A$.

Autrement dit, il faut que chaque élément soit en relation avec lui-même.

D'un point de vue matriciel, il faut que la diagonale de la matrice soit remplie de $1$:

$
mat(
  1, , ,;
  ,dots.down,, ;
  ,, dots.down,;
  ,,, 1
)
$

==== Symétrie

Une relation $R$ sur $A$ est symétrique si et seulement si $(a,b) in R  => (b, a) in R$. Autrement dit, si un élément $a$ est associé à $b$, alors $b$ doit également être associé à $a$ pour tout $a,b in A$.

Pour la matrice, cela est représenté graphiquement par la symmétrie de tous les nombres par rapport à la diagonale.

$
  mat(
    dots.down,,1,,;
    ,dots.down,,,;
    1,,dots.down,0,;
    ,,0,dots.down,;
  )
$
== Les Fonctions

=== Notion de fonction

Soient $E$ et $F$ deux ensembles non-vides. Une fonction de $E$ vers $F$ ("$A$ dans $B$") est une correspondance affectant à chaque élément de $E$ *exactement un* élément de $B$.

L'élément de $B$ qui est associé à $a in A$ par la fonction $f$ est noté $f(a)$. De plus, si $b in B$ est tel que $b = f(a)$, alors on dit que:

- $b$ est l'*image* de $a$ par $f$

- $a$ est _une_ *préimage* de $b$ par $f$ (ou un *antécédant*).

Une fonction $f$ de $A$ dans $B$, s'écrit:

$
f: & A &&--> &&B \
   & a &&--> &&f(a)
$

#remark[
  Un élément de $B$ peut avoir une ou plusieurs préimages, ou aucune.
]

=== Graphe d'une fonction

#definition[
  Soit $f: A -> B$, l'ensemble des couples $(a, b)$ tels que $a in A$ et $b = f(a)$, cela définit le #underline[graphe] de la fonction $f$.

  Graphe de $f = {(a, b) in A times B | b = f(a)}$
]

==== Fonctions numériques

Lorsque $A$ et $B$ sont des ensembles de nombres ($A,B subset.eq RR$), alors on peut identifier le graphe de $f: A -> B$ à un ensemble de points dans le plan $RR^2$, dont les coordonnées $(x, y)$ vérifient que $y = f(x)$.

On parle alors de *représentation graphique*, ou de *courbe représentative* de $f$.


En considérant 
$
f: &RR &&--> &&RR \
    &x &&--> &&y = e^(-x^2)
$ 


#let f1(x) = calc.pow(calc.e, -(x*x))
#{
set text(size: 10pt)
figure(cetz.canvas({
    import cetz.draw: *
    set-style(
        axes: (
            stroke: .5pt, 
            tick: (
                stroke: .5pt
            )
        ),
        legend: (
            stroke: none, 
            orientation: ttb, 
            item: (
                spacing: .3
            ), 
            scale: 80%
        )
    )

    cetz-plot.plot.plot(
        size: (12, 8),
        axis-style: "school-book",
        x-tick-step: 1,
        y-tick-step: 1, y-min: -2, y-max: 2,
        legend: "inner-north-east",
        legend-style: (
            stroke: black,
            fill: none,
            radius: 5pt,
            padding: .5em,
        ),
        {
            let domain = (-2.5, 2.5)
            cetz-plot.plot.add(f1, domain: domain, label: $ f(x)  $,
            style: (stroke: blue + 2pt))
        }
    )
}))
}

Le graphe de $f$ dans ce cas-ci est ${(x,y) in RR^2 | y = e^(-x^2)}$.

=== Fonctions et relations

Le graphe d'une fonction $f: A -> B$ est une sous-ensemble de $A times B$, donc il peut être vu comme une relation de $A$ vers $B$.

Si on identifie une fonction à son graphe, une fonction $f: A-> B$ peut être considérée comme une relation de $A$ vers $B$, avec la propriété que chaque élément $a in A$ est en relation avec un *unique* $b in B$.

#example[
  La relation $R = {(x,y) in ZZ^2 | y = 2x}$ est une fonction car à chaque $x$ est associé un seul $y$.

  Par contre, la relation $R = {(x,y) in ZZ^2 | x^2 = y^2}$ n'est pas une relation car par exemple $x = -1$ est en relation avec $y_1 = -1$ et $y_2 = 1$.
]

=== Domaine et image


Soit $f: A -> B$, on a:

- L'ensemble $A$ est appelé le domaine de définition de $f$.
  
- L'ensemble $B$ est appelé le codomaine de $f$.
  
- L'ensemble de toutes les images des éléments de $A$ est appelé l'image de $f$. On la note $"Im"(f) = f(A) = {f(a) | a in A}$

Plus généralement, pour toute $M subset.eq A$, on peut définir l'image de $M$ par $f(M) = {f(m) | m in M}$.

Pour tout $T subset.eq B$, on définit l'image réciproque de $T$, notée $f^(-1)(T)$ pour $f^(-1)(T) = {a in A | f(a) in T}$.

_Exemple:_

Avec $g: A -> B$, correspondant à la relation $ S = {(1,x), (2,x), (3,z), (4,z)} $ Ainsi que $A = {1,2,3,4} "et" B = {x,y,z}$.

- Le domaine de $g$ est $A = {1,2,3,4}$

- Le codomaine de $g$ est $B = {x,y,z}$

- L'image de $g$ est $"Im"(g) = {x,z}$

- L'image de ${1,2}$ est $f({1,2}) = {x}$

- L'image réciproque de ${z}$ est $g^(-1)({z}) = {3,4}$

- L'image réciproque de ${y}$ est $g^(-1)({y}) = {} = emptyset$


=== Modulo

#definition[
  Soit $a in ZZ$ et $m in NN^*$. On note $a mod m$ ($a % m$) le reste de la division entière de $a$ par $m$.
]

Par définition, le reste dans la définition de $a$ par $m$ est $0 <= r < a$, tel que $a = m k + r$, avec $k in ZZ$.

_Exemples:_

- $17 space mod space 5 = 2$

- $134 space mod space 205 = 134$

- $94 space mod space 9 = 5$

=== Fonction factorielle

#definition[
  Soit $n in NN$, on définit la factorielle de $n$, notée $n!$ comme le produit des entiers de $1$ à $n$:
  $ 1 dot 2 dot ... dot n = product_(k = 1)^n k $
]

Pour $n = 0$, on a $n! = 1$. 

- La factorielle croit très rapidement et est $> 2^n$ pour $n >= 4$.

- La factorielle apparait beaucoup en combinatoire et en analyse, notamment avec les développments de Taylor: $ e^x = sum_(k = 0)^(infinity) x^k/k!  $

=== Bijection et cardinalité

_Rappel_: Le cardinal d'un ensemble *fini* est le nombre d'éléments distincts de l'ensemble.

#definition[
  Deux ensembles $A$ et $B$ ont le même cardinal si et seulement si il existe une bijection de $A$ sur $B$. On dit alors qu'ils sont *équipotents*.
]

_Exemple_: Si $A$ est fini, il est possible de numéroter ses éléments de $1$ à $n = |A|$. On a alors une bijection de $A$ vers ${1, ..., n}$.

Un ensemble $A != emptyset$ est donc fini si il est équipotent avec l'ensemble ${1,...,n}$ pour $n in NN$.

_Exemple_: L'ensemble $NN$ est un ensemble infini. Son cardinal, noté $aleph$ ("aleph 0")

$
f: &NN -> NN^* \
   &x |-> x + 1 \
   \
f: &NN -> 2NN space ("nombres pairs") \
&x |-> 2x
$

$f$ est bijective dans les deux cas.
On peut également prouver que tout $A in P(NN)$, $A$ est équipotent avec $NN$, soit $aleph$ est le "plus petit cardinal" des ensembles infinis.

=== Ensembles dénombrables

#definition[
  Un ensemble qui est soit fini, soit de même cardinal que $NN$ est dit dénombrable. Dans le cas contraire, l'ensemble est dit *non-dénombrable*.
]

_Exemple_: $ZZ$ est-il dénombrable ? Si on définit $f$:

$
f : NN &--> ZZ \ 
x &-->&cases(x/2 "si" x = 2k | k in ZZ, (x-1)/2 "si" x = 2k + 1 | k in ZZ)
$

Tous les entiers de $ZZ$ sont effectivement atteints par $f$, qui alterne en fonction de la parité de $x$.

#theorem[
  Pour tout ensemble $A$, $|cal(P)(A)| > |A|$.
]

_Exemple_: Pour $A = NN$, on a que $|cal(P)(A)| > |A|$, et on a donc que $cal(P)(A)$ n'est pas dénombrable.

Les ensembles dénombrables sont communément: $NN, ZZ, QQ, ZZ^k$, tandis que ceux qui ne le sont pas: $cal(P)(NN), RR, [0; 1], ...$

_Propriété_: Si $B subset.eq A$, alors $|B| <= |A|$. En particulier, si $A$ est dénombrable, tous ses sous ensembles le sont aussi. De même, si $B$ est non-dénombrable, $A$ qui contient $B$, est lui aussi non-dénombrable.

_Propriété_: S'il existe une injection de $A$ vers $B$, alors on a que $|A| <= |B|$. S'il existe une surjection, on a à l'inverse que $|A| >= |B|$.
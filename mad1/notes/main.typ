#import "../../typst/config.typ": *
#import "@preview/cetz:0.2.2"
#import "@preview/cetz-venn:0.1.1"

#set text(lang: "fr")

#let main_color = color.lighten(color.yellow, 30%)

#show: doc => conf(
  title: [= MAD1 Ensembles - 2024 S1],
  title_color: main_color,
  authors: [Colin Stefani],
  header: (
    [_Septembre 2024_],
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
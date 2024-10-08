#import "@preview/ctheorems:1.1.2": *
#import "@preview/codly:1.0.0": *

#let theorem = thmbox(
  "theorem",
  "Théorême",
  fill: rgb("#eeffee"),
).with(numbering: (..nums) => nums.pos().map(str).slice(1).join("."))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong,
).with(numbering: (..nums) => nums.pos().map(str).slice(1).join("."))
#let definition = thmbox(
  "definition",
  "Définition",
  inset: (x: 1.2em, top: 1em),
).with(numbering: (..nums) => nums.pos().map(str).slice(1).join("."))

#let example = thmplain("example", "Exemple").with(numbering: none)
#let proof = thmproof("proof", "Preuve").with(numbering: (
  ..nums,
) => nums.pos().map(str).slice(1).join("."))

#let remark = thmplain("remark", "Remarque").with(numbering: none)

#let number-format = n => text(luma(65%))[#n]
#let enable-line-numbers = () => codly(number-format: number-format)
#let disable-line-numbers = () => codly(number-format: none)

#let inter = math.sect

#let conf(
  title: [],
  title_color: color.aqua,
  authors: [],
  header: ([], [], []),
  doc,
) = {
  let (header_left, header_middle, header_right) = header
  set text(
    font: "New Computer Modern",
    size: 12pt,
  )

  show sym.emptyset: set text(font: "Fira Sans")

  show: thmrules.with(qed-symbol: $square$)

  show: codly-init.with()

  codly(
    zebra-fill: none,
    inset: 4pt,
    number-format: number-format,
  )

  set page(
    paper: "a4",
    header: locate(loc => if [#loc.page()] != [1] {
      grid(
        columns: (1fr, 3fr, 1fr),
        align(left)[#header_left],
        align(center)[#header_middle],
        align(right)[#header_right‎‎‎],
      )
      v(-0.5em)
      line(length: 100%, stroke: 0.03em)
    }),
    numbering: "1",
  )

  set par(
    justify: true,
    leading: 0.55em,
  )

  let code_fill = luma(90%)


  set heading(numbering: (a, ..nums) => {
    let level = nums.pos().len() + 1 // Starts from 0 so we need to +1 it
    let pattern = if level >= 2 {
      "1."
    }
    if pattern != none {
      numbering(pattern, ..nums)
    }
  })

  show heading: it => {
    if it.numbering != none and it.level >= 2 {
      counter(heading).display()
      h(0.4em)
    }
    it.body
    if it.level > 1 {
      v(0.75em / it.level)
    }
    parbreak()
  }

  show outline.entry.where(level: 1): it => { }

  align(center)[
    #box(
      width: 100%,
      height: 4em,
      fill: title_color,
      stroke: black,
    )[
      #pad(top: 1.5em)[
        #title
      ]
    ]

    #authors
  ]

  outline(
    title: [#v(0.3em) #text(15pt)[Table des matières] #v(-0.5em)],
    indent: auto,
  )
  v(1em)


  doc
}
#let conf(
  title: [],
  title_color: color.aqua,
  authors: [],
  header: ([],[],[]),
  doc
) = {
  let (header_left, header_middle, header_right) = header
  set text(
    font: "New Computer Modern",
    size: 12pt,
    lang: "fr"
  )

  set page(
    paper: "a4",
    header: locate(
      loc => if [#loc.page()] != [1] {
        grid(
          columns: (1fr, 3fr, 1fr), 
          align(left)[#header_left], 
          align(center)[#header_middle], 
          align(right)[#header_right‎‎‎]
        )
        v(-0.5em)
        line(length:100%, stroke:0.03em)
      }
    ), 
    numbering: "1" 
  )

  set par(
    justify: true,
    leading: 0.55em,
  )

  set raw(align: start)
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Display block code in a larger block
  // with more padding.
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: (x: 15pt, y: 12pt),
    radius: 4pt,
    width: 100%
  )


  set heading(numbering: (a, ..nums) => {
    let level = nums.pos().len() + 1 // Starts from 0 so we need to +1 it
    let pattern = if level >= 2  {
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

  show outline.entry.where(level: 1): it => {}

  align(center)[
    #box(
      width: 100%,
      height: 4em, 
      fill: title_color,
      stroke: black,
    )[
      #pad(
        top:1.5em
      )[
         #title
      ]
    ]
    
    #authors
  ]

  outline(
    title: [#v(0.3em) #text(15pt)[Table des matières] #v(-0.5em)], indent: auto
  )
  v(1em)


  doc
}
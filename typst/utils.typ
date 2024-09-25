#import "@preview/cetz:0.2.2": canvas, plot, palette, draw

#let transpose_list(list) = {
  let transposed = ()

  if list.len() > 0 {
    let row_length = list.at(0).len()

    for i in range(row_length) {
      let new_row = ()

      for tuple in list {
        new_row.push(tuple.at(i))
      }

      transposed.push(new_row)
    }
  }

  transposed
}

#let linear_trend(data) = {
  let n = data.len()
  let sum_x = data.map(e => e.first()).sum()
  let sum_y = data.map(e => e.last()).sum()
  let mu_x = (1 / n) * sum_x
  let mu_y = (1 / n) * sum_y

  let top = 0
  let bottom = 0

  let m = data.map(e => (e.first() - mu_x) * (e.last() - mu_y)).sum() / data
    .map(e => calc.pow((e.first() - mu_x), 2))
    .sum()


  let b = mu_y - m * mu_x

  (m, b)
}


#let horizontal_table(data, header, font-size: 13pt) = {
  let temp = data
  temp.insert(0, header)
  let data_transposed = transpose_list(temp)


  table(
    fill: (x, _) => if x == 0 {
      gray.lighten(75%)
    },
    columns: data_transposed.at(0).len(),
    ..for data in data_transposed {
      data.map(e => text(font-size)[#e])
    }
  )
}

#let scatter(
  data,
  label: $y(x)$,
  x-label: $x$,
  y-label: $y$,
  size: (10, 8),
  legend: "legend.inner-east",
  x-tick-step: auto,
  y-tick-step: auto,
  color: blue,
  ..plots,
) = {
  canvas({
    import draw: *
    set-style(legend: (
      padding: 0.20,
      fill: rgb(255, 255, 255, 225),
      item: (
        spacing: 0.25,
      ),
    ))
    plot.plot(
      size: size,
      axis-style: "school-book",
      x-label: x-label,
      y-label: y-label,
      legend: legend,
      x-tick-step: x-tick-step,
      y-tick-step: y-tick-step,
      {
        plot.add(
          style: (stroke: blue),
          mark: "o",
          mark-style: (stroke: none, fill: blue),
          line: "spline",
          label: label,
          data,
        )
        plots.pos()
      }.flatten(),
    )
  })
}

#let scatter_with_trend(
  data,
  label: $y(x)$,
  x-label: $x$,
  y-label: $y$,
  size: (10, 8),
  legend: "legend.inner-east",
  x-tick-step: auto,
  y-tick-step: auto,
) = {
  let (m, b) = linear_trend(data)
  scatter(
    data,
    label: label,
    x-label: x-label,
    y-label: y-label,
    size: size,
    legend: legend,
    x-tick-step: x-tick-step,
    y-tick-step: y-tick-step,
    plot.add(
      style: (stroke: red),
      label: $#calc.round(m, digits: 3) x #{
            if b > 0 {
              [$+$]
            } else {
              [ $-$ ]
            }
          } #calc.abs(calc.round(b, digits: 3))$,
      domain: (data.first().first(), data.last().first()),
      x => m * x + b,
    ),
  )
}

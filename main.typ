#show raw.where(block: true): it => {
  set text(font: "Consolas")
  block(
    fill: gray.lighten(90%), 
    stroke: 1.0pt + gray,
    inset: 10pt

  )[#it]
}

#include "Lecture12.typ"

#include "Lecture13.typ"


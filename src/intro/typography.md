# Typography

This page lets you verify that you can read the glyphs and
diagrams correctly. If you do not see two of everything,
then you will not be able to see some of the diagrams in
the book.

[mermaid.js](https://knsv.github.io/mermaid/)

{{#mermaid
graph TB
         subgraph one
         a1-->a2
         end
         subgraph two
         b1-->b2
         end
         subgraph three
         c1-->c2
         end
         c1-->a2
}}

{{#nomnoml
#zoom: 0.75
#direction: right
[test] -> [this]
}}

An inline \\( \int x = \frac{x^2}{2} \\) equation.

A block equation:

\\[ \mu = \frac{1}{N} \sum_{i=0} x_i \\]
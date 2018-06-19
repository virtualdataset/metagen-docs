---
date: 2018-06-18
title: Syntax Reference
weight: 36
menu:
  main:
    parent: "Syntax Reference"
    identifier: "syntax-reference"
    weight: 61
---

This is a railroad schematic of the currently supported VirtData recipe syntax.

{{< note >}} If this is your first time reading this guide, it is best to start
at the top and read in order. Once you are familiar with the page, it can be used as
 a handy reference.{{</ note >}}

## Conventions

In this documentation, **CAPITALIZED :=** sections refer directly to a syntax type, for
reference purposes. Other sections accompany the syntax diagrams, and are more
explanatory in nature. Further, the diagrammatic conventions are explained
below.

**double quotes**

{{< rr >}}Sequence('"("',Comment('notice the double quotes')){{< /rr >}}

Any double quoted values are literal. The above example refers to a single
left parenthesis, not including the double quotes. Also, an inline text that doesn't appear inside a bubble is there just
to point out details. These are merely *inline* comments, nothing else.

**angle brackets**

{{< rr >}}'<IDENTIFIER: name>'{{< /rr >}}

Any angle bracket values are meant as place holders for a syntax or value that
is explained in another diagram or section. When building mapping functions, you 
can replace angle brackets with valid syntax from the appropriate section.

If you see a two-part identifier in the angle brackets above, the first part, `ID` in this
case, describes the syntax which must be used to build a valid substitute for
the angle brackets. The second part, `name` in this case, is used to explain how
the constructed syntax is meant to be used. In other words, `IDENTIFIER` represents
structure, and `name` represents semantics. 

**square brackets**

{{< rr >}}'[a-zA-Z_]'{{< /rr >}}

Square bracketed values refer to possible characters from a set. Without any
suffixes, square brackets allow only one matching character from the sets
provided. Thus, the example above allows for a single uppercase or lowercase
character between 'a' and 'z' OR the underscore character.

## Syntax

The general syntax of a VirtData recipe is designed to support the construction of composed functions.
As such, the syntax resembles a sequence of constructor signatures. Instead of requiring
nesting of functions, they are specified as a chain, where the flow of data from output to input
occurs between the function instances that are described by the template. The syntax of
multiple functions in a chain are called a *VirtData Flow*.

Let's start with identifier conventions.

## IDENTIFIER :=

Identifers are used throughout virtdata and have a uniform syntax. 

{{< rr >}}
 OneOrMore(Sequence('[a-zA-Z]', ZeroOrMore('[0-9a-zA-Z_]')),'.')
{{</ rr >}}

Simple identifiers consist of only a single word with no `.` characters.
Canonical identifiers build on simple identifiers by allowing a path separated
by `.` characters. This allows for an identifier to have a qualifying path just
as with Java package names. For example, `Max` is a simple identifier, and 
`io.virtdata.basicsmappers.unary_int.Max` is a qualified identifier.

You can use simple identifiers by default. If you need qualified identifiers, this
will be called out in the respective sections below.

## FLOW :=

{{< rr align="left">}} OneOrMore('<FUNCTION>','";"') {{</ rr >}}

Functions can be chained together. This supports a flow-oriented way of thinking
about data transformations, rather than nested functions. When a virtdata flow
is created by chaining multiple function templates together, the result
specifies a virtdata lambda template. This is simply a convenient and portable
way of composing functions for specialized purposes.

The VirtData runtime treats all bindings recipes as function flows. If there
only one function, then it is simply a single-function flow at the API level.

## FUNCTION :=

The syntax of a function in a virtdata flow is:


{{< rr align="left" code="VERTICAL_SEPARATION='200px';">}}
 Stack(
   Sequence(Optional(Sequence('<IDENTIFIER: input type>','"->"'))),
    Sequence('<IDENTIFIER: function name>','"("',OneOrMore('<ARG: argument>','","'),'")"'),
   Sequence(Optional(Sequence('"->"', '<IDENTIFIER: output type>')))
 )
{{</ rr >}}
For better illustration, here are a couple version that decompose the syntax above into a more intuitive view:

### FUNCSPEC :=

{{< rr align="left">}}
 Sequence(
   Sequence(Optional(Sequence('<IDENTIFIER: input type>','"->"'))),
    '<NAMEANDARGS>',
   Sequence(Optional(Sequence('"->"', '<IDENTIFIER: output type>')))
 )
{{</ rr >}}

The input type and output type are completely optional. If you don't provide
them, then the runtime will do it's own best-effort matching against all of the
functions available in the bundled function libraries.

### NAMEANDARGS :=

{{< rr align="left">}}
 '<IDENTIFIER: function name>','"("',
 OneOrMore('<ARG: argument>',',')
 ,'")"'
{{</ rr >}}

- **input type** is an optional input type qualifier. If provided, it limits matching functions to those with the input
  type specified. The value can be any primitive java type name or a fully qualified Java class name, including the package name.
- **function name** is a valid function class name from the library.
- **argument** is a valid argument as explained below.
- **output type** is an optional output type qualifier. If provided, it limits the matching functions to those with
  the output type specified. It has the same value restrictions as the input type above.


This merely shows that a function template has basic C-like syntax, with the
addition of optional input type and/or output type qualifiers.

## Function Arguments

Each type of argument syntax is distinguished below. When specifying value
literals, the types are distinct. This means that a function template which
takes a long argument as an initializer will be distinct from one that takes an
int in the same position. Thus, `Max(234)` specifies a *different* function than
`Max(234L)`. This is very important to note when constructing recipes, as the types
provided determine which functions could match the function template.

## ARG :=

{{< rr align="left">}}
Choice(0,
 Sequence(
   Comment('value'),
   Choice(1,
       '<INTEGER: value>',
       '<LONG: value>',
       '<FLOAT: value>',
       '<DOUBLE: value>',
       '<STRING: value>'
   )
 ),
 Sequence(
  Comment('function'),
  '<FUNCTION>'
 )
)
{{</ rr >}}


### INTEGER :=

{{< rr align="left">}}
 Sequence(Optional('-'),OneOrMore('[0-9]'))
{{</ rr >}}

### LONG :=
{{< rr align="left">}}Sequence(Optional('-'),OneOrMore('[0-9]'),Choice(1,'L','l')){{</ rr >}}

### FLOAT :=

{{< rr align="left">}}
 Optional('-'),
 OneOrMore('[0-9]'),
 Optional(
  Sequence(
   '"."',
   OneOrMore('[0-9]')
  )
 ),
 Optional(Sequence(Choice(1,'e','E'),OneOrMore('[0-9]')))
{{</ rr >}}

### DOUBLE :=

{{< rr align="left">}}
 Optional('-'),
 OneOrMore('[0-9]'),
 Optional(
  Sequence(
   '"."',
   OneOrMore('[0-9]')
  )
 ),
 Optional(Sequence(Choice(1,'e','E'),OneOrMore('[0-9]'))),
 Choice(1,'d','D')
{{</ rr >}}

Notice that a function can contain a function as an argument. This allows for higher-order function to be created.







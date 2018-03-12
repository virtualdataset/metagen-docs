---
date: 2017-12-16
title: FGK Sketch Primitives
weight: 1000
---

Some basic examples of function graph structures and how they relate are
in this section.


## Function Graph Notation.

The illustration below shows the visual notation that will be used to explain
function graphs. These conventions are based on graphviz primitives, thus
graphviz is implied as a standard tooling for visualizing function graphs.


**Fields** are uniquely named readable or writable variables within a function graph. They
are represented in general with box shapes:

{{< viz align="left">}}
digraph function_graph {
 size="2,2"
 temperature[shape="box"];
 curator_name[shape="box"];
}
{{< /viz >}}

**Coordinates** are fields which are used as primary inputs to a function graph.
Coordinates are sometimes marked with an inverse trapezoidal shape to indicate
that they are bound to the top of a function graph. Think of them as ports, or
anchoring points at the top of the function graph. Coordinates may be notated
simply a fields, like above, as well. Any field which has no inbound connection
is still a coordinate, although the node shape may be used to make it more
visually obvious.

{{< viz align="left">}}
digraph function_graph {
 size="2"
 x[shape="invtrapezium"];
 y[shape="invtrapezium"];
 time[shape="invtrapezium"];
}
{{< /viz >}}

**Outputs** are fields which are meant to be read as a side-effect of setting other fields.
Outputs are notated with a trapezoidal shape, but may also be notated as a simple field. Any
field which has no downstream connections is still considered an output.

{{< viz align="left">}}
digraph function_graph {
 size="2"
 altitude[shape="trapezium"];
 airspeed[shape="trapezium"];
}
{{< /viz >}}

**Functions** are exactly as you would expect:

{{< viz align="left">}}
digraph function_graph {
 size="1.25"
 f1[label="f()",shape="ellipse"]
 g1[label="g()",shape="ellipse"]
}
{{< /viz >}}

Data Flow **Arrows** can connect the above elements in various ways.

**Arrows can connect one or more fields to one or more functions:**

{{< viz align="left">}}
digraph function_graph {
 size="3"
 w,x,y,z[shape="box"];
 f1[label="f()",shape="ellipse"]
 g1[label="g()",shape="ellipse"]
 h1[label="h()",shape="ellipse"]
 i1[label="i()",shape="ellipse"]
 subgraph cluster1 {
  label="(1) unary function";
   w -> f1;
 }
 subgraph cluster2 {
  label="(2) bifunction";
  x,y -> g1;
 }
 subgraph cluster3 {
  label="(3) shared input"
  z -> h1,i1;
 }
}
{{< /viz >}}

(1) In this example, the field *w* is an input to the function *f()*. The number of
inputs determines the [arity](https://en.wikipedia.org/wiki/Arity) of the
function, thus directly represents the function's call signature.

(2) This illustrates the function graph representation of a bifunction
*g()*, with two arguments. Symbolically, these functions would be named `f(w)`
and `g(y,x)`. Notice that the order is retained between the left-to-right
ordering in the graph and the position in the argument list.

(3) Simply shows multiple functions with a common input.

**Arrows can connect one or more functions together to represent composed functions:**

{{< viz align="left">}}
digraph function_graph {
 size="3"
 w1[label="w()",shape="ellipse"]
 x1[label="x()",shape="ellipse"]
 y1[label="y()",shape="ellipse"]
 z1[label="z()",shape="ellipse"]
 f1[label="f()",shape="ellipse"]
 g1[label="g()",shape="ellipse"]
 h1[label="h()",shape="ellipse"]
 i1[label="i()",shape="ellipse"]
 subgraph cluster1 {
  label="(1) unary function\ncomposition";
   w1 -> f1;
 }
 subgraph cluster2 {
  label="(2) bifunction\ncomposition";
  x1,y1 -> g1;
 }
 subgraph cluster3 {
  label="(3) shared function\ncomposition"
  z1 -> h1,i1;
 }
}
{{< /viz >}}

(1) When functions are connected in this way, they form lambdas. The first case
is simple unary function composition. It would yield a composed function
`f(w(...))`, depending on the argument signature for *w()*. This means that the
order of evaluation follows the data flow as one would expect, with *w(...)*
being evaluated first, **and-then** *f()* on the result of that.

(2) A function with multiple inbound arrows represents a bifunction, whether the
inbound arrows are from fields or functions. However, the way that the function
is bound at runtime will vary according to the input types. In this case, the
composed function would be symbolically `g(y(...),x(...))` depending on the
inputs to y()* and *x()*.

(3) With a function feeding into multiple downstream functions, each path
represents a distinct and separate lambda. In this case `h(z(...))` and
`i(z(...))`.

**Arrows can connect functions to fields:**

{{< viz align="left">}}
digraph function_graph {
 size="3"
 w1[label="w()",shape="ellipse"]
 z1[label="z()",shape="ellipse"]
 x1[label="",shape="ellipse"]
 y1[label="",shape="ellipse"]
 g[label="",shape="box"]
 f,h,i[shape="box"]
 subgraph cluster1 {
  label="(1) single output";
   w1 -> f;
 }
 subgraph cluster3 {
  label="(2) multiple output"
  z1 -> h,i;
 }
 subgraph cluster2 {
  label="NOT ALLOWED";
  x1,y1 -> g;
 }
}
{{< /viz >}}

(1) When a function is connected to a field in this way, then the field represents
a stateful variable for that function's output values. More precisely stated, accessing
the value of that field requires computing all inputs that lead to it, including all inbound
arrows.

(2) It is acceptable to have multiple fields which depend directly on the same function.

**Fields may never have multiple inbound arrows.** This would cause ambiguity for
how to compute the value of the field. Arrows **never** connect a field to a
field.

In a nutshell, arrows are allowed anywhere *except* in these cases:

1. Arrows may not connect fields to fields.
2. Arrows may not connect multiple inputs to a field.
3. Loops are not allowed. A function graph is a directed graph.



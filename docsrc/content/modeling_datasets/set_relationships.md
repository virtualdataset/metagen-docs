---
date: 2017-12-16
title: Set Relationships
weight: 51
menu:
  main:
    parent: "Modeling Datasets" 
    identifier: modeling-set-relationships
    weight: 51
---


This section will talk about how to model relative cardinality between
different types of entities. Before reading this, you should already
be familiar with [data mapping](/concepts/data_mapping_functions.html)
and [cardinality functions](modeling_cardinality.html).

Suppose you have two different sets of things in your virtual dataset:

{{< nomnoml >}}
#zoom:0.75
#direction:right
#.data: fill=#FFFFFF visual=frame
[entity type A|
[<data> "foo"]
[<data> "bar"]
[<data> "baz"]
]
{{</ nomnoml >}}

{{< nomnoml >}}
#zoom:0.75
#direction:right
#.data: fill=#FFFFFF visual=frame
[entity type B|
[<data> "X"]
[<data> "Y"]
[<data> "Z"]
]
{{</ nomnoml >}}

It may be the case that there is no association between elements of the first set to
the second set, as illustrated above.

You could have a many-to-many association from set A to set B, like this:

{{< nomnoml >}}
#zoom:1.0
#direction:down
#.data: fill=#FFFFFF visual=frame
[<data> foo]
[<data> bar]
[<data> baz]
[<data> X]
[<data> Y]
[<data> Z]
[foo] -> [X]
[foo] -> [Y]
[foo] -> [Z]
[bar] -> [X]
[bar] -> [Y]
[bar] -> [Z]
[baz] -> [X]
[baz] -> [Y]
[baz] -> [Z]
{{</ nomnoml >}}

In any case, the associations are themselves part of the data set. They must be
modeled as such. The way that we do this in virtual dataset is to group our
functions and thus their value relationships in the same way that data should
be grouped.

Isolating the values that we use for for uniqueness is a key step. 
Assume for now, that you are using a simple long value to identify each 
unique entity or instance of your virtual dataset. For example, *foo* 
is entity 0, *bar* is entity 1, and *baz* is entity 2. The same applies 
for X, Y and Z: X is 0, Y is 1, and Z is 2.

Let's make this clear in terms of the value groupings that we would need to simulate
for a full association between all type-A entities and all type-B entities. Here are
the tuples: (0,0), (0,1), (0,2), (1,0), (1,1), (1,2), (2,0), (2,1), (2,2).

Another way to say this is that "All members of set A are associated with 
All members of Set B".

A simple modulo function that does only range adjustment for the sizes of these two
populations is simply "mod 3". You could draw many many samples via a mapping function,
but as long as the mapping functions are the *same*, you would get the same identifier
value for each entity in the tuple. You could only ever get (0,0), (1,1), and (2,2).
This does not suffice for our nine different associations above.

Let us look at the associations directly, and work backwards to find the appropriate 
functions that will maintain the correspondence.
 
Here are the associations, enumerated by sample number (coordinate value). The discrete
correspondence is captured for A and B in a more visually obvious way in the columns
to the right.

~~~
sample=#  association  A map   B map

sample=0  (0,0)        0->0    0->0
sample=1  (0,1)        1->0    1->1
sample=2  (0,2)        2->0    2->2
sample=3  (1,0)        3->1    3->0
sample=4  (1,1)        4->1    4->1
sample=5  (1,2)        5->1    5->2
sample=6  (2,0)        6->2    6->0
sample=7  (2,1)        7->2    7->1
sample=8  (2,2)        8->2    8->2

sample=9  (0,0)        9->0    9->0
sample=10 (0,1)       10->0   10->1
sample=11 (0,2)       11->0   11->2
...       ...         ...     ...
~~~

In this case, we can see that the functions must do more than simply correct for the
possible number of unique identifiers in each population. They must also have
some type of relationship that adjust for the relative rates of progression through
the possible values. For every A value, we need to see one each of B. In other words,
we need to see a new A value about 1/3 as frequently as we see a new B value.

For A, we need a function like "divide by 3, then modulo by 3".
For B, simply "modulo by 3". By dividing the sampling input by a number, we reduce
its rate of progression.

Although we are looking at correspondence between discrete values (the counting numbers),
it is easy to demonstrate on a coordinate plane as well using standard plotting tools.

First, by using a floor function to visually illustrate the discrete mapping:

<div id="fpthrees1" style="width: 400px; height: 200px;"> 
{{< jsxgraph >}}
 brd = JXG.JSXGraph.initBoard('fpthrees1', {boundingbox: [-1, 4, 20, -1], axis:true, showCopyright: false});
 brd.suspendUpdate();
 var c1 = brd.create('functiongraph', [function(x){ return (Math.floor(x) % 3); }],
                       {strokeWidth:2,strokeColor:'black'});
 var c2 = brd.create('functiongraph', [function(x){ return (Math.floor(x/3.0) % 3); }],
                       {strokeWidth:5,strokeColor:'blue',strokeOpacity:'0.25'});  
 brd.unsuspendUpdate();
{{</ jsxgraph >}}
</div>

And second, the continuous analog, to show the relative slope 
and repeating patterns at every 9th interval:

<div id="fpthrees2" style="width: 400px; height: 200px;"> 
{{< jsxgraph >}}
 brd = JXG.JSXGraph.initBoard('fpthrees2', {boundingbox: [-1, 4, 20, -1], axis:true, showCopyright: false});
 brd.suspendUpdate();
 var c3 = brd.create('functiongraph', [function(x){ return (x % 3); }],
                       {strokeWidth:2,strokeColor:'black'});
 var c4 = brd.create('functiongraph', [function(x){ return ((x/3.0) % 3); }],
                       {strokeWidth:5,strokeColor:'blue',strokeOpacity:'0.25'});  
 brd.unsuspendUpdate();
{{</ jsxgraph >}}
</div>

### So What?

From all this we can see one of the most basic strategies for establishing a one-to-many
relationship. The basic rule is that the *many* side of the relationship must
have exactly *that many* more values per coordinate range than the *one* side. It is
usually just a matter of adjusting the relative rates of progression along the
coordinate line, as illustrated above.

Also, the example above is very basic. It shows a regular repeating pattern with
a full one-to-many association. How do we extrapolate this to other more advanced examples?
This is a more advanced topic that will be explored in the future. For now, refer
  to the recipes section for some ideas.




 
 




Introducing VirtData
====================

**Please stand by while we bring the docs online...**

This book serves as the primary documentation for VirtualDataSet projects.

## What is a Virtual DataSet?

Virtual data can be described by a recipe. It can be created when you attempt
to access it. Virtual Data is a lens into a set of data that may not exist yet,
but which, once observed, is as tangible as stored data. Virtual data is what 
results when you apply a mapping function to a coordinate.

The procedurally generated worlds of some video 
games start out as a virtual data set. A *procedural generation algorithm*
can be thought of as a mapping function between a set of specific coordinates
and a set of observable details. The data is virtual because it
is synthesized as you observe it, according to a recipe.

The coordinates can be in any useful form, such as a time on a timeline, a
set of cartesian coordinates, something even more rudimentary like a count of
iterations. The details can represent any tangible idea that is called for.

The recipes used with virtual dataset are simply called *virtdata recipes*.
They can vary in complexity from the mundane to the sophisticated.

Some recipes -- those depending only on 
[pure functions](https://en.wikipedia.org/wiki/Pure_function) -- will generate a 
*static virtual dataset*. Recipes that rely mutable state will generate
a *dynamic virtual dataset*.

## Requests

If you have requests for topics to include in this book, please submit them at the 
[Issue Tracker](https://github.com/virtualdataset/metagen-docs/issues).

## Next Steps

This book serves as the primary documentation for the
Virtual DataSet projects, namely 
[Metagen-Java](https://github.com/virtualdataset/metagen-java)
If you have requests, please submit them at the 
[Issue Tracker](https://github.com/virtualdataset/virtdata-docs/issues).

The book is structured to give you a useful entry point regardless of your 
experience with the concepts and tools. You can choose to go directly to 
the [Recipes](using_virtdata/common_recipes.html) section, or
you can start with [Concepts](concepts/concepts.html). 

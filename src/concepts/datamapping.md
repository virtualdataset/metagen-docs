Data Mapping
============

VirtData draws inspiration from several concepts in computer science.
It leans heavily on the utility and efficiency of pure functions.
You could say that the data generation techniques in VirtData are
functional-programming friendly, but not strictly limited to
FP techniques.
 
VirtData emphasizes the idea of "data mapping" over the others,
but allows for users to break these rules if/when it is
necessary or useful.

To explain why, it is useful to contrast the different approaches
for creating synthetic data.

### Has Mutable State?

This is one of the most important aspects of a data generation method.
A method that depends on changing state will not yield the same 
result for a given input. This type of method is more properly called
a **data generator**, as there is no way to predict the output from
the inptu without knowing the internal state, just as for an RNG.

### Has Immutable Data

A data generation method that does not depend on changing state is
effectively a pure function. This includes functions that depend
on data, as long as that data doesn't change over the lifetime
of the function.

Pure functions generally perform better for data generation,
especially in parallel architectures, where much of the code and
volatile state can be cached or kept on the stack.

Pure functions also yield a dataset that is randomly addressible. For
example, you can access the 10043rd element as easily as the first 
element.

### Has Parameters?

Parameters are simply a form of immutable data.

## Distinctions

*Data Generator, Data Mapping Function, What's the difference?*


A data generation method that must be accessed in sequence is called
a [generator](https://en.wikipedia.org/wiki/Generator_(computer_programming)). RNGs are generators.

A data generator that has no mutable state is called a **data mapping function**. In VirtData, these are simply called "data mappers" for short.


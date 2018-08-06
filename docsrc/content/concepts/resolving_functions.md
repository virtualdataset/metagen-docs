---
date: 2017-11-27
title: Resolving Functions
weight: 40
menu:
  main:
    parent: Concepts
    identifier: resolving-functions
    weight: 40
---

When using VirtData to craft procedural data generation
recipes, you can combine multiple functions in a chain, 
as described in `Composition and Dataflow` in
[../function_graphs](../function_graphs/).

This section explains how the library finds and selects
specific functions before composing them together in
a lambda. It also explains how to read the detailed
documentation as described in the function reference
section.

## Function Signatures

There are several parts to a typical function signature in
VirtData.

- The input type
- The function name
- Zero or more initializer parameters of a specific type
- The output type

In the reference section, this may appear as:
```
int -> Add(int: addend) -> int
```
and in actual usage, this specific function would appear as:
```
int -> Add(5) -> int
```

While each specific function provided in the library
has all of the above details, it is not always convenient
to refer to them with the full description as shown.

In fact, the name `Add(...)` refers not just a single
function, but four different functions in the library:

- `double -> Add(double: addend) -> double`
- `long -> Add(long: addend) -> int`
- `long -> Add(long: addend) -> long`
- `int -> Add(int: addend) -> int`

These functions are separate and distinct, but they share
a name and a common purpose. This is why you can use
only the name when using these functions in practice.
Specifically, **the input and output types are optional
when referring to functions**.

## Function Initializers

When you see the the example function `Add(5)`, the single
parameter `5` is an initializer parameter to the function.
This means that it is part of the function definition.
All functions in VirtData are intended to be pure functions
-- once they are initialized, they will return the same
value for any specific input value, no matter how many times
or in what order the values are applied to the function.

The term *function initializer* is meant to emphasize that
the values you use in function definitions are **not** the
values applied to the function. You don't specify the values
which will be applied to the function where you define them,
only the functions, including the initializer values, 
and function chains that are composed by stringing them
together.

## Finding Functions

When you use the specifier `int -> Add(5) -> int`, the
input and output type qualifiers limit the library to
considering *only* the matching functions. This is limited
to only the fourth function in the list above. If you
only use `Add(5)` with no input or output qualifiers,
all four functions are considered. so what happens
when you create a function chain like `Add(5); Mul(15)`?

## Function Candidates

With the example `Add(5); Mul(15)`, each contributing
function specifier can refer to multiple candidate functions.

`Add(5)` causes the library to *resolve* (find and
instantiate) the following functions:

- `int->Add(5)->int`
- `long->Add(5L)->int`
- `long->Add(5L)->long`

And the `Mul(5)` specifier causes these functions
to be resolved:

- `int->Mul(15)->int`
- `long->Mul(15L)->int`
- `long->Mul(15L)->long`

This represents the two sets of functions that could 
possibly be used to construct a chain of single functions.

## Type Compatibility

When chaining functions together, type types that flow from
the output of an upstream function to the input of the
next function must be compatible in some way.

There are different kinds of type compatibility with
different levels of trade-offs:

1. **same types** - The output of one function is exactly
   the same type as the input of the next.
2. **directly assignable types** - The types aren't
   strictly the same, but the output can still be assigned
   to the input. This includes widening type conversions
   as well as assignment of compatible object types.
3. **boxed assignable types** - assignable types with
   the help of auto-boxing.

## Function Reduction

VirtData uses a set of reduction rules to narrow
down the list to only one per function per position.
Starting at the output side of a flow, the following
rules are applied to functions in order to reduce
the candidates down to one function per stage.

1. Functions in the last set must have an output
   which is compatible with the required output type
   of the whole function flow.
2. Downstream functions must have an input type
   that matches at least one of the output types
   of upstream functions.
3. Downstream functions must have an input type
   that is assignable from at least one of the output
   types of upstream functions, **without autoboxing**.
4. Downstream functions must have an input type
   that is assignable from at least one of the output
   types of upstream functions, **with autoboxing**.
5. The input type of a function must be the most
   preferred type with precedence of long, int, float,
   double, boolean, byte, String, Object.
    
In any case where a reduction rule would remove 
*all* functions for a stage, that reduction is skipped.
If any reduction is possible, then the process starts
again.

## Function Compositing

VirtData will take the final chain of functions and
construct a Java 8 lambda using the most obvious
type conversions at each stage, even if the output
type of an upstream function is not strictly assignable
to the input type of the next function in the chain.

The constructed lambdas which have strictly-aligned
types between outputs and inputs will be more performant
that those which must use autoboxing or strange type
conversion.

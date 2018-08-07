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
====== === ==== ======  ======
^      ^   ^    ^          ^
|      |   |    |          |
|      |   |    |          + an output type
|      |   |    + an initializer parameter name
|      |   + an initializer parameter type
|      +- the function name
+-- an input type

```

While each specific function provided in the library
has all of the above details, it is not always convenient
to refer to them with the full description as shown.

In practical use, an *Add* function could be called upon
using any of these forms:

```
# no input our output type qualifiers, just an intializer parameter:
Add(5)

# fully qualified input and output types:
int -> Add(5) -> int

# partially qualified input or output types:
Add(5) -> int
int -> Add(5)

```

The name `Add(...)` refers not just a single
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
all four functions are considered.

### Java Object Types

If you use an output qualifier like `-> java.util.Date`, then
VirtData will use this specific type to avoid considering
any function that does not have the specified input
or output type. This must be a canonical class name that
can be used to resolve the class at runtime.

## Function Candidates

So what when you create a function chain like `Add(5); Mul(15)`?
Each contributing function specifier can refer to one ore more 
candidate functions. With this basic description of a VirtData flow,
the following list of candidates is constructed:

{{< nomnoml align="middle" >}}
#zoom:0.75
#direction:right
#.value: fill=#D0FFD0 visual=frame
#.function: fill=#E0FFE0 visual=sender
[<value>long] -> [<function>int->Add(5)->int]
[<value>long] -> [<function>long->Add(5)->int]
[<value>long] -> [<function>long->Add(5)->long]
[<function>int->Add(5)->int] -> [??]
[<function>long->Add(5)->int] -> [??]
[<function>long->Add(5)->long] -> [??]
[??] -> [int->Mul(15)->int]
[??] -> [long->Mul(15L)->int]
[??] -> [long->Mul(15L)->long]
[int->Mul(15)->int] -> [???]
[long->Mul(15L)->int] -> [???]
[long->Mul(15L)->long] -> [???]
{{< /nomnoml >}}

This represents the two sets of functions that could 
possibly be used to construct a chain of single functions.

The output type is not known in this case, since there was no
trailing output type qualifier, and is represented by `???`.
The intermediate type is not known yet, and is represented by `??`.
By default, the required input type is always set to `long` if no
other is specified.

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
again at the top.

Given this schematic above, it is possible to map 6 pathways through the
functions, yielding 6 possible lambdas. In this case, the rules
explained above will reduce the function candidates to the
final chain of functions, containing only one remaining function per position:

{{< nomnoml align="middle" >}}
#zoom:0.75
#direction:right
#.value: fill=#D0FFD0 visual=frame
#.function: fill=#E0FFE0 visual=sender
[<function>long->Add(5)->long] -> [<function>long->Mul(15L)->long]
{{< /nomnoml >}}

## Function Compositing

The result of function reduction is passed to a lambda construction facility
within VirtData known as the function compositor. The compositor builds a
proper lambda in the Java runtime, yielding a final single function at runtime
that "adds 5 and then multiplies the result by 15".

If the types of the remaining functions are not
directly compatible according to Java casting and conversion rules, the
function compositor will make a best-effort conversion in order to combine
functions in a flexible way. Flows which must rely on this capability are
not as performant as those which have good type alignment in between
function stages. Consult the function library reference on the available
types and conversions if you want to keep things as fast as they coudl be.



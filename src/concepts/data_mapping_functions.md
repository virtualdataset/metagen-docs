Data Mapping Functions
======================

## Audience

This section should be useful to new users as well as experienced 
developers. Here, we explain how and why we use functions for
building data mapping recipes. If you are planning to build your
own data mapping recipes, this section is essential reading.

## Input -> Function -> Output

A function represents a mapping between one set of values and another.
Consider a basic example in which the function N(i) maps an input
number to text form.

{{#nomnoml
#zoom:0.75
#direction:right
#.value: fill=#D0FFD0 visual=sender
#.function: fill=#E0FFE0 visual=frame
[example 1|
[<value> input: 1] ->[<function> F(1)]
[<function>F(1)] -> [<value>output: "one"]
[<value> input: 2] ->[<function>F(2)]
[<function>F(2)] -> [<value>output: "two"]
[<value> input: 3] ->[<function>F(3)]
[<function>F(3)] -> [<value>output: "three"]
]
}}

In this example, as will often be the case, the type of input is different
than that of the output. The input could be a *long*, and the output type
a *String*, for example. This example also shows data flowing through the function,
an approach used with flow-based programming.

## Value Semantics

If we consider the words above to be the names of users in a population, it is easy to
see how we could think of ***N*** as simply enumerating their names. In this case,
the word values are semantically *properties* -- name properties of some
arbitrary member of a population. We say that it is arbitrary in this case
simply because we are not yet speaking about identity semantics.
So far we have chosen only to assin the semantic of property to the output values.

If we take it a step further and say that the words are actually 
unique identifiers for users,
then we can say that we are indeed identifying *specific* instances of a population.
This would be the case, for example, if you had a system in which each unique
number name represented a unique user. Depending on your system, this may or may not 
be the case (I would hope it is not). The most imporant point here is that it is up to you
how uniqueness in your particular system is represented -- and hence how you should 
model it in data mapping functions to yield a facsimile representation in a virtual dataset.

Both properties and instances are important in a dataset. How do we have both? How do
we make it so that we can deal with instances of things as well as the properties
of any given identity?

For this, we need to combine functions. To model the relationship between a thing
at one level and a associated with it, we simply mirror the relationship in terms
of functions. We combine functions. In formal terms, we create a *composed* function.

This is best illustrated visually, using flow-based notation. Take, for 
example, a basic model of users in a population:

{{#nomnoml
#direction:down
#zoom:0.75
[value associations|
[user_id] --> [first name]
[user_id] --> [last name]
]
}}

For the first time, we see a graph structure that represents the semantics of a data set.
This specific type of graph is called a *value graph*, and will be one off the first
steps in figuring out how to model data in vitual dataset. The value graph illustraties
cardinal relationships but it does not capture *how* the data corresponds from one
value to another. For this, we need to fill in the blanks:

{{#nomnoml
#direction:down
#zoom:0.75
[value associations|
[user_id] --> [function: F]
[function: F] --> [first_name]
[user_id] --> [function: L]
[function: L] --> [last_name]
]
}}


Although basic, we see three values and how they are related. *first_name* depends on 
*user_id*, as does *last_name*. This is the same as saying that you must have the
value for user_id before you can calculate the values for first and last name. It also
shows why we draw the lines in this directionn when modeling data flow.

Assume that you have a function that maps numbers to user ids, like this:

{{#nomnoml
#direction:right
#zoom:0.75
[input: number] --> [function: U]
[function: U] --> [output: user_id]
}}

If you combine them together in data-flow form, the results looks like this:

{{#nomnoml
#direction:right
#zoom:0.75
[input: user_id] --> [function: F]
[function: F] --> [output: first_name]
[input: user_id] --> [function: L]
[function: L] --> [output: last_name]
}}

One of the key insights that you need to model a dataset with this approach is that **each
complete path of this graph represents a composed function.** Let's make a more concrete example.

The above view is called a *function graph*. It will be one of the best ways to understand
and elaborate your data mapping model going forward. The fact that the two name functions
are attached to the same upstream identity function is no accident. It is exactly how we
establish a correspondence between entities and their properties.

## Type Signatures

The types are high-level here. No matter what type system is used, the input and output
types determine where the function may be plugged in. This is called the *signature*
of the function. In terms of data flow between pure functions, we are really only 
concerned about the types of inputs and outputs.

## Combining and Simplifying

The input types of downstream functions must match the output type of upstream functions
in order for them to be composed together. A pure function has no other arguments besides
its input.

We can combine the functions ***U*** and ***F*** into another *composed function* ***F(U)***,
which takes the input for U and provides the output for F. We can do the same with ***U***
and ***L***, as function ***L(U)***.

Combined, the above function definitions look like this:

{{#nomnoml
#direction:right
#zoom:0.75
[input: number] --> [function: U]
[function: U] --> [output: user_id]
[input: user_id] --> [function: F]
[function: F] --> [output: first_name]
[input: user_id] --> [function: L]
[function: L] --> [output: last_name]
[output: user_id] --> [input: user_id]
}}

This representation is verbose, but explicit. We can collapse down the representation quite
a bit:

{{#nomnoml
#zoom:0.75
[simplifed|
[number] --> [U]
[U] --> [F]
[F] --> [first_name]
[U] --> [L]
[L] --> [last_name]
]
}} {{#nomnoml
#zoom:0.75
[simplified  output type|
[number] --> [U -> number]
[U -> number] --> [F -> word]
[F -> word] --> [first_name]
[U -> number] --> [L -> word]
[L -> word] --> [last_name]
]
}}

However, we have lost the type signatures between the functions. 

Data Mapping Functions
======================

VirtData leans heavily on the utility and efficiency of pure functions.
You could say that the data generation techniques in VirtData are
[FP](https://en.wikipedia.org/wiki/Functional_programming)-friendly,
but not strictly limited to FP techniques.
 
VirtData emphasizes the idea of "data mapping" over "data generation",
but allows for users to break these rules when necessary. To explain why,
it is useful to contrast the different approaches for creating 
synthetic data.

### Function Has Mutable State?

This is one of the most important aspects of a data generation method.
A method that depends on changing state will not yield the same 
result for a given input. This type of method is more properly called
a **data generator**, as there is no way to predict the output from
the input without knowing the internal state, just as for an RNG.

Because generators may have hidden mutable state, they are able to
create streams of data that are deterministic, but **state dependent.**
This can be useful if you want to prevent the output from being
easily predicted for a given input. However, for creating virtual
data sets, this property is not useful. It is often more important to
be able to get the same result for a given coordinate, regardless
of how many times the function has been iterated internally. For
example, if you want to send a dataset into a database, then read
it out and verify that the content matches, you need the guarantee
of a *static virtual dataset*.

### Function Has Immutable Data?

A data generation method that does not depend on changing state is
effectively a pure function. This includes functions that depend
on data, as long as that data itself doesn't change.

Pure functions generally perform better for data generation,
especially in parallel architectures, where much of the code and
volatile state can be cached or kept on the stack. Code that doesn't
have to access changing state is generally much easier to optimize.

### Function Has Parameters?

Parameters are simply a form of immutable data. Some -- but not all
-- functions have parameters.

## Distinctions

*Data Generator, Data Mapping Function, What's the difference?*

A data generation method that must be accessed in sequence is called
a [generator](https://en.wikipedia.org/wiki/Generator_(computer_programming)).
RNGs are generators.

A data generator that has no mutable state is called a **data mapping function**.
In VirtData, these are simply called "data mappers" for short. The phrase
"data mapping" is used to distinguish functions which are pure functions,
as opposed to "[data] generators", which may depend on mutable state.


## Notation Ideas

{{#nomnoml
#direction: right
#.itype: visual=sender
#.fname: visual=frame
#.arg: visual=roundrect
#.otype: visual=sender
[f2|
[<fname> func2]
[<arg> arg2] --> [func2]
]
[<itype> itype2] -> [f2] 
[<itype> itype3] -> [f2] 
[f2] -> [<otype> otype2]
}
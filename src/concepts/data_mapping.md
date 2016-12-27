Data Mapping Concepts
=====================

## Input -> Function -> Output

A function represents a mapping between one set of values and another.
Consider a basic example in which the function *f(i)* maps an input
number to text form.

{{#mermaid
graph LR
subgraph input
1; 2; 3
end
subgraph function
f1["f(1)"]; f2["f(2)"]; f3["f(3)"]
end
subgraph output 
one; two; three
end
1 --> f1;  2 --> f2; 3 --> f3
f1 --> one;  f2 --> two; f3 --> three
}}

{{#nomnoml
#zoom:0.75
#direction:right
[input|
[1]
[2]
[3]
]
[function|
[f(1)]
[f(2)]
[f(3)]
]
[1] -> [f(1)]
}}

In this example, as will often be the case, the type of input data is different
than the type of output data. The input could be a *long*, and the output type
a *String*, for example.
The function has a signature that captures these types. How this is represented
in a language will vary. For example, in Java it might look like this:

~~~
// A method of LongFunction<String>
String apply(long input);
~~~

This is one of the only language-specific examples we will see in the concepts section.
The point of showing it is to say that eventually the types that we can support
in our system will be very specific, down to the language level. For now, let's
zoom back up to the conceptual level.

## Visual Notation

For the remainder of this section, we'll describe functions in a visual form:

{{#mermaid
graph LR
subgraph function F
i(input: number)
F(function: F)
o(output: word)
i --> F; F --> o
end
}}

{{#nomnoml
#direction: right
#zoom: 0.5
[function F|[input: number] --> [function F]
[function F] --> [output: word]]
}}

Our visual examples will be flow-oriented, like this one. It shows a function ***F***,
which, when applied to a number, yields a word.

The types are high-level here. No matter what type system is used, the input and output
types determine where the function may be plugged in. This is called the *signature*
of the function.

## Value Semantics

If we consider the words above to be the names of users in a population, it is easy to
see how we could think of ***F*** as simply enumerating their names. In this case,
the word values are semantically *properties*.

If we take it a step further and say that the words are unique identifiers for users, 
then we have a way of enumerating the members of the population. In this case, the
word values are semantically *identities*.

Both properties and instances are important in a dataset. How do we have both? How do
we make it so that we can deal with instances of things as well as the properties
of any given identity?

For this, we need to combine functions. Whether we call something semantically an
instance or a property is a matter of establishing a relationship between
them at different levels. In effect, we establish a relationship between a function
that yields an identity value and a separate function that takes that value
and maps it to one or more properties specific to that identity.

Take, for example, a basic model of users in a population:

{{#nomnoml
#direction:down
#zoom:0.75
[user] --> [first name]
[user] --> [last name]
}}

For the first time, we see a graph structure that represents the semantics of a data set.
Although basic, we see three different possible values to generate, and a dependency
from two of them -- last name and first name -- on another, the user instance.

**One of the key insights that you need to model a dataset with this approach is that each
complete path of this graph represents a composed function.** Let's make a more concrete example.

Assume that you have a function that maps numbers to user ids, like:
{{#nomnoml
#direction:right
#zoom:0.75
[input: number] --> [function: U]
[function: U] --> [output: user_id]
}}

Assume also that you have a function that maps a user id to a first name, and another that maps
a user id to a last name:
{{#nomnoml
#direction:right
#zoom:0.75
[input: user_id] --> [function: F]
[function: F] --> [output: first_name]
[input: user_id] --> [function: L]
[function: L] --> [output: last_name]
}}

We can combine the functions ***U*** and ***F*** into another *composed function* ***F(U)***,
which takes the input for U and provides the output for F. We can do the same with ***U***
and ***L***, as function ***L(U)***.

Combined, the above function definitions look like this:

{{#nomnoml
#direction:down
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



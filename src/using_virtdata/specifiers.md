Metagen Design 101
==================

This serves as a basic design doc for metagen, including library integration, specifier formats, etc.

## Overview

Metagen's purpose is to make a modular and composable set of procedural generation libraries that everyone can use. A succesful outcome would resemble users building complex data mapping recipes in the same spirit of adding seasonings to their favorite soup recipe.

Eventually, a rapid-prototyping feedback loop similar to the REPL concept will be supported. To work towards such a possibility, certain design priorities guide the project:

- A specifier format that is simple and direct specifier format for the simplest cases, but flexible enough to allow for composing functions together for more complex requirements.
- A resolution mechanism that allows for programmers to code in an idiomatic way. The simplest data mapping functions should be useful as they are, with as little boilerplate as possible.
- Built-in documentation support for discovering and learning about generator functions.
- Generous feedback to users about how functions are being selected and assembled for use, when things don't go quite as planned.

### Syntax

Modularity and composability between unrelated libraries is one of the key goals of metagen. At the same time, so too is the simple and direct use of mapping functions with as little hassle as possible.
There is a natural tension between these two goals.

The specifier format is how most users will come to know metagen, so it must capture the balance between these two goals.

##### Syntax Basics

The most basic thing that a user needs to be able to do is specify a known mapping function. This is as simple as naming it:
~~~
Timestamp
~~~
By itself, this names a function. If there is only one such function with no parameters, then this is all that should be required.

However, a single function outputs only a single data type. In some cases, you want a *Timestamp* function that returns a long value. In other cases you might want one that returns a java.util.Date object. Because of this, it makes sense to implement multiple functions. If you had to create variations of a *Timestamp* with mangled naming for different output types, things would quickly get out of control.

While you could simply name functions after the types they return, this would also be limiting. The concept of a timestamp should be anchored under a particular term, and the parameters that go with it should just work whether with that term. Further, there are more details that might come into play when selecting the actual function instance, like return type for example. Well keep the return type of a function as a separate concern, as it should be.


##### Result Type Specifier

To differentiate between functions of the same name with different output types, this format is used:
~~~
Timestamp -> DateTime
Timestamp -> long
~~~
In this form, you can easily filter out functions which can't directly provide the type you need by looking at their actual result types.

##### Function Parameters

When mapping an input value to a Timestamp of some form, you might want to multiply the input value by some constant, to simulate increasing timestamps on a timeline. In this case, the spacing between values would be determined by a constant factor, say 1000 in order to step forward by 1000ms per input value. This would become a parameter for the Timestamp function:
~~~
Timestamp(1000) -> DateTime
~~~
This shows a positional parameter that can be used to control the timestamp generator function. Named parameters may be supported in the future.

##### Higher-Order Functions

If you need to construct a higher-order result like a list of generated values, you will need to be able to specify intended properties of the list as well as the individual elements in the list. To do this, you need support for higher-order functions. These will be supported with this unsurprising syntax:
~~~
List(Range(1,5),Timestamp(1000)) -> List
~~~
This example shows a mapping function that is composed from other mapping functions. The first argument is a function *Range(1,5)*. The second is a *Timestamp(1000)* function. Together, they allow the construction of a list.

##### Standard Syntax

Adding an optional *input type* specifier to the examples above leaves us with this basic form:
~~~
intype -> fname(arg1,arg2) -> outtype
~~~
where arguments to a function can, in some cases, also be functions, such as
~~~
intype -> fname(arg1, intype2 -> fname2(arg2) -> outtype2) -> outtype
~~~
This will generally be shortened to:
~~~
intype -> fname(arg1, fname2(arg2)) -> outtype
~~~
The output type of fname2 can be inferred from the input type of
arg2, and the input type is, by default, long. However, this is not
the full story, as there could be multiple functions matching *fname*
by name, with different argument signatures.

You can think of    


### Function Signatures

Each function that can be used by metagen has a signature that includes:

1. the library that provides it
2. the containing package
3. the input type
4. the output type
5. the initializers, also known as constructor arguments
6. the function name

All of these together uniquely define a function. For example, it is possible to have a function that has the same signature except for the providing library. This should be uncommon in practice, however there are reasons to allow for it.

In practice, users will not be concerned with all these details. As much as possible, metagen will allow the user to start with only the function name, moving further up the stack only as necessary.

### Function Instantiation and Lifetime

As a general rule, functions are resolved and instantiated
on a per-thread basis. This serves multiple purposes, the first of
which is to allow for the creation of mapping functions which
are not thread safe. Furthermore, it allows for threads to be part
of the client-side model for how generators are apportioned.

##### Function Resolver

The function resolver is responsible for finding a suitable
implementation of a requested function. If successful, the function
resolver will produce a function descriptor which has enough details for instantiating instances of the function as needed. This is called
a *resolved function*.

##### Function Instantiator

The function instantiator

The bindings resolver 


This means that they should be instantiated
properly only in the threads that will use them. To support this
pattern, functions are resolved and mapped ahead of time in descriptors
which can then be called on to provide the actual functions once
the threading context is established.

#
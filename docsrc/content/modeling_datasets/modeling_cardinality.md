---
date: 2017-12-347
title: Cardinality
weight: 51
menu:
  main:
    parent: "Modeling Datasets" 
    identifier: modeling-cardinality
    weight: 51
---

### Data Types and Values

Given that our values are all *bits* on some level, there is no basic *fixed
size* data type that has an unlimited range of values. Even the floating point
types have finite range, although it is represented and handled differently than
that of the whole number types.

### Standard Types

For a 64-bit data type, there are \\( 64^2 \\) different distinct values that
can be represented. With the usual twos-complement representation for signed
numbers, this ends up being every value between [-9223372036854775808,
[9223372036854775807](https://en.wikipedia.org/wiki/9223372036854775807)],
inclusive.

The signed 64-bit integer is in focus here for a couple of reasons:

* This is the most common machine type that is used in current RNGs
* This is the highest width type which is commonly supported throughout
  modern architectures from the memory bus all the way to the registers
  in the CPU.

These two go hand-in-hand of course. It means that there is much to draw from in
terms of inspiration and examples for building efficient functions.

There will be other
[types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
in use.  It is possible to use objects in addition to basic types, but for now
we will focus on the signed long type for the purposes of explanation.

### Simulating Cardinality

We assume that whether you are using a 64-bit *or* 32-bit signed number, that
you can represent a high enough cardinality of values to have a useful dataset,
in most cases. There are ways of having higher cardinality when needed, but they
are less efficient at runtime.

When applying a hash function to counting numbers, the results will generally
vary within the total range of values that you can represent.

For example, applying the murmur3f hash to the long values 0..3 will yield
values ranging from -8048510690352527683 to 6292367497774912474. Such large
values are not immediately useful for enumerating or simulating identifiers in
realistically bounded datasets. However, the wide dispersion achieved such a
hash function *is* useful to us, so how do we use it at a more reasonable range
of values for typical datasets?

Enter modulus arithmetic. With such wide ranges in values, it is reasonable to
down-sample the hashed value into the range simply by dividing the value by the
range size we want, taking only the remainder.

For example, the first 5 values produced by such a method with a modulo of 
50 and absolute value are:

{{#nomnoml
#zoom:0.75
#direction:right
#.input: fill=#FFFFFF visual=frame
#.function: fill=#FFFFFF visual=sender
#.userid: fill=#E2D58B visual=frame
#.firstname: fill=#44BBA4 visual=frame
[<input> 0] ->[<function>Hash(0)]
[<function>Hash(0)] -> [<input> 39]
[<input> 39] -> [<function>Abs(39)]
[<function>Abs(39)] -> [<firstname>result: 39]
[<input> 1] ->[<function>Hash(1)]
[<function>Hash(1)] -> [<input> 24]
[<input> 24] -> [<function>Abs(24)]
[<function>Abs(24)] -> [<firstname>result: 24]
[<input> 2] ->[<function>Hash(2)]
[<function>Hash(2)] -> [<input> -43]
[<input> -43] -> [<function>Abs(-43)]
[<function>Abs(-43)] -> [<firstname>result: 43]
[<input> 3] ->[<function>Hash(3)]
[<function>Hash(3)] -> [<input> -33]
[<input> -33] -> [<function>Abs(-33)]
[<function>Abs(-33)] -> [<firstname>result: 33]
[<input> 4] ->[<function>Hash(4)]
[<function>Hash(4)] -> [<input> 21]
[<input> 21] -> [<function>Abs(21)]
[<function>Abs(21)] -> [<firstname>result: 21]
}}     

We use absolute value in addition to modulo, because signed results allow our
range to span twice as many unique values as our intended output range.

The next five values are 0, 6, 22, 6, and 2.

This shows that we have a single duplicate (6), which is quite expected,
according to the odds. In fact, the probability of seeing a single duplicate
goes over 50% as you go to 9 samples. Over very large numbers of samples, the
effect evens out quite well. In fact, it is easy to show that the quality of
samples produced in this way is directly dependent upon the quality of the
underlying hash function as one would expect.

Using this method, we are able to simulate very large ranges and very large
numbers of data samples. Furthermore, since the function pipeline is purely
functional with no mutable state, we know that we can use the mapping from the
input value to the output as a map that does not change. In other words, if we
take the input value as an enumeration of samples, or *coordinates* of the
output data, we have a fixed dataset with respect to the samples we choose to
observe. In this sense, applying the function is akin to taking samples of data
from a fixed coordinate space.

### To Be Continued...

There is more to come on this section in the future. Stay tuned.

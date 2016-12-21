Virtual Dataset Concepts
========================

### Procedural Generation

Procedural generation is a general class of methods for taking 
inputs from a coordinate system and modifying them in predictable
ways to produce content which appears random and original.

### (Pseudo) Random Number Generators

Sequences of values produced by random number generators
(more properly called Pseudo-RNGs) are not actually random, even
though they may pass certain tests for randomness. Useful RNGs
produce *apparently* random data that is completely deterministic. In 
practice, the combination of these two properties is quite valuable
for testing and data synthesis.

### Virtual Samples

Just as RNGs can appear random when the are not truly, statistical
distributions which take them as inputs work in the same way. By
feeding a uniform RNG over the unit interval [0,1.0] into a density
function, we can simulate random sampling (with replacement) over
an imagined population of entities, events, times, etc. This is a
fundamental building block of realistic simulation, for video games
as well as database tests, and everything in between.

### Data Mapping Functions

Procedural generation depends on a mapping between some input domain
and some output representation. Whether the input is a coordinate
system, cycles of a loop, or something more complex like a point in
3-space, the basic strategy is still the same. A set of inputs is
applied to a set of mapping functions to yield a set of simulated
data.

The data mapping functions are thus like a recipe for a dataset.
See [Data Mapping Functions in Detail](./concepts/datamapping.html) for
more details on how they contrast with related but different concepts.

##### Combining RNGs and Data Mapping Functions

Because pure functions play such a key part in procedural generation
techniques, the terms "data mapping function", "data mapper" and "data mapping library" will be more common in the library than "generator". Conceptually, mapping functions to not generate anything. It makes more sense to think of mapping data from one domain to another. Even so, the data that is yielded by mapping functions can appear quite realistic.

Because good RNGs do generally contain internal state, they aren't purely functional. This means that in some cases -- those in which you need to have random access to a virtual data set, hash functions make more sense. This toolkit allows you to choose between the two in some cases. However, it generally favors using hashing and pure-function approaches where possible. Even the statistical curve simulations do this.  

### Data Mapper Library

Data Mapping functions are packaged into libraries which can be loaded by the metagen-user component of the project. Each library has a name, a function resolver, and a set of functions that can be instantiated via the function resolver.

### Function Resolver

Each library must implement its own function resolver. This is because each library may have a different way of naming, finding, creating or managing function generator instances. For the user, the description of a generator is simply a string. What the generator library does with it is implementation-specific. This means that some generator libraries may simply have constructor signatures as function specifiers, and others may go as far as implementing their own DSL. The basic contract for a function resolver is that you pass it a string describing what you want, and it provides a generator function in return.

#### Bindings Template

It is often useful to have a template that describes a set of generator functions that can be reused across many threads or other application scopes. A bindings template is a way to capture the requested generator functions for re-use, with actual scope instantiation of the generator functions controlled by the usage point. For example, in a JEE app, you may have a bindings template in the application scope, and a set of actual bindings within each request (thread scope).


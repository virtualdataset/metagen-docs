---
date: 2017-12-16
title: FGK Sketch
weight: 1000
---

This section elaborates on the function graph kernel design.

Consider the following function graph. For the sake of discussion, it is assumed that this
is not merely a functiong graph template, but instad a fully realized function graph kernel.
In practices, this simply means that all of the function names can be mapped to an actual
implementation in a runtime library, and that there is enough detail in the graph to find
an unambiguous mapping for such.

Herein, the function graph kernel will be abbreviated as FGK, although it needs
a better name. In essence, the function graph kernel is a runtime implementation
of the [Function Graph Kernel API](../function_graph_kernel_api).


{{< nomnoml >}}
#zoom:0.75
#direction:down
#.function: fill=#FFFFFF visual=sender
#.userid: visual=frame
#.firstname: visual=frame
#.lastname: visual=frame
[<input>cycle: long] ->[<function>U]
[<function>U] -> [<userid>user_id: long]
[<userid>user_id: long] ->[<function>F]
[<function>F] -> [<firstname>first_name: String]
[<userid>user_id: long] ->[<function>L]
[<function>L] -> [<lastname>last_name: String]
{{< /nomnoml >}}

This graph clearly identifies the dependency relationships in the graph.

However, there are limited ways to interact with the function graph. The
designer of the function graph determines what the available inputs and outputs
are, and gives them names to suit. 

All interactions with a user should be based on named inputs and outputs. These
are referred to as **fields** in the FGK. In the naive implementation, all
fields are simple state boxes which can be muted or observed via the named-based
getter and setter API.

In this example, we will assume that all
named variables are meant to be interacted with. Any variable that does not have
an inbound path on the graph will be deemed an independent variable, and thus a
coordinate. Any other variable will be deemed visible, but also settable by the
application.

Further, the fields have strict types. This is necessary in order to make an
efficient FGK implementation as well as to handle type-conversion robustly.

## Design Invariants

Certain behaviors will need to be encoded as standard for the purposes of API
simplicity:

- As a design invariant, a given FGK should be initialized with all output fields
current with respect to the default coordinates.
- When an input coordinate is set to the same value as it was previously set to,
the FGK should disregard setting any flags for field invalidation.

## Dependency Tracking

One of the goals of the FGK design is to allow for localized computation of
subgraphs which are relatively high-use without incurring the cost of
recomputing all predecessor values. This means that it is necessary to identify,
based on the data flow through the graph, when an observable value has become
stale with respect to its upstream inputs -- possibly back to the original
coordinate inputs. There are various ways to approach this.

## Dependency Structure



Each dependent variable in a graph has a distinct pathway of dependencies.
Specifically, the set of dependencies is the directed graph that results from
tracing a variable to its inputs, repeating the process for each of them, and so
forth, until the independent variables are found. However, this is the full
dependency graph. Perhaps, counter-intuitively, the dependencies for a given
variable must include the actual data-flow segments between the variable and any
predecessor variable as well as the functions along the path between them. This
means that each variable has a proper graph that describes its dependencies.

However, we are generally more interested in breaking the over-all function
graph down to segments which can be used to determine when a variable's value
goes stale with respect to its inputs.

Further, the grain of data depends on the possible mutations within the graph.
Since we are limiting user interactions only to the named variables, the
possible mutations are mechanically the paths between the variables, including
any function chains along the way. In combination with the above, this gives
us a canonical recipe for the state tracking model for a function graph kernel:
A simple deterministic ordering of all dependency segments for each variable.

Consider the following function graph:

{{< viz >}}
digraph tracking {
    size="4,4"
    seed[label="seed: long"]
    cycle[label="cycle: long"]
    user_id[label="user_id: long"]
    seed -> U -> user_id [color="grey", label="0",labelcolor="grey"];
    cycle-> U -> user_id [color="blue",label="1",labelcolor="blue"];
    user_id -> F -> first_name [color="red", label="2", labelcolor="red"];
    user_id -> L -> last_name [color="green" label="3", labelcolor="green"];
  tracker[shape="record", label="{tracking register|{0|1|2|3|...}}"]
}
{{< /viz >}}

## Dependency Tracking

Given each field-to-field data flow in a function graph, a simple tracking structure
can be created that enumerates these paths in terms of a bitmask.

This graph shows both the effect of tracking change flow for unary functions as well
as an implied bi-function. If either the *seed* or the *cycle* value are changed, then
one of the inbound paths to *user_id* is affected. Further, it is specific which one is
affected.

For fields which are the product of bifunctions, such as *user_id* and *U()*, any upstream
changes require the bi-function to be re-computed. However, ...

- The dependency mask for *last_name* is `1011`.
- The dependency mask for *first_name* is `0111`.
- The dependency mask for *user_id* is `0011`.

The basic rules of state tracking using this dependency scheme are as follows:

1. When a FGK is initialized, all observable values are computed with
   respect to the default inputs (coordinats), and all tracked state is cleared.
2. When a field is observed, it's 


## Other Ideas

### Computed State and Function Unrolling

For the above example, here are a specific and finite set of uncomputed
states that are possible when the user attempts to observe thee *first_name* field.
They are:

1. <s>cycle and identity have both been changed</s>
2. cycle has been changed
3. user_id has been changed
4. neither cycle nor user_id have been changed

Of these, there are only three distict and actionable execution plans, owing to the
fact that when cycle has been chaged, identity might as well have been changed in terms
of how it affects the value of the *first_name* field. The last case with no changes *is*
a specific execution plan, although it is effectively a NOOP.

This provides a basic rationale for setting the required entry point for
evaluation of the *first_name* field:

- In case **2**, compute the new value of *user_id* from cycle, then compute the new value of *first_name* from *user_id*, then return the value of *first_name*.
- In case **3**, compute the new value of *first_name* and then return the value of the curret *first_name* field.
- In case **4**, do nothing, return the current value of the *first_name* field.

This yields an interesting affinity to loop unrolling, and can be encoded in a kernel with the following pseudocode (with more optimal numbering):

    switch predecessor_state:
      case: 0: compute user_id
      case: 1: compute first_name
    
    return first_name

For a function graph which includes no bi-functions or other functions with higher arity,
it would be possible to have a simple predecessor tracking bitmask by walkig backwards
through the graph from a given field.

For function graphs with bi-functions or other functions with higher arity, it
is still possible to have a function tracking bitmask, although the mapping
between predecessors would need to be established from a deterministic graph
traversal method. This is the current approach to tracking that will be
employed in the initial implementation.


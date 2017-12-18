---
date: 2017-12-16
title: FGK Sketch
weight: 1000
---

## Description

This section elaborates on the function graph kernel design.

Herein, the function graph kernel will be abbreviated as FGK, although it needs
a better name. In essence, the function graph kernel is a runtime implementation
of the [Function Graph Kernel API](../function_graph_kernel_api).

A function graph is a directed graph. No loops are currently supported.

Let us start with an example function graph template:

{{< viz >}}
digraph function_graph {
    size="4,4"
    f1[label="f()",shape="ellipse"];
    f2[label="g()",shape="ellipse"];
    f3[label="h()",shape="ellipse"];
    f4[label="i()",shape="ellipse"];
    node[shape="box"];
    var1,var2,var3,var4;
    var2 -> f1 -> f2 -> var4;
    var1 -> f1 -> var3;
    var2 -> f4 -> var6;
    f1 -> var5 -> f3 -> var3;
    subgraph cluster1 {
     label="inputs";
     var1,var2;
    }
    subgraph cluster2 {
     label="outputs";
     var3, var4, var6;
    }
}
{{< /viz >}}

This is a basic model of a function graph without the usual data types and
meaningful names. The purpose of this is to illustrate that a function graph
can have the following:

1. Named fields which have no upstream inputs. These are *coordinate fields*.
2. Unary functions, such as `i(var2)->var6`
3. bi-functions, as in `f(var1,var2) -> var3`
4. overlapping lambda paths, as in both `f()` and `g()`
5. independent flows, as in `i(var2) -> var6`
6. Intermediate fields as in `var5` connecting `f(var1,var2)->var5` and `h(var5)->var3`.
7. Named fields which have upstream inputs, which may be read or written to.

However, the following is verboten:

1. Loops are **not** allowed. A function graph is a directed graph. All paths back to the inputs must end up at coordinate fields.
2. Connections directly between fields are **not** allowed. A field is the holder for the result of a single function.
3. Fields which have more than one upstream function are **not** allowed. A field is the holder for result of a single function. 

## Usage Semantics

However, there are limited ways to interact with the function graph. The
designer of the function graph determines what the available inputs and outputs
are, and gives them names to suit. 

All interactions with a user should be based on named inputs and outputs. These
are referred to as **fields** in the FGK. In the naive implementation, all
fields are simple state boxes which can be muted or observed via the named-based
getter and setter API.

In this example, we will assume that all named variables are meant to be
interacted with. Any variable that does not have an inbound path on the graph
will be deemed an independent variable, and thus a coordinate. Any other
variable will be deemed visible, but also settable by the application.

Further, the fields have strict types. This is necessary in order to make an
efficient FGK implementation as well as to handle type-conversion robustly.

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

A kernel-global register that tracks when a variable is stale with respect to
all of its inputs. This register is specifically named the *dependency tracking
register*. This register is considered unsigned, providing for up to 64
independent segments tracked per kernel for the naive implementation.

Further, each named variable has its own mask of bits, called the dependency
mask* that determines which of the global tracking register segments feed into
it. If there are named variables which are not meant to be exposed to the
getter/setter API, then these can be elided and the enclosing segments tracked
as a single segment.

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
  tracker[shape="record", label="{dependency tracking register|{0|1|2|3|...}}"]
}
{{< /viz >}}

The dependency masks implied are: (msb first)

    user_id is  0011  # 1<<0, 1<<1
    last_name   1011  # 1<<0,       1<<2, 1<<4
    first_name  0111  # 1<<0, 1<<1, 1<<2

With the masks attached to their associated variables:

{{< viz >}}
digraph tracking {
    size="4,4"
    seed[label="seed: long",shape="box"]
    cycle[label="cycle: long",shape="box"]
    user_id[label="user_id: long",shape="box"]
    first_name[label="first_name: String",shape="box"]
    last_name[label="last_name: String",shape="box"]
    seed -> U -> user_id [color="grey", label="0",labelcolor="grey"];
    cycle-> U -> user_id [color="blue",label="1",labelcolor="blue"];
    user_id -> F -> first_name [color="red", label="2", labelcolor="red"];
    user_id -> L -> last_name [color="green" label="3", labelcolor="green"];
    seed_mask[shape="record", label="mask|0b0000", fontcolor="blue",color="blue"];
    cycle_mask[shape="record", label="mask|0b0000", fontcolor="blue",color="blue"];
    first_name_mask[shape="record", label="mask|0b0111", fontcolor="blue",color="blue"];
    last_name_mask[shape="record", label="mask|0b1011", fontcolor="blue",color="blue"];
    user_id_mask[shape="record", label="mask|0b0011", fontcolor="blue",color="blue"];
    seed->seed_mask;
    cycle->cycle_mask;
    user_id->user_id_mask;
    first_name->first_name_mask;
    last_name->last_name_mask;
}
{{< /viz >}}

## Design Invariants

Certain behaviors will need to be encoded as standard for the purposes of API
simplicity:

- The function graph segments referenced in the *dependency tracking register*
  should be ordered so that upstream segments always occur before their respective
  downstream segments.
- A given FGK should be initialized with all output fields current with respect 
  to the default coordinates. This also serves as a runtime validation of the
  kernel.
- When an input coordinate is set to the same value as it was previously set to,
  the FGK should disregard setting any flags for field invalidation.

## Using Dependency Data

The above graph shows both the effect of tracking change flow for unary functions as well
as an implied bi-function. If either the *seed* or the *cycle* value are changed, then
one of the inbound paths to *user_id* is affected. Further, it is specific which one is
affected, although in the case of a bi-function, both inputs must be used again for
re-computation.

The basic rules of state tracking using this dependency scheme are as follows:

1. When a field is observed, the logical and of its *dependency mask* and the
   *dependency tracking register* is computed. The resulting bitfield is the
   execution plan for which variables to compute. All of indicated segments are 
   computed in order, and then the global tracking register is unset for those
   segments.
2. The resulting field(s) are returned.

This means that computing the required executions for a single readable variable 
is akin to computing them for multiple fields. The only difference is that for multiple
variables, the logical or of all dependency masks is taken first. This can allow for
iterative calls to a kernel to be coalesced if the fields sets are known ahead of time.

## Optimizations

With the model above, it becomes possible to create a caching layer around named
fields that enable direct invocation of sections of the graph without the cost
of name-based lookup.

Example pseudo-code:

    mut= fgk.prepareMutator(new String[]{ "var1", "var2"}, new String[]{"var5,var6"});
    Object[] outs=mut.call("a","b");
    
While not proper code, this illustrates the idea of knowing which set of inputs will
be used with a set of outputs and thus allowing for the *pre-baking* of the call-sites
for better performance.

  
  



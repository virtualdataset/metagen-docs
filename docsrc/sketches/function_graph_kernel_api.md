---
date: 2017-12-16
title: Function Graph Kernel API
weight: 36
---

The functional graph kernel API is simply the implementation of a function
graph, as realized in your application. This is the result of binding a parsed
function graph template to a set of functions within a graph.

What makes the functional kernel useful at the most basic level are the named
input and output operations.

## Setting coordinates

Whe a functional kernel is realized in your runtime, it will have a set of named
inputs which we call *coordinates*. These are simply the independent values
which depend on nothing other that the controlling application. That is, the
application that contains the function graph kernel object can set these values,
and that is the only way that they can be changed. The virtdata API will provide
a setter interface which allows values to be set int he kernel in a type-safe
way.

## Reading values

Just as inputs are named, so are all of the outputs in a function graph -- at
least the ones intended to be readable by the function graph designer. Any time
an input coordinate is changed, the view of observable values is changed.

## Thread Safety

By default, the functional kernel is not designed to be thread-safe.
Multi-threaded support may come in the form of explicit semantics in a future
update, but for now, it is best to create an instance of the kernel for each
thread, *or* wrap any shared instance in a synchronizing API.


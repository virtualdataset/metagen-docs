---
date: 2017-05-19T21:52:39
title: Virtual Data Set - User's Guide
type: index
weight: 5
layout: single
---

[![Latest Release](https://maven-badges.herokuapp.com/maven-central/io.virtdata/virtdata/badge.svg)](https://maven-badges.herokuapp.com/maven-central/io.virtdata/virtdata/) [![Build Status](https://travis-ci.org/virtualdataset/virtdata-java.svg?branch=master)](https://travis-ci.org/virtualdataset/virtdata-java)


**Please stand by while we bring the docs online...**

This book serves as the primary documentation for VirtualDataSet projects.

## What is a Virtual DataSet?

Virtual data can be described by a recipe. It can be created when you attempt
to access it. Virtual Data is a lens into a set of data that may not exist yet,
but which, once observed, is as tangible as stored data. Virtual data is what 
results when you apply a mapping function to a coordinate.

The procedurally generated worlds of some video 
games start out as a virtual data set. A *procedural generation algorithm*
can be thought of as a mapping function between a set of specific coordinates
and a set of observable details. The data is virtual because it
is synthesized as you observe it, according to a recipe.

The coordinates can be in any useful form, such as a time on a timeline, a
set of cartesian coordinates, something even more rudimentary like a count of
iterations. The details can represent any tangible idea that is called for.

The recipes used with virtual dataset are simply called *virtdata recipes*.
They can vary in complexity from the mundane to the sophisticated.

Some recipes -- those depending only on 
[pure functions](https://en.wikipedia.org/wiki/Pure_function) -- will generate a 
*static virtual dataset*. Recipes that rely mutable state will generate
a *dynamic virtual dataset*.

## Requests

If you have requests for topics to include in this book, please submit them at the 
[Issue Tracker](https://github.com/virtualdataset/metagen-docs/issues).

## Next Steps

This book serves as the primary documentation for the
Virtual DataSet projects, namely 
[VirtData-Java](https://github.com/virtualdataset/virtdata-java)
If you have requests, please submit them at the 

[Issue Tracker](https://github.com/virtualdataset/virtdata-docs/issues).

The book is structured to give you a useful entry point regardless of your 
experience with the concepts and tools. You can choose to go directly to 
the [Recipes](using_virtdata/common_recipes.html) section, or
you can start with [Concepts](concepts/concepts.html). 

## VirtData History

Virtual DataSet began as an experiment to see if a DSL could be used to create
recipe-driven synthetic data streams for distributed testing.

The first generation of the experiment, named **Metagener**, was successful in
producing a working prototype, with a direct generator specification language,
fluent API and built-in examples. However, it had at least one major failing: It
was not easy to use.

The current version of the toolkit exists as a reboot of the original ideas, but
with a less ambitious set of goals and a focus providing something useful.

The design priorities of this phase of the virtual dataset tools are:

1. Late-binding and easy integration for runtime library extensions
2. Idiomatic Java-8 functional reflection
3. Efficient lambda construction and composition of higher-order data mappers
4. Consumer-friendly APIs for easy client integration
5. A set of common recipe examples for users to copy and paste
6. Useful documentation

Once these basic goals are met, some of the more interesting features of the
original project may be added in.






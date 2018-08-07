---
date: 2018-06-18
title: collections
weight: 75
menu:
  main:
    parent: Function Reference
    identifier: reference-collections
    weight: 52
---
Collection functions allow you to construct Java Lists, Maps or Sets.
These functions often take the form of a higher-order function, where
the inner function definitions are called to determine the size of
the collection, the individual values to be added, etc.

## HashedLineToStringList

- long -> HashedLineToStringList(String: filename, int: minSize, int: maxSize) -> java.util.List

## HashedLineToStringSet

Return a pseudo-randomly created Set from the values in
the specified file.

- long -> HashedLineToStringSet(String: filename, int: minSize, int: maxSize) -> java.util.Set<String>
  - *ex:* `HashedLineToStringSet('data/variable_words.txt',2,10)` - *Create a set of words sized between 2 and 10 elements*

## HashedLineToStringStringMap

Create a String-String map from the specified file, ranging in size
from 0 to the specified maximum.

- long -> HashedLineToStringStringMap(String: paramFile, int: maxSize) -> java.util.Map<String,String>

## HashedRangeToLongList

Create a list of longs.

- long -> HashedRangeToLongList(int: minVal, int: maxVal, int: minSize, int: maxSize) -> java.util.List<Long>


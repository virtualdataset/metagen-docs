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


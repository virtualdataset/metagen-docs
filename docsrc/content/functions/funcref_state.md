---
date: 2018-06-18
title: state
weight: 75
menu:
  main:
    parent: Function Reference
    identifier: reference-state
    weight: 52
---
## Clear

Clears the per-thread map which is used by the Expr function.

- long -> Clear() -> long
  - *notes:* Clear all named entries from the per-thread map.
  - *ex:* `Clear()` - *clear all thread-local variables*
- long -> Clear(String[]...: names) -> long
  - *notes:* Clear the specified names from the per-thread map.
  - *ex:* `Clear('foo')` - *clear the thread-local variable 'foo'*
  - *ex:* `Clear('foo','bar')` - *clear the thread-local variables 'foo' and 'bar'*

## Load

Load a named value from the per-thread state map.
The previous input value will be forgotten, and the named value will replace it
before the next function in the chain.

- double -> Load(String: name) -> double
  - *ex:* `Load('foo')` - *load a double value from the named variable for this thread*
- long -> Load(String: name) -> long
  - *ex:* `Load('foo')` - *load a long value from the named variable for this thread*
- Object -> Load(String: name) -> Object
  - *ex:* `Load('foo')` - *load a Object value from the named variable for this thread*
- int -> Load(String: name) -> int
  - *ex:* `Load('foo')` - *load an int value from the named variable for this thread*
- String -> Load(String: name) -> String
  - *ex:* `Load('foo')` - *load a String value from the named variable for this thread*

## Save

Save the current input value at this point in the function chain to a thread-local variable name.
The input value is unchanged, and available for the next function in the chain to use as-is.

- double -> Save(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*
- double -> Save(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*
- double -> Save(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*
- double -> Save(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*
- long -> Save(String: name) -> long
  - *ex:* `Save('foo')` - *save the current long value to the name 'foo' in this thread*
- long -> Save(String: name) -> long
  - *ex:* `Save('foo')` - *save the current long value to the name 'foo' in this thread*
- long -> Save(String: name) -> long
  - *ex:* `Save('foo')` - *save the current long value to the name 'foo' in this thread*
- long -> Save(String: name) -> long
  - *ex:* `Save('foo')` - *save the current long value to the name 'foo' in this thread*
- Object -> Save(String: name) -> Object
  - *ex:* `Save('foo')` - *save the current input object value to the name 'foo' in this thread*
- Object -> Save(String: name) -> Object
  - *ex:* `Save('foo')` - *save the current input object value to the name 'foo' in this thread*
- Object -> Save(String: name) -> Object
  - *ex:* `Save('foo')` - *save the current input object value to the name 'foo' in this thread*
- Object -> Save(String: name) -> Object
  - *ex:* `Save('foo')` - *save the current input object value to the name 'foo' in this thread*
- int -> Save(String: name) -> int
  - *ex:* `Save('foo')` - *save the current int value to the name 'foo' in this thread*
- int -> Save(String: name) -> int
  - *ex:* `Save('foo')` - *save the current int value to the name 'foo' in this thread*
- int -> Save(String: name) -> int
  - *ex:* `Save('foo')` - *save the current int value to the name 'foo' in this thread*
- int -> Save(String: name) -> int
  - *ex:* `Save('foo')` - *save the current int value to the name 'foo' in this thread*
- String -> Save(String: name) -> String
  - *ex:* `Save('foo')` - *save the current String value to the name 'foo' in this thread*
- String -> Save(String: name) -> String
  - *ex:* `Save('foo')` - *save the current String value to the name 'foo' in this thread*
- String -> Save(String: name) -> String
  - *ex:* `Save('foo')` - *save the current String value to the name 'foo' in this thread*
- String -> Save(String: name) -> String
  - *ex:* `Save('foo')` - *save the current String value to the name 'foo' in this thread*

## Show

Show diagnostic values for the thread-local variable map.

- Object -> Show() -> String
  - *ex:* `Show()` - *Show all values in a json-like format*
- Object -> Show(String[]...: names) -> String
  - *ex:* `Show('foo')` - *Show only the 'foo' value in a json-like format*
  - *ex:* `Show('foo','bar')` - *Show the 'foo' and 'bar' values in a json-like format*


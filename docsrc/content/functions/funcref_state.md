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
Functions in the state category allow you to do things with
side-effects in the function flow. Specifically, they allow
you to save or load values of named variables to thread-local
registers.

## Clear

Clears the per-thread map which is used by the Expr function.

- long -> Clear() -> long
  - *notes:* Clear all named entries from the per-thread map.
  - *ex:* `Clear()` - *clear all thread-local variables*
- long -> Clear(String... names) -> long
  - *notes:* Clear the specified names from the per-thread map.
  - *ex:* `Clear('foo')` - *clear the thread-local variable 'foo'*
  - *ex:* `Clear('foo','bar')` - *clear the thread-local variables 'foo' and 'bar'*

## Load

Load a named value from the per-thread state map.
The previous input value will be forgotten, and the named value will replace it
before the next function in the chain.

- double -> Load(String: name) -> double
  - *ex:* `Load('foo')` - *for the current thread, load a double value from the named variable*
- double -> Load(String: name, double: defaultValue) -> double
  - *ex:* `Load('foo',432.0D)` - *for the current thread, load a double value from the named variable, or the defaultvalue if it is not yet defined.*
- double -> Load(java.util.function.Function<Object,Object>: nameFunc) -> double
  - *ex:* `Load(NumberNameToString())` - *for the current thread, load a double value from the named variable, where the variablename is provided by a function.*
- double -> Load(java.util.function.Function<Object,Object>: nameFunc, double: defaultValue) -> double
  - *ex:* `Load(NumberNameToString(),1234.5D)` - *for the current thread, load a double value from the named variable, where the variablename is provided by a function, or the default value if the named value is not yet defined.*
- long -> Load(String: name) -> long
  - *ex:* `Load('foo')` - *for the current thread, load a long value from the named variable*
- long -> Load(String: name, long: defaultValue) -> long
  - *ex:* `Load('foo', 423L)` - *for the current thread, load a long value from the named variable, or the default value if the variable is not yet defined*
- long -> Load(java.util.function.Function<Object,Object>: nameFunc) -> long
  - *ex:* `Load(NumberNameToString())` - *for the current thread, load a long value from the named variable, where the variable name is provided by the provided by a function.*
- long -> Load(java.util.function.Function<Object,Object>: nameFunc, long: defaultvalue) -> long
  - *ex:* `Load(NumberNameToString(),22L)` - *for the current thread, load a long value from the named variable, where the variable name is provided by the provided by a function, or the default value if the variable is not yet defined*
- Object -> Load(String: name) -> Object
  - *ex:* `Load('foo')` - *for the current thread, load an Object value from the named variable*
- Object -> Load(java.util.function.Function<Object,Object>: nameFunc) -> Object
  - *ex:* `Load(NumberNameToString())` - *for the current thread, load an Object value from the named variable, where the variable name is returned by the provided function*
- Object -> Load(String: name, Object: defaultValue) -> Object
  - *ex:* `Load('foo','testvalue')` - *for the current thread, load an Object value from the named variable, or the default value if the variable is not yet defined.*
- Object -> Load(java.util.function.Function<Object,Object>: nameFunc, Object: defaultValue) -> Object
  - *ex:* `Load(NumberNameToString(),'testvalue')` - *for the current thread, load an Object value from the named variable, where the variable name is returned by the provided function, or thedefault value if the variable is not yet defined.*
- int -> Load(String: name) -> int
  - *ex:* `Load('foo')` - *for the current thread, load an int value from the named variable*
- int -> Load(String: name, int: defaultValue) -> int
  - *ex:* `Load('foo',42)` - *for the current thread, load an int value from the named variable, or return the default value if it is undefined.*
- int -> Load(java.util.function.Function<Object,Object>: nameFunc) -> int
  - *ex:* `Load(NumberNameToString())` - *for the current thread, load an int value from the named variable, where the variable name is provided by a function.*
- int -> Load(java.util.function.Function<Object,Object>: nameFunc, int: defaultValue) -> int
  - *ex:* `Load(NumberNameToString(),42)` - *for the current thread, load an int value from the named variable, where the variable name is provided by a function, or the default value if the named variable is undefined.*
- String -> Load(String: name) -> String
  - *ex:* `Load('foo')` - *for the current thread, load a String value from the named variable*
- String -> Load(String: name, String: defaultvalue) -> String
  - *ex:* `Load('foo','track05')` - *for the current thread, load a String value from the named variable, or teh default value if the variable is not yet defined.*
- String -> Load(java.util.function.Function<Object,Object>: nameFunc) -> String
  - *ex:* `Load(NumberNameToString())` - *for the current thread, load a String value from the named variable, where the variable name is provided by a function*
- String -> Load(java.util.function.Function<Object,Object>: nameFunc, String: defaultValue) -> String
  - *ex:* `Load(NumberNameToString(),'track05')` - *for the current thread, load a String value from the named variable, where the variable name is provided by a function, or the default value if the variable is not yet defined.*

## Save

Save the current input value at this point in the function chain to a thread-local variable name.
The input value is unchanged, and available for the next function in the chain to use as-is.

- double -> Save(String: name) -> double
  - *ex:* `Save('foo')` - *for the current thread, save the current double value to the named variable.*
- double -> Save(java.util.function.Function<Object,Object>: nameFunc) -> double
  - *ex:* `Save(NumberNameToString())` - *for the current thread, save the current double value to the name 'foo' in this thread, where the variable name is provided by a function.*
- long -> Save(String: name) -> long
  - *ex:* `Save('foo')` - *save the current long value to the name 'foo' in this thread*
- long -> Save(java.util.function.Function<Object,Object>: nameFunc) -> long
  - *ex:* `Save(NumberNameToString())` - *save the current long value to the name generated by the function given.*
- Object -> Save(String: name) -> Object
  - *ex:* `Save('foo')` - *for the current thread, save the input object value to the named variable*
- Object -> Save(java.util.function.Function<Object,Object>: nameFunc) -> Object
  - *ex:* `Save(NumberNameToString())` - *for the current thread, save the current input object value to the named variable,where the variable name is provided by a function.*
- int -> Save(String: name) -> int
  - *ex:* `Save('foo')` - *save the current int value to the name 'foo' in this thread*
- int -> Save(java.util.function.Function<Object,Object>: nameFunc) -> int
  - *ex:* `Save(NumberNameToString())` - *save the current int value to a named variable in this thread,where the variable name is provided by a function.*
- String -> Save(String: name) -> String
  - *ex:* `Save('foo')` - *save the current String value to the name 'foo' in this thread*
- String -> Save(java.util.function.Function<Object,Object>: nameFunc) -> String
  - *ex:* `Save(NumberNameToString())` - *save the current String value to a named variable in this thread, where the variable name is provided by a function*

## Show

Show diagnostic values for the thread-local variable map.

- Object -> Show() -> String
  - *ex:* `Show()` - *Show all values in a json-like format*
- Object -> Show(String... names) -> String
  - *ex:* `Show('foo')` - *Show only the 'foo' value in a json-like format*
  - *ex:* `Show('foo','bar')` - *Show the 'foo' and 'bar' values in a json-like format*

## Swap

Load a named value from the per-thread state map.
The previous input value will be stored in the named value, and the previously
stored value will be returned. A default value to return may be provided
in case there was no previously stored value under the given name.

- long -> Swap(String: name) -> long
  - *ex:* `Swap('foo')` - *for the current thread, swap the input value with the named variable and returned the named variable.*
- long -> Swap(String: name, long: defaultValue) -> long
  - *ex:* `Swap('foo',234L)` - *for the current thread, swap the input value with the named variable and returned the named variable,or the default value if the named variable is not defined.*
- long -> Swap(java.util.function.LongFunction<String>: nameFunc) -> long
  - *ex:* `Swap(NumberNameToString())` - *for the current thread, swap the input value with the named variable and returned the named variable, where the variable name is generated by the provided function.*
- long -> Swap(java.util.function.LongFunction<String>: nameFunc, long: defaultValue) -> long
  - *ex:* `Swap(NumberNameToString(), 234L)` - *for the current thread, swap the input value with the named variable and returned the named variable, where the variable name is generated by the provided function, or the default value if the named variable is not defined.*
- Object -> Swap(String: name) -> Object
  - *ex:* `Swap('foo')` - *for the current thread, swap the input value with the named variable and returned the named variable*
- Object -> Swap(String: name, Object: defaultValue) -> Object
  - *ex:* `Swap('foo','examplevalue')` - *for the current thread, swap the input value with the named variable and returned the named variable, or return the default value if the named value is not defined.*
- Object -> Swap(java.util.function.Function<Object,Object>: nameFunc) -> Object
  - *ex:* `Swap(NumberNameToString())` - *for the current thread, swap the input value with the named variable and returned the named variable, where the variable name is generated by the provided function.*
- Object -> Swap(java.util.function.Function<Object,Object>: nameFunc, Object: defaultValue) -> Object
  - *ex:* `Swap(NumberNameToString(),'examplevalue')` - *for the current thread, swap the input value with the named variable and returned the named variable, where the variable name is generated by the provided function, or the default value if the named value is not defined.*


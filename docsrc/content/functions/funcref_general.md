---
date: 2018-06-18
title: general
weight: 75
menu:
  main:
    parent: Function Reference
    identifier: reference-general
    weight: 52
---
These functions have no particular category, so they ended up here
by default. This is where the bulk of basic functions can be found.

## Add

Adds a value to the input.

- double -> Add(double: addend) -> double
- long -> Add(long: addend) -> int
- long -> Add(long: addend) -> long
- int -> Add(int: addend) -> int
  - *ex:* `Add(23)` - *adds integer 23 to the input integer value*

## AddCycleRange

Adds a cycle range to the input, producing an increasing sawtooth-like output.

- long -> AddCycleRange(long: maxValue) -> int
- long -> AddCycleRange(long: minValue, long: maxValue) -> int
- long -> AddCycleRange(long: maxValue) -> long
- long -> AddCycleRange(long: minValue, long: maxValue) -> long
- int -> AddCycleRange(int: maxValue) -> int
- int -> AddCycleRange(int: minValue, int: maxValue) -> int

## AddHashRange

Adds a pseudo-random value within the specified range to the input.

- long -> AddHashRange(long: maxValue) -> int
- long -> AddHashRange(long: minValue, long: maxValue) -> int
- long -> AddHashRange(long: maxValue) -> long
- long -> AddHashRange(long: minValue, long: maxValue) -> long
- int -> AddHashRange(int: maxValue) -> int
- int -> AddHashRange(int: minValue, int: maxValue) -> int

## AlphaNumericString

Create an alpha-numeric string of the specified length, character-by-character.

- long -> AlphaNumericString(int: length) -> String

## Clamp

Clamp the output values to be at least the minimum value and
at most the maximum value.

- double -> Clamp(double: min, double: max) -> double
  - *ex:* `Clamp(1.0D,9.0D)` - *clamp output values between the range [1.0D, 9.0D], inclusive*
- long -> Clamp(long: min, long: max) -> long
  - *ex:* `Clamp(4L,400L)` - *clamp the output values in the range [4L,400L], inclusive*
- int -> Clamp(int: min, int: max) -> int
  - *ex:* `Clamp(1,100)` - *clamp the output values in the range [1,100], inclusive*

## Combinations

Convert a numeric value into a code according to ASCII printable
characters. This is useful for creating various encodings using different
character ranges, etc.

This mapper can map over the sequences of character ranges providing every unique
combination and then wrapping around to the beginning again.
It can convert between character bases with independent radix in each position.
Each position in the final string takes its values from a position-specific
character set, described by the shorthand in the examples below.

The constructor will throw an error if the number of combinations exceeds that
which can be represented in a long value. (This is a very high number).

- long -> Combinations(String: spec) -> String
  - *ex:* `Combinations('A-Z;A-Z')` - *a two digit alphanumeric code. Wraps at 26^2*
  - *ex:* `Combinations('0-9A-F')` - *a single hexadecimal digit*
  - *ex:* `Combinations('0123456789ABCDEF')` - *a single hexadecimal digit*
  - *ex:* `Combinations('0-9A-F;0-9A-F;0-9A-F;0-9A-F;')` - *two bytes of hexadecimal*
  - *ex:* `Combinations('A-9')` - *upper case alphanumeric*

## CycleRange

Yields a value within a specified range, which rolls over continuously.

- long -> CycleRange(long: maxValue) -> int
- long -> CycleRange(long: minValue, long: maxValue) -> int
- long -> CycleRange(long: maxValue) -> long
- long -> CycleRange(long: minValue, long: maxValue) -> long
- int -> CycleRange(int: maxValue) -> int
  - *notes:* Sets the maximum value of the cycle range. The minimum is default to 0.
  - *ex:* `CycleRange(34)` - *add a rotating value between 0 and 34 to the input*
- int -> CycleRange(int: minValue, int: maxValue) -> int
  - *notes:* Sets the minimum and maximum value of the cycle range.

## DirectoryLines

Read each line in each matching file in a directory structure, providing one
line for each time this function is called. The files are sorted at the time
the function is initialized, and each line is read in order.

This function does not produce the same result per cycle value. It is possible
that different cycle inputs will return different inputs if the cycles are not
applied in strict order. Still, this function is useful for consuming input
from a set of files as input to a test or simulation.

- long -> DirectoryLines(String: basepath, String: namePattern) -> String
  - *ex:* `DirectoryLines('/var/tmp/bardata', '.*')` - *load every line from every file in /var/tmp/bardata*

## Div

Divide the operand by a fixed value and return the result.

- double -> Div(double: divisor) -> double
- long -> Div(int: divisor) -> int
- long -> Div(long: divisor) -> long
  - *ex:* `Div(42L)` - *divide all inputs by 42L*
- int -> Div(int: divisor) -> int

## DivideToLongToString

This is equivalent to `Div(...)`, but returns
the result after String.valueOf(...). This function is also deprecated,
as it is easily replaced by other functions.

- long -> DivideToLongToString(long: divisor) -> String

## DoubleToFloat

Convert the input double value to the closest float value.

- double -> DoubleToFloat() -> Float

## Expr

Allow for the use of arbitrary expressions according to the
[MVEL](http://mvel.documentnode.com/) expression language.

Variables that have been set by a Save function are available
to be used in this function.

The variable name **cycle** is reserved, and is always equal to
the current input value.

- double -> Expr(String: expr) -> double
- long -> Expr(String: expr) -> int
- long -> Expr(String: expr) -> long
- int -> Expr(String: expr) -> int

## FieldExtractor

Extracts out a set of fields from a delimited string, returning
a string with the same delimiter containing only the specified fields.
The

- String -> FieldExtractor(String: fields) -> String
  - *ex:* `FieldExtractor('|,2,16')` - *extract fields 2 and 16 from the input data with '|' as the delimiter*

## FixedValue

Yield a fixed value.

- long -> FixedValue(int: value) -> int
  - *ex:* `FixedValue(42)` - *always return 42*
- long -> FixedValue(long: fixedValue) -> long

## FixedValues

Yield one of the specified values, rotating through them as the input value
increases.

- long -> FixedValues(int... values) -> int
- long -> FixedValues(long... values) -> long
  - *ex:* `FixedValues(3L,53L,73L)` - *Yield 3L, 53L, 73L, 3L, 53L, 73L, 3L, ...*

## Format

Apply the Java String.format method to an incoming object.
See <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax">Java 8 String.format(...) javadoc</a>
Note: This function can often be quite slow, so more direct methods are generally preferrable.

- Object -> Format(String: format) -> String
  - *ex:* `Format('Y')` - *Yield the formatted year from a Java date object.*

## FullHash

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output.

This version returns the value regardless of this sign bit.
It does not return the absolute value, as Hash does.

- long -> FullHash() -> long

## Hash

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output. It does, however, return the absolute value.
This is to make it play nice with users and other libraries.

- long -> Hash() -> int
- long -> Hash() -> long
- int -> Hash() -> int

## HashRange

Return a value within a range, pseudo-randomly. This is equivalent to
returning a value with in range between 0 and some maximum value, but
with a minimum value added.

- long -> HashRange(long: width) -> int
- long -> HashRange(long: minValue, long: maxValue) -> int
- long -> HashRange(long: width) -> long
- long -> HashRange(long: minValue, long: maxValue) -> long
- int -> HashRange(int: width) -> int
- int -> HashRange(int: minValue, int: maxValue) -> int

## HashRangeScaled

Return a pseudo-random value which can only be as large as the input.

- long -> HashRangeScaled() -> int
- long -> HashRangeScaled() -> long
- int -> HashRangeScaled() -> int

## HashedDoubleRange

Return a double value within the specified range. This function
uses an intermediate long to arrive at the sampled value before
conversion to double, thus providing a more linear sample at the
expense of some precision at extremely large values.

- long -> HashedDoubleRange(double: min, double: max) -> double

## HashedFileExtractToString

Pseudo-randomly extract a section of a text file and return it according to some
minimum and maximum extract size. The file is loaded into memory as a shared
text image. It is then indexed into as a character buffer to find a pseudo-randomly
sized fragment.

- long -> HashedFileExtractToString(String: fileName, int: minsize, int: maxsize) -> String
  - *ex:* `HashedFileExtractToString('data/adventures.txt',100,200)` - *return a fragment from adventures.txt between 100 and 200 characters long*

## HashedLineToInt

Return a pseudo-randomly selected integer value from a file of numeric values.
Each line in the file must contain one parsable integer value.

- long -> HashedLineToInt(String: filename) -> int

## HashedLineToString

Return a pseudo-randomly selected String value from a single line of
the specified file.

- long -> HashedLineToString(String: filename) -> String

## HashedLinesToKeyValueString

Generate a string in the format key1:value1;key2:value2;... from the words
in the specified file, ranging in size between zero and the specified maximum.

- long -> HashedLinesToKeyValueString(String: paramFile, int: maxsize) -> String

## HashedLoremExtractToString

Provide a text extract from the full lorem ipsum text, between the specified
minimum and maximum size.

- long -> HashedLoremExtractToString(int: minsize, int: maxsize) -> String

## HashedRangedToNonuniformDouble

This provides a random sample of a double in a range, without
accounting for the non-uniform distribution of IEEE double representation.
This means that values closer to high-precision areas of the IEEE spec
will be weighted higher in the output. However, NaN and positive and
negative infinity are filtered out via oversampling. Results are still
stable for a given input value.

- long -> HashedRangedToNonuniformDouble(long: min, long: max) -> double

## HashedToByteBuffer

Hash a long input value into a byte buffer, at least length bytes long, but aligned on 8-byte
boundary;

- long -> HashedToByteBuffer(int: lengthInBytes) -> java.nio.ByteBuffer

## Identity

Simply returns the input value. This function intentionally does nothing.

- long -> Identity() -> long

## Interpolate

Return a value along an interpolation curve. This allows you to sketch a basic
density curve and describe it simply with just a few values. The number of values
provided determines the resolution of the internal lookup table that is used for
interpolation. The first value is always the 0.0 anchoring point on the unit interval.
The last value is always the 1.0 anchoring point on the unit interval. This means
that in order to subdivide the density curve in an interesting way, you need to provide
a few more values in between them. Providing two values simply provides a uniform
sample between a minimum and maximum value.

The input range of this function is, as many of the other functions in this library,
based on the valid range of positive long values, between 0L and Long.MAX_VALUE inclusive.
This means that if you want to combine interpolation on this curve with the effect of
pseudo-random sampling, you need to put a hash function ahead of it in the flow.

- long -> Interpolate(double... value) -> double
  - *ex:* `Interpolate(0.0d,100.0d)` - *return a uniform double value between 0.0d and 100.0d*
  - *ex:* `Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d)` - *return a weighted double value where the first second and third quartiles are 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(int: resolution, double[]: lut) -> double
- long -> Interpolate(double... value) -> long
  - *ex:* `Interpolate(0.0d,100.0d)` - *return a uniform long value between 0L and 100L*
  - *ex:* `Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d)` - *return a weighted long value where the first second and third quartiles are 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(long... value) -> long
- long -> Interpolate(int: resolution, double[]: lut) -> long

## JoinTemplate

Combine the result of the specified functions together with the
specified delimiter and optional prefix and suffix.

- long -> JoinTemplate(String: delimiter, java.util.function.LongFunction<?>... funcs) -> String
  - *ex:* `JoinTemplate('--',NumberNameToString(),NumberNameToString())` - *create values like `one--one`, `two-two`, ...*
- long -> JoinTemplate(String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>... funcs) -> String
  - *ex:* `JoinTemplate('{',',','}',NumberNameToString(),LastNames())` - *create values like '{one,Farrel}', '{two,Haskell}', ...*
- long -> JoinTemplate(java.util.function.LongUnaryOperator: iterop, String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>... funcs) -> String
  - *ex:* `JoinTemplate(Add(3),'[',';',']',NumberNameToString(),NumberNameToString(),NumberNameToString())` - *create values like '[zero;three,six]', '[one;four,seven]', ...*

## ListTemplate

Create a {@code List<String>} based on two functions, the first to
determine the list size, and the second to populate the list with
string values. The input fed to the second function is incremented
between elements.

- long -> ListTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<String>: valueFunc) -> java.util.List<String>
  - *ex:* `ListTemplate(HashRange(3,7),NumberNameToString())` - *create a list between 3 and 7 elements, with number names as the values*

## LoadDouble

Load a value from a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
If the named variable is not defined, then the default value is returned.

- Object -> LoadDouble(String: name) -> Double
  - *ex:* `LoadDouble('foo')` - *for the current thread, load a double value from the named variable.*
- Object -> LoadDouble(String: name, double: defaultValue) -> Double
  - *ex:* `LoadDouble('foo',23D)` - *for the current thread, load a double value from the named variable,or the default value if the named variable is not defined.*
- Object -> LoadDouble(java.util.function.Function<Object,Object>: nameFunc) -> Double
  - *ex:* `LoadDouble(NumberNameToString())` - *for the current thread, load a double value from the named variable, where the variable name is provided by a function.*
- Object -> LoadDouble(java.util.function.Function<Object,Object>: nameFunc, double: defaultValue) -> Double
  - *ex:* `LoadDouble(NumberNameToString(),23D)` - *for the current thread, load a double value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*
- long -> LoadDouble(String: name) -> double
  - *ex:* `LoadDouble('foo')` - *for the current thread, load a double value from the named variable.*
- long -> LoadDouble(String: name, double: defaultValue) -> double
  - *ex:* `LoadDouble('foo',23D)` - *for the current thread, load a double value from the named variable,or the default value if the named variable is not defined.*
- long -> LoadDouble(java.util.function.LongFunction<Object>: nameFunc) -> double
  - *ex:* `LoadDouble(NumberNameToString())` - *for the current thread, load a double value from the named variable, where the variable name is provided by a function.*
- long -> LoadDouble(java.util.function.LongFunction<Object>: nameFunc, double: defaultValue) -> double
  - *ex:* `LoadDouble(NumberNameToString(),23D)` - *for the current thread, load a double value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*

## LoadFloat

Load a value from a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
If the named variable is not defined, then the default value is returned.

- Object -> LoadFloat(String: name) -> Float
  - *ex:* `LoadFloat('foo')` - *for the current thread, load a float value from the named variable.*
- Object -> LoadFloat(String: name, float: defaultValue) -> Float
  - *ex:* `LoadFloat('foo',23F)` - *for the current thread, load a float value from the named variable,or the default value if the named variable is not defined.*
- Object -> LoadFloat(java.util.function.Function<Object,Object>: nameFunc) -> Float
  - *ex:* `LoadFloat(NumberNameToString())` - *for the current thread, load a float value from the named variable,where the variable name is provided by a function.*
- Object -> LoadFloat(java.util.function.Function<Object,Object>: nameFunc, float: defaultValue) -> Float
  - *ex:* `LoadFloat(NumberNameToString(),23F)` - *for the current thread, load a float value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*
- long -> LoadFloat(String: name) -> Float
  - *ex:* `LoadFloat('foo')` - *for the current thread, load a float value from the named variable.*
- long -> LoadFloat(String: name, float: defaultValue) -> Float
  - *ex:* `LoadFloat('foo',23F)` - *for the current thread, load a float value from the named variable,or the default value if the named variable is not defined.*
- long -> LoadFloat(java.util.function.LongFunction<Object>: nameFunc) -> Float
  - *ex:* `LoadFloat(NumberNameToString())` - *for the current thread, load a float value from the named variable,where the variable name is provided by a function.*
- long -> LoadFloat(java.util.function.LongFunction<Object>: nameFunc, float: defaultValue) -> Float
  - *ex:* `LoadFloat(NumberNameToString(),23F)` - *for the current thread, load a float value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*

## LoadInteger

Load a value from a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
If the named variable is not defined, then the default value is returned.

- Object -> LoadInteger(String: name) -> Integer
  - *ex:* `LoadInteger('foo')` - *for the current thread, load an integer value from the named variable.*
- Object -> LoadInteger(String: name, int: defaultValue) -> Integer
  - *ex:* `LoadInteger('foo',42)` - *for the current thread, load an integer value from the named variable, or the default value if the named variable is not defined.*
- Object -> LoadInteger(java.util.function.Function<Object,Object>: nameFunc) -> Integer
  - *ex:* `LoadInteger(NumberNameToString())` - *for the current thread, load an integer value from the named variable,where the variable name is provided by a function.*
- Object -> LoadInteger(java.util.function.Function<Object,Object>: nameFunc, int: defaultValue) -> Integer
  - *ex:* `LoadInteger(NumberNameToString(),42)` - *for the current thread, load an integer value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*
- long -> LoadInteger(String: name) -> int
  - *ex:* `LoadInteger('foo')` - *for the current thread, load an integer value from the named variable.*
- long -> LoadInteger(String: name, int: defaultValue) -> int
  - *ex:* `LoadInteger('foo',42)` - *for the current thread, load an integer value from the named variable, or the default value if the named variable is not defined.*
- long -> LoadInteger(java.util.function.LongFunction<Object>: nameFunc) -> int
  - *ex:* `LoadInteger(NumberNameToString())` - *for the current thread, load an integer value from the named variable,where the variable name is provided by a function.*
- long -> LoadInteger(java.util.function.LongFunction<Object>: nameFunc, int: defaultValue) -> int
  - *ex:* `LoadInteger(NumberNameToString(),42)` - *for the current thread, load an integer value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*

## LoadLong

Load a value from a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
If the named variable is not defined, then the default value is returned.

- Object -> LoadLong(String: name) -> Long
  - *ex:* `LoadLong('foo',42L)` - *for the current thread, load a long value from the named variable.*
- Object -> LoadLong(String: name, long: defaultValue) -> Long
  - *ex:* `LoadLong('foo',42L)` - *for the current thread, load a long value from the named variable, or the default value if the named variable is not defined.*
- Object -> LoadLong(java.util.function.Function<Object,Object>: nameFunc) -> Long
  - *ex:* `LoadLong(NumberNameToString(),42L)` - *for the current thread, load a long value from the named variable,where the variable name is provided by a function.*
- Object -> LoadLong(java.util.function.Function<Object,Object>: nameFunc, long: defaultValue) -> Long
  - *ex:* `LoadLong(NumberNameToString(),42L)` - *for the current thread, load a long value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*
- long -> LoadLong(String: name) -> long
  - *ex:* `LoadLong('foo',42L)` - *for the current thread, load a long value from the named variable.*
- long -> LoadLong(String: name, long: defaultValue) -> long
  - *ex:* `LoadLong('foo',42L)` - *for the current thread, load a long value from the named variable, or the default value if the named variable is not defined.*
- long -> LoadLong(java.util.function.LongFunction<Object>: nameFunc) -> long
  - *ex:* `LoadLong(NumberNameToString(),42L)` - *for the current thread, load a long value from the named variable,where the variable name is provided by a function.*
- long -> LoadLong(java.util.function.LongFunction<Object>: nameFunc, long: defaultValue) -> long
  - *ex:* `LoadLong(NumberNameToString(),42L)` - *for the current thread, load a long value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*

## LoadString

Load a value from a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
If the named variable is not defined, then the default value is returned.

- Object -> LoadString(String: name) -> String
  - *ex:* `LoadString('foo','examplevalue')` - *for the current thread, load a String value from the named variable.*
- Object -> LoadString(String: name, String: defaultValue) -> String
  - *ex:* `LoadString('foo','examplevalue')` - *for the current thread, load a String value from the named variable, or the default value if the named variable is not defined.*
- Object -> LoadString(java.util.function.Function<Object,Object>: nameFunc) -> String
  - *ex:* `LoadString(NumberNameToString(),'examplevalue')` - *for the current thread, load a String value from the named variable, or the default value if the named variable is not defined.*
- Object -> LoadString(java.util.function.Function<Object,Object>: nameFunc, String: defaultValue) -> String
  - *ex:* `LoadString(NumberNameToString(),'examplevalue')` - *for the current thread, load a String value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*
- long -> LoadString(String: name) -> String
  - *ex:* `LoadString('foo','examplevalue')` - *for the current thread, load a String value from the named variable.*
- long -> LoadString(String: name, String: defaultValue) -> String
  - *ex:* `LoadString('foo','examplevalue')` - *for the current thread, load a String value from the named variable, or the default value if the named variable is not defined.*
- long -> LoadString(java.util.function.LongFunction<Object>: nameFunc) -> String
  - *ex:* `LoadString(NumberNameToString(),'examplevalue')` - *for the current thread, load a String value from the named variable, or the default value if the named variable is not defined.*
- long -> LoadString(java.util.function.LongFunction<Object>: nameFunc, String: defaultValue) -> String
  - *ex:* `LoadString(NumberNameToString(),'examplevalue')` - *for the current thread, load a String value from the named variable,where the variable name is provided by a function, or the default value if the namedvariable is not defined.*

## LongToString

Return the string representation of the provided long.

- long -> LongToString() -> String

## MapTemplate

Construct a {@code Map<String,String>} from a set of input functions
which determine the size of the map, the value of each key, and
the value for that key. In between calling the key and value functions,
the input value is incremented.

- long -> MapTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<String>: keyFunc, java.util.function.LongFunction<String>: valueFunc) -> java.util.Map<String,String>
  - *ex:* `MapTemplate(HashRange(3-7),NumberNameToString(),LastNames())` - *create maps between 3 and 7 values big, with number names as the keys, and last names as the values*

## Max

Return the maximum of either the input value or the specified max.

- double -> Max(double: max) -> double
- long -> Max(long: max) -> long
  - *ex:* `Max(42L)` - *take the value of 42L or the input, which ever is greater*
  - *ex:* `Max(-42L)` - *take the value of -42L or the input, which ever is greater*
- int -> Max(int: max) -> int

## Min

Return the minimum of either the input value or the specified minimum.

- double -> Min(double: min) -> double
- long -> Min(long: min) -> long
- int -> Min(int: min) -> int

## Mod

Return the result of modulo division by the specified divisor.

- long -> Mod(long: modulo) -> int
- long -> Mod(long: modulo) -> long
- int -> Mod(int: modulo) -> int

## ModuloCSVLineToString

Select a value from a CSV file line by modulo division against the number
of lines in the file. The second parameter is the field name, and this must
be provided in the CSV header line as written.

- long -> ModuloCSVLineToString(String: filename, String: fieldname) -> String
  - *ex:* `ModuloCSVLineToString('data/myfile.csv','lat')` - *load values for 'lat' from the CSV file myfile.csv.*

## ModuloLineToString

Select a value from a text file line by modulo division against the number
of lines in the file.

- long -> ModuloLineToString(String: filename) -> String

## ModuloToInteger

Return an integer value as the result of modulo division with the specified divisor.

- long -> ModuloToInteger(int: modulo) -> Integer

## ModuloToLong

Return a long value as the result of modulo division with the specified divisor.

- long -> ModuloToLong(long: modulo) -> long

## Mul

Return the result of multiplying the specified value with the input.

- double -> Mul(double: factor) -> double
- long -> Mul(long: multiplicand) -> int
- long -> Mul(long: multiplicand) -> long
- int -> Mul(int: addend) -> int

## Murmur3DivToLong

Yield a long value which is the result of hashing and modulo division
with the specified divisor.

- long -> Murmur3DivToLong(long: divisor) -> long

## Murmur3DivToString

Yield a String value which is the result of hashing and modulo division
with the specified divisor to long and then converting the value to String.

- long -> Murmur3DivToString(long: divisor) -> String

## NumberNameToString

- long -> NumberNameToString() -> String

## Prefix

Add the specified prefix String to the input value and return the result.

- String -> Prefix(String: prefix) -> String
  - *ex:* `Prefix('PREFIX:')` - *Prepend 'PREFIX:' to every input value*

## SaveDouble

Save a value to a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
Note that the input type is not that suitable for constructing names,
so this is more likely to be used in an indirect naming pattern like
`SaveDouble(Load('id'))`

- double -> SaveDouble(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*
- double -> SaveDouble(java.util.function.Function<Object,Object>: nameFunc) -> double
  - *ex:* `Save(NumberNameToString())` - *save a double value to a named variable in the current thread, where the variable name is provided by a function.*
- long -> SaveDouble(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*
- long -> SaveDouble(java.util.function.LongFunction<Object>: nameFunc) -> double
  - *ex:* `Save(NumberNameToString())` - *save a double value to a named variable in the current thread, where the variable name is provided by a function.*

## SaveFloat

Save a value to a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
Note that the input type is not that suitable for constructing names,
so this is more likely to be used in an indirect naming pattern like
`SaveDouble(Load('id'))`

- Float -> SaveFloat(String: name) -> Float
  - *ex:* `SaveFloat('foo')` - *save the current float value to a named variable in this thread.*
- Float -> SaveFloat(java.util.function.Function<Object,Object>: nameFunc) -> Float
  - *ex:* `SaveFloat(NumberNameToString())` - *save the current float value to a named variable in this thread, where the variable name is provided by a function.*
- long -> SaveFloat(String: name) -> Float
  - *ex:* `SaveFloat('foo')` - *save the current float value to a named variable in this thread.*
- long -> SaveFloat(java.util.function.LongFunction<Object>: nameFunc) -> Float
  - *ex:* `SaveFloat(NumberNameToString())` - *save the current float value to a named variable in this thread, where the variable name is provided by a function.*

## SaveInteger

Save a value to a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
Note that the input type is not that suitable for constructing names,
so this is more likely to be used in an indirect naming pattern like
`SaveDouble(Load('id'))`

- int -> SaveInteger(String: name) -> int
  - *ex:* `SaveInteger('foo')` - *save the current integer value to a named variable in this thread.*
- int -> SaveInteger(java.util.function.Function<Object,Object>: nameFunc) -> int
  - *ex:* `SaveInteger(NumberNameToString())` - *save the current integer value to a named variable in this thread, where the variable name is provided by a function.*
- long -> SaveInteger(String: name) -> int
  - *ex:* `SaveInteger('foo')` - *save the current integer value to a named variable in this thread.*
- long -> SaveInteger(java.util.function.LongFunction<Object>: nameFunc) -> int
  - *ex:* `SaveInteger(NumberNameToString())` - *save the current integer value to a named variable in this thread, where the variable name is provided by a function.*

## SaveLong

Save a value to a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
Note that the input type is not that suitable for constructing names,
so this is more likely to be used in an indirect naming pattern like
`SaveDouble(Load('id'))`

- long -> SaveLong(String: name) -> long
  - *ex:* `SaveLong('foo')` - *save the current long value to a named variable in this thread.*
- long -> SaveLong(java.util.function.Function<Object,Object>: nameFunc) -> long
  - *ex:* `SaveLong(NumberNameToString())` - *save the current long value to a named variable in this thread, where the variable name is provided by a function.*
- long -> SaveLong(String: name) -> long
  - *ex:* `SaveLong('foo')` - *save the current long value to a named variable in this thread.*
- long -> SaveLong(java.util.function.Function<Object,Object>: nameFunc) -> long
  - *ex:* `SaveLong(NumberNameToString())` - *save the current long value to a named variable in this thread, where the variable name is provided by a function.*

## SaveString

Save a value to a named thread-local variable, where the variable
name is fixed or a generated variable name from a provided function.
Note that the input type is not that suitable for constructing names,
so this is more likely to be used in an indirect naming pattern like
`SaveDouble(Load('id'))`

- String -> SaveString(String: name) -> String
  - *ex:* `SaveString('foo')` - *save the current String value to a named variable in this thread.*
- String -> SaveString(java.util.function.Function<Object,Object>: nameFunc) -> String
  - *ex:* `SaveString(NumberNameToString())` - *save the current String value to a named variable in this thread, where the variable name is provided by a function.*
- long -> SaveString(String: name) -> String
  - *ex:* `SaveString('foo')` - *save the current String value to a named variable in this thread.*
- long -> SaveString(java.util.function.LongFunction<Object>: nameFunc) -> String
  - *ex:* `SaveString(NumberNameToString())` - *save the current String value to a named variable in this thread, where the variable name is provided by a function.*

## Scale

Scale the input to the

- long -> Scale(double: scaleFactor) -> int
- int -> Scale(double: scaleFactor) -> int

## Shuffle

This function provides a low-overhead shuffling effect without loading
elements into memory. It uses a bundled dataset of pre-computed
Galois LFSR shift register configurations, along with a down-sampling
method to provide amortized virtual shuffling with minimal memory usage.

Essentially, this guarantees that every value in the specified range will
be seen at least once before the cycle repeats. However, since the order
of traversal of these values is dependent on the LFSR configuration, some
orders will appear much more random than others depending on where you
are in the traversal cycle.

This function *does* yield values that are deterministic.

- long -> Shuffle(long: min, long: maxPlusOne) -> long
  - *ex:* `Shuffle(11,99)` - *Provide all values between 11 and 98 inclusive, in some order, then repeat*
- long -> Shuffle(long: min, long: maxPlusOne, int: bankSelector) -> long
  - *ex:* `Shuffle(11,99,3)` - *Provide all values between 11 and 98 inclusive, in some different (and repeatable) order, then repeat*

## SignedHash

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output.

Unlike the other hash functions, this one may return positive
as well as negative values.

- long -> SignedHash() -> int
- long -> SignedHash() -> long
- int -> SignedHash() -> int

## StaticStringMapper

Return a static String value.

- long -> StaticStringMapper(String: string) -> String

## Suffix

Add the specified prefix String to the input value and return the result.

- String -> Suffix(String: suffix) -> String
  - *ex:* `Suffix('--Fin')` - *Append '--Fin' to every input value*

## Template

Creates a template function which will yield a string which fits the template
provided, with all occurrences of `{}` substituted pair-wise with the
result of the provided functions. The number of `{}` entries in the template
must strictly match the number of functions or an error will be thrown.

To provide differing values for similarly defined functions in the list, the input
value used is automatically incremented by one for each function, starting with
the initial input value.

- long -> Template(String: template, java.util.function.LongFunction<?>... funcs) -> String
  - *ex:* `Template('{}-{}',Add(10),Hash())` - *concatenate input+10, '-', and a pseudo-random long*
- long -> Template(java.util.function.LongUnaryOperator: iterOp, String: template, java.util.function.LongFunction<?>... funcs) -> String
  - *notes:* If an operator is provided, it is used to change the function input value in an additional way before each function.

## ThreadNum

Matches a digit sequence in the current thread name and caches it in a thread local.
This allows you to use any intentionally indexed thread factories to provide an analogue for
concurrency. Note that once the thread number is cached, it will not be refreshed. This means
you can't change the thread name and get an updated value.

- long -> ThreadNum() -> int
- long -> ThreadNum() -> long

## ThreadNumToInteger

Matches a digit sequence in the current thread name and caches it in a thread local.
This allows you to use any intentionally indexed thread factories to provide an analogue for
concurrency. Note that once the thread number is cached, it will not be refreshed. This means
you can't change the thread name and get an updated value.

- long -> ThreadNumToInteger() -> Integer

## ThreadNumToLong

Matches a digit sequence in the current thread name and caches it in a thread local.
This allows you to use any intentionally indexed thread factories to provide an analogue for
concurrency. Note that once the thread number is cached, it will not be refreshed. This means
you can't change the thread name and get an updated value.

- long -> ThreadNumToLong() -> long

## ToHashedUUID

This function provides a stable hashing of the input value to
a version 4 (Random) UUID.

- long -> ToHashedUUID() -> java.util.UUID

## ToUUID

This function creates a non-random UUID in the type 4 version (Random).
It always puts the same value in the MSB position of the UUID format.
The input value is put in the LSB position.
`
xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx
mmmmmmmm-mmmm-Mmmm-Llll-llllllllllll
              4    3
`
As shown above, the LSB position does not have the complication of having
a version identifier (position M) dividing the dynamic range of the data type.
For this reason, only the LSB side is used for this mapper, which allows
an effective range of Long.MAX_VALUE/8, given the loss of 3 digits of precision.

This function is suitable for deterministic testing of scenarios which depend
on type 4 UUIDs, but without the mandated randomness that makes testing difficult.
Just be aware that the MSB will always contain value 0x0123456789ABCDEFL unless you
specify a different long value to pre-fill it with.

- long -> ToUUID() -> java.util.UUID
- long -> ToUUID(long: msbs) -> java.util.UUID

## Trim

Trim the input value and return the result.

- String -> Trim() -> String

## WeightedStrings

- long -> WeightedStrings(String: valuesAndWeights) -> String
- long -> WeightedStrings(String: valueColumn, String: weightColumn, String... filenames) -> String
  - *notes:* Create a sampler of strings from the given CSV file. The CSV file must have plain CSV headers
as its first line.


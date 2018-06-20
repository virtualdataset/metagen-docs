---
date: 2018-06-18
title: All Functions
weight: 74
menu:
  main:
    parent: Function Reference
    identifier: reference
    weight: 51
---

### Reference Format

Each heading in this page is the name of a function. The description of
the function in general is provided, if any after it.

The details that follow show all of the forms of the function which are available,
according to different input, out, and argument signatures. For each form,
examples and notes are provided if available under *ex:* and *notes:*.

Here is a fake documentation entry that visually explains the layout:

### AnyFunc (not a real one)

The explanation of what AnyFunc does goes here. It will explain the general purpose of AnyFunc,
regardless of the type-specific details that may go below.

- int -> AnyFunc(int: size) -> int *(This is the full type signature of one of the availabler versions of AnyFunc)*
  - *ex:* `AnyFunc(42)` - *An example to the left, and an explanation for what makes it useful.*
  - *notes:* This particular explanation is just to show where additional notes on the AnyFunc(int) variant would go.
- long -> AnyFunc(long: size) -> long *(There is another form available which specializes for the long type.)*
  - *ex:* `AnyFunc(42L)` - *This form wants the argument to be a long*

## Add

Adds a value to the input.

- long -> Add(long: addend) -> long
- int -> Add(int: addend) -> int
  - *ex:* `Add(23)` - *adds integer 23 to the input integer value*
- long -> Add(long: addend) -> int
- double -> Add(double: addend) -> double

## AddCycleRange

Adds a cycle range to the input, producing an increasing sawtooth-like output.

- long -> AddCycleRange(long: maxValue) -> int
- long -> AddCycleRange(long: minValue, long: maxValue) -> int
- int -> AddCycleRange(int: maxValue) -> int
- int -> AddCycleRange(int: minValue, int: maxValue) -> int
- long -> AddCycleRange(long: maxValue) -> long
- long -> AddCycleRange(long: minValue, long: maxValue) -> long

## AddHashRange

Adds a pseudo-random value within the specified range to the input.

- long -> AddHashRange(long: maxValue) -> int
- long -> AddHashRange(long: minValue, long: maxValue) -> int
- long -> AddHashRange(long: maxValue) -> long
- long -> AddHashRange(long: minValue, long: maxValue) -> long
- int -> AddHashRange(int: maxValue) -> int
- int -> AddHashRange(int: minValue, int: maxValue) -> int

## AliasElementSampler

Uses the alias sampling method to encode and sample from discrete probabilities,
even over larger sets of data. This form requires a unit interval sample value
between 0.0 and 1.0. Assuming the maximal amount of memory is used for distinct
outcomes N, a memory buffer of N*16 bytes is required for this implementation,
requiring 32MB of memory for 1M entries. Not bad, eh?

This sampler should be shared between threads, and will be by default, in order
to avoid many instances of a 32MB buffer on heap.

- double -> AliasElementSampler(double[]: biases, T[]: elements) -> T
  - *notes:* Setup an alias table for T type objects.
- double -> AliasElementSampler(java.util.Collection<T>: elements, java.util.function.Function<T,Double>: weightFunction) -> T
- double -> AliasElementSampler(java.util.List<io.virtdata.stathelpers.ElemProbD<T>>: events) -> T

## AliasSamplerDoubleInt

Uses the alias sampling method to encode and sample from discrete probabilities,
even over larger sets of data. This form requires a unit interval sample value
between 0.0 and 1.0. Assuming the maximal amount of memory is used for distinct
outcomes N, a memory buffer of N*16 bytes is required for this implementation,
requiring 32MB of memory for 1M entries. Not bad, eh?

This sampler should be shared between threads, and will be by default, in order
to avoid many instances of a 32MB buffer on heap.

- double -> AliasSamplerDoubleInt(java.nio.ByteBuffer: stats) -> int
- double -> AliasSamplerDoubleInt(java.util.List<io.virtdata.stathelpers.EvProbD>: events) -> int

## AlphaNumericString

- long -> AlphaNumericString(int: length) -> String

## Clear

Clears the per-thread map which is used by the Expr function.

- long -> Clear() -> long
  - *notes:* Clear all named entries from the per-thread map.
- long -> Clear(String[]...: names) -> long
  - *notes:* Clear the specified names from the per-thread map.

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
which can be represented in a long value. (This is a very high
number).

- long -> Combinations(String: spec) -> String
  - *ex:* `Combinations('A-Z;A-Z')` - *a two digit alphanumeric code. Wraps at 26^2*
  - *ex:* `Combinations('0-9A-F')` - *a single hexadecimal digit*
  - *ex:* `Combinations('0123456789ABCDEF')` - *a single hexadecimal digit*
  - *ex:* `Combinations('0-9A-F;0-9A-F;0-9A-F;0-9A-F;')` - *two bytes of hexadecimal*
  - *ex:* `Combinations('A-9')` - *upper case alphanumeric*

## CycleRange

Yields a value within a specified range, which rolls over continuously.

- long -> CycleRange(long: maxValue) -> long
- long -> CycleRange(long: minValue, long: maxValue) -> long
- long -> CycleRange(long: maxValue) -> int
- long -> CycleRange(long: minValue, long: maxValue) -> int
- int -> CycleRange(int: maxValue) -> int
  - *notes:* Sets the maximum value of the cycle range. The minimum is default to 0.
  - *ex:* `CycleRange(34)` - *add a rotating value between 0 and 34 to the input*
- int -> CycleRange(int: minValue, int: maxValue) -> int
  - *notes:* Sets the minimum and maximum value of the cycle range.

## DateTimeFormats

The valid formats, in joda specifier form are documented in DateTimeFormats
<ol>
<li>yyyy-MM-dd HH:mm:ss.SSSZ, for example: 2015-02-28 23:30:15.223</li>
<li>yyyy-MM-dd HH:mm:ss, for example 2015-02-28 23:30:15</li>
<li>yyyyMMdd'T'HHmmss.SSSZ, for example: 20150228T233015.223</li>
<li>yyyyMMdd'T'HHmmssZ, for example: 20150228T233015</li>
<li>yyyy-MM-dd, for example: 2015-02-28</li>
<li>yyyyMMdd, for example: 20150228</li>
<li>yyyyMM, for example: 201502</li>
<li>yyyy, for example: 2015</li>
</ol>

- null -> DateTimeFormats() -> null

## DirectoryLines

- long -> DirectoryLines(String: basepath, String: namePattern) -> String

## Div

- long -> Div(int: divisor) -> int
- int -> Div(int: divisor) -> int
- long -> Div(int: divisor) -> long
- double -> Div(double: divisor) -> double

## DivideToLongToString

Integer devide the cycle, the other side of modulo.

- long -> DivideToLongToString(long: divisor) -> String

## DoubleToFloat

- double -> DoubleToFloat() -> Float

## Expr

Allow for the use of arbitrary expressions according to the
[MVEL](http://mvel.documentnode.com/) expression language.

Variables that have been set by a Save function are available
to be used in this function.

The variable name **cycle** is reserved, and is always equal to
the current input value.

- int -> Expr(String: expr) -> int
- long -> Expr(String: expr) -> int
- double -> Expr(String: expr) -> double
- long -> Expr(String: expr) -> long

## FemaleFirstNames

- null -> FemaleFirstNames() -> null

## FieldExtractor

Extracts out a set of fields from a delimited string, returning
a string with the same delimiter containing only the specified fields.

- String -> FieldExtractor(String: fields) -> String

## FirstNames

Returns a first name from all names that were seen more than 100 times in the last census,
according to the frequency that it was actually seen.
This function does *not* pre-hash its input. You need to provide a form of hashing using
any of the documented Hash functions first.

- null -> FirstNames() -> null
  - *ex:* `FirstNames()`

## FixedValue

Yield a fixed value.

- long -> FixedValue(int: value) -> int
  - *ex:* `FixedValue(42)` - *always return 42*
- long -> FixedValue(long: fixedValue) -> long

## FixedValues

- long -> FixedValues(long[]...: values) -> long
- long -> FixedValues(int[]...: values) -> int

## Format

- Object -> Format(String: format) -> String

## FullHash

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output.

This version returns the value regardless of this sign bit.
It does not return the absolute value, as Hash does.

- long -> FullHash() -> long

## FullNames

- null -> FullNames() -> null

## FuncTemplate

- long -> FuncTemplate(String: rawTemplate) -> String

## Hash

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output. It does, however, return the absolute value.
This is to make it play nice with users and other libraries.

- long -> Hash() -> long
- int -> Hash() -> int
- long -> Hash() -> int

## HashRange

- long -> HashRange(long: width) -> long
- long -> HashRange(long: minValue, long: maxValue) -> long
- int -> HashRange(int: width) -> int
- int -> HashRange(int: minValue, int: maxValue) -> int
- long -> HashRange(long: width) -> int
- long -> HashRange(long: minValue, long: maxValue) -> int

## HashRangeScaled

Uses the input value as well to establish the upper bound of the
value produced from the hash.

- long -> HashRangeScaled() -> int
- long -> HashRangeScaled() -> long
- int -> HashRangeScaled() -> int

## HashedDoubleRange

This simulates a uniform sample from a range of double values
via long hashing. This function attempts to take a double
unit interval value from a long/long division over the whole
range of long values but via double value types, thus providing
a very linear sample. This means that the range of double
values to be accessed will not fall along all possible doubles,
but will still provide suitable values for ranges close to
high-precision points in the IEEE floating point number line.
This suffices for most reasonable ranges in practice outside
of scientific computing, where large exponents put adjacent
IEEE floating point values much further apart.

This should be consider the default double range sampling
function for most uses, when the exponent is not needed for
readability.

- long -> HashedDoubleRange(double: min, double: max) -> double

## HashedFileExtractToString

- long -> HashedFileExtractToString(String: fileName, int: minsize, int: maxsize) -> String

## HashedLineToInt

- long -> HashedLineToInt(String: filename) -> int

## HashedLineToString

- long -> HashedLineToString(String: filename) -> String

## HashedLineToStringList

- long -> HashedLineToStringList(String: filename, int: minSize, int: maxSize) -> java.util.List

## HashedLineToStringSet

- long -> HashedLineToStringSet(String: filename, int: minSize, int: maxSize) -> java.util.Set<String>

## HashedLineToStringStringMap

- long -> HashedLineToStringStringMap(String: paramFile, int: maxSize) -> java.util.Map<String,String>

## HashedLinesToKeyValueString

- long -> HashedLinesToKeyValueString(String: paramFile, int: maxsize) -> String

## HashedLoremExtractToString

- long -> HashedLoremExtractToString(int: minsize, int: maxsize) -> String

## HashedRangedToNonuniformDouble

This provides a random sample of a double in a range, without
accounting for the non-uniform distribution of IEEE double representation.
This means that values closer to high-precision areas of the IEEE spec
will be weighted higher in the output. However, NaN and positive and
negative infinity are filtered out via oversampling. Results are still
stable for a given input value.

- null -> HashedRangedToNonuniformDouble(long: min, long: max) -> null
- null -> HashedRangedToNonuniformDouble(long: min, long: max, long: seed) -> null

## HashedToByteBuffer

Hash a long input value into a byte buffer, at least length bytes long, but aligned on 8-byte
boundary;

- long -> HashedToByteBuffer(int: lengthInBytes) -> java.nio.ByteBuffer

## Identity

- long -> Identity() -> long

## Interpolate

- long -> Interpolate(double[]...: value) -> long
  - *ex:* `Interpolate(0.0d,100.0d)` - *return a linear value between 0L and 100L based on input in range 0L, Long.MAX_VALUE*
  - *ex:* `Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d)` - *return a weighted value between 0L and 100L based on input in range 0L, Long.MAX_VALUE, where the first second and third quartiles map to 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(long[]...: value) -> long
- long -> Interpolate(int: resolution, double[]: lut) -> long
- long -> Interpolate(double[]...: value) -> double
  - *ex:* `Interpolate(0.0d,100.0d) // return a linear value, 0L -> 0.0D, Long.MAX_VALUE -> 100.0D`
  - *ex:* `Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d)` - *return a weighted value between 0.0D and 100.0D based on input in range 0L, Long.MAX_VALUE, where the first second and third quartiles map to 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(int: resolution, double[]: lut) -> double

## JoinTemplate

- null -> JoinTemplate(String: delimiter, java.util.function.LongFunction<?>[]...: funcs) -> null
  - *notes:* Creates a string template function which will concatenate the result of the
provided functions together with the provided delimiter.
- null -> JoinTemplate(String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>[]...: funcs) -> null
  - *notes:* Creates a string template function which will concatenate the result
of the provided function together with the delimiter, but with the
prifix prepended and the suffix appended to the final result.
- null -> JoinTemplate(java.util.function.LongUnaryOperator: iterop, String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>[]...: funcs) -> null

## LastNames

- null -> LastNames() -> null

## ListTemplate

- long -> ListTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<String>: valueFunc) -> java.util.List<String>

## Load

Load a named value from the per-thread state map.
The previous input value will be forgotten, and the named value will replace it
before the next function in the chain.

- long -> Load(String: name) -> long
- int -> Load(String: name) -> int
- Object -> Load(String: name) -> Object
- double -> Load(String: name) -> double
- String -> Load(String: name) -> String

## LongToByte

- long -> LongToByte() -> Byte

## LongToShort

- long -> LongToShort() -> Short

## LongToString

- long -> LongToString() -> String

## MaleFirstNames

- null -> MaleFirstNames() -> null

## MapTemplate

- long -> MapTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<String>: keyFunc, java.util.function.LongFunction<String>: valueFunc) -> java.util.Map<String,String>

## Max

- long -> Max(long: max) -> long
  - *ex:* `Max(42L)` - *take the value of 42L or the input, which ever is greater*
  - *ex:* `Max(-42L)` - *take the value of -42L or the input, which ever is greater*
- int -> Max(int: max) -> int
- double -> Max(double: max) -> double

## Min

- long -> Min(long: min) -> long
- int -> Min(int: min) -> int
- double -> Min(double: min) -> double

## Mod

- int -> Mod(int: modulo) -> int
- long -> Mod(long: modulo) -> int
- long -> Mod(long: modulo) -> long

## ModuloLineToString

- long -> ModuloLineToString(String: filename) -> String

## ModuloToBigDecimal

- long -> ModuloToBigDecimal() -> java.math.BigDecimal
- long -> ModuloToBigDecimal(long: modulo) -> java.math.BigDecimal

## ModuloToBigInt

- long -> ModuloToBigInt() -> java.math.BigInteger
- long -> ModuloToBigInt(long: modulo) -> java.math.BigInteger

## ModuloToBoolean

- long -> ModuloToBoolean() -> Boolean

## ModuloToByte

- long -> ModuloToByte(long: modulo) -> Byte

## ModuloToInteger

- long -> ModuloToInteger(int: modulo) -> Integer

## ModuloToLong

- long -> ModuloToLong(long: modulo) -> long

## ModuloToShort

- long -> ModuloToShort(long: modulo) -> Short

## Mul

- long -> Mul(long: multiplicand) -> int
- double -> Mul(double: factor) -> double
- long -> Mul(long: multiplicand) -> long
- int -> Mul(int: addend) -> int

## Murmur3DivToLong

- long -> Murmur3DivToLong(long: divisor) -> long

## Murmur3DivToString

- long -> Murmur3DivToString(long: divisor) -> String

## NumberNameToString

- long -> NumberNameToString() -> String

## Prefix

Created by sebastianestevez on 8/28/17.

- String -> Prefix(String: prefix) -> String

## Save

- String -> Save(String: name) -> String
- Object -> Save(String: name) -> Object
- long -> Save(String: name) -> long
- int -> Save(String: name) -> int
- double -> Save(String: name) -> double

## Scale

Scale the input to the

- long -> Scale(double: scaleFactor) -> long
- long -> Scale(double: scaleFactor) -> int
- int -> Scale(double: scaleFactor) -> int

## Show

- Object -> Show() -> String
- Object -> Show(String[]...: names) -> String

## Shuffle

This function provides a low-overhead shuffling effect without loading
elements into memory. It uses a bundled dataset of pre-computed
Galois LFSR shift register configurations, along with a down-sampling
method to provide amortized virtual shuffling with minimal memory usage.

- long -> Shuffle(long: min, long: maxPlusOne) -> long
  - *ex:* `Shuffle(11,99)` - *Provide all values between 11 and 98 inclusive, in some order, then repeat*
- long -> Shuffle(long: min, long: maxPlusOne, int: moduloSelector) -> long

## SignedHash

- int -> SignedHash() -> int
- long -> SignedHash() -> long
- long -> SignedHash() -> int

## StartingEpochMillis

This function sets the minimum long value to the equivalent
unix epoch time in milliseconds. It simply adds the input
value to this base value as determined by the provided
time specifier. It wraps any overflow within this range as well.

- long -> StartingEpochMillis(String: baseTimeSpec) -> long
  - *ex:* `{StartingEpochMillis('2017-01-01 23:59:59')}` - *add the millisecond epoch time of 2017-01-01 23:59:59 to all input values*

## StaticStringMapper

- long -> StaticStringMapper(String: string) -> String

## StringDateWrapper

- long -> StringDateWrapper(String: format) -> String

## Suffix

- String -> Suffix(String: suffix) -> String

## Template

Creates a template function which will yield a string which fits the template
provided, with all occurrences of `{}` substituted pair-wise with the
result of the provided functions. The number of `{}` entries in the template
must strictly match the number of functions or an error will be thrown.

To provide differing values for similarly defined functions in the list, the input
value used is automatically incremented by one for each function, starting with
the initial input value.

- long -> Template(String: template, java.util.function.LongFunction<?>[]...: funcs) -> String
  - *ex:* `Template('{}-{}',Add(10),Hash())` - *concatenate input+10, '-', and a pseudo-random long*
- long -> Template(java.util.function.LongUnaryOperator: iterOp, String: template, java.util.function.LongFunction<?>[]...: funcs) -> String
  - *notes:* If an operator is provided, it is use to change the function input value in an additional way before each function.

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

## ToBigInt

- long -> ToBigInt() -> java.math.BigInteger

## ToBoolean

- Double -> ToBoolean() -> Boolean
- Float -> ToBoolean() -> Boolean
- Integer -> ToBoolean() -> Boolean
- long -> ToBoolean() -> Boolean

## ToByte

- double -> ToByte() -> Byte
- double -> ToByte(int: modulo) -> Byte
- Float -> ToByte() -> Byte
- Float -> ToByte(int: modulo) -> Byte
- long -> ToByte() -> Byte
- long -> ToByte(int: modulo) -> Byte
- String -> ToByte() -> Byte
- Short -> ToByte(int: scale) -> Byte
- Short -> ToByte() -> Byte
- int -> ToByte() -> Byte
- int -> ToByte(int: modulo) -> Byte

## ToByteBuffer

- Float -> ToByteBuffer() -> java.nio.ByteBuffer
- Short -> ToByteBuffer() -> java.nio.ByteBuffer
- long -> ToByteBuffer() -> java.nio.ByteBuffer
- int -> ToByteBuffer() -> java.nio.ByteBuffer
- String -> ToByteBuffer() -> java.nio.ByteBuffer
- double -> ToByteBuffer() -> java.nio.ByteBuffer

## ToDate

- long -> ToDate(int: spacing, int: repeat_count) -> java.util.Date
- long -> ToDate(int: spacing) -> java.util.Date
- long -> ToDate() -> java.util.Date

## ToDateTime

- long -> ToDateTime(int: spacing, int: repeat_count) -> org.joda.time.DateTime
- long -> ToDateTime(String: spacing) -> org.joda.time.DateTime
- long -> ToDateTime() -> org.joda.time.DateTime

## ToDouble

- long -> ToDouble() -> double

## ToEpochTimeUUID

Converts a long UTC timestamp in epoch millis form into a Version 1 TimeUUID
according to <a href="https://www.ietf.org/rfc/rfc4122.txt">RFC 4122</a>.
This means that only one unique value for a timeuuid can be generated for
each epoch milli value, even though version 1 TimeUUIDs can normally represent
up to 10000 distinct values per millisecond. If you need to access this
level of resolution for testing purposes, use ToFinestTimeUUID
instead. This method is to support simple mapping to natural timestamps
as we often find in the real world.

For the variants that have an String argument in the constructor, this is
a parsable datetime that is used as the base time for all produced values.
Setting this allows you to set the start of the time range for all timeuuid
values produced. All times are parsed for UTC. All time use ISO date ordering,
meaning that the most significant fields always go before the others.

The valid formats, in joda specifier form are:
<ol>
<li>yyyy-MM-dd HH:mm:ss.SSSZ, for example: 2015-02-28 23:30:15.223</li>
<li>yyyy-MM-dd HH:mm:ss, for example 2015-02-28 23:30:15</li>
<li>yyyyMMdd'T'HHmmss.SSSZ, for example: 20150228T233015.223</li>
<li>yyyyMMdd'T'HHmmssZ, for example: 20150228T233015</li>
<li>yyyy-MM-dd, for example: 2015-02-28</li>
<li>yyyyMMdd, for example: 20150228</li>
<li>yyyyMM, for example: 201502</li>
<li>yyyy, for example: 2015</li>
</ol>

- long -> ToEpochTimeUUID() -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a per-host node and empty clock data.
The node and clock components are seeded from network interface data. In this case,
the clock data is not seeded uniquely.
  - *ex:* `ToEpochTimeUUID()` - *basetime 0, computed node data, empty clock data*
- long -> ToEpochTimeUUID(long: node) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and empty clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToEpochTimeUUID(5234)` - *basetime 0, specified node data (5234), empty clock data*
- long -> ToEpochTimeUUID(long: node, long: clock) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and specific clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToEpochTimeUUID(31,337)` - *basetime 0, specified node data (31) and clock data (337)*
- long -> ToEpochTimeUUID(String: baseSpec) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a per-host node and empty clock data.
The node and clock components are seeded from network interface data. In this case,
the clock data is not seeded uniquely.

  - *ex:* `ToEpochTimeUUID('2017-01-01T23:59:59')` - *specified basetime, computed node data, empty clock data*
- long -> ToEpochTimeUUID(String: baseSpec, long: node) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and empty clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToEpochTimeUUID('2012',12345)` - *basetime at start if 2012, with node data 12345, empty clock data*
- long -> ToEpochTimeUUID(String: baseSpec, long: node, long: clock) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and specific clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToEpochTimeUUID('20171231T1015.243',123,456)` - *ms basetime, specified node and clock data*

## ToFinestTimeUUID

Converts a count of 100ns intervals from 1582 Julian to a Type1 TimeUUID
according to <a href="https://www.ietf.org/rfc/rfc4122.txt">RFC 4122</a>.
This allows you to access the finest unit of resolution for the
purposes of simulating a large set of unique timeuuid values. This offers
10000 times more unique values per ms than ToEpochTimeUUID.

For the variants that have an String argument in the constructor, this is
a parsable datetime that is used as the base time for all produced values.
Setting this allows you to set the start of the time range for all timeuuid
values produced. All times are parsed for UTC. All time use ISO date ordering,
meaning that the most significant fields always go before the others.

The valid formats, in joda specifier form are:

<ol>
<li>yyyy-MM-dd HH:mm:ss.SSSZ, for example: 2015-02-28 23:30:15.223</li>
<li>yyyy-MM-dd HH:mm:ss, for example 2015-02-28 23:30:15</li>
<li>yyyyMMdd'T'HHmmss.SSSZ, for example: 20150228T233015.223</li>
<li>yyyyMMdd'T'HHmmssZ, for example: 20150228T233015</li>
<li>yyyy-MM-dd, for example: 2015-02-28</li>
<li>yyyyMMdd, for example: 20150228</li>
<li>yyyyMM, for example: 201502</li>
<li>yyyy, for example: 2015</li>
</ol>

- long -> ToFinestTimeUUID() -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a per-host node and empty clock data.
The node and clock components are seeded from network interface data. In this case,
the clock data is not seeded uniquely.
  - *ex:* `ToFinestTimeUUID()` - *basetime 0, computed node data, empty clock data*
- long -> ToFinestTimeUUID(long: node) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and empty clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToFinestTimeUUID(5234)` - *basetime 0, specified node data (5234), empty clock data*
- long -> ToFinestTimeUUID(long: node, long: clock) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and specific clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToFinestTimeUUID(31,337)` - *basetime 0, specified node data (31) and clock data (337)*
- long -> ToFinestTimeUUID(String: baseTimeSpec) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a per-host node and empty clock data.
The node and clock components are seeded from network interface data. In this case,
the clock data is not seeded uniquely.

  - *ex:* `ToFinestTimeUUID('2017-01-01T23:59:59')` - *specified basetime, computed node data, empty clock data*
- long -> ToFinestTimeUUID(String: baseTimeSpec, long: node) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and empty clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToFinestTimeUUID('2012',12345)` - *basetime at start if 2012, with node data 12345, empty clock data*
- long -> ToFinestTimeUUID(String: baseTimeSpec, long: node, long: clock) -> java.util.UUID
  - *notes:* Create version 1 timeuuids with a specific static node and specific clock data.
This is useful for testing so that you can know that values are verifiable, even though
in non-testing practice, you would rely on some form of entropy per-system to provide
more practical dispersion of values over reboots, etc.

  - *ex:* `ToFinestTimeUUID('20171231T1015.243',123,456)` - *ms basetime, specified node and clock data*

## ToFloat

- double -> ToFloat(double: scale) -> Float
- double -> ToFloat() -> Float
- long -> ToFloat(long: scale) -> Float
- long -> ToFloat() -> Float
- String -> ToFloat() -> Float
- int -> ToFloat(int: scale) -> Float
- int -> ToFloat() -> Float
- Short -> ToFloat() -> Float

## ToHashedUUID

This function provides a stable hashing of the input value to
a version 4 (Random) UUID.

- long -> ToHashedUUID() -> java.util.UUID

## ToInetAddress

- long -> ToInetAddress() -> java.net.InetAddress

## ToInt

- String -> ToInt() -> Integer
- double -> ToInt(int: scale) -> int
- double -> ToInt() -> int
- long -> ToInt(int: scale) -> int
- long -> ToInt() -> int
- long -> ToInt() -> int
- Double -> ToInt(int: scale) -> Integer
- Double -> ToInt() -> Integer
- Object -> ToInt() -> Integer

## ToJodaDateTime

- long -> ToJodaDateTime(int: spacing, int: repeat_count) -> org.joda.time.DateTime
- long -> ToJodaDateTime(String: spacing) -> org.joda.time.DateTime
- long -> ToJodaDateTime() -> org.joda.time.DateTime

## ToLong

- Float -> ToLong(long: scale) -> Long
- Float -> ToLong() -> Long
- double -> ToLong(long: scale) -> long
- double -> ToLong() -> long

## ToLongFunction

Adapts any FunctionalInterface type to a LongFunction,
for use with higher-order functions, when they require a
LongFunction as an argument.

- long -> ToLongFunction(java.util.function.LongUnaryOperator: op) -> Object
- long -> ToLongFunction(java.util.function.Function<Long,Long>: op) -> Object
- long -> ToLongFunction(java.util.function.LongToIntFunction: op) -> Object
- long -> ToLongFunction(java.util.function.LongToDoubleFunction: op) -> Object
- long -> ToLongFunction(java.util.function.LongFunction<?>: func) -> Object

## ToLongUnaryOperator

- long -> ToLongUnaryOperator(java.util.function.LongFunction<Long>: f) -> long
- long -> ToLongUnaryOperator(java.util.function.Function<Long,Long>: f) -> long
- long -> ToLongUnaryOperator(java.util.function.LongUnaryOperator: f) -> long

## ToShort

- double -> ToShort() -> Short
- double -> ToShort(int: modulo) -> Short
- long -> ToShort() -> Short
- long -> ToShort(int: wrapat) -> Short
- String -> ToShort() -> Short
- Float -> ToShort() -> Short
- Float -> ToShort(int: modulo) -> Short
- int -> ToShort() -> Short
- int -> ToShort(int: scale) -> Short

## ToString

- Object -> ToString() -> String

## ToUUID

This function creates a non-random UUID in the type 4 version (Random).
It puts the same value in the MSB position of the UUID format.
The input value is put in the LSB position.
```
xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx
mmmmmmmm-mmmm-Mmmm-Llll-llllllllllll
              4    3
```
As shown above, the LSB position does not have the complication of having
a version identifier (position M) dividing the dynamic range of the data type.
For this reason, only the LSB side is used for this mapper, which allows
an effective range of Long.MAX_VALUE/8, given the loss of 3 digits of precision.

- long -> ToUUID() -> java.util.UUID
- long -> ToUUID(long: msbs) -> java.util.UUID

## WeightedStrings

- long -> WeightedStrings(String: valuesAndWeights) -> String
- long -> WeightedStrings(String: valueColumn, String: weightColumn, String[]...: filenames) -> String
  - *notes:* Create a sampler of strings from the given CSV file. The CSV file must have plain CSV headers
as its first line.



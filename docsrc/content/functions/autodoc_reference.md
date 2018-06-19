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
## Add

- long -> Add(long: addend) -> long
- int -> Add(int: addend) -> int
  - *example:* Add(23) *adds integer 23 to the input integer value*
- long -> Add(long: addend) -> int
- double -> Add(double: addend) -> double

Adds a value to the input.


## AddCycleRange

- long -> AddCycleRange(long: maxValue) -> int
- long -> AddCycleRange(long: minValue, long: maxValue) -> int
- int -> AddCycleRange(int: maxValue) -> int
- int -> AddCycleRange(int: minValue, int: maxValue) -> int
- long -> AddCycleRange(long: maxValue) -> long
- long -> AddCycleRange(long: minValue, long: maxValue) -> long


## AddHashRange

- long -> AddHashRange(long: maxValue) -> int
- long -> AddHashRange(long: minValue, long: maxValue) -> int
- long -> AddHashRange(long: maxValue) -> long
- long -> AddHashRange(long: minValue, long: maxValue) -> long
- int -> AddHashRange(int: maxValue) -> int
- int -> AddHashRange(int: minValue, int: maxValue) -> int


## AliasElementSampler

- double -> AliasElementSampler(double[]: biases, T[]: elements) -> T
- double -> AliasElementSampler(java.util.Collection<T>: elements, java.util.function.Function<T,Double>: weightFunction) -> T
- double -> AliasElementSampler(java.util.List<io.virtdata.stathelpers.ElemProbD<T>>: events) -> T

Uses the alias sampling method to encode and sample from discrete probabilities,
even over larger sets of data. This form requires a unit interval sample value
between 0.0 and 1.0. Assuming the maximal amount of memory is used for distinct
outcomes N, a memory buffer of N*16 bytes is required for this implementation,
requiring 32MB of memory for 1M entries. Not bad, eh?

This sampler should be shared between threads, and will be by default, in order
to avoid many instances of a 32MB buffer on heap.


## AliasSamplerDoubleInt

- double -> AliasSamplerDoubleInt(java.nio.ByteBuffer: stats) -> int
- double -> AliasSamplerDoubleInt(java.util.List<io.virtdata.stathelpers.EvProbD>: events) -> int

Uses the alias sampling method to encode and sample from discrete probabilities,
even over larger sets of data. This form requires a unit interval sample value
between 0.0 and 1.0. Assuming the maximal amount of memory is used for distinct
outcomes N, a memory buffer of N*16 bytes is required for this implementation,
requiring 32MB of memory for 1M entries. Not bad, eh?

This sampler should be shared between threads, and will be by default, in order
to avoid many instances of a 32MB buffer on heap.


## AlphaNumericString

- long -> AlphaNumericString(int: length) -> String


## Clear

- long -> Clear() -> long
- long -> Clear(String[]: names) -> long


## Combinations

- long -> Combinations(String: spec) -> String
  - *example:* Combinations('A-Z;A-Z') *a two digit alphanumeric code. Wraps at 26^2*
  - *example:* Combinations('0-9A-F') *a single hexadecimal digit*
  - *example:* Combinations('0123456789ABCDEF') *a single hexadecimal digit*
  - *example:* Combinations('0-9A-F;0-9A-F;0-9A-F;0-9A-F;') *two bytes of hexadecimal*
  - *example:* Combinations('A-9') *upper case alphanumeric*


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


## CycleRange

- long -> CycleRange(long: maxValue) -> long
- long -> CycleRange(long: minValue, long: maxValue) -> long
- long -> CycleRange(long: maxValue) -> int
- long -> CycleRange(long: minValue, long: maxValue) -> int
- int -> CycleRange(int: maxValue) -> int
- int -> CycleRange(int: minValue, int: maxValue) -> int


## DateTimeFormats

- null -> DateTimeFormats() -> null

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


## DirectoryLines

- long -> DirectoryLines(String: basepath, String: namePattern) -> String


## Div

- long -> Div(int: divisor) -> int
- int -> Div(int: divisor) -> int
- long -> Div(int: divisor) -> long
- double -> Div(double: divisor) -> double


## DivideToLongToString

- long -> DivideToLongToString(long: divisor) -> String

Integer devide the cycle, the other side of modulo.


## DoubleToFloat

- double -> DoubleToFloat() -> Float


## Expr

- int -> Expr(String: expr) -> int
- long -> Expr(String: expr) -> int
- double -> Expr(String: expr) -> double
- long -> Expr(String: expr) -> long


## FemaleFirstNames

- null -> FemaleFirstNames() -> null


## FieldExtractor

- String -> FieldExtractor(String: fields) -> String

Extracts out a set of fields from a delimited string, returning
a string with the same delimiter containing only the specified fields.


## FirstNames

- null -> FirstNames() -> null


## FixedValue

- long -> FixedValue(int: value) -> int
- long -> FixedValue(long: fixedValue) -> long


## FixedValues

- long -> FixedValues(long[]: values) -> long
- long -> FixedValues(int[]: values) -> int


## Format

- Object -> Format(String: format) -> String


## FullHash

- long -> FullHash() -> long

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output.

This version returns the value regardless of this sign bit.
It does not return the absolute value, as Hash does.


## FullNames

- null -> FullNames() -> null


## FuncTemplate

- long -> FuncTemplate(String: rawTemplate) -> String


## Hash

- long -> Hash() -> long
- int -> Hash() -> int
- long -> Hash() -> int

This uses the Murmur3F (64-bit optimized) version of Murmur3,
not as a checksum, but as a simple hash. It doesn't bother
pushing the high-64 bits of input, since it only uses the lower
64 bits of output. It does, however, return the absolute value.
This is to make it play nice with users and other libraries.


## HashRange

- long -> HashRange(long: width) -> long
- long -> HashRange(long: minValue, long: maxValue) -> long
- int -> HashRange(int: width) -> int
- int -> HashRange(int: minValue, int: maxValue) -> int
- long -> HashRange(long: width) -> int
- long -> HashRange(long: minValue, long: maxValue) -> int


## HashRangeScaled

- long -> HashRangeScaled() -> int
- long -> HashRangeScaled() -> long
- int -> HashRangeScaled() -> int

Uses the input value as well to establish the upper bound of the
value produced from the hash.


## HashedDoubleRange

- long -> HashedDoubleRange(double: min, double: max) -> double


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

- null -> HashedRangedToNonuniformDouble(long: min, long: max) -> null
- null -> HashedRangedToNonuniformDouble(long: min, long: max, long: seed) -> null

This provides a random sample of a double in a range, without
accounting for the non-uniform distribution of IEEE double representation.
This means that values closer to high-precision areas of the IEEE spec
will be weighted higher in the output. However, NaN and positive and
negative infinity are filtered out via oversampling. Results are still
stable for a given input value.


## HashedToByteBuffer

- long -> HashedToByteBuffer(int: lengthInBytes) -> java.nio.ByteBuffer

Hash a long input value into a byte buffer, at least length bytes long, but aligned on 8-byte
boundary;


## Identity

- long -> Identity() -> long


## Interpolate

- long -> Interpolate(double[]: value) -> long
  - *example:* Interpolate(0.0d,100.0d) *return a linear value between 0L and 100L based on input in range 0L, Long.MAX_VALUE*
  - *example:* Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d) *return a weighted value between 0L and 100L based on input in range 0L, Long.MAX_VALUE, where the first second and third quartiles map to 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(long[]: value) -> long
- long -> Interpolate(int: resolution, double[]: lut) -> long
- long -> Interpolate(double[]: value) -> double
  - *example:* Interpolate(0.0d,100.0d) // return a linear value, 0L -> 0.0D, Long.MAX_VALUE -> 100.0D
  - *example:* Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d) *return a weighted value between 0.0D and 100.0D based on input in range 0L, Long.MAX_VALUE, where the first second and third quartiles map to 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(int: resolution, double[]: lut) -> double


## JoinTemplate

- null -> JoinTemplate(String: delimiter, java.util.function.LongFunction<?>[]: funcs) -> null
- null -> JoinTemplate(String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>[]: funcs) -> null
- null -> JoinTemplate(java.util.function.LongUnaryOperator: iterop, String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>[]: funcs) -> null


## LastNames

- null -> LastNames() -> null


## ListTemplate

- long -> ListTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<String>: valueFunc) -> java.util.List<String>


## Load

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
  - *example:* Max(42L) *take the value of 42L or the input, which ever is greater*
  - *example:* Max(-42L) *take the value of -42L or the input, which ever is greater*
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

- String -> Prefix(String: prefix) -> String

Created by sebastianestevez on 8/28/17.


## Save

- String -> Save(String: name) -> String
- Object -> Save(String: name) -> Object
- long -> Save(String: name) -> long
- int -> Save(String: name) -> int
- double -> Save(String: name) -> double


## Scale

- long -> Scale(double: scaleFactor) -> long
- long -> Scale(double: scaleFactor) -> int
- int -> Scale(double: scaleFactor) -> int

Scale the input to the


## Show

- Object -> Show() -> String
- Object -> Show(String[]: names) -> String


## Shuffle

- long -> Shuffle(long: min, long: maxPlusOne) -> long
  - *example:* Shuffle(11,99) *Provide all values between 11 and 98 inclusive, in some order, then repeat*
- long -> Shuffle(long: min, long: maxPlusOne, int: moduloSelector) -> long

This function provides a low-overhead shuffling effect without loading
elements into memory. It uses a bundled dataset of pre-computed
Galois LFSR shift register configurations, along with a down-sampling
method to provide amortized virtual shuffling with minimal memory usage.


## SignedHash

- int -> SignedHash() -> int
- long -> SignedHash() -> long
- long -> SignedHash() -> int


## StartingEpochMillis

- long -> StartingEpochMillis(String: baseTimeSpec) -> long
  - *example:* {StartingEpochMillis('2017-01-01 23:59:59')} *add the millisecond epoch time of 2017-01-01 23:59:59 to all input values*

This function sets the minimum long value to the equivalent
unix epoch time in milliseconds. It simply adds the input
value to this base value as determined by the provided
time specifier. It wraps any overflow within this range as well.


## StaticStringMapper

- long -> StaticStringMapper(String: string) -> String


## StringDateWrapper

- long -> StringDateWrapper(String: format) -> String


## Suffix

- String -> Suffix(String: suffix) -> String


## Template

- long -> Template(String: template, java.util.function.LongFunction<?>[]: funcs) -> String
- long -> Template(java.util.function.LongUnaryOperator: iterOp, String: template, java.util.function.LongFunction<?>[]: funcs) -> String

Creates a template function which will yield a string which fits the template
provided, with all occurrences of `{}` substituted pair-wise with the
result of the provided function. The number of `{}` entries in the template
must strictly match the number of functions or an error will be thrown.
To provide differing values for similarly defined functions in the list, the input
value used is automatically incremented by one for each function, starting with
the initial input value.


## ThreadNumToInteger

- long -> ThreadNumToInteger() -> Integer

Matches a digit sequence in the current thread name and caches it in a thread local.
This allows you to use any intentionally indexed thread factories to provide an analogue for
concurrency. Note that once the thread number is cached, it will not be refreshed. This means
you can't change the thread name and get an updated value.


## ThreadNumToLong

- long -> ThreadNumToLong() -> long

Matches a digit sequence in the current thread name and caches it in a thread local.
This allows you to use any intentionally indexed thread factories to provide an analogue for
concurrency. Note that once the thread number is cached, it will not be refreshed. This means
you can't change the thread name and get an updated value.


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

- long -> ToEpochTimeUUID() -> java.util.UUID
  - *example:* ToEpochTimeUUID() *basetime 0, computed node data, empty clock data*
- long -> ToEpochTimeUUID(long: node) -> java.util.UUID
  - *example:* ToEpochTimeUUID(5234) *basetime 0, specified node data (5234), empty clock data*
- long -> ToEpochTimeUUID(long: node, long: clock) -> java.util.UUID
  - *example:* ToEpochTimeUUID(31,337) *basetime 0, specified node data (31) and clock data (337)*
- long -> ToEpochTimeUUID(String: baseSpec) -> java.util.UUID
  - *example:* ToEpochTimeUUID('2017-01-01T23:59:59') *specified basetime, computed node data, empty clock data*
- long -> ToEpochTimeUUID(String: baseSpec, long: node) -> java.util.UUID
  - *example:* ToEpochTimeUUID('2012',12345) *basetime at start if 2012, with node data 12345, empty clock data*
- long -> ToEpochTimeUUID(String: baseSpec, long: node, long: clock) -> java.util.UUID
  - *example:* ToEpochTimeUUID('20171231T1015.243',123,456) *ms basetime, specified node and clock data*

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


## ToFinestTimeUUID

- long -> ToFinestTimeUUID() -> java.util.UUID
  - *example:* ToFinestTimeUUID() *basetime 0, computed node data, empty clock data*
- long -> ToFinestTimeUUID(long: node) -> java.util.UUID
  - *example:* ToFinestTimeUUID(5234) *basetime 0, specified node data (5234), empty clock data*
- long -> ToFinestTimeUUID(long: node, long: clock) -> java.util.UUID
  - *example:* ToFinestTimeUUID(31,337) *basetime 0, specified node data (31) and clock data (337)*
- long -> ToFinestTimeUUID(String: baseTimeSpec) -> java.util.UUID
  - *example:* ToFinestTimeUUID('2017-01-01T23:59:59') *specified basetime, computed node data, empty clock data*
- long -> ToFinestTimeUUID(String: baseTimeSpec, long: node) -> java.util.UUID
  - *example:* ToFinestTimeUUID('2012',12345) *basetime at start if 2012, with node data 12345, empty clock data*
- long -> ToFinestTimeUUID(String: baseTimeSpec, long: node, long: clock) -> java.util.UUID
  - *example:* ToFinestTimeUUID('20171231T1015.243',123,456) *ms basetime, specified node and clock data*

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

- long -> ToHashedUUID() -> java.util.UUID

This function provides a stable hashing of the input value to
a version 4 (Random) UUID.


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

- long -> ToLongFunction(java.util.function.LongUnaryOperator: op) -> Object
- long -> ToLongFunction(java.util.function.Function<Long,Long>: op) -> Object
- long -> ToLongFunction(java.util.function.LongToIntFunction: op) -> Object
- long -> ToLongFunction(java.util.function.LongToDoubleFunction: op) -> Object
- long -> ToLongFunction(java.util.function.LongFunction<?>: func) -> Object

Adapts any FunctionalInterface type to a LongFunction,
for use with higher-order functions, when they require a
LongFunction as an argument.


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

- long -> ToUUID() -> java.util.UUID
- long -> ToUUID(long: msbs) -> java.util.UUID

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


## WeightedStrings

- long -> WeightedStrings(String: valuesAndWeights) -> String
- long -> WeightedStrings(String: valueColumn, String: weightColumn, String[]: filenames) -> String




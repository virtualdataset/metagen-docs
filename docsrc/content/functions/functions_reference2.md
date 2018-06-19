

## mapto_hypergeometric
## mapto_compute_hypergeometric
## compute_hypergeometric
## uniform_integer
## mapto_uniform_integer
## mapto_compute_uniform_integer
## compute_uniform_integer
## geometric
## mapto_geometric
## mapto_compute_geometric
## compute_geometric
## poisson
## mapto_poisson
## mapto_compute_poisson
## compute_poisson
## zipf
## mapto_zipf
## mapto_compute_zipf
## compute_zipf
## binomial
## mapto_binomial
## mapto_compute_binomial
## compute_binomial
## pascal
## mapto_pascal
## mapto_compute_pascal
## compute_pascal
## levy
## mapto_levy
## mapto_compute_levy
## compute_levy
## nakagami
## mapto_nakagami
## mapto_compute_nakagami
## compute_nakagami
## triangular
## mapto_triangular
## mapto_compute_triangular
## compute_triangular
## exponential
## mapto_exponential
## mapto_compute_exponential
## compute_exponential
## logistic
## mapto_logistic
## mapto_compute_logistic
## compute_logistic
## enumerated_real
## mapto_enumerated_real
## mapto_compute_enumerated_real
## compute_enumerated_real
## laplace
## mapto_laplace
## mapto_compute_laplace
## compute_laplace
## log_normal
## mapto_log_normal
## mapto_compute_log_normal
## compute_log_normal
## cauchy
## mapto_cauchy
## mapto_compute_cauchy
## compute_cauchy
## f
## mapto_f
## mapto_compute_f
## compute_f
## t
## mapto_t
## mapto_compute_t
## compute_t
## empirical
## mapto_empirical
## mapto_compute_empirical
## compute_empirical
## normal
## mapto_normal
## mapto_compute_normal
## compute_normal
## weibull
## mapto_weibull
## mapto_compute_weibull
## compute_weibull
## chi_squared
## mapto_chi_squared
## mapto_compute_chi_squared
## compute_chi_squared
## gumbel
## mapto_gumbel
## mapto_compute_gumbel
## compute_gumbel
## beta
## mapto_beta
## mapto_compute_beta
## compute_beta
## pareto
## mapto_pareto
## mapto_compute_pareto
## compute_pareto
## gamma
## mapto_gamma
## mapto_compute_gamma
## compute_gamma
## uniform_real
## mapto_uniform_real
## mapto_compute_uniform_real
## compute_uniform_real
## Add

available forms:

- long `->` Add(long: addend) `->` long
- int `->` Add(int: addend) `->` int
- long `->` Add(long: addend) `->` int
- double `->` Add(double: addend) `->` double

## AddCycleRange

available forms:

- long `->` AddCycleRange(long: maxValue) `->` int
- long `->` AddCycleRange(long: minValue, long: maxValue) `->` int
- int `->` AddCycleRange(int: maxValue) `->` int
- int `->` AddCycleRange(int: minValue, int: maxValue) `->` int
- long `->` AddCycleRange(long: maxValue) `->` long
- long `->` AddCycleRange(long: minValue, long: maxValue) `->` long

## AddHashRange

available forms:

- long `->` AddHashRange(long: maxValue) `->` int
- long `->` AddHashRange(long: minValue, long: maxValue) `->` int
- long `->` AddHashRange(long: maxValue) `->` long
- long `->` AddHashRange(long: minValue, long: maxValue) `->` long
- int `->` AddHashRange(int: maxValue) `->` int
- int `->` AddHashRange(int: minValue, int: maxValue) `->` int

## AliasElementSampler
javadoc:
Uses the alias sampling method to encode and sample from discrete probabilities,
 even over larger sets of data. This form requires a unit interval sample value
 between 0.0 and 1.0. Assuming the maximal amount of memory is used for distinct
 outcomes N, a memory buffer of N*16 bytes is required for this implementation,
 requiring 32MB of memory for 1M entries. Not bad, eh?

 This sampler should be shared between threads, and will be by default, in order
 to avoid many instances of a 32MB buffer on heap.--

available forms:

- double `->` AliasElementSampler(double[]: biases, T[]: elements) `->` T
- double `->` AliasElementSampler(java.util.Collection<T>: elements, java.util.function.Function<T,java.lang.Double>: weightFunction) `->` T
- double `->` AliasElementSampler(java.util.List<io.virtdata.stathelpers.ElemProbD<T>>: events) `->` T

## AliasSamplerDoubleInt
javadoc:
Uses the alias sampling method to encode and sample from discrete probabilities,
 even over larger sets of data. This form requires a unit interval sample value
 between 0.0 and 1.0. Assuming the maximal amount of memory is used for distinct
 outcomes N, a memory buffer of N*16 bytes is required for this implementation,
 requiring 32MB of memory for 1M entries. Not bad, eh?

 This sampler should be shared between threads, and will be by default, in order
 to avoid many instances of a 32MB buffer on heap.--

available forms:

- double `->` AliasSamplerDoubleInt(java.nio.ByteBuffer: stats) `->` int
- double `->` AliasSamplerDoubleInt(java.util.List<io.virtdata.stathelpers.EvProbD>: events) `->` int

## AlphaNumericString

available forms:

- long `->` AlphaNumericString(int: length) `->` java.lang.String

## Clear

available forms:

- long `->` Clear() `->` long
- long `->` Clear(java.lang.String[]: names) `->` long

## Combinations
javadoc:
<p>Convert a numeric value into a code according to ASCII printable
 characters. This is useful for creating various encodings using different
 character ranges, etc.</p>
 <p>
 This mapper can map over the sequences of character ranges providing every unique
 combination and then wrapping around to the beginning again.
 It can convert between character bases with independent radix in each position.
 Each position in the final string takes its values from a position-specific
 character set, described by the shorthand in the examples below.
 </p>
 <p>
 The constructor will throw an error if the number of combinations exceeds that
 which can be represented in a long value. (This is a very high
 number).--

- long `->` Combinations(java.lang.String: spec) `->` java.lang.String

## CycleRange

available forms:

- long `->` CycleRange(long: maxValue) `->` long
- long `->` CycleRange(long: minValue, long: maxValue) `->` long
- long `->` CycleRange(long: maxValue) `->` int
- long `->` CycleRange(long: minValue, long: maxValue) `->` int
- int `->` CycleRange(int: maxValue) `->` int
- int `->` CycleRange(int: minValue, int: maxValue) `->` int

## DateTimeFormats
javadoc:
The valid formats, in joda specifier form are documented in {@link DateTimeFormats}
 <ol>
 <li>yyyy-MM-dd HH:mm:ss.SSSZ, for example: 2015-02-28 23:30:15.223</li>
 <li>yyyy-MM-dd HH:mm:ss, for example 2015-02-28 23:30:15</li>
 <li>yyyyMMdd'T'HHmmss.SSSZ, for example: 20150228T233015.223</li>
 <li>yyyyMMdd'T'HHmmssZ, for example: 20150228T233015</li>
 <li>yyyy-MM-dd, for example: 2015-02-28</li>
 <li>yyyyMMdd, for example: 20150228</li>
 <li>yyyyMM, for example: 201502</li>
 <li>yyyy, for example: 2015</li>
 </ol>--

available forms:

- null `->` DateTimeFormats() `->` null

## DirectoryLines

available forms:

- long `->` DirectoryLines(java.lang.String: basepath, java.lang.String: namePattern) `->` java.lang.String

## Div

available forms:

- long `->` Div(int: divisor) `->` int
- int `->` Div(int: divisor) `->` int
- long `->` Div(int: divisor) `->` long
- double `->` Div(double: divisor) `->` double

## DivideToLongToString
javadoc:
Integer devide the cycle, the other side of modulo.--

available forms:

- long `->` DivideToLongToString(long: divisor) `->` java.lang.String

## DoubleToFloat

available forms:

- double `->` DoubleToFloat() `->` java.lang.Float

## Expr

available forms:

- int `->` Expr(java.lang.String: expr) `->` int
- long `->` Expr(java.lang.String: expr) `->` int
- double `->` Expr(java.lang.String: expr) `->` double
- long `->` Expr(java.lang.String: expr) `->` long

## FemaleFirstNames

available forms:

- null `->` FemaleFirstNames() `->` null

## FieldExtractor
javadoc:
Extracts out a set of fields from a delimited string, returning
 a string with the same delimiter containing only the specified fields.--

available forms:

- java.lang.String `->` FieldExtractor(java.lang.String: fields) `->` java.lang.String

## FirstNames

available forms:

- null `->` FirstNames() `->` null

## FixedValue

available forms:

- long `->` FixedValue(int: value) `->` int
- long `->` FixedValue(long: fixedValue) `->` long

## FixedValues

available forms:

- long `->` FixedValues(long[]: values) `->` long
- long `->` FixedValues(int[]: values) `->` int

## Format

available forms:

- java.lang.Object `->` Format(java.lang.String: format) `->` java.lang.String

## FullHash
javadoc:
This uses the Murmur3F (64-bit optimized) version of Murmur3,
 not as a checksum, but as a simple hash. It doesn't bother
 pushing the high-64 bits of input, since it only uses the lower
 64 bits of output.

 This version returns the value regardless of this sign bit.
 It does not return the absolute value, as {@link Hash} does.--

available forms:

- long `->` FullHash() `->` long

## FullNames

available forms:

- null `->` FullNames() `->` null

## FuncTemplate

available forms:

- long `->` FuncTemplate(java.lang.String: rawTemplate) `->` java.lang.String

## Hash
javadoc:
This uses the Murmur3F (64-bit optimized) version of Murmur3,
 not as a checksum, but as a simple hash. It doesn't bother
 pushing the high-64 bits of input, since it only uses the lower
 64 bits of output. It does, however, return the absolute value.
 This is to make it play nice with users and other libraries.--

available forms:

- long `->` Hash() `->` long
- int `->` Hash() `->` int
- long `->` Hash() `->` int

## HashRange

available forms:

- long `->` HashRange(long: width) `->` long
- long `->` HashRange(long: minValue, long: maxValue) `->` long
- int `->` HashRange(int: width) `->` int
- int `->` HashRange(int: minValue, int: maxValue) `->` int
- long `->` HashRange(long: width) `->` int
- long `->` HashRange(long: minValue, long: maxValue) `->` int

## HashRangeScaled
javadoc:
Uses the input value as well to establish the upper bound of the
 value produced from the hash.--

available forms:

- long `->` HashRangeScaled() `->` int
- long `->` HashRangeScaled() `->` long
- int `->` HashRangeScaled() `->` int

## HashedDoubleRange
javadoc:
<p>This simulates a uniform sample from a range of double values
 via long hashing. This function attempts to take a double
 unit interval value from a long/long division over the whole
 range of long values but via double value types, thus providing
 a very linear sample. This means that the range of double
 values to be accessed will not fall along all possible doubles,
 but will still provide suitable values for ranges close to
 high-precision points in the IEEE floating point number line.
 This suffices for most reasonable ranges in practice outside
 of scientific computing, where large exponents put adjacent
 IEEE floating point values much further apart.</p>

 <p>This should be consider the default double range sampling
 function for most uses, when the exponent is not needed for
 readability.</p>--

available forms:

- long `->` HashedDoubleRange(double: min, double: max) `->` double

## HashedFileExtractToString

available forms:

- long `->` HashedFileExtractToString(java.lang.String: fileName, int: minsize, int: maxsize) `->` java.lang.String

## HashedLineToInt

available forms:

- long `->` HashedLineToInt(java.lang.String: filename) `->` int

## HashedLineToString

available forms:

- long `->` HashedLineToString(java.lang.String: filename) `->` java.lang.String

## HashedLineToStringList

available forms:

- long `->` HashedLineToStringList(java.lang.String: filename, int: minSize, int: maxSize) `->` java.util.List

## HashedLineToStringSet

available forms:

- long `->` HashedLineToStringSet(java.lang.String: filename, int: minSize, int: maxSize) `->` java.util.Set<java.lang.String>

## HashedLineToStringStringMap

available forms:

- long `->` HashedLineToStringStringMap(java.lang.String: paramFile, int: maxSize) `->` java.util.Map<java.lang.String,java.lang.String>

## HashedLinesToKeyValueString

available forms:

- long `->` HashedLinesToKeyValueString(java.lang.String: paramFile, int: maxsize) `->` java.lang.String

## HashedLoremExtractToString

available forms:

- long `->` HashedLoremExtractToString(int: minsize, int: maxsize) `->` java.lang.String

## HashedRangedToNonuniformDouble
javadoc:
This provides a random sample of a double in a range, without
 accounting for the non-uniform distribution of IEEE double representation.
 This means that values closer to high-precision areas of the IEEE spec
 will be weighted higher in the output. However, NaN and positive and
 negative infinity are filtered out via oversampling. Results are still
 stable for a given input value.--

available forms:

- null `->` HashedRangedToNonuniformDouble(long: min, long: max) `->` null
- null `->` HashedRangedToNonuniformDouble(long: min, long: max, long: seed) `->` null

## HashedToByteBuffer
javadoc:
Hash a long input value into a byte buffer, at least length bytes long, but aligned on 8-byte
 boundary;--

available forms:

- long `->` HashedToByteBuffer(int: lengthInBytes) `->` java.nio.ByteBuffer

## Identity

available forms:

- long `->` Identity() `->` long

## Interpolate

available forms:

- long `->` Interpolate(double[]: value) `->` long
- long `->` Interpolate(long[]: value) `->` long
- long `->` Interpolate(int: resolution, double[]: lut) `->` long
- long `->` Interpolate(double[]: value) `->` double
- long `->` Interpolate(int: resolution, double[]: lut) `->` double

## JoinTemplate

available forms:

- null `->` JoinTemplate(java.lang.String: delimiter, java.util.function.LongFunction<?>[]: funcs) `->` null
- null `->` JoinTemplate(java.lang.String: prefix, java.lang.String: delimiter, java.lang.String: suffix, java.util.function.LongFunction<?>[]: funcs) `->` null
- null `->` JoinTemplate(java.util.function.LongUnaryOperator: iterop, java.lang.String: prefix, java.lang.String: delimiter, java.lang.String: suffix, java.util.function.LongFunction<?>[]: funcs) `->` null

## LastNames

available forms:

- null `->` LastNames() `->` null

## ListTemplate

available forms:

- long `->` ListTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<java.lang.String>: valueFunc) `->` java.util.List<java.lang.String>

## Load

available forms:

- long `->` Load(java.lang.String: name) `->` long
- int `->` Load(java.lang.String: name) `->` int
- java.lang.Object `->` Load(java.lang.String: name) `->` java.lang.Object
- double `->` Load(java.lang.String: name) `->` double
- java.lang.String `->` Load(java.lang.String: name) `->` java.lang.String

## LongToByte

available forms:

- long `->` LongToByte() `->` java.lang.Byte

## LongToShort

available forms:

- long `->` LongToShort() `->` java.lang.Short

## LongToString

available forms:

- long `->` LongToString() `->` java.lang.String

## MaleFirstNames

available forms:

- null `->` MaleFirstNames() `->` null

## MapTemplate

available forms:

- long `->` MapTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<java.lang.String>: keyFunc, java.util.function.LongFunction<java.lang.String>: valueFunc) `->` java.util.Map<java.lang.String,java.lang.String>

## Max

available forms:

- long `->` Max(long: max) `->` long
- int `->` Max(int: max) `->` int
- double `->` Max(double: max) `->` double

## Min

available forms:

- long `->` Min(long: min) `->` long
- int `->` Min(int: min) `->` int
- double `->` Min(double: min) `->` double

## Mod

available forms:

- int `->` Mod(int: modulo) `->` int
- long `->` Mod(long: modulo) `->` int
- long `->` Mod(long: modulo) `->` long

## ModuloLineToString

available forms:

- long `->` ModuloLineToString(java.lang.String: filename) `->` java.lang.String

## ModuloToBigDecimal

available forms:

- long `->` ModuloToBigDecimal() `->` java.math.BigDecimal
- long `->` ModuloToBigDecimal(long: modulo) `->` java.math.BigDecimal

## ModuloToBigInt

available forms:

- long `->` ModuloToBigInt() `->` java.math.BigInteger
- long `->` ModuloToBigInt(long: modulo) `->` java.math.BigInteger

## ModuloToBoolean

available forms:

- long `->` ModuloToBoolean() `->` java.lang.Boolean

## ModuloToByte

available forms:

- long `->` ModuloToByte(long: modulo) `->` java.lang.Byte

## ModuloToInteger

available forms:

- long `->` ModuloToInteger(int: modulo) `->` java.lang.Integer

## ModuloToLong

available forms:

- long `->` ModuloToLong(long: modulo) `->` long

## ModuloToShort

available forms:

- long `->` ModuloToShort(long: modulo) `->` java.lang.Short

## Mul

available forms:

- long `->` Mul(long: multiplicand) `->` int
- double `->` Mul(double: factor) `->` double
- long `->` Mul(long: multiplicand) `->` long
- int `->` Mul(int: addend) `->` int

## Murmur3DivToLong

available forms:

- long `->` Murmur3DivToLong(long: divisor) `->` long

## Murmur3DivToString

available forms:

- long `->` Murmur3DivToString(long: divisor) `->` java.lang.String

## NumberNameToString

available forms:

- long `->` NumberNameToString() `->` java.lang.String

## Prefix
javadoc:
Created by sebastianestevez on 8/28/17.--

available forms:

- java.lang.String `->` Prefix(java.lang.String: prefix) `->` java.lang.String

## Save

available forms:

- java.lang.String `->` Save(java.lang.String: name) `->` java.lang.String
- java.lang.Object `->` Save(java.lang.String: name) `->` java.lang.Object
- long `->` Save(java.lang.String: name) `->` long
- int `->` Save(java.lang.String: name) `->` int
- double `->` Save(java.lang.String: name) `->` double

## Scale
javadoc:
Scale the input to the--

available forms:

- long `->` Scale(double: scaleFactor) `->` long
- long `->` Scale(double: scaleFactor) `->` int
- int `->` Scale(double: scaleFactor) `->` int

## Show

available forms:

- java.lang.Object `->` Show() `->` java.lang.String
- java.lang.Object `->` Show(java.lang.String[]: names) `->` java.lang.String

## Shuffle
javadoc:
This function provides a low-overhead shuffling effect without loading
 elements into memory. It uses a bundled dataset of pre-computed
 Galois LFSR shift register configurations, along with a down-sampling
 method to provide amortized virtual shuffling with minimal memory usage.--

available forms:

- long `->` Shuffle(long: min, long: maxPlusOne) `->` long
- long `->` Shuffle(long: min, long: maxPlusOne, int: moduloSelector) `->` long

## SignedHash

available forms:

- int `->` SignedHash() `->` int
- long `->` SignedHash() `->` long
- long `->` SignedHash() `->` int

## StartingEpochMillis
javadoc:
This function sets the minimum long value to the equivalent
 unix epoch time in milliseconds. It simply adds the input
 value to this base value as determined by the provided
 time specifier. It wraps any overflow within this range as well.--

available forms:

- long `->` StartingEpochMillis(java.lang.String: baseTimeSpec) `->` long

## StaticStringMapper

available forms:

- long `->` StaticStringMapper(java.lang.String: string) `->` java.lang.String

## StringDateWrapper

available forms:

- long `->` StringDateWrapper(java.lang.String: format) `->` java.lang.String

## Suffix

available forms:

- java.lang.String `->` Suffix(java.lang.String: suffix) `->` java.lang.String

## Template
javadoc:
Creates a template function which will yield a string which fits the template
 provided, with all occurrences of <pre>{}</pre> substituted pair-wise with the
 result of the provided function. The number of <pre>{}</pre> entries in the template
 must strictly match the number of functions or an error will be thrown.
 To provide differing values for similarly defined functions in the list, the input
 value used is automatically incremented by one for each function, starting with
 the initial input value.--

available forms:

- long `->` Template(java.lang.String: template, java.util.function.LongFunction<?>[]: funcs) `->` java.lang.String
- long `->` Template(java.util.function.LongUnaryOperator: iterOp, java.lang.String: template, java.util.function.LongFunction<?>[]: funcs) `->` java.lang.String

## ThreadNumToInteger
javadoc:
Matches a digit sequence in the current thread name and caches it in a thread local.
 This allows you to use any intentionally indexed thread factories to provide an analogue for
 concurrency. Note that once the thread number is cached, it will not be refreshed. This means
 you can't change the thread name and get an updated value.--

available forms:

- long `->` ThreadNumToInteger() `->` java.lang.Integer

## ThreadNumToLong
javadoc:
Matches a digit sequence in the current thread name and caches it in a thread local.
 This allows you to use any intentionally indexed thread factories to provide an analogue for
 concurrency. Note that once the thread number is cached, it will not be refreshed. This means
 you can't change the thread name and get an updated value.--

available forms:

- long `->` ThreadNumToLong() `->` long

## ToBigInt

available forms:

- long `->` ToBigInt() `->` java.math.BigInteger

## ToBoolean

available forms:

- java.lang.Double `->` ToBoolean() `->` java.lang.Boolean
- java.lang.Float `->` ToBoolean() `->` java.lang.Boolean
- java.lang.Integer `->` ToBoolean() `->` java.lang.Boolean
- long `->` ToBoolean() `->` java.lang.Boolean

## ToByte

available forms:

- double `->` ToByte() `->` java.lang.Byte
- double `->` ToByte(int: modulo) `->` java.lang.Byte
- java.lang.Float `->` ToByte() `->` java.lang.Byte
- java.lang.Float `->` ToByte(int: modulo) `->` java.lang.Byte
- long `->` ToByte() `->` java.lang.Byte
- long `->` ToByte(int: modulo) `->` java.lang.Byte
- java.lang.String `->` ToByte() `->` java.lang.Byte
- java.lang.Short `->` ToByte(int: scale) `->` java.lang.Byte
- java.lang.Short `->` ToByte() `->` java.lang.Byte
- int `->` ToByte() `->` java.lang.Byte
- int `->` ToByte(int: modulo) `->` java.lang.Byte

## ToByteBuffer

available forms:

- java.lang.Float `->` ToByteBuffer() `->` java.nio.ByteBuffer
- java.lang.Short `->` ToByteBuffer() `->` java.nio.ByteBuffer
- long `->` ToByteBuffer() `->` java.nio.ByteBuffer
- int `->` ToByteBuffer() `->` java.nio.ByteBuffer
- java.lang.String `->` ToByteBuffer() `->` java.nio.ByteBuffer
- double `->` ToByteBuffer() `->` java.nio.ByteBuffer

## ToDate

available forms:

- long `->` ToDate(int: spacing, int: repeat_count) `->` java.util.Date
- long `->` ToDate(int: spacing) `->` java.util.Date
- long `->` ToDate() `->` java.util.Date

## ToDateTime

available forms:

- long `->` ToDateTime(int: spacing, int: repeat_count) `->` org.joda.time.DateTime
- long `->` ToDateTime(java.lang.String: spacing) `->` org.joda.time.DateTime
- long `->` ToDateTime() `->` org.joda.time.DateTime

## ToDouble

available forms:

- long `->` ToDouble() `->` double

## ToEpochTimeUUID
javadoc:
Converts a long UTC timestamp in epoch millis form into a Version 1 TimeUUID
 according to <a href="https://www.ietf.org/rfc/rfc4122.txt">RFC 4122</a>.
 This means that only one unique value for a timeuuid can be generated for
 each epoch milli value, even though version 1 TimeUUIDs can normally represent
 up to 10000 distinct values per millisecond. If you need to access this
 level of resolution for testing purposes, use {@link ToFinestTimeUUID}
 instead. This method is to support simple mapping to natural timestamps
 as we often find in the real world.
 <p>
 For the variants that have an String argument in the constructor, this is
 a parsable datetime that is used as the base time for all produced values.
 Setting this allows you to set the start of the time range for all timeuuid
 values produced. All times are parsed for UTC. All time use ISO date ordering,
 meaning that the most significant fields always go before the others.
 <p>
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
 </ol>--

available forms:

- long `->` ToEpochTimeUUID() `->` java.util.UUID
- long `->` ToEpochTimeUUID(long: node) `->` java.util.UUID
- long `->` ToEpochTimeUUID(long: node, long: clock) `->` java.util.UUID
- long `->` ToEpochTimeUUID(java.lang.String: baseSpec) `->` java.util.UUID
- long `->` ToEpochTimeUUID(java.lang.String: baseSpec, long: node) `->` java.util.UUID
- long `->` ToEpochTimeUUID(java.lang.String: baseSpec, long: node, long: clock) `->` java.util.UUID

## ToFinestTimeUUID
javadoc:
Converts a count of 100ns intervals from 1582 Julian to a Type1 TimeUUID
 according to <a href="https://www.ietf.org/rfc/rfc4122.txt">RFC 4122</a>.
 This allows you to access the finest unit of resolution for the
 purposes of simulating a large set of unique timeuuid values. This offers
 10000 times more unique values per ms than {@link ToEpochTimeUUID}.

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
 </ol>--

available forms:

- long `->` ToFinestTimeUUID() `->` java.util.UUID
- long `->` ToFinestTimeUUID(long: node) `->` java.util.UUID
- long `->` ToFinestTimeUUID(long: node, long: clock) `->` java.util.UUID
- long `->` ToFinestTimeUUID(java.lang.String: baseTimeSpec) `->` java.util.UUID
- long `->` ToFinestTimeUUID(java.lang.String: baseTimeSpec, long: node) `->` java.util.UUID
- long `->` ToFinestTimeUUID(java.lang.String: baseTimeSpec, long: node, long: clock) `->` java.util.UUID

## ToFloat

available forms:

- double `->` ToFloat(double: scale) `->` java.lang.Float
- double `->` ToFloat() `->` java.lang.Float
- long `->` ToFloat(long: scale) `->` java.lang.Float
- long `->` ToFloat() `->` java.lang.Float
- java.lang.String `->` ToFloat() `->` java.lang.Float
- int `->` ToFloat(int: scale) `->` java.lang.Float
- int `->` ToFloat() `->` java.lang.Float
- java.lang.Short `->` ToFloat() `->` java.lang.Float

## ToHashedUUID
javadoc:
This function provides a stable hashing of the input value to
 a version 4 (Random) UUID.--

available forms:

- long `->` ToHashedUUID() `->` java.util.UUID

## ToInetAddress

available forms:

- long `->` ToInetAddress() `->` java.net.InetAddress

## ToInt

available forms:

- java.lang.String `->` ToInt() `->` java.lang.Integer
- double `->` ToInt(int: scale) `->` int
- double `->` ToInt() `->` int
- long `->` ToInt(int: scale) `->` int
- long `->` ToInt() `->` int
- long `->` ToInt() `->` int
- java.lang.Double `->` ToInt(int: scale) `->` java.lang.Integer
- java.lang.Double `->` ToInt() `->` java.lang.Integer
- java.lang.Object `->` ToInt() `->` java.lang.Integer

## ToJodaDateTime

available forms:

- long `->` ToJodaDateTime(int: spacing, int: repeat_count) `->` org.joda.time.DateTime
- long `->` ToJodaDateTime(java.lang.String: spacing) `->` org.joda.time.DateTime
- long `->` ToJodaDateTime() `->` org.joda.time.DateTime

## ToLong

available forms:

- java.lang.Float `->` ToLong(long: scale) `->` java.lang.Long
- java.lang.Float `->` ToLong() `->` java.lang.Long
- double `->` ToLong(long: scale) `->` long
- double `->` ToLong() `->` long

## ToLongFunction
javadoc:
Adapts any {@link FunctionalInterface} type to a LongFunction,
 for use with higher-order functions, when they require a
 LongFunction as an argument.--

available forms:

- long `->` ToLongFunction(java.util.function.LongUnaryOperator: op) `->` java.lang.Object
- long `->` ToLongFunction(java.util.function.Function<java.lang.Long,java.lang.Long>: op) `->` java.lang.Object
- long `->` ToLongFunction(java.util.function.LongToIntFunction: op) `->` java.lang.Object
- long `->` ToLongFunction(java.util.function.LongToDoubleFunction: op) `->` java.lang.Object
- long `->` ToLongFunction(java.util.function.LongFunction<?>: func) `->` java.lang.Object

## ToLongUnaryOperator

available forms:

- long `->` ToLongUnaryOperator(java.util.function.LongFunction<java.lang.Long>: f) `->` long
- long `->` ToLongUnaryOperator(java.util.function.Function<java.lang.Long,java.lang.Long>: f) `->` long
- long `->` ToLongUnaryOperator(java.util.function.LongUnaryOperator: f) `->` long

## ToShort

available forms:

- double `->` ToShort() `->` java.lang.Short
- double `->` ToShort(int: modulo) `->` java.lang.Short
- long `->` ToShort() `->` java.lang.Short
- long `->` ToShort(int: wrapat) `->` java.lang.Short
- java.lang.String `->` ToShort() `->` java.lang.Short
- java.lang.Float `->` ToShort() `->` java.lang.Short
- java.lang.Float `->` ToShort(int: modulo) `->` java.lang.Short
- int `->` ToShort() `->` java.lang.Short
- int `->` ToShort(int: scale) `->` java.lang.Short

## ToString

available forms:

- java.lang.Object `->` ToString() `->` java.lang.String

## ToUUID
javadoc:
This function creates a non-random UUID in the type 4 version (Random).
 It puts the same value in the MSB position of the UUID format.
 The input value is put in the LSB position.
 <pre>
 xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx
 mmmmmmmm-mmmm-Mmmm-Llll-llllllllllll
               4    3
 </pre>
 As shown above, the LSB position does not have the complication of having
 a version identifier (position M) dividing the dynamic range of the data type.
 For this reason, only the LSB side is used for this mapper, which allows
 an effective range of Long.MAX_VALUE/8, given the loss of 3 digits of precision.--

available forms:

- long `->` ToUUID() `->` java.util.UUID
- long `->` ToUUID(long: msbs) `->` java.util.UUID

## WeightedStrings

available forms:

- long `->` WeightedStrings(java.lang.String: valuesAndWeights) `->` java.lang.String
- long `->` WeightedStrings(java.lang.String: valueColumn, java.lang.String: weightColumn, java.lang.String[]: filenames) `->` java.lang.String



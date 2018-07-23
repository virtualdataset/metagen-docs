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

Reference Format

Each heading in this page is the name of a function. The description of
the function in general is provided, if any after it.

The details that follow show all of the forms of the function which are available,
according to different input, out, and argument signatures. For each form,
examples and notes are provided if available under *ex:* and *notes:*.

Here is a fake documentation entry that visually explains the layout:

**AnyFunc (not a real function)**

The explanation of what AnyFunc does goes here. It will explain the general purpose of AnyFunc,
regardless of the type-specific details that may go below.

- int -> AnyFunc(int: size) -> int *(This is the full type signature of one of the availabler versions of AnyFunc)*
  - *ex:* `AnyFunc(42)` - *An example to the left, and an explanation for what makes it useful.*
  - *notes:* This particular explanation is just to show where additional notes on the AnyFunc(int) variant would go.
- long -> AnyFunc(long: size) -> long *(There is another form available which specializes for the long type.)*
  - *ex:* `AnyFunc(42L)` - *This form wants the argument to be a long*

# CATEGORY datetime
## StartingEpochMillis

This function sets the minimum long value to the equivalent
unix epoch time in milliseconds. It simply adds the input
value to this base value as determined by the provided
time specifier. It wraps any overflow within this range as well.

- long -> StartingEpochMillis(String: baseTimeSpec) -> long
  - *ex:* `StartingEpochMillis('2017-01-01 23:59:59')` - *add the millisecond epoch time of 2017-01-01 23:59:59 to all input values*

## ToDate

Convert the input value to a {@code Date}

- long -> ToDate(int: spacing, int: repeat_count) -> java.util.Date
- long -> ToDate(int: spacing) -> java.util.Date
- long -> ToDate() -> java.util.Date

## ToDateTime

Convert the input value to a {@code org.joda.time.DateTime}

- long -> ToDateTime(int: spacing, int: repeat_count) -> org.joda.time.DateTime
- long -> ToDateTime(String: spacing) -> org.joda.time.DateTime
- long -> ToDateTime() -> org.joda.time.DateTime

## ToEpochTimeUUID

Converts a long UTC timestamp in epoch millis form into a Version 1 TimeUUID
according to <a href="https://www.ietf.org/rfc/rfc4122.txt">RFC 4122</a>.
This means that only one unique value for a timeuuid can be generated for
each epoch milli value, even though version 1 TimeUUIDs can normally represent
up to 10000 distinct values per millisecond. If you need to access this
level of resolution for testing purposes, use ToFinestTimeUUID
instead. This method is to support simple mapping to natural timestamps
as we often find in the real world.

For the variants that have a String argument in the constructor, this is
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

For the variants that have a String argument in the constructor, this is
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

## ToJodaDateTime

Convert the input value to a {@code org.joda.time.DateTime}

- long -> ToJodaDateTime(int: spacing, int: repeat_count) -> org.joda.time.DateTime
- long -> ToJodaDateTime(String: spacing) -> org.joda.time.DateTime
- long -> ToJodaDateTime() -> org.joda.time.DateTime

# CATEGORY state
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

- long -> Load(String: name) -> long
  - *ex:* `Load('foo')` - *load a long value from the named variable for this thread*
- Object -> Load(String: name) -> Object
  - *ex:* `Load('foo')` - *load a Object value from the named variable for this thread*
- String -> Load(String: name) -> String
  - *ex:* `Load('foo')` - *load a String value from the named variable for this thread*

## Save

Save the current input value at this point in the function chain to a thread-local variable name.
The input value is unchanged, and available for the next function in the chain to use as-is.

- long -> Save(String: name) -> long
  - *ex:* `Save('foo')` - *save the current long value to the name 'foo' in this thread*
- Object -> Save(String: name) -> Object
  - *ex:* `Save('foo')` - *save the current input object value to the name 'foo' in this thread*
- int -> Save(String: name) -> int
  - *ex:* `Save('foo')` - *save the current int value to the name 'foo' in this thread*
- String -> Save(String: name) -> String
  - *ex:* `Save('foo')` - *save the current String value to the name 'foo' in this thread*

## Show

Show diagnostic values for the thread-local variable map.

- Object -> Show() -> String
  - *ex:* `Show()` - *Show all values in a json-like format*
- Object -> Show(String[]...: names) -> String
  - *ex:* `Show('foo')` - *Show only the 'foo' value in a json-like format*
  - *ex:* `Show('foo','bar')` - *Show the 'foo' and 'bar' values in a json-like format*

# CATEGORY distributions
## Beta

@see <a href="https://en.wikipedia.org/wiki/Beta_distribution">Wikipedia: Beta distribution</a>

@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/BetaDistribution.html">Commons JavaDoc: BetaDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Beta(double: alpha, double: beta, String[]...: mods) -> double

## Binomial

@see <a href="http://en.wikipedia.org/wiki/Binomial_distribution">Wikipedia: Binomial distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/BinomialDistribution.html">Commons JavaDoc: BinomialDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function based on inverse cumulative
 density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Binomial(int: trials, double: p, String[]...: modslist) -> int

## Cauchy

@see <a href="http://en.wikipedia.org/wiki/Cauchy_distribution">Wikipedia: Cauchy_distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/CauchyDistribution.html">Commons Javadoc: CauchyDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Cauchy(double: median, double: scale, String[]...: mods) -> double

## ChiSquared

@see <a href="https://en.wikipedia.org/wiki/Chi-squared_distribution">Wikipedia: Chi-squared distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ChiSquaredDistribution.html">Commons JavaDoc: ChiSquaredDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> ChiSquared(double: degreesOfFreedom, String[]...: mods) -> double

## ConstantContinuous

Always yields the same value
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ConstantContinuousDistribution.html">Commons JavaDoc: ConstantContinuousDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> ConstantContinuous(double: value, String[]...: mods) -> double

## Enumerated

Creates a probability density given the values and optional weights provided, in "value:weight value:weight ..." form.
The weight can be elided for any value to use the default weight of 1.0d.

@see <a href="http://commons.apache.org/proper/commons-math/apidocs/org/apache/commons/math4/distribution/EnumeratedRealDistribution.html">Commons JavaDoc: EnumeratedRealDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Enumerated(String: data, String[]...: mods) -> double
  - *ex:* `Enumerated('1 2 3 4 5 6')` - *a fair six-sided die roll*
  - *ex:* `Enumerated('1:2.0 2 3 4 5 6')` - *an unfair six-sided die roll, where 1 has probability mass 2.0, and everything else has only 1.0*

## Exponential

@see <a href="https://en.wikipedia.org/wiki/Exponential_distribution">Wikipedia: Exponential distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ExponentialDistribution.html">Commons JavaDoc: ExponentialDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Exponential(double: mean, String[]...: mods) -> double

## F

@see <a href="https://en.wikipedia.org/wiki/F-distribution">Wikipedia: F-distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/FDistribution.html">Commons JavaDoc: FDistribution</a>
@see <a href="http://mathworld.wolfram.com/F-Distribution.html">Mathworld: F-Distribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> F(double: numeratorDegreesOfFreedom, double: denominatorDegreesOfFreedom, String[]...: mods) -> double

## Gamma

@see <a href="https://en.wikipedia.org/wiki/Gamma_distribution">Wikipedia: Gamma distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/GammaDistribution.html">Commons JavaDoc: GammaDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Gamma(double: shape, double: scale, String[]...: mods) -> double

## Geometric

@see <a href="http://en.wikipedia.org/wiki/Geometric_distribution">Wikipedia: Geometric distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/GeometricDistribution.html">Commons JavaDoc: GeometricDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function based on inverse cumulative
 density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Geometric(double: p, String[]...: modslist) -> int

## Gumbel

@see <a href="https://en.wikipedia.org/wiki/Gumbel_distribution">Wikipedia: Gumbel distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/GumbelDistribution.html">Commons JavaDoc: GumbelDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Gumbel(double: mu, double: beta, String[]...: mods) -> double

## Hypergeometric

@see <a href="http://en.wikipedia.org/wiki/Hypergeometric_distribution">Wikipedia: Hypergeometric distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/HypergeometricDistribution.html">Commons JavaDoc: HypergeometricDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function based on inverse cumulative
 density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String[]...: modslist) -> int

## Laplace

@see <a href="https://en.wikipedia.org/wiki/Laplace_distribution">Wikipedia: Laplace distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LaplaceDistribution.html">Commons JavaDoc: LaplaceDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Laplace(double: mu, double: beta, String[]...: mods) -> double

## Levy

@see <a href="https://en.wikipedia.org/wiki/L%C3%A9vy_distribution">Wikipedia: Lévy distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LevyDistribution.html">Commons JavaDoc: LevyDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Levy(double: mu, double: c, String[]...: mods) -> double

## LogNormal

@see <a href="https://en.wikipedia.org/wiki/Log-normal_distribution">Wikipedia: Log-normal distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LogNormalDistribution.html">Commons JavaDoc: LogNormalDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> LogNormal(double: scale, double: shape, String[]...: mods) -> double

## Logistic

@see <a href="https://en.wikipedia.org/wiki/Logistic_distribution">Wikipedia: Logistic distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LogisticDistribution.html">Commons JavaDoc: LogisticDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Logistic(double: mu, double: scale, String[]...: mods) -> double

## Nakagami

@see <a href="https://en.wikipedia.org/wiki/Nakagami_distribution">Wikipedia: Nakagami distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/NakagamiDistribution.html">Commons JavaDoc: NakagamiDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Nakagami(double: mu, double: omega, String[]...: mods) -> double

## Normal

@see <a href="https://en.wikipedia.org/wiki/Normal_distribution">Wikipedia: Normal distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/NormalDistribution.html">Commons JavaDoc: NormalDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Normal(double: mean, double: sd, String[]...: mods) -> double

## Pareto

@see <a href="https://en.wikipedia.org/wiki/Pareto_distribution">Wikipedia: Pareto distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ParetoDistribution.html">Commons JavaDoc: ParetoDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Pareto(double: scale, double: shape, String[]...: mods) -> double

## Pascal

@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/PascalDistribution.html">Commons JavaDoc: PascalDistribution</a>
@see <a href="https://en.wikipedia.org/wiki/Negative_binomial_distribution">Wikipedia: Negative binomial distribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function based on inverse cumulative
 density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Pascal(int: r, double: p, String[]...: modslist) -> int

## Poisson

@see <a href="http://en.wikipedia.org/wiki/Poisson_distribution">Wikipedia: Poisson distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/PoissonDistribution.html">Commons JavaDoc: PoissonDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function based on inverse cumulative
 density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Poisson(double: p, String[]...: modslist) -> int

## T

@see <a href="https://en.wikipedia.org/wiki/Student's_t-distribution">Wikipedia: Student's t-distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/TDistribution.html">Commons JavaDoc: TDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> T(double: degreesOfFreedom, String[]...: mods) -> double

## Triangular

@see <a href="https://en.wikipedia.org/wiki/Triangular_distribution">Wikipedia: Triangular distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/TriangularDistribution.html">Commons JavaDoc: TriangularDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Triangular(double: a, double: c, double: b, String[]...: mods) -> double

## Uniform

- int -> Uniform(double: lower, double: upper, String[]...: mods) -> double
- int -> Uniform(int: lower, int: upper, String[]...: modslist) -> int

## Weibull

@see <a href="https://en.wikipedia.org/wiki/Weibull_distribution">Wikipedia: Weibull distribution</a>
@see <a href="http://mathworld.wolfram.com/WeibullDistribution.html">Wolfram Mathworld: Weibull Distribution</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/WeibullDistribution.html">Commons Javadoc: WeibullDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function. The method used is
 inverse cumulative density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Weibull(double: alpha, double: beta, String[]...: mods) -> double

## Zipf

@see <a href="https://en.wikipedia.org/wiki/Zipf's_law">Wikipedia: Zipf's Law</a>
@see <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ZipfDistribution.html">Commons JavaDoc: ZipfDistribution</a>

 Generate samples according to the specified probability density.

 The input value consists of a long between 0L and Long.MAX_VALUE.
 This value is scaled to the unit interval (0.0, 1.0) as
 an index into a sampling function based on inverse cumulative
 density sampling.

 <H3>Sampling Mode</H3>

 The curve can be sampled in either map or hash mode. Map mode
 simply indexes into the probability curve in the order that
 it would appear on a density plot. Hash mode applies a
 murmur3 hash to the input value before scaling from the
 range of longs to the unit interval, thus providing a pseudo-random
 sample of a value from the curve. This is usually what you want,
 so hash mode is the default.  To enable map mode, simply provide
 "map" as one of the modifiers as explained below.

 <H3>Interpolation</H3>

 The curve can be computed from the sampling function for each value
 generated, or it can be provided via interpolation with a lookup table.
 Using interpolation makes all the generator functions perform the
 same. This is almost always what you want, so interpolation is
 enabled by default. In order to compute the value for every sample
 instead, simply provide "compute" as one of the modifiers as explained
 below.

 You can add optional modifiers after the distribution parameters.
 You can add one of 'hash' or 'map' but not both. If neither of these is
 added, 'hash' is implied as a default.
 You can add one of 'interpolate' or 'compute' but not both. If neither
 of these is added, 'interpolate' is implied as a default.

 At times, it might be useful to add 'hash', 'interpolate' to your
 specifiers as a form of verbosity or explicit specification.

- int -> Zipf(int: numberOfElements, double: exponent, String[]...: modslist) -> int

# CATEGORY diagnostics
## Show

Show diagnostic values for the thread-local variable map.

- Object -> Show() -> String
  - *ex:* `Show()` - *Show all values in a json-like format*
- Object -> Show(String[]...: names) -> String
  - *ex:* `Show('foo')` - *Show only the 'foo' value in a json-like format*
  - *ex:* `Show('foo','bar')` - *Show the 'foo' and 'bar' values in a json-like format*

## ToLongFunction

Adapts any compatible FunctionalInterface type to a LongFunction,
for use with higher-order functions, when they require a
LongFunction as an argument. Some of the higher-order functions within
this library specifically require a LongFunction as an argument, while
some of the other functions are provided in semantically equivalent
forms with compatible types which can't be converted directly or
automatically by Java.

In such cases, those types of functions can be wrapped with the forms
described here in order to allow the inner and outer functions to work together.

- long -> ToLongFunction(java.util.function.LongUnaryOperator: op) -> Object
- long -> ToLongFunction(java.util.function.Function<Long,Long>: op) -> Object
- long -> ToLongFunction(java.util.function.LongToIntFunction: op) -> Object
- long -> ToLongFunction(java.util.function.LongToDoubleFunction: op) -> Object
- long -> ToLongFunction(java.util.function.LongFunction<?>: func) -> Object

## ToLongUnaryOperator

Adapts any compatible FunctionalInterface type to a LongUnaryOperator,
for use with higher-order functions, when they require a
LongUnaryOperator as an argument. Some of the higher-order functions within
this library specifically require a LongUnaryOperator as an argument, while
some of the other functions are provided in semantically equivalent
forms with compatible types which can't be converted directly or
automatically by Java.

In such cases, those types of functions can be wrapped with the forms
described here in order to allow the inner and outer functions to work together.

- long -> ToLongUnaryOperator(java.util.function.LongFunction<Long>: f) -> long
- long -> ToLongUnaryOperator(java.util.function.Function<Long,Long>: f) -> long
- long -> ToLongUnaryOperator(java.util.function.LongUnaryOperator: f) -> long

## TypeOf

Yields the class of the resulting type in String form.

- Object -> TypeOf() -> String

# CATEGORY conversion
## LongToByte

Convert the input long value to a byte, with negative values
masked away.

- long -> LongToByte() -> Byte

## LongToShort

- long -> LongToShort() -> Short

## ModuloToBigDecimal

Return a {@code BigDecimal} value as the result of modulo division with the specified divisor.

- long -> ModuloToBigDecimal() -> java.math.BigDecimal
- long -> ModuloToBigDecimal(long: modulo) -> java.math.BigDecimal

## ModuloToBigInt

Return a {@code BigInteger} value as the result of modulo division with the specified divisor.

- long -> ModuloToBigInt() -> java.math.BigInteger
- long -> ModuloToBigInt(long: modulo) -> java.math.BigInteger

## ModuloToBoolean

Return a boolean value as the result of modulo division with the specified divisor.

- long -> ModuloToBoolean() -> Boolean

## ModuloToByte

Return a byte value as the result of modulo division with the specified divisor.

- long -> ModuloToByte(long: modulo) -> Byte

## ModuloToShort

Return a boolean value as the result of modulo division with the specified divisor.

- long -> ModuloToShort(long: modulo) -> Short

## ToBigInt

Convert the input value to a {@code BigInteger}

- long -> ToBigInt() -> java.math.BigInteger

## ToBoolean

Convert the input value to a {@code boolean}

- long -> ToBoolean() -> Boolean
- Double -> ToBoolean() -> Boolean
- Float -> ToBoolean() -> Boolean
- Integer -> ToBoolean() -> Boolean

## ToByte

Convert the input value to a {@code Byte}.

- double -> ToByte() -> Byte
- double -> ToByte(int: modulo) -> Byte
- Float -> ToByte() -> Byte
- Float -> ToByte(int: modulo) -> Byte
- int -> ToByte() -> Byte
- int -> ToByte(int: modulo) -> Byte
- long -> ToByte() -> Byte
- long -> ToByte(int: modulo) -> Byte
- Short -> ToByte(int: scale) -> Byte
- Short -> ToByte() -> Byte
- String -> ToByte() -> Byte

## ToByteBuffer

Convert the input value to a {@code ByteBuffer}

- double -> ToByteBuffer() -> java.nio.ByteBuffer
- Float -> ToByteBuffer() -> java.nio.ByteBuffer
- int -> ToByteBuffer() -> java.nio.ByteBuffer
- long -> ToByteBuffer() -> java.nio.ByteBuffer
- Short -> ToByteBuffer() -> java.nio.ByteBuffer
- String -> ToByteBuffer() -> java.nio.ByteBuffer

## ToDouble

Convert the input value to a double.

- long -> ToDouble() -> double

## ToFloat

Convert the input value into a float.

- double -> ToFloat(double: scale) -> Float
- double -> ToFloat() -> Float
- int -> ToFloat(int: scale) -> Float
- int -> ToFloat() -> Float
- long -> ToFloat(long: scale) -> Float
- long -> ToFloat() -> Float
- Short -> ToFloat() -> Float
- String -> ToFloat() -> Float

## ToInetAddress

Convert the input value to a {@code java.net.InetAddress}

- long -> ToInetAddress() -> java.net.InetAddress

## ToInt

Convert the input value to a long.

- long -> ToInt() -> int
- Object -> ToInt() -> Integer
- double -> ToInt(int: scale) -> int
- double -> ToInt() -> int
- Double -> ToInt(int: scale) -> Integer
- Double -> ToInt() -> Integer
- long -> ToInt(int: scale) -> int
- long -> ToInt() -> int
- String -> ToInt() -> Integer

## ToLong

- double -> ToLong(long: scale) -> long
- double -> ToLong() -> long
- Float -> ToLong(long: scale) -> Long
- Float -> ToLong() -> Long

## ToShort

Convert the input value to a short.

- double -> ToShort() -> Short
- double -> ToShort(int: modulo) -> Short
- Float -> ToShort() -> Short
- Float -> ToShort(int: modulo) -> Short
- int -> ToShort() -> Short
- int -> ToShort(int: scale) -> Short
- long -> ToShort() -> Short
- long -> ToShort(int: wrapat) -> Short
  - *notes:* This form allows for limiting the short values at a lower limit than Short.MAX_VALUE.
- String -> ToShort() -> Short

## ToString

- Float -> ToString() -> String
- int -> ToString() -> String
- long -> ToString() -> String

# CATEGORY collections
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

# CATEGORY premade
## FirstNames

Return a pseudo-randomly sampled first name from the last US census data on first names
occurring more than 100 times. Both male and female names are combined in this function.

- long -> FirstNames() -> String
  - *ex:* `FirstNames()` - *select a random first name based on the chance of seeing it in the census data*
- long -> FirstNames(String: modifier) -> String
  - *ex:* `FirstNames('map')` - *select over the first names by probability as input varies from 1L to Long.MAX_VALUE*

## FullNames

Combines the FirstNames and LastNames functions into one that
simply concatenates them with a space between.
This function is a shorthand equivalent of {@code Template('{} {}', FirstNames(), LastNames())}

- long -> FullNames() -> String

## LastNames

Return a pseudo-randomly sampled last name from the last US census data on last names
occurring more than 100 times.

- long -> LastNames() -> String
  - *ex:* `LastNames()` - *select a random last name based on the chance of seeing it in the census data*
- long -> LastNames(String: modifier) -> String
  - *ex:* `LastNames('map')` - *select over the last names by probability as input varies from 1L to Long.MAX_VALUE*

# CATEGORY general
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

## Beta

- long -> Beta(double: alpha, double: beta, String[]...: mods) -> double

## Binomial

- int -> Binomial(int: trials, double: p, String[]...: modslist) -> long
- long -> Binomial(int: trials, double: p, String[]...: modslist) -> int
- long -> Binomial(int: trials, double: p, String[]...: modslist) -> long

## Cauchy

- long -> Cauchy(double: median, double: scale, String[]...: mods) -> double

## ChiSquared

- long -> ChiSquared(double: degreesOfFreedom, String[]...: mods) -> double

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

## ConstantContinuous

- long -> ConstantContinuous(double: value, String[]...: mods) -> double

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

## Enumerated

- long -> Enumerated(String: data, String[]...: mods) -> double
  - *ex:* `Enumerated('1 2 3 4 5 6')` - *a fair 6-sided die*
  - *ex:* `Enumerated('1:2.0 2 3 4 5:0.5 6:0.5')` - *an unfair fair 6-sided die, where ones are twice as likely, and fives and sixes are half as likely*

## Exponential

- long -> Exponential(double: mean, String[]...: mods) -> double

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

## F

- long -> F(double: numeratorDegreesOfFreedom, double: denominatorDegreesOfFreedom, String[]...: mods) -> double

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

- long -> FixedValues(int[]...: values) -> int
- long -> FixedValues(long[]...: values) -> long
  - *ex:* `FixedValues(3L,53L,73L)` - *Yield 3L, 53L, 73L, 3L, 53L, 73L, 3L, ...*

## Format

Apply the Java String.format method to an incoming object.
@see <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax">Java 8 String.format(...) javadoc</a>
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

## Gamma

- long -> Gamma(double: shape, double: scale, String[]...: mods) -> double

## Geometric

- int -> Geometric(double: p, String[]...: modslist) -> long
- long -> Geometric(double: p, String[]...: modslist) -> int
- long -> Geometric(double: p, String[]...: modslist) -> long

## Gumbel

- long -> Gumbel(double: mu, double: beta, String[]...: mods) -> double

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

## Hypergeometric

- int -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String[]...: modslist) -> long
- long -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String[]...: modslist) -> int
- long -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String[]...: modslist) -> long

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

- long -> Interpolate(double[]...: value) -> double
  - *ex:* `Interpolate(0.0d,100.0d)` - *return a uniform double value between 0.0d and 100.0d*
  - *ex:* `Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d)` - *return a weighted double value where the first second and third quartiles are 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(int: resolution, double[]: lut) -> double
- long -> Interpolate(double[]...: value) -> long
  - *ex:* `Interpolate(0.0d,100.0d)` - *return a uniform long value between 0L and 100L*
  - *ex:* `Interpolate(0.0d,90.0d,95.0d,98.0d,100.0d)` - *return a weighted long value where the first second and third quartiles are 90.0D, 95.0D, and 98.0D*
- long -> Interpolate(long[]...: value) -> long
- long -> Interpolate(int: resolution, double[]: lut) -> long

## JoinTemplate

Combine the result of the specified functions together with the
specified delimiter and optional prefix and suffix.

- long -> JoinTemplate(String: delimiter, java.util.function.LongFunction<?>[]...: funcs) -> String
  - *ex:* `JoinTemplate('--',NumberNameToString(),NumberNameToString())` - *create values like `one--one`, `two-two`, ...*
- long -> JoinTemplate(String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>[]...: funcs) -> String
  - *ex:* `JoinTemplate('{',',','}',NumberNameToString(),LastNames())` - *create values like '{one,Farrel}', '{two,Haskell}', ...*
- long -> JoinTemplate(java.util.function.LongUnaryOperator: iterop, String: prefix, String: delimiter, String: suffix, java.util.function.LongFunction<?>[]...: funcs) -> String
  - *ex:* `JoinTemplate(Add(3),'[',';',']',NumberNameToString(),NumberNameToString(),NumberNameToString())` - *create values like '[zero;three,six]', '[one;four,seven]', ...*

## Laplace

- long -> Laplace(double: mu, double: beta, String[]...: mods) -> double

## Levy

- long -> Levy(double: mu, double: c, String[]...: mods) -> double

## ListTemplate

Create a {@code List<String>} based on two functions, the first to
determine the list size, and the second to populate the list with
string values. The input fed to the second function is incremented
between elements.

- long -> ListTemplate(java.util.function.LongToIntFunction: sizeFunc, java.util.function.LongFunction<String>: valueFunc) -> java.util.List<String>
  - *ex:* `ListTemplate(HashRange(3,7),NumberNameToString())` - *create a list between 3 and 7 elements, with number names as the values*

## Load

- double -> Load(String: name) -> double
  - *ex:* `Load('foo')` - *load a double value from the named variable for this thread*
- int -> Load(String: name) -> int
  - *ex:* `Load('foo')` - *load an int value from the named variable for this thread*

## LogNormal

- long -> LogNormal(double: scale, double: shape, String[]...: mods) -> double

## Logistic

- long -> Logistic(double: mu, double: scale, String[]...: mods) -> double

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

## Nakagami

- long -> Nakagami(double: mu, double: omega, String[]...: mods) -> double

## Normal

- long -> Normal(double: mean, double: sd, String[]...: mods) -> double

## NumberNameToString

- long -> NumberNameToString() -> String

## Pareto

- long -> Pareto(double: scale, double: shape, String[]...: mods) -> double

## Pascal

- int -> Pascal(int: r, double: p, String[]...: modslist) -> long
- long -> Pascal(int: r, double: p, String[]...: modslist) -> int
- long -> Pascal(int: r, double: p, String[]...: modslist) -> long

## Poisson

- int -> Poisson(double: p, String[]...: modslist) -> long
- long -> Poisson(double: p, String[]...: modslist) -> int
- long -> Poisson(double: p, String[]...: modslist) -> long

## Prefix

Add the specified prefix String to the input value and return the result.

- String -> Prefix(String: prefix) -> String
  - *ex:* `Prefix('PREFIX:')` - *Prepend 'PREFIX:' to every input value*

## Save

- double -> Save(String: name) -> double
  - *ex:* `Save('foo')` - *save the current double value to the name 'foo' in this thread*

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

- long -> SignedHash() -> int
- long -> SignedHash() -> long
- int -> SignedHash() -> int

## StaticStringMapper

Return a static String value.

- long -> StaticStringMapper(String: string) -> String

## StringDateWrapper

- long -> StringDateWrapper(String: format) -> String

## Suffix

Add the specified prefix String to the input value and return the result.

- String -> Suffix(String: suffix) -> String
  - *ex:* `Suffix('--Fin')` - *Append '--Fin' to every input value*

## T

- long -> T(double: degreesOfFreedom, String[]...: mods) -> double

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

## ToString

Converts the input to the most obvious string representation with String.valueOf(...).

- Object -> ToString() -> String

## ToUUID

This function creates a non-random UUID in the type 4 version (Random).
It always puts the same value in the MSB position of the UUID format.
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

This function is suitable for deterministic testing of scenarios which depend
on type 4 UUIDs, but without the mandated randomness that makes testing difficult.
Just be aware that the MSB will always contain value 0x0123456789ABCDEFL unless you
specify a different long value to pre-fill it with.

- long -> ToUUID() -> java.util.UUID
- long -> ToUUID(long: msbs) -> java.util.UUID

## Triangular

- long -> Triangular(double: a, double: c, double: b, String[]...: mods) -> double

## Uniform

- long -> Uniform(double: lower, double: upper, String[]...: mods) -> double
- int -> Uniform(int: lower, int: upper, String[]...: modslist) -> long
- long -> Uniform(int: lower, int: upper, String[]...: modslist) -> int
- long -> Uniform(int: lower, int: upper, String[]...: modslist) -> long

## Weibull

- long -> Weibull(double: alpha, double: beta, String[]...: mods) -> double

## WeightedStrings

- long -> WeightedStrings(String: valuesAndWeights) -> String
- long -> WeightedStrings(String: valueColumn, String: weightColumn, String[]...: filenames) -> String
  - *notes:* Create a sampler of strings from the given CSV file. The CSV file must have plain CSV headers
as its first line.

## Zipf

- int -> Zipf(int: numberOfElements, double: exponent, String[]...: modslist) -> long
- long -> Zipf(int: numberOfElements, double: exponent, String[]...: modslist) -> int
- long -> Zipf(int: numberOfElements, double: exponent, String[]...: modslist) -> long



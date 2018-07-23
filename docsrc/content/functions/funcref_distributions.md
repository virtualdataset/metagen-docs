---
date: 2018-06-18
title: distributions
weight: 75
menu:
  main:
    parent: Function Reference
    identifier: reference-distributions
    weight: 52
---
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


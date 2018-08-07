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
All of the distributions that are provided in the Apache Commons Math
project are supported here, in multiple forms. 


## Continuous or Discrete

These distributions break down into two main categories:

### Continuous Distributions

These are distributions over real numbers like 23.4323, with
continuity across the values. Each of the continuous distributions can
provide samples that fall on an interval of the real number line.
Continuous probability distributions include the *Normal* distribution,
and the *Exponential* distribution, among many others.

### Discrete Distributions

Discrete distributions, also known as *integer distributions* have only
whole-number valued samples. These distributions include the *Binomial*
distribution, the *Zipf* distribution, and the *Poisson* distribution,
among others.

## Hashed or Mapped

### hashed samples

Generally, you will want to "randomly sample" from a probability distribution.
This is handled automatically by the functions below if you do not override the
defaults. **The `hash` mode is the default sampling mode for probability
distributions.** This is accomplished by computing an internal on the unit
interval variate input before using the resulting value to map into the sampling
curve. This is called the `hash` sampling mode by VirtData. You can put `hash`
into the modifiers as explained below if you want to document it explicitly.

### mapped samples

The method used to sample from these distributions depends on a mathematical
function called the cumulative probability function, or more specifically
the inverse of it. Having this function computed over some interval allows
one to sample the shape of a distribution progressively if desired. In
other words, it allows for some *percentile-like* view of values within
a given probability distribution. This mode of using the inverse cumulative
density function is known as the `map` mode in VirtData, as it allows one
to map a unit interval variate in a deterministic way to a density 
sampling curve. To enable this mode, simply pass `map` as one of the
function modifiers for any function in this category.

## Interpolated or Computed Samples

When sampling from mathematical models of probability densities, performance
between different densities can vary drastically. This means that you may
end up perturbing the results of your test in an unexpected way simply
by changing parameters of your testing distributions. Even worse, some
densities have painful corner cases in performance, like 'Zipf', which
can make tests unbearably slow and flawed as they chew up CPU resources.

### Interpolated Samples
 
For this reason, interpolation is built-in to these sampling functions.
**The default mode is `interpolate`.** This means that the sampling
function is pre-computed over 1000 equidistant points in the unit interval,
and the result is shared among all threads as a look-up-table for
interpolation. This makes all statistical sampling functions perform nearly
identically at runtime (after initialization, a one time cost).
This does have the minor side effect of a little loss in accuracy, but
the difference is generally negligible for nearly all performance testing
cases.

### Computed Samples

Conversely, `compute` mode sampling calls the sampling function every
time a sample is needed. This affords a little more accuracy, but is generally
not preferable to the default interpolated mode. You'll know if you need
computed samples. Otherwise, it's best to stick with interpolation so that
you spend more time testing your target system and less time testing
your data generation functions.

## Input Range

All of these functions take a long as the input value for sampling. This
is similar to how the unit interval (0.0,1.0) is used in mathematics
and statistics, but more tailored to modern system capabilities. Instead
of using the unit interval, we simply use the interval of all positive
longs. This provides more compatibility with other functions in VirtData,
including hashing functions.


## Beta

See <a href="https://en.wikipedia.org/wiki/Beta_distribution">Wikipedia: Beta distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/BetaDistribution.html">Commons JavaDoc: BetaDistribution</a>

- int -> Beta(double: alpha, double: beta, String... mods) -> double
- long -> Beta(double: alpha, double: beta, String... mods) -> double

## Binomial

See <a href="http://en.wikipedia.org/wiki/Binomial_distribution">Wikipedia: Binomial distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/BinomialDistribution.html">Commons JavaDoc: BinomialDistribution</a>

- int -> Binomial(int: trials, double: p, String... modslist) -> int
- int -> Binomial(int: trials, double: p, String... modslist) -> long
- long -> Binomial(int: trials, double: p, String... modslist) -> int
- long -> Binomial(int: trials, double: p, String... modslist) -> long

## Cauchy

See <a href="http://en.wikipedia.org/wiki/Cauchy_distribution">Wikipedia: Cauchy_distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/CauchyDistribution.html">Commons Javadoc: CauchyDistribution</a>

- int -> Cauchy(double: median, double: scale, String... mods) -> double
- long -> Cauchy(double: median, double: scale, String... mods) -> double

## ChiSquared

See <a href="https://en.wikipedia.org/wiki/Chi-squared_distribution">Wikipedia: Chi-squared distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ChiSquaredDistribution.html">Commons JavaDoc: ChiSquaredDistribution</a>

- int -> ChiSquared(double: degreesOfFreedom, String... mods) -> double
- long -> ChiSquared(double: degreesOfFreedom, String... mods) -> double

## ConstantContinuous

Always yields the same value.

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ConstantContinuousDistribution.html">Commons JavaDoc: ConstantContinuousDistribution</a>

- int -> ConstantContinuous(double: value, String... mods) -> double
- long -> ConstantContinuous(double: value, String... mods) -> double

## Enumerated

Creates a probability density given the values and optional weights provided, in "value:weight value:weight ..." form.
The weight can be elided for any value to use the default weight of 1.0d.

See <a href="http://commons.apache.org/proper/commons-math/apidocs/org/apache/commons/math4/distribution/EnumeratedRealDistribution.html">Commons JavaDoc: EnumeratedRealDistribution</a>

- int -> Enumerated(String: data, String... mods) -> double
  - *ex:* `Enumerated('1 2 3 4 5 6')` - *a fair six-sided die roll*
  - *ex:* `Enumerated('1:2.0 2 3 4 5 6')` - *an unfair six-sided die roll, where 1 has probability mass 2.0, and everything else has only 1.0*
- long -> Enumerated(String: data, String... mods) -> double
  - *ex:* `Enumerated('1 2 3 4 5 6')` - *a fair 6-sided die*
  - *ex:* `Enumerated('1:2.0 2 3 4 5:0.5 6:0.5')` - *an unfair fair 6-sided die, where ones are twice as likely, and fives and sixes are half as likely*

## Exponential

See <a href="https://en.wikipedia.org/wiki/Exponential_distribution">Wikipedia: Exponential distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ExponentialDistribution.html">Commons JavaDoc: ExponentialDistribution</a>

- int -> Exponential(double: mean, String... mods) -> double
- long -> Exponential(double: mean, String... mods) -> double

## F

See <a href="https://en.wikipedia.org/wiki/F-distribution">Wikipedia: F-distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/FDistribution.html">Commons JavaDoc: FDistribution</a>

See <a href="http://mathworld.wolfram.com/F-Distribution.html">Mathworld: F-Distribution</a>

- int -> F(double: numeratorDegreesOfFreedom, double: denominatorDegreesOfFreedom, String... mods) -> double
- long -> F(double: numeratorDegreesOfFreedom, double: denominatorDegreesOfFreedom, String... mods) -> double

## Gamma

See <a href="https://en.wikipedia.org/wiki/Gamma_distribution">Wikipedia: Gamma distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/GammaDistribution.html">Commons JavaDoc: GammaDistribution</a>

- int -> Gamma(double: shape, double: scale, String... mods) -> double
- long -> Gamma(double: shape, double: scale, String... mods) -> double

## Geometric

See <a href="http://en.wikipedia.org/wiki/Geometric_distribution">Wikipedia: Geometric distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/GeometricDistribution.html">Commons JavaDoc: GeometricDistribution</a>

- int -> Geometric(double: p, String... modslist) -> int
- int -> Geometric(double: p, String... modslist) -> long
- long -> Geometric(double: p, String... modslist) -> int
- long -> Geometric(double: p, String... modslist) -> long

## Gumbel

See <a href="https://en.wikipedia.org/wiki/Gumbel_distribution">Wikipedia: Gumbel distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/GumbelDistribution.html">Commons JavaDoc: GumbelDistribution</a>

- int -> Gumbel(double: mu, double: beta, String... mods) -> double
- long -> Gumbel(double: mu, double: beta, String... mods) -> double

## Hypergeometric

See <a href="http://en.wikipedia.org/wiki/Hypergeometric_distribution">Wikipedia: Hypergeometric distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/HypergeometricDistribution.html">Commons JavaDoc: HypergeometricDistribution</a>

- int -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String... modslist) -> int
- int -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String... modslist) -> long
- long -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String... modslist) -> int
- long -> Hypergeometric(int: populationSize, int: numberOfSuccesses, int: sampleSize, String... modslist) -> long

## Laplace

See <a href="https://en.wikipedia.org/wiki/Laplace_distribution">Wikipedia: Laplace distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LaplaceDistribution.html">Commons JavaDoc: LaplaceDistribution</a>

- int -> Laplace(double: mu, double: beta, String... mods) -> double
- long -> Laplace(double: mu, double: beta, String... mods) -> double

## Levy

See <a href="https://en.wikipedia.org/wiki/L%C3%A9vy_distribution">Wikipedia: Lévy distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LevyDistribution.html">Commons JavaDoc: LevyDistribution</a>

- int -> Levy(double: mu, double: c, String... mods) -> double
- long -> Levy(double: mu, double: c, String... mods) -> double

## LogNormal

See <a href="https://en.wikipedia.org/wiki/Log-normal_distribution">Wikipedia: Log-normal distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LogNormalDistribution.html">Commons JavaDoc: LogNormalDistribution</a>

- int -> LogNormal(double: scale, double: shape, String... mods) -> double
- long -> LogNormal(double: scale, double: shape, String... mods) -> double

## Logistic

See <a href="https://en.wikipedia.org/wiki/Logistic_distribution">Wikipedia: Logistic distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/LogisticDistribution.html">Commons JavaDoc: LogisticDistribution</a>

- int -> Logistic(double: mu, double: scale, String... mods) -> double
- long -> Logistic(double: mu, double: scale, String... mods) -> double

## Nakagami

See <a href="https://en.wikipedia.org/wiki/Nakagami_distribution">Wikipedia: Nakagami distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/NakagamiDistribution.html">Commons JavaDoc: NakagamiDistribution</a>

- int -> Nakagami(double: mu, double: omega, String... mods) -> double
- long -> Nakagami(double: mu, double: omega, String... mods) -> double

## Normal

See <a href="https://en.wikipedia.org/wiki/Normal_distribution">Wikipedia: Normal distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/NormalDistribution.html">Commons JavaDoc: NormalDistribution</a>

- int -> Normal(double: mean, double: sd, String... mods) -> double
- long -> Normal(double: mean, double: sd, String... mods) -> double

## Pareto

See <a href="https://en.wikipedia.org/wiki/Pareto_distribution">Wikipedia: Pareto distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ParetoDistribution.html">Commons JavaDoc: ParetoDistribution</a>

- int -> Pareto(double: scale, double: shape, String... mods) -> double
- long -> Pareto(double: scale, double: shape, String... mods) -> double

## Pascal

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/PascalDistribution.html">Commons JavaDoc: PascalDistribution</a>

See <a href="https://en.wikipedia.org/wiki/Negative_binomial_distribution">Wikipedia: Negative binomial distribution</a>

- int -> Pascal(int: r, double: p, String... modslist) -> int
- int -> Pascal(int: r, double: p, String... modslist) -> long
- long -> Pascal(int: r, double: p, String... modslist) -> int
- long -> Pascal(int: r, double: p, String... modslist) -> long

## Poisson

See <a href="http://en.wikipedia.org/wiki/Poisson_distribution">Wikipedia: Poisson distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/PoissonDistribution.html">Commons JavaDoc: PoissonDistribution</a>

- int -> Poisson(double: p, String... modslist) -> int
- int -> Poisson(double: p, String... modslist) -> long
- long -> Poisson(double: p, String... modslist) -> int
- long -> Poisson(double: p, String... modslist) -> long

## T

See <a href="https://en.wikipedia.org/wiki/Student's_t-distribution">Wikipedia: Student's t-distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/TDistribution.html">Commons JavaDoc: TDistribution</a>

- int -> T(double: degreesOfFreedom, String... mods) -> double
- long -> T(double: degreesOfFreedom, String... mods) -> double

## Triangular

See <a href="https://en.wikipedia.org/wiki/Triangular_distribution">Wikipedia: Triangular distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/TriangularDistribution.html">Commons JavaDoc: TriangularDistribution</a>

- int -> Triangular(double: a, double: c, double: b, String... mods) -> double
- long -> Triangular(double: a, double: c, double: b, String... mods) -> double

## Uniform

See <a href="https://en.wikipedia.org/wiki/Uniform_distribution_(continuous)">Wikipedia: Uniform distribution (continuous)</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/UniformContinuousDistribution.html">Commons JavaDoc: UniformContinuousDistribution</a>

- int -> Uniform(double: lower, double: upper, String... mods) -> double
- long -> Uniform(double: lower, double: upper, String... mods) -> double
- int -> Uniform(int: lower, int: upper, String... modslist) -> int
- int -> Uniform(int: lower, int: upper, String... modslist) -> long
- long -> Uniform(int: lower, int: upper, String... modslist) -> int
- long -> Uniform(int: lower, int: upper, String... modslist) -> long

## Weibull

See <a href="https://en.wikipedia.org/wiki/Weibull_distribution">Wikipedia: Weibull distribution</a>

See <a href="http://mathworld.wolfram.com/WeibullDistribution.html">Wolfram Mathworld: Weibull Distribution</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/WeibullDistribution.html">Commons Javadoc: WeibullDistribution</a>

- int -> Weibull(double: alpha, double: beta, String... mods) -> double
- long -> Weibull(double: alpha, double: beta, String... mods) -> double

## Zipf

See <a href="https://en.wikipedia.org/wiki/Zipf's_law">Wikipedia: Zipf's Law</a>

See <a href="https://commons.apache.org/proper/commons-statistics/commons-statistics-distribution/apidocs/org/apache/commons/statistics/distribution/ZipfDistribution.html">Commons JavaDoc: ZipfDistribution</a>

- int -> Zipf(int: numberOfElements, double: exponent, String... modslist) -> int
- int -> Zipf(int: numberOfElements, double: exponent, String... modslist) -> long
- long -> Zipf(int: numberOfElements, double: exponent, String... modslist) -> int
- long -> Zipf(int: numberOfElements, double: exponent, String... modslist) -> long


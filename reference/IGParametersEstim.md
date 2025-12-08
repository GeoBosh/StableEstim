# Estimate parameters of stable laws by Kogon and McCulloch methods

Kogon regression method is used together with the McCulloch quantile
method to provide initial estimates of parameters of stable
distributions.

## Usage

``` r
IGParametersEstim(x, pm = 0, ...)
```

## Arguments

- x:

  data used to perform the estimation: vector of length n.

- pm:

  parametrisation, an integer (0 or 1); default: `pm = 0` (Nolan's ‘S0’
  parametrisation).

- ...:

  other arguments. Currently not used.

## Details

The parameters \\\gamma\\ and \\\delta\\ are estimated using the
McCulloch(1986) quantile method from fBasics. The data is rescaled using
those estimates and used to perform the Kogon regression method to
estimate \\\alpha\\ and \\\beta\\.

## Value

a vector of length 4 containing the estimates of the 4 parameters.

## References

Kogon SM and Williams DB (1998). “Characteristic function based
estimation of stable distribution parameters.” *A practical guide to
heavy tailed data*, pp. 311–335. McCulloch JH (1986). “Simple consistent
estimators of stable distribution parameters.” *Communications in
Statistics-Simulation and Computation*, **15**(4), pp. 1109–1136.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md),
[`McCullochParametersEstim`](https://geobosh.github.io/StableEstim/reference/McCullochParametersEstim.md)

## Examples

``` r
x <- rstable(200, 1.2, 0.5, 1, 0, pm = 0)
IGParametersEstim(x, pm = 0)
#>     alpha      beta     gamma     delta 
#> 1.1860378 0.5784942 0.9124637 0.0211270 
```

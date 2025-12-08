# Quantile-based method

McCulloch quantile-based method.

## Usage

``` r
McCullochParametersEstim(x)
```

## Arguments

- x:

  data used to perform the estimation: vector of length n.

## Details

`McCullochParametersEstim` is a wrapper for function `.qStableFit` from
package fBasics.

## Value

`numeric` of length 4, represening the values of the 4 parameters

## References

McCulloch JH (1986). “Simple consistent estimators of stable
distribution parameters.” *Communications in Statistics-Simulation and
Computation*, **15**(4), pp. 1109–1136.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md),
[`IGParametersEstim`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md)

## Examples

``` r
set.seed(333)
x <- rstable(500, 1.3, 0.4, 1, 0)
McCullochParametersEstim(x)
#>     alpha      beta     gamma     delta 
#> 1.2280000 0.3910000 0.9498760 0.0353745 
```

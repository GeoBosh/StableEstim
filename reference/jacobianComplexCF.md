# Jacobian of the characteristic function of stable laws

Numeric jacobian of the characteristic function (CF) as a function of
the parameter \\\theta\\ evaluated at a specific (vector) point `t` and
a given value \\\theta\\.

## Usage

``` r
jacobianComplexCF(t, theta, pm = 0)
```

## Arguments

- t:

  vector of (real) numbers where the jacobian of the CF is evaluated;
  numeric.

- theta:

  vector of parameters of the stable law; vector of length 4.

- pm:

  parametrisation, an integer (0 or 1); default: `pm = 0` (Nolan's ‘S0’
  parametrisation).

## Details

The numerical derivation is obtained by a call to the function
`jacobian` from package numDeriv. We have set up its arguments by
default and the user is not given the option to modify them.

## Value

a matrix `length(t)` \\\times \\ 4 of complex numbers.

## See also

[`ComplexCF`](https://geobosh.github.io/StableEstim/reference/ComplexCF.md)

## Examples

``` r
## define the parameters
nt <- 10
t <- seq(0.1, 3, length.out = nt)
theta <- c(1.5, 0.5, 1, 0)
pm <- 0

## Compute the jacobian of the characteristic function
jack_CF <- jacobianComplexCF(t = t, theta = theta, pm = pm)
```

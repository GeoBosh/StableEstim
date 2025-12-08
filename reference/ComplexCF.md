# Compute the characteristic function of stable laws

Theoretical characteristic function (CF) of stable laws under
parametrisation ‘S0’ or ‘S1’. See Nolan (2013) for more details.

## Usage

``` r
ComplexCF(t, theta, pm = 0)
```

## Arguments

- t:

  vector of (real) numbers where the CF is evaluated; numeric.

- theta:

  vector of parameters of the stable law; vector of length 4.

- pm:

  parametrisation, an integer (0 or 1); default: `pm = 0` (Nolan's ‘S0’
  parametrisation).

## Details

For more details about the different parametrisation of the CF, see
*Nolan(2012)*.

## Value

vector of complex numbers with dimension `length(t)`.

## References

Nolan JP (2012). *Stable Distributions - Models for Heavy Tailed Data*.
Birkhauser, Boston. In progress, Chapter 1 online at
academic2.american.edu/\\\sim\\jpnolan.

## See also

[`jacobianComplexCF`](https://geobosh.github.io/StableEstim/reference/jacobianComplexCF.md)

## Examples

``` r
## define the parameters
nt <- 10
t <- seq(0.1, 3, length.out = nt)
theta <- c(1.5, 0.5, 1, 0)
pm <- 0

## Compute the characteristic function
CF <- ComplexCF(t = t, theta = theta, pm = pm)
CF
#>  [1] 0.968305811+0.033117936i 0.757986409+0.056143306i 0.525387123+0.026851945i
#>  [4] 0.332271933-0.005812349i 0.193104300-0.024061787i 0.102956859-0.027785107i
#>  [7] 0.049972446-0.023103095i 0.021746183-0.015850609i 0.008231545-0.009409216i
#> [10] 0.002521428-0.004930514i
```

# First root of the empirical characteristic function

Computes the first root of the real part of the empirical characteristic
function.

## Usage

``` r
ComputeFirstRootRealeCF(x, ..., tol = 0.001, maxIter = 100,
                        lowerBand = 1e-04, upperBand = 30)
```

## Arguments

- x:

  data used to perform the estimation: vector of length n.

- ...:

  other arguments to pass to the optimisation function.

- tol:

  tolerance to accept the solution; default = 1e-3.

- maxIter:

  maximum number of iteration in the Welsh algorithm; default = 100.

- lowerBand:

  lower band of the domain where the graphical seach is performed;
  default = 1e-4.

- upperBand:

  Lower band of the domain where the graphical seach is performed;
  default = 30.

## Details

The Welsh algorithm is first applied. If it fails to provide a
satisfactory value (`< tol`), a graphical/ numerical approach is used.
We first plot the real part of the eCF vs t in order to determine the
first zero directly and use it as the initial guess of a numerical
minimisation routine.

## Value

`numeric`: first zero of the real part of the eCF.

## References

Welsh AH (1986). “Implementing empirical characteristic function
procedures.” *Statistics & probability letters*, **4**(2), 65–67.

## See also

[`ComplexCF`](https://geobosh.github.io/StableEstim/reference/ComplexCF.md)

## Examples

``` r
set.seed(345)
x <- rstable(500, 1.5, 0.5)
ComputeFirstRootRealeCF(x)
#> [1] 2.302698
```

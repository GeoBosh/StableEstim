# Maximum likelihood (ML) method

Uses the numerical ML approach described by Nolan to estimate the 4
parameters of stable law. The method may be slow for large sample size
due to the use of numerical optimisation routine.

## Usage

``` r
MLParametersEstim(x, theta0 = NULL, pm = 0, PrintTime = FALSE, ...)
```

## Arguments

- x:

  data used to perform the estimation: vector of length n.

- theta0:

  initial guess for the 4 parameters values: If `NULL`, the
  Kogon-McCulloch method is called, see
  [`IGParametersEstim`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md);
  a vector of length 4.

- pm:

  parametrisation, an integer (0 or 1); default: `pm=0` (Nolan's ‘S0’
  parametrisation).

- PrintTime:

  logical flag; if set to TRUE, the estimation duration is printed out
  to the screen in a readable format (h/min/sec).

- ...:

  Other argument to be passed to the optimisation function.

## Details

The function performs the minimisation of the numerical (-)log-density
of stable laws computed by function `dstable` from package stabledist.

After testing several optimisation routines, we have found out that the
`"L-BFGS-B"` algorithm performs better with the ML method (faster, more
accurate).

## Value

a list with the following elements:

- Estim :

  output of the optimisation function,

- duration:

  estimation duration in a numerical format,

- method:

  `character` describing the method used.

## References

Nolan J (2001). “Maximum likelihood estimation and diagnostics for
stable distributions.” *L'evy processes: theory and applications*, pp.
379–400.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md)

## Examples

``` r
theta <- c(1.5, 0.4, 1, 0)
pm <- 0
## 50 points does not give accurate estimation
## but it makes estimation fast for installation purposes
## use at least 200 points to get decent results.
set.seed(1333)
x <- rstable(50, theta[1], theta[2], theta[3], theta[4], pm)

## This example takes > 30 sec hence commented out
if (FALSE) { # \dontrun{
  ML <- MLParametersEstim(x = x, pm = pm, PrintTime = TRUE)
} # }
## see the Examples folder for more examples.
```

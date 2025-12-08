# Integral outer product of random vectors

Computes the integral outer product of two possibly complex random
vectors.

## Usage

``` r
IntegrateRandomVectorsProduct(f_fct, X, g_fct, Y, s_min, s_max,
                              subdivisions = 50,
                              method = c("Uniform", "Simpson"),
                              randomIntegrationLaw = c("norm","unif"),
                              ...)
```

## Arguments

- f_fct:

  function object with signature `f_fct=function(s,X)` and returns a
  matrix \\ns \times nx\\ where nx=`length(X)` and ns=`length(s)`; `s`
  is the points where the integrand is evaluated.

- X:

  random vector where the function `f_fct` is evaluated. See Details.

- g_fct:

  function object with signature `g_fct=function(s,Y)` and returns a
  matrix \\ns \times ny\\ where ny=`length(Y)` and ns=`length(s)`; `s`
  is the points where the integrand is evaluated.

- Y:

  random vector where the function `g_fct` is evaluated. See Details.

- s_min,s_max:

  limits of integration. Should be finite.

- subdivisions:

  maximum number of subintervals.

- method:

  numerical integration rule, one of `"uniform"` (fast) or `"Simpson"`
  (more accurate quadratic rule).

- randomIntegrationLaw:

  Random law pi(s) to be applied to the Random product vector, see
  Details. Choices are `"unif"` (uniform) and `"norm"` (normal
  distribution).

- ...:

  other arguments to pass to random integration law. Mainly, the mean
  (`mu`) and standard deviation (`sd`) of the normal law.

## Details

The function computes the \\nx \times ny\\ matrix \\C =
\int\_{s\_{min}}^{s\_{max}} f_s(X) g_s(Y) \pi(s) ds\\, such as the one
used in the objective function of the Cgmm method. This is essentially
an outer product with with multiplication replaced by integration.

There is no function in R to compute vectorial integration and computing
\\C\\ element by element using `integrate` may be very slow when
`length(X)` (or `length(y)`) is large.

The function allows complex vectors as its integrands.

## Value

an \\nx \times ny\\ matrix \\C\\ with elements: \$\$c\_{ij} =
\int\_{s\_{min}}^{s\_{max}} f_s(X_i) g_s(Y_j) \pi(s) ds . \$\$

## Examples

``` r
## Define the integrand
f_fct <- function(s, x) {
    sapply(X = x, FUN = sampleComplexCFMoment, t = s, theta = theta)
}
f_bar_fct <- function(s, x) Conj(f_fct(s, x))

## Function specific arguments
theta <- c(1.5, 0.5, 1, 0)
set.seed(345)
X <- rstable(3, 1.5, 0.5, 1, 0)
s_min <- 0;
s_max <- 2
numberIntegrationPoints <- 10
randomIntegrationLaw <- "norm"

Estim_Simpson <-
    IntegrateRandomVectorsProduct(f_fct, X, f_bar_fct, X, s_min, s_max, 
                                  numberIntegrationPoints, 
                                  "Simpson", randomIntegrationLaw)
Estim_Simpson
#>                       [,1]                  [,2]                  [,3]
#> [1,] 0.18350577+0.0000000i 0.18998639+0.0282428i 0.08004621-0.1248522i
#> [2,] 0.18998639-0.0282428i 0.20150135+0.0000000i 0.06272407-0.1402916i
#> [3,] 0.08004621+0.1248522i 0.06272407+0.1402916i 0.12578873+0.0000000i
```

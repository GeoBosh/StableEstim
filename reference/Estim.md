# Estimate parameters of stable laws

Estimates the four parameters of stable distributions using one of the
methods implemented in StableEstim. This is the main user-level function
but the individul methods are available also as separate functions.

## Usage

``` r
Estim(EstimMethod = c("ML", "GMM", "Cgmm","Kout"), data, theta0 = NULL,
      ComputeCov = FALSE, HandleError = TRUE, ...)
```

## Arguments

- EstimMethod:

  Estimation method to be used, one of `"ML"` (maximum likelihood,
  default), `"GMM"` (generalised method of moment with finite moment
  conditions), `"Cgmm"` (GMM with continuum moment conditions), and
  `"Kout"` (Koutrouvelis regression method).

- data:

  Data used to perform the estimation, a numeric vector.

- theta0:

  Initial values for the 4 parameters. If `NULL` (default), initial
  values are computed using the fast Kogon-McCulloch method, see
  [`IGParametersEstim`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md);
  vector of length 4.

- ComputeCov:

  Logical flag: if `TRUE`, the asymptotic covariance matrix (4x4) is
  computed (except for the Koutrouvelis method).

- HandleError:

  Logical flag: if `TRUE` and if an error occurs during the estimation
  procedure, the computation will carry on and `NA` will be returned.
  Useful for Monte Carlo simulations, see
  [`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md).

- ...:

  Other arguments to be passed to the estimation function, such as the
  asymptotic confidence level, see Details.

## Details

`Estim` is the main estimation function in package StableEstim.

This function should be used in priority for estimation purpose as it
provides more information about the estimator. However, user needs to
pass the appropriate parameters to the selected method in `...`. See the
documentation of the selected method.

**Asymptotic Confidence Intervals**: The *normal* asymptotic confidence
intervals (CI) are computed. The user can set the *level* of confidence
by inputing the `level` argument (in the `"\dots"`); default
`level=0.95`. The theoretical justification for asymptotic normal CI can
be found in the references for the individual methods. Note the CI's are
not computed for the Koutrouvelis regression method.

## Value

an object of class `Estim`, see
[`Estim-class`](https://geobosh.github.io/StableEstim/reference/Estim-class.md)
for more details

## See also

[`CgmmParametersEstim`](https://geobosh.github.io/StableEstim/reference/CgmmParamsEstim.md),
[`GMMParametersEstim`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md),
[`MLParametersEstim`](https://geobosh.github.io/StableEstim/reference/MLParametersEstim.md),
[`KoutParametersEstim`](https://geobosh.github.io/StableEstim/reference/KoutParamsEstim.md)
for the individual estimation methods;

[`IGParametersEstim`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md)
for fast computation of initial values.

## Examples

``` r
## general inputs
theta <- c(1.45, 0.55, 1, 0)
pm <- 0
set.seed(2345)
x <- rstable(200, theta[1], theta[2], theta[3], theta[4], pm)

objKout <- Estim(EstimMethod = "Kout", data = x, pm = pm, 
                     ComputeCov = FALSE, HandleError = FALSE, 
                     spacing = "Kout")
```

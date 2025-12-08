# Installing StableEstim

The [latest stable
version](https://cran.r-project.org/package=StableEstim) is on CRAN.

``` R
install.packages("StableEstim")
```

You can install the [development
version](https://github.com/GeoBosh/StableEstim) of `StableEstim` from
Github:

``` R
library(devtools)
install_github("GeoBosh/StableEstim")
```

# Overview

A collection of methods to estimate the four parameters of stable
distributions. The package also provides functions to compute
characteristic functions and tools to run Monte Carlo simulations.

The main functions of package `StableEstim` are briefly described below:

- main function:
  [`Estim()`](https://geobosh.github.io/StableEstim/reference/Estim.md)
  estimates the parameters by various methods. Also gives the associated
  asymptotic properties of the estimators.

- estimation functions for specific methods: these functions are called
  by
  [`Estim()`](https://geobosh.github.io/StableEstim/reference/Estim.md)
  but can be used directly, as well. The methods provided so far are:

  - the maximum-likelihood
    ([`MLParametersEstim()`](https://geobosh.github.io/StableEstim/reference/MLParametersEstim.md)),

  - the generalised method of moments with a finite
    ([`GMMParametersEstim()`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md))
    or continuum moment conditions
    ([`CgmmParametersEstim()`](https://geobosh.github.io/StableEstim/reference/CgmmParamsEstim.md)),

  - the iterative Koutrouvelis regression method
    ([`KoutParametersEstim()`](https://geobosh.github.io/StableEstim/reference/KoutParamsEstim.md)),

  - the fast Kogon-McCulloch method used for first guess estimation
    (`IGParametersEstim`).

- characteristic function: the characteristic function
  ([`ComplexCF()`](https://geobosh.github.io/StableEstim/reference/ComplexCF.md))
  and its Jacobian
  ([`jacobianComplexCF()`](https://geobosh.github.io/StableEstim/reference/jacobianComplexCF.md))
  can be computed and will return a vector (respectively a matrix) of
  complex numbers.

- Monte Carlo simulation: a tool to run a Monte Carlo simulation
  ([`Estim_Simulation()`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md))
  is provided and can save output files and/or produce statistical
  summary.

The package is developed by Tarak Kharrat and Georgi N.Boshnakov.

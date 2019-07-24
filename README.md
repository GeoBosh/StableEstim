[![CRANStatusBadge](http://www.r-pkg.org/badges/version/StableEstim)](https://cran.r-project.org/package=StableEstim)

# Installing StableEstim

The [latest stable version](https://cran.r-project.org/package=StableEstim) is on
CRAN.

    install_packages("StableEstim")

You can install the [development version](https://github.com/GeoBosh/StableEstim) of
`StableEstim` from Github:

    library(devtools)
    install_github("GeoBosh/StableEstim")


# Overview

A collection of methods to estimate the four parameters of stable
distributions. The package also provides functions to compute
characteristic functions and tools to run Monte Carlo simulations.

The main functions of package `StableEstim` are briefly described below:


* main function: `Estim()` gives the estimated parameters and the
  asymptotic properties of the estimator.

* estimation function: the methods provided so far are the
  maximum-likelihood (`MLParametersEstim()`), the generalised method
  of moment with a finite (`GMMParametersEstim()`) or continuum moment
  conditions (`CgmmParametersEstim()`), the iterative Koutrouvelis
  regression method (`KoutParametersEstim()`) and the fast
  Kogon-McCulloch method used for first guess estimation
  (`IGParametersEstim`).
      
* characteristic function: the characteristic function (`ComplexCF()`)
  and its Jacobian (`jacobianComplexCF()`) can be computed and will
  return a vector (respectively a matrix) of complex numbers.

* Monte Carlo simulation: a tool to run a Monte Carlo simulation
  (`Estim_Simulation()`) is provided and can save output files and/or
  produce statistical summary.



The package is developed by Tarak Kharrat and Georgi N.Boshnakov.

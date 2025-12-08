# Stable law estimation functions

A collection of methods to estimate the four parameters of stable laws.
The package also provides functions to compute the characteristic
function and tools to run Monte Carlo simulations.

## Details

The main functions of the package are briefly described below:

- main function::

  [`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md) is
  the most useful function of the package. It estimates of the
  parameters and the asymptotic properties of the estimators.

- estimation function::

  the methods provided so far are the maximum-likelihood
  ([`MLParametersEstim`](https://geobosh.github.io/StableEstim/reference/MLParametersEstim.md)),
  the generalised method of moment with finite
  ([`GMMParametersEstim`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md))
  or continuum
  ([`CgmmParametersEstim`](https://geobosh.github.io/StableEstim/reference/CgmmParamsEstim.md))
  moment conditions, the iterative Koutrouvelis regression method
  ([`KoutParametersEstim`](https://geobosh.github.io/StableEstim/reference/KoutParamsEstim.md))
  and the fast Kogon-McCulloch method used for first guess estimation
  ([`IGParametersEstim`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md)).

- characteristic function::

  the characteristic function
  ([`ComplexCF`](https://geobosh.github.io/StableEstim/reference/ComplexCF.md))
  and its Jacobian
  ([`jacobianComplexCF`](https://geobosh.github.io/StableEstim/reference/jacobianComplexCF.md))
  can be computed and will return a vector (respectively a matrix) of
  complex numbers.

- Monte Carlo simulation:

  [`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md)
  is a tool to run Monte Carlo simulations with flexible options to
  select the estimation method, the Monte Carlo control parameters,
  compute statistical summaries or save results to a file.

## Author

Tarak Kharrat, Georgi N. Boshnakov

## Note

Version 1 of this package had a somewhat restricted license since it
needed package akima in some computations.

In version 2 of the package we implemented a 2D interpolation routine
and removed the dependency on akima. Therefore, StableEstim is now under
GPL license. The package is related to upcoming work by the authors
where the different methods are compared using MC simulations.

## See also

`fBasics:::.mleStableFit`, `fBasics:::.qStableFit`

package stabledist

## References

Carrasco M and Florens J (2000). “Generalization of GMM to a continuum
of moment conditions.” *Econometric Theory*, **16**(06), pp. 797–834.

Carrasco M and Florens J (2002). “Efficient GMM estimation using the
empirical characteristic function.” *IDEI Working Paper*, **140**.

Carrasco M and Florens J (2003). “On the asymptotic efficiency of GMM.”
*IDEI Working Paper*, **173**.

Carrasco M, Chernov M, Florens J and Ghysels E (2007). “Efficient
estimation of general dynamic models with a continuum of moment
conditions.” *Journal of Econometrics*, **140**(2), pp. 529–573.

Carrasco M, Florens J and Renault E (2007). “Linear inverse problems in
structural econometrics estimation based on spectral decomposition and
regularization.” *Handbook of econometrics*, **6**, pp. 5633–5751.

Carrasco M and Kotchoni R (2010). “Efficient estimation using the
characteristic function.” Mimeo. University of Montreal.

Nolan J (2001). “Maximum likelihood estimation and diagnostics for
stable distributions.” *L'evy processes: theory and applications*, pp.
379–400.

Nolan JP (2012). *Stable Distributions - Models for Heavy Tailed Data*.
Birkhauser, Boston. In progress, Chapter 1 online at
academic2.american.edu/\\\sim\\jpnolan.

Hansen LP (1982). “Large sample properties of generalized method of
moments estimators.” *Econometrica: Journal of the Econometric Society*,
pp. 1029–1054.

Hansen LP, Heaton J and Yaron A (1996). “Finite-sample properties of
some alternative GMM estimators.” *Journal of Business & Economic
Statistics*, **14**(3), pp. 262–280.

Feuerverger A and McDunnough P (1981). “On efficient inference in
symmetric stable laws and processes.” *Statistics and Related Topics*,
**99**, pp. 109–112.

Feuerverger A and McDunnough P (1981). “On some Fourier methods for
inference.” *Journal of the American Statistical Association*,
**76**(374), pp. 379–387.

Schmidt P (1982). “An improved version of the Quandt-Ramsey MGF
estimator for mixtures of normal distributions and switching
regressions.” *Econometrica: Journal of the Econometric Society*, pp.
501–516.

Besbeas P and Morgan B (2008). “Improved estimation of the stable laws.”
*Statistics and Computing*, **18**(2), pp. 219–231.

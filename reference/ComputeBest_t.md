# Monte Carlo simulation to investigate the optimal number of points to use in the moment conditions

Runs Monte Carlo simulation for different values of \\\alpha\\ and
\\\beta\\ and computes a specified number of t-points that minimises the
determinant of the asymptotic covariance matrix.

## Usage

``` r
ComputeBest_t(AlphaBetaMatrix = abMat, nb_ts = seq(10, 100, 10),
              alphaReg = 0.001, FastOptim = TRUE, ...)
```

## Arguments

- AlphaBetaMatrix:

  values of the parameter \\\alpha\\ and \\\beta\\ from which we
  simulate the data. By default, the values of \\\gamma\\ and \\\delta\\
  are set to 1 and 0, respectively; a \\2 \times n\\ matrix.

- nb_ts:

  vector of numbers of t-points to use for the minimisation; default =
  `seq(10, 100, 10)`.

- alphaReg:

  value of the regularisation parameter; numeric, default = 0.001.

- FastOptim:

  Logical flag; if set to TRUE, `optim` with "Nelder-Mead" method is
  used (fast but not accurate). Otherwise, `nlminb` is used (more
  accurate but slower).

- ...:

  Other arguments to pass to the optimisation function.

## Value

a `list` containing slots from class
[`Best_t-class`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)
corresponding to one value of the parameters \\\alpha\\ and \\\beta\\.

## See also

[`ComputeBest_tau`](https://geobosh.github.io/StableEstim/reference/ComputeBest_tau.md),
[`Best_t-class`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)

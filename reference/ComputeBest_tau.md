# Run Monte Carlo simulation to investigate the optimal \\\tau\\

Runs Monte Carlo simulation to investigate the optimal number of points
to use when one of the reduced spacing schemes is considered.

## Usage

``` r
ComputeBest_tau(AlphaBetaMatrix = abMat, nb_ts = seq(10, 100, 10),
                tScheme = c("uniformOpt", "ArithOpt"),
                Constrained = TRUE, alphaReg = 0.001, ...)
```

## Arguments

- AlphaBetaMatrix:

  values of the parameter \\\alpha\\ and \\\beta\\ from which we
  simulate the data. By default, the values of \\\gamma\\ and \\\delta\\
  are set to 1 and 0, respectively; a \\2 \times n\\ matrix.

- nb_ts:

  vector of number of t-points to use for the minimisation; default =
  `seq(10,100,10)`.

- tScheme:

  scheme used to select the points where the moment conditions are
  evaluated, one of `"uniformOpt"` (uniform optimal placement) and
  `"ArithOpt"` (arithmetic optimal placement). See function
  [`GMMParametersEstim`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md).

- Constrained:

  logical flag: if set to True, lower and upper bands will be computed
  as discussed for function
  [`GMMParametersEstim`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md).

- alphaReg:

  value of the regularisation parameter; numeric, default = 0.001.

- ...:

  Other arguments to pass to the optimisation function.

## Value

a `list` containing slots from class
[`Best_t-class`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)
corresponding to one value of the parameters \\\alpha\\ and \\\beta\\.

## See also

[`ComputeBest_t`](https://geobosh.github.io/StableEstim/reference/ComputeBest_t.md),
[`Best_t-class`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)

# Estimate parameters of stable laws using a GMM method

Estimate parameters of stable laws using generalised method of moments
(GMM) with finite number of moment conditions. It uses a regularisation
technique to make the method more robust (when the number of moment
condition is large) and allows different schemes to select where the
moment conditions are computed.

## Usage

``` r
GMMParametersEstim(x, algo = c("2SGMM", "ITGMM", "CueGMM"),
                   alphaReg = 0.01,
                   regularization = c("Tikhonov", "LF", "cut-off"),
                   WeightingMatrix = c("OptAsym", "DataVar", "Id"),
                   t_scheme = c("equally", "NonOptAr", "uniformOpt",
                                "ArithOpt", "VarOpt", "free"),
                   theta0 = NULL,
                   IterationControl = list(),
                   pm = 0, PrintTime = FALSE, ...)
```

## Arguments

- x:

  data used to perform the estimation: vector of length n.

- algo:

  GMM algorithm: `"2SGMM"` is the two step GMM proposed by Hansen(1982).
  `"CueGMM"` and `"ITGMM"` are respectively the continuous updated and
  the iterative GMM proposed by Hansen, Eaton et Yaron (1996) and
  adapted to the continuum case.

- alphaReg:

  value of the regularisation parameter; numeric, default = 0.01.

- regularization:

  regularization scheme to be used, one of `"Tikhonov"` (Tikhonov),
  `"LF"` (Landweber-Fridmann) and `"cut-off"` (spectral cut-off). See
  [`RegularisedSol`](https://geobosh.github.io/StableEstim/reference/RegularisedSol.md).

- WeightingMatrix:

  type of weighting matrix used to compute the objective function, one
  of `"OptAsym"` (the optimal asymptotic), `"DataVar"` (the data driven)
  and `"Id"` (the identity matrix). See Details.

- t_scheme:

  scheme used to select the points where the moment conditions are
  evaluated, one of `"equally"` (equally placed), `"NonOptAr"` (non
  optimal arithmetic placement), `"uniformOpt"` (uniform optimal
  placement), `"ArithOpt"` (arithmetic optimal placement), `"Var Opt"`
  (optimal variance placement) and `"free"` (users need to pass their
  own set of points in `...`). See Details.

- theta0:

  initial guess for the 4 parameters values: if `NULL`, the
  Kogon-McCulloch method is called, see
  [`IGParametersEstim`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md);
  vector of length 4.

- IterationControl:

  only used if `type = "IT"` or `type = "Cue"` to control the
  iterations. See Details.

- pm:

  parametrisation, an integer (0 or 1); default: `pm = 0` (Nolan's ‘S0’
  parametrisation).

- PrintTime:

  logical flag; if set to TRUE, the estimation duration is printed out
  to the screen in a readable format (h/min/sec).

- ...:

  other arguments to pass to the regularisation function, the
  optimisation function or the selection scheme (including the function
  that finds the first zero of the eCF). See Details.

## Details

**The moment conditions**

The moment conditions are given by: \$\$g_t(X,\theta) = g(t,X;\theta)=
e^{itX} - \phi\_{\theta}(t)\$\$ If one has a sample \\x_1,\dots,x_n\\ of
i.i.d realisations of the same random variable \\X\\, then:
\$\$\hat{g}\_n(t,\theta) = \frac{1}{n}\sum\_{i=1}^n g(t,x_i;\theta) =
\phi_n(t) -\phi\_\theta(t),\$\$ where \\\phi_n(t)\\ is the eCF
associated to the sample \\x_1,\dots,x_n\\, and defined by \\\phi_n(t)=
\frac{1}{n} \sum\_{j=1}^n e^{itX_j}\\.

**Objective function**

\$\$obj{\theta} = \< K^{-1/2}
\hat{g}\_n(.;\theta),K^{-1/2}\hat{g}\_n(.;\theta)\>,\$\$ where
\\K^{-1}f\\ denotes the solution \\\varphi\\ (when it exists) of the
equation \\K \varphi=f\\ and \\K^{-1/2}=(K^{-1})^{1/2}\\. The optimal
choice of the Weighting operator K (a matrix in the GMM case) and its
estimation are discussed in Hansen (1982).

**Weighting operator (Matrix)**

- `OptAsym`::

  the optimal asymptotic choice as described by Hansen. The expression
  of the components of this matrix could be found for example in
  Feuerverger and McDunnough (1981b).

- `DataVar`::

  the covariance matrix of the data provided.

- `Id`::

  the identity matrix.

**the t-scheme**

One of the most important features of this method is that it allows the
user to choose how to place the points where the moment conditions are
evaluated. The general rule is that users can provide their own set of
points (option `"free"`) or choose one of the other schemes. In the
latter case they *need to specify the number of points* `nb_t` in
argument `"\dots"` and eventually the lower and upper limit (by setting
`Constrained` to FALSE and providing `min_t` and `max_t`) in the
non-optimised case. If one of the optimised cases is selected, setting
`Constrained` to FALSE will not constrain the choice of \\\tau\\, see
below. We mean by optimised set of point, the set that minimises the
(determinant) of the asymptotic covariance matrix as suggested by
Schmidt (1982) and Besbeas and Morgan (2008).

6 options have been implemented:

- `"equally"`::

  equally placed points in \[`min_t`,`max_t`\]. When provided, user's
  `min_t` and `max_t` will be used (when `Coinstrained = FALSE`).
  Otherwise, `eps` and `An` will be used instead (where `An` is the
  first zero of the eCF).

- `"NonOptAr"`::

  non optimal arithmetic placement: \\t_j =
  \frac{j(j+1)}{nbt(nbt+1)}(max-eps); j=1,\dots,nbt\\, where \\max\\ is
  the upper band of the set of points selected as discussed before.

- `"uniformOpt"`::

  uniform optimal placement: \\t_j=j \tau, j=1,\dots, nbt\\

- `"ArithOpt"`::

  arithmetic optimal placement: \\t_j=j(j+1) \tau, j=1,\dots nbt\\

- `"Var Opt"`::

  optimal variance placement as explained above.

- `"free"`::

  user needs to pass his own set of points in `"\dots"`.

For the `"ArithOpt"` and `"uniformOpt"` schemes, the function to
minimise is seen as a function of the real parameter \\\tau\\ instead of
doing a vectorial optimisition as in the `"Var Opt"` case. In the latter
case, one can choose between a fast (but less accurate) optimisation
routine or a slow (but more accurate) one by setting the `FastOptim`
flag to the desired value.

**The IterationControl**

If `type = "IT"` or `type = "Cue"` the user can control each iteration
by setting up the `list` `IterationControl` which contains the following
elements:

- `NbIter`::

  maximum number of iteration. The loop stops when `NBIter` is reached;
  default = 10.

- `PrintIterlogical`::

  if set to TRUE, the value of the current parameter estimation is
  printed to the screen at each iteration; default = TRUE.

- `RelativeErrMax`::

  the loop stops if the relative error between two consecutive
  estimation steps is smaller than `RelativeErrMax`; default = 1e-3.

## Value

a list with the following elements:

- Estim:

  output of the optimisation function.

- duration:

  estimation duration in a numerical format.

- method:

  `character` describing the method used.

- tEstim:

  final set of points selected for the estimation. Only relevant when
  one of the optimisation scheme is selected.

## References

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

## Note

`nlminb` was used for the minimisation of the GMM objective funcion and
to compute \\tau\\ in the `"uniformOpt"` and `"ArithOpt"` schemes. In
the `"Var Opt"` scheme, `optim` was preferred. All those routines have
been selected after running different tests using the summary table
produced by package optimx for comparing the performance of different
optimisation methods.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md),
[`CgmmParametersEstim`](https://geobosh.github.io/StableEstim/reference/CgmmParamsEstim.md)

## Examples

``` r
## General data
theta <- c(1.5, 0.5, 1, 0)
pm <- 0
set.seed(345);
x <- rstable(100, theta[1], theta[2], theta[3], theta[4], pm)
##---------------- 2S free ----------------
## method specific arguments
regularization <- "cut-off"
WeightingMatrix <- "OptAsym"
alphaReg <- 0.005
t_seq <- seq(0.1, 2, length.out = 12)

## If you are just interested by the value
## of the 4 estimated parameters
t_scheme = "free"

algo = "2SGMM"
suppressWarnings(GMMParametersEstim(
    x = x, algo = algo, alphaReg = alphaReg, 
    regularization = regularization, 
    WeightingMatrix = WeightingMatrix, 
    t_scheme = t_scheme, 
    pm = pm, PrintTime = TRUE, t_free = t_seq))
#> [1] "GMMParametersEstim_2SGMM_free :duration= 0  h, 0  min, 0  sec. "
#> $Estim
#> $Estim$par
#>      alpha                 gamma      delta 
#>  1.4357577  0.8210212  1.0040717 -0.1286401 
#> 
#> $Estim$objective
#> [1] 0.1689458
#> 
#> $Estim$convergence
#> [1] 0
#> 
#> $Estim$iterations
#> [1] 9
#> 
#> $Estim$evaluations
#> function gradient 
#>       10       56 
#> 
#> $Estim$message
#> [1] "relative convergence (4)"
#> 
#> 
#> $duration
#> elapsed 
#>   0.092 
#> 
#> $method
#> [1] "2SGMM_nb_t=12_alphaReg=0.005_regularization=cut-off_WeightingMatrix=OptAsym_t_scheme=free_OptimAlgo=nlminb"
#> 
#> $tEstim
#>  [1] 0.1000000 0.2727273 0.4454545 0.6181818 0.7909091 0.9636364 1.1363636
#>  [8] 1.3090909 1.4818182 1.6545455 1.8272727 2.0000000
#> 

## algo = "CueGMM"
GMMParametersEstim(
    x = x, algo = "CueGMM", alphaReg = alphaReg, 
    regularization = regularization, 
    WeightingMatrix = WeightingMatrix, 
    t_scheme = t_scheme, 
    pm = pm, PrintTime = TRUE, t_free = t_seq)
#> [1] "---------------iteration  0 / 10 ------------------------ ( 1.41379384683587 , 0.999 , 1.03766143510207 , -0.148849417971229 )"
#>  
#> [1] "---------------iteration  1 / 10 ------------------------ ( 1.41379384683587 , 0.999 , 1.03766143510207 , -0.148849417971229 )"
#>  
#> [1] "GMMParametersEstim_CueGMM_free :duration= 0  h, 0  min, 1  sec. "
#> $Estim
#> $Estim$par
#>      alpha                 gamma      delta 
#>  1.4137938  0.9990000  1.0376614 -0.1488494 
#> 
#> $Estim$objective
#> [1] 0.05112931
#> 
#> $Estim$convergence
#> [1] 0
#> 
#> $Estim$iterations
#> [1] 1
#> 
#> $Estim$evaluations
#> function gradient 
#>        2        4 
#> 
#> $Estim$message
#> [1] "both X-convergence and relative convergence (5)"
#> 
#> 
#> $duration
#> elapsed 
#>    0.52 
#> 
#> $method
#> [1] "CueGMM_nb_t=12_alphaReg=0.005_regularization=cut-off_WeightingMatrix=OptAsym_t_scheme=free_OptimAlgo=nlminb"
#> 
#> $tEstim
#>  [1] 0.1000000 0.2727273 0.4454545 0.6181818 0.7909091 0.9636364 1.1363636
#>  [8] 1.3090909 1.4818182 1.6545455 1.8272727 2.0000000
#> 
```

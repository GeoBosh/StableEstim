# Estimate parameters of stable laws using a Cgmm method

Estimate the four parameters of stable laws using generalised method of
moments based on a continuum of complex moment conditions (Cgmm) due to
Carrasco and Florens. Those moments are computed by matching the
characteristic function with its sample counterpart. The resulting
(ill-posed) estimation problem is solved by a regularisation technique.

## Usage

``` r
CgmmParametersEstim(x, type = c("2S", "IT", "Cue"), alphaReg = 0.01,
                    subdivisions = 50,
                    IntegrationMethod = c("Uniform", "Simpson"),
                    randomIntegrationLaw = c("unif", "norm"),
                    s_min = 0, s_max = 1,
                    theta0 = NULL,
                    IterationControl = list(),
                    pm = 0, PrintTime = FALSE,...)
```

## Arguments

- x:

  Data used to perform the estimation: a vector of length n.

- type:

  Cgmm algorithm: `"2S"` is the two steps GMM proposed by Hansen(1982).
  `"Cue"` and `"IT"` are respectively the continuous updated and the
  iterative GMM proposed by Hansen, Eaton et Yaron (1996) and adapted to
  the continuum case.

- alphaReg:

  Value of the regularisation parameter; numeric, default = 0.01.

- subdivisions:

  Number of subdivisions used to compute the different integrals
  involved in the computation of the objective function (to minimise);
  numeric.

- IntegrationMethod:

  Numerical integration method to be used to approximate the (vectorial)
  integrals. Users can choose between `"Uniform"` discretization or the
  `"Simpson"`'s rule (the 3-point Newton-Cotes quadrature rule).

- randomIntegrationLaw:

  Probability measure associated to the Hilbert space spanned by the
  moment conditions. See Carrasco and Florens (2003) for more details.

- s_min,s_max:

  Lower and Upper bounds of the interval where the moment conditions are
  considered; numeric.

- theta0:

  Initial guess for the 4 parameters values: vector of length 4.

- IterationControl:

  Only used with `type = "IT"` or `type = "Cue"` to control the
  iterations, see Details.

- pm:

  Parametrisation, an integer (0 or 1); default: `pm = 0` (Nolan's ‘S0’
  parametrisation).

- PrintTime:

  Logical flag; if set to TRUE, the estimation duration is printed out
  to the screen in a readable format (h/min/sec).

- ...:

  Other arguments to be passed to the optimisation function and/or to
  the integration function.

## Details

**The moment conditions** The moment conditions are given by:
\$\$g_t(X,\theta)=g(t,X;\theta)= e^{itX} - \phi\_{\theta}(t)\$\$ If one
has a sample \\x_1,\dots,x_n\\ of i.i.d realisations of the same random
variable \\X\\, then: \$\$\hat{g}\_n(t,\theta) =
\frac{1}{n}\sum\_{i=1}^n g(t,x_i;\theta) = \phi_n(t)
-\phi\_\theta(t),\$\$ where \\\phi_n(t)\\ is the eCF associated with the
sample \\x_1,\dots,x_n\\, defined by \\\phi_n(t)= \frac{1}{n}
\sum\_{j=1}^n e^{itX_j}\\. **Objective function**

Following Carrasco et al. (2007), Proposition 3.4 , the objective
function to minimise is given by:
\$\$obj(\theta)=\overline{\underline{v}^{\prime}}(\theta)\[\alpha\_{Reg}
\mathcal{I}\_n+C^2\]^{-1}\underline{v}(\theta)\$\$ where:

- \\\underline{v} = \[v_1,\ldots,v_n\]^{\prime}\\;:

  \\v_i(\theta) = \int_I \overline{g_i}(t;\hat{\theta}^1_n)
  \hat{g}(t;\theta) \pi(t) dt\\.

- \\I_n\\:

  is the identity matrix of size \\n\\.

- \\C\\:

  is a \\n \times n\\ matrix with \\(i,j)\\th element given by \\c\_{ij}
  = \frac{1}{n-4}\int_I \overline{g_i}(t;\hat{\theta}^1_n)
  g_j(t;\hat{\theta}^1_n) \pi(t) dt\\.

To compute \\C\\ and \\v_i()\\ we will use the function
[`IntegrateRandomVectorsProduct`](https://geobosh.github.io/StableEstim/reference/IntegrateRandomVectorsProduct.md).
**The IterationControl** If `type = "IT"` or `type = "Cue"`, the user
can control each iteration using argument `IterationControl`, which
should be a `list` which contains the following elements:

- `NbIter`::

  maximum number of iterations. The loop stops when `NBIter` is reached;
  default = 10.

- `PrintIterlogical`::

  if set to TRUE the values of the current parameter estimates are
  printed to the screen at each iteration; default = TRUE.

- `RelativeErrMax`::

  the loop stops if the relative error between two consecutive
  estimation steps is smaller then `RelativeErrMax`; default = 1e-3.

## Value

a list with the following elements:

- Estim:

  output of the optimisation function,

- duration:

  estimation duration in numerical format,

- method:

  `character` describing the method used.

## References

Carrasco M, Florens J (2000). “Generalization of GMM to a continuum of
moment conditions.” *Econometric Theory*, **16**(06), 797–834.

Carrasco M, Florens J (2002). “Efficient GMM estimation using the
empirical characteristic function.” *IDEI Working Paper*, **140**.

Carrasco M, Florens J (2003). “On the asymptotic efficiency of GMM.”
*IDEI Working Paper*, **173**.

Carrasco M, Chernov M, Florens J, Ghysels E (2007). “Efficient
estimation of general dynamic models with a continuum of moment
conditions.” *Journal of Econometrics*, **140**(2), 529–573.

Carrasco M, Kotchoni R (2010). “Efficient estimation using the
characteristic function.” Mimeo. University of Montreal.

## Note

`nlminb` as used to minimise the Cgmm objective function.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md),
[`GMMParametersEstim`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md),
[`IntegrateRandomVectorsProduct`](https://geobosh.github.io/StableEstim/reference/IntegrateRandomVectorsProduct.md)

## Examples

``` r
## general inputs
theta <- c(1.45, 0.55, 1, 0)
pm <- 0
set.seed(2345)
x <- rstable(50, theta[1], theta[2], theta[3], theta[4], pm)

## GMM specific params
alphaReg <- 0.01
subdivisions <- 20
randomIntegrationLaw <- "unif"
IntegrationMethod <- "Uniform"

## Estimation
twoS <- CgmmParametersEstim(x = x, type = "2S", alphaReg = alphaReg, 
                          subdivisions = subdivisions, 
                          IntegrationMethod = IntegrationMethod, 
                          randomIntegrationLaw = randomIntegrationLaw, 
                          s_min = 0, s_max = 1, theta0 = NULL, 
                          pm = pm, PrintTime = TRUE)
#> [1] "CgmmParametersEstim_2S :duration= 0  h, 0  min, 1  sec. "
twoS
#> $Estim
#> $Estim$par
#> [1]  1.3193378  0.6995646  0.7875786 -0.1791584
#> 
#> $Estim$all
#> $Estim$all$par
#>      alpha       beta      gamma      delta 
#>  1.3193378  0.6995646  0.7875786 -0.1791584 
#> 
#> $Estim$all$objective
#> [1] 0.02720932
#> 
#> $Estim$all$convergence
#> [1] 0
#> 
#> $Estim$all$iterations
#> [1] 9
#> 
#> $Estim$all$evaluations
#> function gradient 
#>       13       44 
#> 
#> $Estim$all$message
#> [1] "both X-convergence and relative convergence (5)"
#> 
#> 
#> 
#> $duration
#> [1] 0.943
#> 
#> $method
#> [1] "Cgmm_type=2S_alphaReg=0.01_OptimAlgo=nlminb_subdivisions=20_IntegrationMethod=Uniform_randomIntegrationLaw=unif_s_min=0_s_max=1"
#> 
```

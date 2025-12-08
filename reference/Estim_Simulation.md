# Monte Carlo simulation

Runs Monte Carlo simulation for a selected estimation method. The
function can save a file and produce a statistical summary.

## Usage

``` r
Estim_Simulation(AlphaBetaMatrix = abMat, SampleSizes = c(200, 1600),
                 MCparam = 100, Estimfct = c("ML", "GMM", "Cgmm","Kout"),
                 HandleError = TRUE, FctsToApply = StatFcts,
                 saveOutput = TRUE, StatSummary = FALSE,
                 CheckMat = TRUE, tolFailCheck = tolFailure,
                 SeedOptions=NULL, ...)
```

## Arguments

- AlphaBetaMatrix:

  values of the parameter \\\alpha\\ and \\\beta\\ from which we
  simulate the data. By default, the values of \\\gamma\\ and \\\delta\\
  are set to 1 and 0, respectively; a \\2 \times n\\ matrix.

- SampleSizes:

  sample sizes to be used to simulate the data. By default, we use `200`
  (small sample size) and `1600` (large sample size); vector of
  integers.

- MCparam:

  Number of Monte Carlo simulation for each couple of parameter, default
  = 100; an integer number.

- Estimfct:

  the estimation function to be used, one of `"ML"`, `"GMM"`, `"Cgmm"`
  or `"Kout"`.

- HandleError:

  logical flag: if set to TRUE, the simulation doesn't stop when an
  error in the estimation function is encountered. A vector of (size 4)
  `NA` is saved and the the simulation carries on. See details.

- FctsToApply:

  functions used to produce the statistical summary. See details; a
  character vector.

- saveOutput:

  logical flag: if set to TRUE, a csv file (for each couple of
  parameters \\\alpha\\ and \\\beta\\) with the the estimation
  information is saved in the current directory. See Details.

- StatSummary:

  logical flag: if set to TRUE, a statistical summary (using
  `FctsToApply`) is returned. See Details.

- CheckMat:

  logical flag: if set to TRUE, an estimation is declared failed if the
  squared error of the estimation is larger than `tolFailCheck`; default
  = TRUE.

- tolFailCheck:

  tolerance on the squared error of the estimation to be declared
  failed; default = 1.5.

- SeedOptions:

  list to control the seed generation. See Details.

- ...:

  other arguments to be passed to the estimation function.

## Details

**Error Handling** It is advisable to set it to TRUE when the user is
planning to launch long simulations as it will prevent the procedure
from stopping if an error occurs for one sample data. The estimation
function will produce a vector of `NA` as estimated parameters related
to this (error generating) sample data and move on to the next Monte
Carlo step. **Statistical summary** The function is able to produce a
statistical summary of the Monte Carlo simulation for each parameter
(slices of the list). Each slice is a matrix where the rows represents
the true values of the parameters and the columns the statistical
information. In all cases, the following quantities are computed:

- `sample size`::

  the sample size used to produce the simulated data.

- `alphaT`, `betaT`::

  the true values of the parameters.

- `failure`::

  the number of times the procedure failed to produce relevant
  estimation.

- `time`::

  the average running time in seconds of the estimation procedure

Besides, the (vector of `character`) `FctsToApply` controls the other
quantities to be computed by providing the name of the function object
to be applied to the vector of estimated parameters. The signature of
the function should be of the form `fctName = function(p,...){...}`,
where `p` is the vector (`length(p) = MCparam`) of parameter estimates
and `...` is the extra arguments to be passed the function.

By default, the functions from `StatFcts` will be applied but the user
can pass his own functions by providing their names in argument
`FctsToApply` and their definitions in the global environment.

Note that if `CheckMat` is set to TRUE, the estimation is considered
failed if the squared error (of the first 2 parameters `alpha` and
`beta`) is larger than `tolFailCheck`.

**Output file**

Setting `saveOutput` to TRUE will have the side effect of saving a csv
file in the working directory. This file will have
`MCparam * length(SampleSizes)` lines and its columns will be:

- `alphaT`, `betaT`::

  the true values of the parameters.

- `data size`::

  the sample size used to generate the simulated data.

- `seed`::

  the seed value used to generate the simulated data.

- `alphaE`, `betaE`, `gammaE`, `deltaE`::

  the estimates of the 4 parameters.

- `failure`::

  binary: 0 for success, 1 for failure.

- `time`::

  estimation running time in seconds.

The file name is informative to let the user identify the values of the
true parameters, the MC parameters, as well as the options selected for
the estimation method.

The csv file is updated after each MC estimation, which is useful when
the simulation stops before it finishes. Besides, using the
check-pointing mechanism explained below, the simulation can re-start
from where it stopped.

*Check-pointing.* Checkpointing is the act of saving enough program
state and results so far calculated that a computation can be stopped
and restarted. The way we did it here is to save a text file with some
useful information about the state of the estimation. This text file is
updated after each MC iteration and read at the beginning of function
`Estim_Simulation` to allow the simulation to re-start from where it
stopped. This file is deleted at the end of the simulation procedure.

*SeedOptions.* Users who do not want to control the seed generation can
ignore this argument (its default value is `NULL`). This argument can be
more useful when one wants to cut the simulation (even for one parameter
value) into pieces. In that case, the user can control which part of the
seed vector to use.

- `MCtot`::

  total values of MC simulations in the entire process.

- `seedStart`::

  starting index in the seed vector. The vector extracted will be of
  size `MCparam`.

## Value

If `StatSummary` is set to TRUE, a `list` with 4 components
(corresponding to the 4 parameters) is returned. Each component is a
matrix. If `SaveOutput` is set to TRUE, only a csv file is saved and
nothing is returned (if `StatSummary` is FALSE). If both are FALSE, the
function stops.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md),
[`CgmmParametersEstim`](https://geobosh.github.io/StableEstim/reference/CgmmParamsEstim.md),
[`GMMParametersEstim`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md),
[`MLParametersEstim`](https://geobosh.github.io/StableEstim/reference/MLParametersEstim.md)

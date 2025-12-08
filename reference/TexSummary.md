# LaTeX summary

Creates a TeX table from a summary object or a vector of files.

## Usage

``` r
TexSummary(obj, files = NULL, sep_ = ",", FctsToApply = StatFcts,
           caption = "Statistical Summary", label = "Simtab",
           digits = 3, par_index = 1, MCparam = 1000, ...)
```

## Arguments

- obj:

  `list` of length 4 containing a summary `matrix` object associated to
  each parameter identical to the one produced by function
  [`ComputeStatObjectFromFiles`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md).

- files:

  `character` vector containing the files name to be parsed. It will be
  passed to function
  [`ComputeStatObjectFromFiles`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md).

- sep\_:

  field separator character to be passed to function
  [`ComputeStatObjectFromFiles`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md).

- FctsToApply:

  functions used to produce the statistical summary to be passed to the
  function
  [`ComputeStatObjectFromFiles`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md).

- caption:

  `character` vector with length equal to `length(par_index)` containing
  the table's caption or title.

- label:

  `character` vector with length equal to `length(par_index)` containing
  the LaTeX label.

- digits:

  `numeric` vector of length equal to one (in which case it will be
  replicated as necessary) or to the number of columns of the resulting
  table or length of `FctsToApply` or matrix of the same size as the
  resulting table indicating the number of digits to display in the
  corresponding columns. See `xtable`.

- par_index:

  `numeric` or `character` vector of length 1, 2, 3 or 4 of the desired
  indices to be selected in `obj`. See Details.

- MCparam:

  number of Monte Carlo simulations for each couple of parameters,
  default = 1000; integer.

- ...:

  other arguments to be passed to function
  [`ComputeStatObjectFromFiles`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md).

## Details

Accepted values for `par_index` are `c(1,2,3,4)` or
`c("alpha","beta","gamma","delta")` or mixed.

Some examples are provided in the example folder.

## Value

a `list` of length `length(par_index)` whose elements are objects from
class `Latex` (produced by `toLatex`)

## See also

[`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md),
[`ComputeStatObjectFromFiles`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md),
`xtable`

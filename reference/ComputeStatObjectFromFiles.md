# Parse an output file to create a summary object (`list`)

Parses the file saved by
[`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md)
and re-creates a summary list identical to the one produced by
[`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md)
when `StatSummary` is set to TRUE.

## Usage

``` r
ComputeStatObjectFromFiles(files, sep_ = ",",
                           FctsToApply = StatFcts,
                           headers_=TRUE,readSizeFrom=1,
                           CheckMat=TRUE,
                           tolFailCheck=tolFailure,
                           MCparam=1000,...)
```

## Arguments

- files:

  `character` vector containing the files name to be parsed. See
  Details.

- sep\_:

  field separator character to be used in function
  [`read.csv()`](https://rdrr.io/r/utils/read.table.html) and
  [`write.table()`](https://rdrr.io/r/utils/write.table.html). Values on
  each line of the file are separated by this character. It can also be
  a character vector (same length as `files`) if different separators
  are used for each file; default: `","`.

- FctsToApply:

  functions used to produce the statistical summary. See
  [`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md);
  character vector.

- headers\_:

  `boolean` vector of length 1 or same length as `files` to indicate for
  each file if the header argument is to be considered or not. To be
  passed to function
  [`read.csv()`](https://rdrr.io/r/utils/read.table.html).

- readSizeFrom:

  index of the file from which the sample sizes are determined; default
  1 (from first file in `files`).

- CheckMat:

  logical flag: if set to TRUE, an estimation is declared failed if the
  squared error of the estimation is larger than `tolFailCheck`; default
  TRUE.

- tolFailCheck:

  tolerance on the squared error of the estimation to be declared
  failed; default = 1.5.

- MCparam:

  number of Monte Carlo simulation for each couple of parameter, default
  = 1000; integer.

- ...:

  other arguments to be passed to the estimation function. See
  [`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md).

## Details

The same sample sizes are assumed for all the files and we also assume a
different set of parameters (`alpha`,`beta`) within each file (one and
one only).

This function is particularly useful when simulations are run in
parallel on different computers/CPUs and the output files are collected
afterwards. This function is also used to create the Latex summary
table: see
[`TexSummary`](https://geobosh.github.io/StableEstim/reference/TexSummary.md).

Some examples are provided in the example folder.

## Value

a list of `length` 4 containing a summary `matrix` object associated to
each parameter.

## See also

[`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md)

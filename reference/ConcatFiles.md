# Concatenates output files.

Creates a unique file by concatenating several output files associated
to one set of parameters.

## Usage

``` r
ConcatFiles(files, sep_ = ",", outfile, headers_ = TRUE,
            DeleteIfExists=TRUE)
```

## Arguments

- files:

  `character` Vector containing the files name to be concatenated. See
  details.

- sep\_:

  Field separator character to be used in function
  [`read.csv()`](https://rdrr.io/r/utils/read.table.html) and
  [`write.table()`](https://rdrr.io/r/utils/write.table.html). Values on
  each line of the file are separated by this character; It can also be
  a vector character (same length as `files`) if different separators
  are useed for each file; default: ","

- outfile:

  Name of the output file; `character`

- headers\_:

  Vector of `boolean` of length 1 or same length as `files` to indicate
  for each file if the header argument is to be considered or not. To be
  passed to function
  [`read.csv()`](https://rdrr.io/r/utils/read.table.html).

- DeleteIfExists:

  if `outfile` exists, it will be deleted and recreated (over-written).

## Details

The files to be concatenated should be related to the same set of
parameters `alpha` and `beta`. The function stops if one of the file
contains 2 (or more) different set of parameters (the function compares
the values of columns 1 and 2 row by row) or if the set of parameters
within one file is different from the one from other files.

## Value

Returns an output file `outfile` saved in the working directory.

## See also

[`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md)

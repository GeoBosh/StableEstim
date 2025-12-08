# Estimated remaining time

Prints the estimated remaining time in a loop. Useful in Monte Carlo
simulations.

## Usage

``` r
PrintEstimatedRemainingTime(ActualIter, ActualIterStartTime, TotalIterNbr)
```

## Arguments

- ActualIter:

  Actual Iteration; `integer`

- ActualIterStartTime:

  Actual Iteration Starting time; `numeric`

- TotalIterNbr:

  Total number of iterations; `integer`

## Details

Called at the end of each Monte Carlo step, this function will compute
the duration of the actual step, an estimate of the remaining MC loops
duration and prints the result to the screen in a human readable format
using function
[`PrintDuration`](https://geobosh.github.io/StableEstim/reference/PrintDuration.md).

## See also

[`PrintDuration`](https://geobosh.github.io/StableEstim/reference/PrintDuration.md),
[`ComputeDuration`](https://geobosh.github.io/StableEstim/reference/ComputeDuration.md).

# Duration

Compute the duration between 2 time points.

## Usage

``` r
ComputeDuration(t_init, t_final, OneNumber = FALSE)
```

## Arguments

- t_init:

  Starting time; numeric.

- t_final:

  Final time; numeric.

- OneNumber:

  Logical flag; if set to TRUE, the duration in seconds will be
  returned. Otherwise, a vector of length 3 will be computed
  representing the time in h/min/sec.

## Value

a `numeric` of length 1 or 3 depending on the value of `OneNumber` flag.

## See also

[`PrintDuration`](https://geobosh.github.io/StableEstim/reference/PrintDuration.md),
[`PrintEstimatedRemainingTime`](https://geobosh.github.io/StableEstim/reference/PrintEstimatedRemainingTime.md).

## Examples

``` r
ti <- getTime_()
for (i in 1:100) x <- i*22.1
tf <- getTime_()
ComputeDuration(ti,tf)
#>   h.elapsed min.elapsed sec.elapsed 
#>           0           0           0 
```

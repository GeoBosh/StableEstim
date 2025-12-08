# Print duration

Print duration in human readable format.

## Usage

``` r
PrintDuration(t, CallingFct = "")
```

## Arguments

- t:

  Duration; `numeric` of `length` 1 or 3.

- CallingFct:

  Name of the calling function.

## Details

The duration will be printed in the format: hours/minutes/seconds.

## Value

Prints a `character` to the screen.

## Examples

``` r
ti <- getTime_()
for (i in 1:100) x = i*22.1
tf <- getTime_()
duration <- ComputeDuration(ti, tf)
PrintDuration(duration, "test")
#> [1] "test :duration= 0  h, 0  min, 0  sec. "
```

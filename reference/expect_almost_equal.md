# Test approximate equality

Tests the approximate equality of 2 objects. Useful for running tests.

## Usage

``` r
expect_almost_equal(x, y, tolExpect = 0.001)
```

## Arguments

- x:

  first object.

- y:

  second object.

- tolExpect:

  tolerance, default is 0.001.

## Details

This function works with the `expect_that` function from package
`testhat` to test equality between 2 objects with a given tolerance. It
is used particularly for testing functions output. See the CF examples
in the Examples folder.

## See also

`expect_that`, `testthat`

## Examples

``` r
x <- 1.1
y <- 1.5
expect_almost_equal(x, y, 1)      # passes
## expect_almost_equal(x, y, 0.3) # fails
```

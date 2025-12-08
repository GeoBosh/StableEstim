# Default functions used to produce the statistical summary

Default functions used to produce the statistical summary in the Monte
Carlo simulations.

## Usage

``` r
get.StatFcts()
```

## Value

The functions computed are:

- Mean:

  `.mean <- function(p,...) mean(p)`

- Min:

  `.min <- function(p,...) min(p)`

- Max:

  `.max <- function(p,...) max(p)`

- Sn:

  `.Sn <- function(p,n,...) sqrt(n)*sd(p)`

- MSE:

  `.MSE <- function(p,paramT,...) (1/length(p))*sum((p-paramT)^2)`

- Std error:

  `.st.err <- function(p,...) sd(p)/sqrt(length(p))`

Users can define their own summaries by defining functions with similar
signatures and passing a `character` vector containing the functions'
names to
[`Estim_Simulation`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md).

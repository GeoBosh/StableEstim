# Changelog

## StableEstim 2.4

CRAN release: 2025-12-09

- Now `RelativeErr` (used in the condition to terminate the loop) in
  `ComputeITGMMParametersEstim()`and `ComputeCueGMMParametersEstim()`
  (called by
  [`GMMParametersEstim()`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md)
  when `algo = "ITGMM"` or `"CueGMM"`) remains scalar in the second and
  subsequent iterations of the `while` loop. Previously it was becoming
  a vector from the second iteration on, throwing an error or giving
  warning in recent versions of R. Thanks to Cedric Juessen who reported
  and diagnosed it. (fixes
  [\#1](https://github.com/GeoBosh/StableEstim/issues/1))

- moved some dependencies from Imports to Suggests. Removed Matrix from
  the list of dependencies, as it is not used (in recent versions?).

- several other changes, not visible to the user.

## StableEstim 2.3

CRAN release: 2024-10-24

- fixed a minor documentation issue causing a NOTE on CRAN.

## StableEstim 2.2

CRAN release: 2022-08-07

- fixed ‘Escaped LaTeX specials’ NOTEs from CRAN.

- updated DESCRIPTION, documentation and github site.

- created pkgdown website.

## StableEstim 2.3.9000

* Now `RelativeErr` (used in the condition to terminate the loop) in
  `ComputeITGMMParametersEstim()`and `ComputeCueGMMParametersEstim()` (called by
  `GMMParametersEstim()` when `algo = "ITGMM"` or `"CueGMM"`) remains scalar in
  the second and subsequent iterations of the `while` loop. Previously it was
  becoming a vector from the second iteration on, throwing an error or giving
  warning in recent versions of R. Thanks to Cedric Juessen who reported and
  diagnosed it. (fixes #1)



## StableEstim 2.3

* fixed a minor documentation issue causing a NOTE on CRAN.


## StableEstim 2.2

* fixed 'Escaped LaTeX specials' NOTEs from CRAN.

* updated DESCRIPTION, documentation and github site.

* created pkgdown website.

# Class `"Estim"`

Class for storing the results of estimating parameters of stable laws,
output of function
[`Estim()`](https://geobosh.github.io/StableEstim/reference/Estim.md).

## Objects from the Class

Objects can be created by calls of the form `new("Estim", par, ...)`.
Users can provide some (or all) of the inputs stated below to create an
object from this class or call function
[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md) with
appropriate arguments.

## Slots

- `par`::

  `numeric(4)`, values of the 4 estimated parameters.

- `par0`::

  `numeric(4)`, initial values for the 4 parameters.

- `vcov`::

  object of class `"matrix"` (`4 x 4`), representing the covariance
  matrix of the estimated parameters.

- `confint`::

  object of class `"matrix"` (`4 x 4`), representing the confidence
  interval computed at a specific level (attribute of the object).

- `data`::

  [`numeric()`](https://rdrr.io/r/base/numeric.html), the data used to
  compute the estimates.

- `sampleSize`::

  `numeric(1)`, length of the data.

- `others`::

  [`list()`](https://rdrr.io/r/base/list.html), further information
  about the estimation method.

- `duration`::

  `numeric(1)`, duration in seconds.

- `failure`::

  `numeric(1)`, represents the status of the procedure: 0 failure or 1
  success.

- `method`::

  Object of class `"character"`, description of the parameters used in
  the estimation.

## Methods

- initialize:

  `signature(.Object = "Estim")`: creates an object of this class using
  the inputs described above.

- show:

  `signature(object = "Estim")`: summarised print of the object.

## See also

[`Estim`](https://geobosh.github.io/StableEstim/reference/Estim.md)

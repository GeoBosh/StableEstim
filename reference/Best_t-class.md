# Class `"Best_t"`

Class used to store the result of function
[`ComputeBest_t`](https://geobosh.github.io/StableEstim/reference/ComputeBest_t.md).

## Objects from the Class

Objects can be created by calls of the form
`new("Best_t", theta, nbt, tvec, detVal, convcode, ...)`, where the user
can specify some/all of the inputs or call function
[`ComputeBest_t`](https://geobosh.github.io/StableEstim/reference/ComputeBest_t.md).

## Slots

- `theta`::

  Object of class `"vector"`; values of the 4 parameters.

- `nbt`::

  Object of class `"vector"`; number of points used in the minimisation.

- `tvec`::

  Object of class `"list"`; values of the best t-vectors.

- `detVal`::

  Object of class `"vector"`; values of the optimal determinant found
  after minimisation.

- `convcode`::

  Convergence code.

## Methods

- +:

  `signature(e1 = "Best_t", e2 = "Best_t")`: sum objects from class
  `Best_t`.

- initialize:

  `signature(.Object = "Best_t")`: initialise an object from class
  `Best_t` as described above.

- show:

  `signature(object = "Best_t")`: print a summary of the object.

## See also

[`ComputeBest_t`](https://geobosh.github.io/StableEstim/reference/ComputeBest_t.md)

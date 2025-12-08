# Regularised Inverse

Regularised solution of the (ill-posed) problem \\K\phi = r\\ where
\\K\\ is a \\n \times n\\ matrix, \\r\\ is a given vector of `length` n.
Users can choose one of the 3 schemes described in Carrasco and Florens
(2007).

## Usage

``` r
RegularisedSol(Kn, alphaReg, r,
               regularization = c("Tikhonov", "LF", "cut-off"),
               ...)
```

## Arguments

- Kn:

  numeric \\n \times n\\ matrix.

- alphaReg:

  regularisation parameter; numeric in \]0,1\].

- r:

  numeric vector of `length` n.

- regularization:

  regularization scheme to be used, one of `"Tikhonov"` (Tikhonov
  scheme), `"LF"` (Landweber-Fridmann) and `"cut-off"` (spectral
  cut-off). See Details.

- ...:

  the value of \\c\\ used in the `"LF"` scheme. See Carrasco and
  Florens(2007).

## Details

Following Carrasco and Florens(2007), the regularised solution of the
problem \\K \phi=r\\ is given by : \$\$\varphi\_{\alpha\_{reg}} =
\sum\_{j=1}^{n} q(\alpha\_{reg},\mu_j)\frac{\<r,\psi_j \>}{\mu_j} \phi_j
, \$\$ where \\q\\ is a (positive) real function with some regularity
conditions and \\\mu,\phi,\psi\\ the singular decomposition of the
matrix \\K\\.

The `regularization` parameter defines the form of the function \\q\\.
For example, the `"Tikhonov"` scheme defines \\q(\alpha\_{reg},\mu) =
\frac{\mu^2}{\alpha\_{reg}+\mu^2}\\.

When the matrix \\K\\ is symmetric, the singular decomposition is
replaced by a spectral decomposition.

## Value

the regularised solution, a vector of length n.

## References

Carrasco M, Florens J and Renault E (2007). “Linear inverse problems in
structural econometrics estimation based on spectral decomposition and
regularization.” *Handbook of econometrics*, **6**, pp. 5633–5751.

## See also

[`solve`](https://rdrr.io/r/base/solve.html)

## Examples

``` r
## Adapted from R examples for Solve 
## We compare the result of the regularized sol to the expected solution

hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+")}

K_h8 <- hilbert(8);
r8 <- 1:8

alphaReg_robust <- 1e-4
Sa8_robust <- RegularisedSol(K_h8,alphaReg_robust,r8,"LF")

alphaReg_accurate <- 1e-10
Sa8_accurate <- RegularisedSol(K_h8,alphaReg_accurate,r8,"LF")

## when pre multiplied by K_h8, the expected solution is 1:8
## User can check the influence of the choice of alphaReg
```

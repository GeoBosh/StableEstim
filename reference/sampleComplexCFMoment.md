# Complex moment condition based on the characteristic function

Computes the moment condition based on the characteristic function as a
complex vector.

## Usage

``` r
sampleComplexCFMoment(x, t, theta, pm = 0)
```

## Arguments

- x:

  vector of data where the ecf is computed.

- t:

  vector of (real) numbers where the CF is evaluated; numeric.

- theta:

  vector of parameters of the stable law; vector of length 4.

- pm:

  parametrisation, an integer (0 or 1); default: `pm=0` (Nolan's ‘S0’
  parametrisation).

## Details

**The moment conditions**

The moment conditions are given by: \$\$g_t(X,\theta) = g(t,X;\theta)=
e^{itX} - \phi\_{\theta}(t)\$\$ If one has a sample \\x_1,\dots,x_n\\ of
i.i.d realisations of the same random variable \\X\\, then:
\$\$\hat{g}\_n(t,\theta) = \frac{1}{n}\sum\_{i=1}^n g(t,x_i;\theta) =
\phi_n(t) - \phi\_\theta(t) , \$\$ where \\\phi_n(t)\\ is the eCF
associated to the sample \\x_1,\dots,x_n\\, and defined by \\\phi_n(t) =
\frac{1}{n} \sum\_{j=1}^n e^{itX_j}\\.

The function compute the vector of difference between the eCF and the CF
at a set of given point `t`.

## Value

a complex vector of `length(t)`.

## See also

[`ComplexCF`](https://geobosh.github.io/StableEstim/reference/ComplexCF.md),
[`sampleRealCFMoment`](https://geobosh.github.io/StableEstim/reference/sampleRealCFMoment.md)

## Examples

``` r
## define the parameters
nt <- 10   
t <- seq(0.1, 3, length.out = nt)
theta <- c(1.5, 0.5, 1, 0)
pm <- 0

set.seed(222)
x <- rstable(200, theta[1], theta[2], theta[3], theta[4], pm)

## Compute the characteristic function
CFMC <- sampleComplexCFMoment(x = x, t = t, theta = theta, pm = pm)
CFMC
#>  [1]  0.006242431-0.004761586i -0.020703369+0.057950623i
#>  [3] -0.072449040+0.064189392i -0.050660290+0.051092006i
#>  [5] -0.040969284+0.022624526i -0.028959753+0.036014037i
#>  [7] -0.029889636+0.060445754i -0.015320422+0.058259580i
#>  [9] -0.032306259+0.050194423i -0.017038430-0.014834322i
```

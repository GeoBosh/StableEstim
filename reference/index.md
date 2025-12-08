# Package index

## StableEstim overview

- [`StableEstim-package`](https://geobosh.github.io/StableEstim/reference/StableEstim-package.md)
  : Stable law estimation functions

## Estimation of stable laws

- [`Estim()`](https://geobosh.github.io/StableEstim/reference/Estim.md)
  : Estimate parameters of stable laws

- [`CgmmParametersEstim()`](https://geobosh.github.io/StableEstim/reference/CgmmParamsEstim.md)
  : Estimate parameters of stable laws using a Cgmm method

- [`GMMParametersEstim()`](https://geobosh.github.io/StableEstim/reference/GMMParametersEstim.md)
  : Estimate parameters of stable laws using a GMM method

- [`IGParametersEstim()`](https://geobosh.github.io/StableEstim/reference/IGParametersEstim.md)
  : Estimate parameters of stable laws by Kogon and McCulloch methods

- [`KoutParametersEstim()`](https://geobosh.github.io/StableEstim/reference/KoutParamsEstim.md)
  : Iterative Koutrouvelis regression method

- [`MLParametersEstim()`](https://geobosh.github.io/StableEstim/reference/MLParametersEstim.md)
  : Maximum likelihood (ML) method

- [`McCullochParametersEstim()`](https://geobosh.github.io/StableEstim/reference/McCullochParametersEstim.md)
  : Quantile-based method

- [`Estim_Simulation()`](https://geobosh.github.io/StableEstim/reference/Estim_Simulation.md)
  : Monte Carlo simulation

- [`get.abMat()`](https://geobosh.github.io/StableEstim/reference/get.abMat.md)
  :

  Default set of parameters to pass to `Estim_Simulation`

## CF of stable distributions

- [`ComplexCF()`](https://geobosh.github.io/StableEstim/reference/ComplexCF.md)
  : Compute the characteristic function of stable laws
- [`ComputeFirstRootRealeCF()`](https://geobosh.github.io/StableEstim/reference/ComputeFirstRootRealeCF.md)
  : First root of the empirical characteristic function
- [`jacobianComplexCF()`](https://geobosh.github.io/StableEstim/reference/jacobianComplexCF.md)
  : Jacobian of the characteristic function of stable laws
- [`sampleComplexCFMoment()`](https://geobosh.github.io/StableEstim/reference/sampleComplexCFMoment.md)
  : Complex moment condition based on the characteristic function
- [`sampleRealCFMoment()`](https://geobosh.github.io/StableEstim/reference/sampleRealCFMoment.md)
  : Real moment condition based on the characteristic function

## Regularisation and parameter tuning

- [`RegularisedSol()`](https://geobosh.github.io/StableEstim/reference/RegularisedSol.md)
  : Regularised Inverse
- [`IntegrateRandomVectorsProduct()`](https://geobosh.github.io/StableEstim/reference/IntegrateRandomVectorsProduct.md)
  : Integral outer product of random vectors
- [`ComputeBest_t()`](https://geobosh.github.io/StableEstim/reference/ComputeBest_t.md)
  : Monte Carlo simulation to investigate the optimal number of points
  to use in the moment conditions
- [`ComputeBest_tau()`](https://geobosh.github.io/StableEstim/reference/ComputeBest_tau.md)
  : Run Monte Carlo simulation to investigate the optimal \\\tau\\

## Classes

- [`Best_t-class`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)
  [`+,Best_t,Best_t-method`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)
  [`initialize,Best_t-method`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)
  [`show,Best_t-method`](https://geobosh.github.io/StableEstim/reference/Best_t-class.md)
  :

  Class `"Best_t"`

- [`Estim-class`](https://geobosh.github.io/StableEstim/reference/Estim-class.md)
  [`initialize,Estim-method`](https://geobosh.github.io/StableEstim/reference/Estim-class.md)
  [`show,Estim-method`](https://geobosh.github.io/StableEstim/reference/Estim-class.md)
  :

  Class `"Estim"`

## Summaries

- [`get.StatFcts()`](https://geobosh.github.io/StableEstim/reference/get.StatFcts.md)
  : Default functions used to produce the statistical summary
- [`StatFcts`](https://geobosh.github.io/StableEstim/reference/StatFcts.md)
  : Default functions used to produce the statistical summary
- [`TexSummary()`](https://geobosh.github.io/StableEstim/reference/TexSummary.md)
  : LaTeX summary

## Other

- [`expect_almost_equal()`](https://geobosh.github.io/StableEstim/reference/expect_almost_equal.md)
  : Test approximate equality

- [`ConcatFiles()`](https://geobosh.github.io/StableEstim/reference/ConcatFiles.md)
  : Concatenates output files.

- [`ComputeStatObjectFromFiles()`](https://geobosh.github.io/StableEstim/reference/ComputeStatObjectFromFiles.md)
  :

  Parse an output file to create a summary object (`list`)

- [`ComputeDuration()`](https://geobosh.github.io/StableEstim/reference/ComputeDuration.md)
  : Duration

- [`getTime_()`](https://geobosh.github.io/StableEstim/reference/getTime_.md)
  : Read time

- [`PrintDuration()`](https://geobosh.github.io/StableEstim/reference/PrintDuration.md)
  : Print duration

- [`PrintEstimatedRemainingTime()`](https://geobosh.github.io/StableEstim/reference/PrintEstimatedRemainingTime.md)
  : Estimated remaining time


<!-- README.md is generated from README.Rmd. Please edit that file -->

# kernopt - A Package for estimating count data distributions with a Discrete Symmetric Optimal Kernel

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/kernopt)](https://cran.r-project.org/package=kernopt)
[![R-CMD-check](https://github.com/thomasfillon/kernopt/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/thomasfillon/kernopt/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/thomasfillon/kernopt/graph/badge.svg)](https://app.codecov.io/gh/thomasfillon/kernopt)
<!-- badges: end -->

## kernopt:

**kernopt** is an R package that implements *Discrete Symmetric Optimal
Kernel* for estimating count data distributions, as described by ([Senga
Kiessé and Durrieu 2024](#ref-SengaDurrieu2024)). The nonparametric
estimator using the discrete symmetric optimal kernel was illustrated on
simulated data sets and a real-word data set included in the package, in
comparison with two other discrete symmetric kernels.

## Authors:

- *Tristan Senga Kiessé*, UMR SAS INRAE, Institut Agro
- *Gilles Durrieu*, Université Bretagne Sud - CNRS UMR 6205, LMBA
- *Thomas Fillon*, Université Bretagne Sud - CNRS UMR 6205, LMBA & CNRS
  UMR 6074 IRISA

## Installation

You can install the development version of kernopt from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("thomasfillon/kernopt")
```

## Example

This is a basic example which shows how to use the *kernopt* library to
compute the discrete optimal kernel values for some parameters:

``` r
library(kernopt)

## Compute the discrete optimal kernel values
k_opt <- discrete_optimal(x = 25, z = 1:50, h = 0.9, k = 20)
print(k_opt)
#>  [1] 0.00000000 0.00000000 0.00000000 0.00000000 0.01871809 0.01956892
#>  [7] 0.02037611 0.02113967 0.02185959 0.02253589 0.02316855 0.02375758
#> [13] 0.02430298 0.02480475 0.02526288 0.02567739 0.02604826 0.02637550
#> [19] 0.02665910 0.02689908 0.02709542 0.02724813 0.02735721 0.02742266
#> [25] 0.02744448 0.02742266 0.02735721 0.02724813 0.02709542 0.02689908
#> [31] 0.02665910 0.02637550 0.02604826 0.02567739 0.02526288 0.02480475
#> [37] 0.02430298 0.02375758 0.02316855 0.02253589 0.02185959 0.02113967
#> [43] 0.02037611 0.01956892 0.01871809 0.00000000 0.00000000 0.00000000
#> [49] 0.00000000 0.00000000
```

The documentation is available at
<https://thomasfillon.github.io/kernopt/>.

## References

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-SengaDurrieu2024" class="csl-entry">

Senga Kiessé, Tristan, and Gilles Durrieu. 2024. “On a Discrete
Symmetric Optimal Associated Kernel for Estimating Count Data
Distributions.” *Statistics & Probability Letters* 208: 110078.
<https://doi.org/10.1016/j.spl.2024.110078>.

</div>

</div>

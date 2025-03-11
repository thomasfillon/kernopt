
<!-- README.md is generated from README.Rmd. Please edit that file -->

# kernopt - A R Package for estimating count data distributions with a Discrete Symmetric Optimal Kernel

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/kernopt)](https://cran.r-project.org/package=kernopt)
[![R-CMD-check](https://github.com/thomasfillon/kernopt/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/thomasfillon/kernopt/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/thomasfillon/kernopt/graph/badge.svg)](https://app.codecov.io/gh/thomasfillon/kernopt)
<!-- badges: end -->

## kernopt:

**kernopt** is an R package that implements *Discrete Symmetric Optimal
Kernel* for estimating count data distributions, as described by [Senga
Kiessé and Durrieu (2024)](#1). ([Senga Kiessé and Durrieu
2024](#ref-SengaDurrieu2024)). The non parametric estimator using the
discrete symmetric optimal kernel was illustrated on simulated data sets
and a real-word data set included in the package, in comparison with two
other discrete symmetric kernels the *triangular kernel* and the
*Epanechnikov kernel*.

## Authors:

- *Tristan Senga Kiessé*, UMR SAS INRAE, Institut Agro
- *Gilles Durrieu*, Université Bretagne Sud - CNRS UMR 6205, LMBA
- *Thomas Fillon*, Université Bretagne Sud - CNRS UMR 6205, LMBA & CNRS
  UMR 6074 IRISA

## References

<a id="1">\[Senga Kiessé and Durrieu (2024)\]</a> *Senga Kiessé T,
Durrieu G* (2024). **“On a discrete symmetric optimal associated kernel
for estimating count data distributions.”** Statistics & Probability
Letters, 208, p.110078. ISSN0167-7152.
[![DOI:10.1007/978-3-031-21438-7_60](https://zenodo.org/badge/DOI/10.1016/j.spl.2024.110078.svg)](https://doi.org/10.1016/j.spl.2024.110078)

## Installation

You can install the development version of kernopt from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("thomasfillon/kernopt")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(kernopt)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
k_opt = discrete_optimal(x = 25, z = 1:50, h = 0.9, k = 20)
```

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

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

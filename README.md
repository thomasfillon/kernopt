
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
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-SengaDurrieu2024" class="csl-entry">

Senga Kiessé, Tristan, and Gilles Durrieu. 2024. “On a Discrete
Symmetric Optimal Associated Kernel for Estimating Count Data
Distributions.” *Statistics & Probability Letters* 208: 110078.
<https://doi.org/10.1016/j.spl.2024.110078>.

</div>

</div>

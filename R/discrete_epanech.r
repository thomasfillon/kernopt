#' Discrete Epanechnikov kernel
#'
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter)
#' @return Returns the value of the associated kernel function according to the
#'        target x and the bandwidth h.
#' @export
#'
#' @examples
#' # Basic usage of discrete_epanech() to compute a discrete Epanechnikov kernel
#' discrete_epanech(x = 50, z = 1:100, h = 10)
#'
discrete_epanech <- function(x, z, h) {
  a <- 3 * h / (1 - 4 * h^2)
  b <- -a

  k <- ifelse(abs(x - z) <= h,
    a * ((x - z) / h)^2 + b,
    0
  )

  return(k)
}

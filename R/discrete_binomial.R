#' Discrete binomial kernel
#'
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter) which should match the
#'          condition 0<= h < 1
#'
#' @returns Returns the value of the associated kernel function according to the
#'        target x and the bandwidth h.
#' @importFrom stats dbinom
#' @export
#'
#' @examples
#' # Basic usage of discrete_binomial() to compute a Discrete Binomial Kernel
#' discrete_binomial(x = 50, z = 1:100, h = 0.1)
discrete_binomial <- function(x, z, h) {
  stopifnot((h >= 0), (h < 1))
  K = stats::dbinom(z, x + 1, (x + h) / (x + 1))
  return (K)
}

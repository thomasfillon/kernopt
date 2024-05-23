# Discrete Epanechnikov kernel
######################

#' Title
#'
#' @param x
#' @param z vector of observations
#' @param h kernel bandwidth (or smoothing parameter) is defined as a positive integer
#'
#' @return Returns the value of the associated kernel function at t according to the target and the bandwidth.
#' @export
#'
#' @examples
#'
#'
DiscreteEpanech = function(x, z, h)
{

  a = 3 * h / (1 - 4 * h ^ 2)
  b = -a

  K = ifelse(abs(x - z) <= h,
             a * ((x - z) / h) ^ 2 + b,
             0
         )

  return(K)
}

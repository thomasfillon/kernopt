# Discrete Epanechnikov kernel
##############################

#' Title
#'
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter)
#' @param k the integer (positive) parameter that defined the support of the kernel function
#' @return Returns the value of the associated kernel function according to the target x and the bandwidth h.
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

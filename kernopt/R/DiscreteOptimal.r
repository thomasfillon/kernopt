#' Discrete optimal kernel
##########################
#'
#'
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter), which should match the condition (3 / 5) * (1 - 1 / k)) < h < 1
#' @param k the integer (positive) parameter that defined the support of the kernel function
#' @return Returns the value of the associated kernel function according to the target x and the bandwidth h.
#' @export
#'
#' @examples
#' DiscreteOptimal(x = 50, z = 1:100, h = 0.6, k = 10)
#'
DiscreteOptimal = function(x, z, h, k)
{
  # Return a error if h does not match the condition (3 / 5) * (1 - 1 / k)) < h < 1
  stopifnot((h > (3 / 5) * (1 - 1 / k)), (h < 1))

  #lambda_3=30*(6*b-k*(k+1))/(k*(k+1)*(2*k+1)*(-4*k^2-4*k+3))
  #lambda_2=-2*x*lambda_3
  #lambda_1=lambda_3*(x^2-(3*k^2+3*k-1)/5)-2*b/(k*(k+1)*(2*k+1)/6)

  lambda = 15 * (1 - h) / ((2 * k + 1) * (4 * k ^ 2 + 4 * k - 3))

  #support = ( abs(x-z)<=k)
  #K = lambda*((3*k^2+3*k-1)/5 - (x-z)^(2)) + h/(2*k+1)
  #K = K * support
  K = ifelse(abs(x - z) <= k,
             lambda * ((3 * k ^ 2 + 3 * k - 1) / 5 - (x - z) ^ (2)) + h / (2 * k + 1),
             0)


  return(K)
}

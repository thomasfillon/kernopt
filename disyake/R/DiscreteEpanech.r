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
  # Initialize kernel values to zeros
  K = rep(0, length(z))

  a = 3 * h / (1 - 4 * h ^ 2)
  b = -a

  for (j in 1:length(z))
  {
    if (abs(z[j]-x) <= h)
      #
    {
      K[j] = a * ((x - z[j]) / h) ^ 2 + b

    }

    # zeros value are already set outside the bandwith
    #else{
    #  K[j] = 0
    #}

  }

  return(K)
}

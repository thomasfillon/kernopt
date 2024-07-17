#Discrete triangular kernel
###########################
#'
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter)
#' @param a the integer (positive) parameter that defined the support of the kernel function
#' @return Returns the value of the associated kernel function according to the target x and the bandwidth h.
#' @export
#'
#' @examples
#'
#'

DiscreteTriang = function(x, z, h, a)

{
  # Initialize kernel values to zeros
  K = rep(0, length(z))


  # Initial condition for a = 0
  u = 0


  if (a > 0)
  {
    for (k in 1:a)
    {
      u = u + k ^ h
    }
  }

  A = (2 * a + 1) * (a + 1) ^ h - 2 * u

  K = ifelse(abs(x - z) <= a,
             ((a + 1) ^ h - (abs(x - z)) ^ h) / A,  # Triangular kernel
             0)

  return(K)
}

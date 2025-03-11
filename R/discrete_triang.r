#' Discrete triangular kernel
###########################
#'
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter)
#' @param a the integer (positive) parameter that defined the support
#'          of the kernel function
#' @return Returns the value of the associated kernel function according
#'         to the target x and the bandwidth h.
#' @export
#'
#' @examples
#' # Basic usage of discrete_triang() to compute a Discrete triangular kernel
#' discrete_triang(x = 25, z = 1:50, h = 10, a = 20)
#'
discrete_triang <- function(x, z, h, a) {
  # Initial condition for a = 0
  u <- 0

  if (a > 0) {
    for (k in 1:a) {
      u <- u + k^h
    }
  }
  # Normalization factor
  d_ah <- (2 * a + 1) * (a + 1)^h - 2 * u

  target_in_support <- abs(x - z) <= a
  kernel_triang <- ifelse(target_in_support,
    ((a + 1)^h - (abs(x - z))^h) / d_ah, # Triangular kernel
    0
  )

  return(kernel_triang)
}

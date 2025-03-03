#' Estimator for discrete optimal kernel
#'
#' @param x the target point at which the density is calculated.
#' @param h the bandwidth (or smoothing parameter), which should match the
#'          condition (3 / 5) * (1 - 1 / k)) < h < 1
#' @param v ???
#' @param k the integer (positive) parameter that defined the support of
#'          the kernel function
#'
#' @returns  The estimated optimal kernel
#'
#' @export


estim_optimal <- function(x, h, v, k) {
  kernel_opt <- 0 # kernel function initialized at 0
  n <- length(v)
  w <- rep(0, length(x)) # non normalized vector of estimations

  for (i in seq_along(x)) { # loop at each target point x
    kernel_opt <- discrete_optimal(x[i], v, h, k)
    w[i] <- (1 / n) * sum(kernel_opt)
  }

  fn_hopt <- w / sum(w) # normalized vector of estimations

  return(fn_hopt)
}

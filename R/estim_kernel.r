#' Discrete Kernel Density Estimator
#'
#' @param kernel the type of kernel. Currently supported kernels are limited to:
#'   "optimal", "triang", "epanech" and "binomial"
#' @param x the list of target points at which the density is calculated
#' @param h the bandwidth (or smoothing parameter)
#' @param v the vector of observations
#' @param k Optional: the integer (positive) parameter that defined the support
#'   of the kernel function (corresponds to parameter 'a' for triangular
#'   kernel). It is only used for optimal and triangular kernel
#'
#' @return  The estimated discrete kernel density values
#' @export
#'
#' @examples
#' n <- 250
#' mu <- 2 # Mean
#' x <- 0:10 # target values
#' y <- sort(rpois(n, mu)) # simulated Poisson observations
#' # kernel parameters
#' kernel <- "optimal"
#' k <- 1
#' # Cross Validation
#' H <- seq((max(y) - min(y)) / 200, (max(y) - min(y)) / 2, length.out = 50)
#' hcv <- cv_bandwidth(kernel = kernel, y, h = H, k = k)
#' # Kernel estimation
#' fn_opt_k <- estim_kernel(kernel = kernel, x=x, h = hcv, v = y, k = k)
estim_kernel <- function(kernel = c("optimal", "triang", "epanech", "binomial"),
                         x,
                         h,
                         v,
                         k = NULL) {
  kernel_opt <- 0 # kernel function initialized at 0
  n <- length(v)
  w <- rep(0, length(x)) # non normalized vector of estimations

  for (i in seq_along(x)) {
    # loop at each target point x
    kernel_opt <- discrete_kernel(
      kernel = kernel,
      x = x[i],
      z = v,
      h = h,
      k = k
    )
    w[i] <- (1 / n) * sum(kernel_opt)
  }

  fn_hopt <- w / sum(w) # normalized vector of estimations

  return(fn_hopt)
}

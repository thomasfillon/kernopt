


#' Estimator for discrete optimal kernel
#'
#' @param kernel the type of kernel. Currently supported kernels are limited to:
#'   "optimal", "triang" and "epanech"
#' @param x the list of target points at which the density is calculated  TODO : à valider
#' @param h the bandwidth (or smoothing parameter)
#' @param v the vector of observations TODO : Renommer "z" ???
#' @param k Optional: the integer (positive) parameter that defined the support
#'   of the kernel function (corresponds to parameter 'a' for triangular
#'   kernel). It is only used for optimal and triangular kernel
#'
#' @return  The estimated kernel
#' @export
#'
#' @examples
#' fn_opt_k <- estim_kernel(kernel=kernel, x=count_values, h=hcv, v=fish_weights, k=k)

estim_kernel <- function(kernel=c("optimal","triang","epanech"), x, h, v, k=NULL) {
  kernel_opt <- 0 # kernel function initialized at 0
  n <- length(v)
  w <- rep(0, length(x)) # non normalized vector of estimations

  for (i in seq_along(x)) { # loop at each target point x
    kernel_opt <- discrete_kernel(kernel=kernel, x=x[i], z=v, h=h, k=k)
    w[i] <- (1 / n) * sum(kernel_opt)
  }

  fn_hopt <- w / sum(w) # normalized vector of estimations

  return(fn_hopt)
}

# Estimator with discrete optimal kernel
########################################

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

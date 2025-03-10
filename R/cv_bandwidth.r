#' `cv_bandwidth` function is a Cross-Validation function for bandwidth
#' parameter selection of discrete kernel
#'
#' @param kernel the type of kernel. Currently supported kernels are limited to:
#'   "optimal", "triang", "epanech" and "binomial"
#' @param v the vector of observations
#' @param h the list of bandwidth parameters to test in cross validation
#' @param k Optional: the integer (positive) parameter that defined the support
#'   of the kernel function (corresponds to parameter 'a' for triangular
#'   kernel). It is only used for optimal and triangular kernel
#'
#' @return the optimal bandwidth value
#' @export
#'
#' @examples
#' n <- 250
#' mu <- 2 # Mean
#' y <- sort(rpois(n, mu))
#' # kernel support parameter
#' k <- 1
#' H <- seq((max(y) - min(y)) / 200, (max(y) - min(y)) / 2, length.out = 50)
#' hcv <- cv_bandwidth(kernel = "optimal", y, h = H, k = k)
cv_bandwidth <- function(kernel = c("optimal", "triang", "epanech", "binomial"),
                         v,
                         h,
                         k = NULL) {
  cv1 <- rep(0, length(h))
  cv2 <- rep(0, length(h))
  x <- 0:(max(v) + 2)
  n1 <- length(x)
  n2 <- length(v)
  a <- matrix(0, n1, n2)
  b <- matrix(0, n2, n2)

  for (l in seq_along(h)) {
    tryCatch({
      for (j in 1:n1) {
        a[j, 1:n2] <- discrete_kernel(
          kernel = kernel,
          x = x[j],
          z = v,
          h = h[l],
          k = k
        )
      }

      for (j in 1:n2) {
        b[j, 1:n2] <- discrete_kernel(
          kernel = kernel,
          x = v[j],
          z = v,
          h = h[l],
          k = k
        )
      }

      res1 <- apply(a, 1, mean)
      diag(b) <- 0
      res2 <- apply(b, 1, sum)
      cv1[l] <- sum(res1^2)
      cv2[l] <- (2 / ((n2 - 1) * n2)) * sum(res2)
    }, error = function(err) {
      cv1[l] <- NaN
      cv2[l] <- NaN
    })
  }

  cv <- cv1 - cv2
  index <- which.min(cv) # to compute the optimal bandwidth
  hcv <- h[index]
  return(hcv)
}

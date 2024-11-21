#' Cross Validation optimal revised
#'
#' `cv_optimal` does something.
#'
#' @param v A value to return
#' @param h the list of bandwidth parameters to test in cross validation
#' @param k kernel function
#'
#' @return Returns the value of
#'
#' @examples
#'
#' # myfunction(1) # returns 1
#'
#' @export


cv_optimal <- function(v, h, k) {
  cv1 <- rep(0, length(h))
  cv2 <- rep(0, length(h))
  x <- 0:(max(v) + 2)
  n1 <- length(x)
  n2 <- length(v)
  a <- matrix(0, n1, n2)
  b <- matrix(0, n2, n2)

  for (l in seq_along(h)) {
    tryCatch(
      {
        for (j in 1:n1) {
          a[j, 1:n2] <- discrete_optimal(x[j], v, h[l], k)
        }

        for (j in 1:n2) {
          b[j, 1:n2] <- discrete_optimal(v[j], v, h[l], k)
        }

        res1 <- apply(a, 1, mean)
        diag(b) <- 0
        res2 <- apply(b, 1, sum)
        cv1[l] <- sum(res1^2)
        cv2[l] <- (2 / ((n2 - 1) * n2)) * sum(res2)
      },
      error = function(err) {
        cv1[l] <- NaN
        cv2[l] <- NaN
      }
    )
  }

  cv <- cv1 - cv2
  index <- which.min(cv) # to compute the optimal bandwidth
  hcv <- h[index]
  return(hcv)
}

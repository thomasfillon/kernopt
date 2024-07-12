#' Cross Validation optimal revised
#'
#' `CV_optimal_revised` does something.
#'
#' @param V A value to return
#' @param h the list of bandwidth parameters to test in cross validation
#' @param k kernel function
#'
#' @return Returns the value of
#'
#' @examples
#'
#' myfunction(1) # returns 1
#'
#' @export


CV_optimal_revised = function(V, h, k)
{
  CV1 <- rep(0, length(h))
  CV2 <- rep(0, length(h))
  x = 0:(max(V) + 2)
  n1 <- length(x)
  n2 <- length(V)
  a = matrix(0, n1, n2)
  b = matrix(0, n2, n2)

  for (l in 1:length(h))
  {
    tryCatch(
      {
    for (j in 1:n1)
    {
        a[j, 1:n2] = OptimalKern_revised(x[j], V, h[l], k)
    }

    for (j in 1:n2)
    {

        b[j, 1:n2] = OptimalKern_revised(V[j], V, h[l], k)
    }

    res1 <- apply(a, 1, mean)
    diag(b) = 0
    res2 <- apply(b, 1, sum)
    CV1[l] = sum(res1 ^ 2)
    CV2[l] = (2 / ((n2 - 1) * n2)) * sum(res2)
      }
    ,error = function(err) {
      CV1[l] = NaN
      CV2[l] = NaN
    }
    )
  }

  CV = CV1 - CV2
  index <- which.min(CV)  #to compute the optimal bandwidth
  hcv <- h[index]
  return(hcv)
}

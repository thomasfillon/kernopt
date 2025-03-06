
#' Discrete kernel function
#'
#' @param kernel the type of kernel. Currently supported kernels are limited to:
#'   "optimal", "triang" and "epanech"
#' @param x the target point at which the density is calculated
#' @param z the vector of observations
#' @param h the bandwidth (or smoothing parameter)
#' @param k Optional: the integer (positive) parameter that defined the support
#'   of the kernel function (corresponds to parameter 'a' for triangular
#'   kernel). It is only used for optimal and triangular kernel
#' @return Returns the value of the associated kernel function
#' @export
#'
#' @examples
#' discrete_kernel(kernel="triang", x = 50, z = 1:100, h = 10, a = 5)
discrete_kernel <- function(kernel=c("optimal","triang","epanech"),
                            x, z, h, k=NULL) {
  switch(kernel,
         "optimal" = discrete_optimal(x=x, z=z, h=h, k=k),
         "triang"= discrete_triang(x=x, z=z, h=h, a=k),
         "epanech"= discrete_epanech(x=x, z=z, h=h))
}

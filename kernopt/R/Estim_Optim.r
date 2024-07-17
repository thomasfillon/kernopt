# Estimator with discrete optimal kernel
########################################

Estim_Optim = function(x , h , V, k)
{
  K <- 0 # kernel function initialized at 0 
  n = length(V)
  w = rep(0, length(x)) # non normalized vector of estimations

  for (i in 1:length(x)) # loop at each target point x

  {
    K = DiscreteOptimal(x[i], V, h, k)
    w[i] = (1 / n) * sum(K)
  }

  fn_hopt = w / sum(w)                      # normalized vector of estimations

  return(fn_hopt)

}

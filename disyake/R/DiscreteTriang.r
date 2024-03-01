#NOYAU discret triangulaire
######################

DiscreteTriang = function(x, z, h, a)

{
  # Initialize kernel values to zeros
  K = rep(0, length(z))


  # Initial condition for a = 0
  u = 0


  if (a>0)
  {
    for (k in 1:a)

    {
      u = u + k ^ h
    }

  }

  A = (2 * a + 1) * (a + 1) ^ h - 2 * u

  for (j in 1:length(z))
    # boucle en j pour chaque observation V

  {
    if  (abs(z[j]-x) <= a)
      # observations sur le support {x-a,...,x...,x+a}
    {
      K[j] = ((a + 1) ^ h - (abs(z[j] - x)) ^ h) / A  # noyau triangulaire
    }
  }
  return(K)
}


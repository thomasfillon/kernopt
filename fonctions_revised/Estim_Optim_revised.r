# ESTIMATEUR DISCRET OPTIMAL
############################

Estim_Optim_revised=function(x , h ,V,k)
{K<-0;                                   # valeur estimation initialisée à 0
  n=length(V)
  w=rep(0,length(x));                    # vecteur des estimations non normalisées

 for (i in 1:length(x))                  # boucle en i pour chaque point x où est fait l'estimation

     {for (j in 1:length(V))             # boucle en j pour chaque observation V

      {
        K[j]=OptimalKern_revised(x[i],V[j],h,k)
      }
      w[i]=(1/n)*sum(K)
    }

  fn_hopt=w/sum(w)                      # vecteur des estimations normalisées
  
  return(fn_hopt)

}

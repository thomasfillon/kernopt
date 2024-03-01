                                 # ESTIMATEUR DISCRET OPTIMAL
############################

Estim_Epanech=function(x , h ,V)
{K<-0;                                   # valeur estimation initialis�e � 0
  n=length(V)
  w=rep(0,length(x));                    # vecteur des estimations non normalis�es


 for (i in 1:length(x))                  # boucle en i pour chaque point x o� est fait l'estimation

     {for (j in 1:length(V))             # boucle en j pour chaque observation V

      {
        K[j]=DiscreteEpanech(x[i],V[j],h)
      }
    w[i]=(1/n)*sum(K)
    }
  fn_hopt=w/sum(w)                      # vecteur des estimations normalis�es
  return(fn_hopt)
}

Estim_binom=function(x,h,V)
{
K<-0;                                   # valeur estimation initialisée à 0
  n=length(V)
  w=rep(0,length(x)); 
  
for (i in 1:length(x))               # boucle en i pour chaque point x où est fait l'estimation

  {for (j in 1:length(V))             # boucle en j pour chaque observation V

      {
        K[j] = dbinom(V[j],x[i]+1,(x[i]+h)/(x[i]+1)) #  noyau binom
	 
      }
      w[i]=(1/n)*sum(K)
  }
  fn_hopt=w/sum(w)
   
return(fn_hopt)
}

#NOYAU discret Epanechn
######################

DiscreteEpanech=function(x,z,h)
{K=rep(0,length(z))
 a=3*h/(1-4*h^2)
 b=-a
  for (j in 1:length(z))             # boucle en j pour chaque observation V
  {


      if ( (z[j]>=(x-h)) & (z[j]<=(x+h)))#
  {

     K[j]= a*((x-z[j])/h)^2 + b

   }


     else{
           K[j]=0
	    }


  }

  return(K)
}



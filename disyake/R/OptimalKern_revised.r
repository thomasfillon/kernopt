#NOYAU discret optimal
######################

OptimalKern_revised=function(x,z,h,k)
{K=rep(0,length(z))
if ((h>(3/5)*(1-1/k)) & (h<1))   # condition sur h
{
 #b=h*k*(k+1)/6

 #lambda_3=30*(6*b-k*(k+1))/(k*(k+1)*(2*k+1)*(-4*k^2-4*k+3))
 #lambda_2=-2*x*lambda_3
 #lambda_1=lambda_3*(x^2-(3*k^2+3*k-1)/5)-2*b/(k*(k+1)*(2*k+1)/6)

 lambda=15*(1-h)/((2*k+1)*(4*k^2+4*k-3))

 support = ( abs(x-z)<=k)
 K = lambda*((3*k^2+3*k-1)/5 - (x-z)^(2)) + h/(2*k+1)
 K = K * support

#   for (j in 1:length(z))             # boucle en j pour chaque observation
#   {
#
#
#     if ( abs(x-z[j])<=k)#    support du noyau
#   {
#
#      #K[j]= -(1/2)*(lambda_1+z[j]*lambda_2+z[j]^2*lambda_3)
#      #K[j]=((lambda_3)/2)*(-(z[j])^2 + 2*x*z[j] - x^2 + (3*k^2 + 3*k -1)/5 ) + h/(2*k+1)
#      K[j]= lambda*((3*k^2+3*k-1)/5 - (x-z[j])^(2)) + h/(2*k+1)
# }
#
#
#      else{
#            K[j]=0
# 	    }
#
#   }
  }
  return(K)
}

CV_Epanech=function(V,h)
{
 CV1<-rep(0,length(h))
 CV2<-rep(0,length(h))
 x=0:(max(V)+2)
 n1 <- length(x)
 n2 <- length(V)
 a=matrix(0,n1, n2)	
 b=matrix(0,n2, n2)
 
 for (k in 1:length(h))
 { 
  for(j in 1:n1)
  {
   for (i in 1:n2)
   {
   a[j,i]=DiscreteEpanech(x[j],V[i],h[k])  
   }
  }
  
  for(j in 1:n2)
  {
   for (i in 1:n2)
   {
    b[j,i]=DiscreteEpanech(V[i],V[j],h[k])   
   }
  }
   
  res1<-apply(a,1,mean)
  diag(b)=0
  res2<-apply(b,1,sum)
  CV1[k]=sum(res1^2)
  CV2[k]=(2/((n2-1)*n2))*sum(res2)
 }
 
 CV=CV1-CV2
 index<-which.min(CV)  #to compute the optimal bandwidth
hcv<-h[index]
return(hcv)
}
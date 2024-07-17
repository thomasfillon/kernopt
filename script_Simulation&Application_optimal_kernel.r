
rm(list=ls(all=TRUE))

path=c("./fonctions_revised/")
path3=c("./")

 #discrete optimal kernel
source(paste(path,"Estim_Optim.r",sep=""))
source(paste(path,"DiscreteOptimal.r",sep=""))
source(paste(path,"CV_optimal.r",sep=""))

#discrete epanechnikov
source(paste(path,"Estim_Epanech.r",sep=""))
source(paste(path,"DiscreteEpanech.r",sep=""))
source(paste(path,"CV_Epanech.r",sep=""))

#binomial
source(paste(path,"CV_binom.r",sep=""))
source(paste(path,"Estim_binom.r",sep=""))


# Triang
source(paste(path,"CV_triang.r",sep=""))
source(paste(path,"DiscreteTriang.r",sep=""))
source(paste(path,"Estim_Triang.r",sep=""))

### COMPARISON GRAPH OF SYMMETRIC KERNELS

 par(mfrow=c(2,2))
 #epanech
 z=0:10
x=5
h=c(1,2,3,4)
K_epan=matrix(0,length(z),length(h))

for (i in 1:length(h))
{
 K_epan[,i]=DiscreteEpanech(x,z,h[i])
}
 
# p=k=1
#opt
z=0:10
x=5
k=1
h=c(0.2, 0.7,  0.95)
K_opt=matrix(0,length(z),length(h))
for (i in 1:length(h))
{
 K_opt[,i]=DiscreteOptimal(x,z,h[i],k)
}
 plot(z,K_opt[,1],xlab=" ",ylab="Probability",ylim=c(0,1),main ="Optimal (k=1, h) and Epanechnikov (h=1)", pch=1,lwd=2, cex=1.6,cex.axis=1.2,cex.lab=1.2)
 lines(z,K_opt[,1],lty=1,lwd=2)
 points(z,K_opt[,2],xlab="z",ylab="Probability",pch=2,lwd=2, col="grey")
 lines(z,K_opt[,2],lty=2,lwd=2, col="grey")
 points(z,K_opt[,3],xlab="z",ylab="Probability",pch=3,lwd=2)
 lines(z,K_opt[,3],lty=3,lwd=2)
  points(z,K_epan[,1],xlab="z",ylab="Probability",pch=4,lwd=2, col="grey")
 lines(z,K_epan[,1],lty=4,lwd=2, col="grey")
 legend(0,1,c("Opt. h=0.2","Opt. h=0.7","Opt. h=0.95","Epan. h=1"), lty=c(1,2,3,4),pch=c(1,2,3,4),col=c("black","grey","black", "grey"),lwd=c(2,2,2,2),cex=1.2)

#triangular
z=0:10
x=5
a=1
h=c(0.2, 0.7, 0.95)
K_trg=matrix(0,length(z),length(h))
for (i in 1:length(h))
{
 K_trg[,i]=DiscreteTriang(x,z,h[i],a)
}
 plot(z,K_trg[,1],xlab=" ",ylab=" ",main ="Triangular (a=1, h) and Epanechnikov (h=1)",ylim=c(0,1),pch=1,lwd=2, cex=1.6,cex.axis=1.2,cex.lab=1.2)
 lines(z,K_trg[,1],lty=1,lwd=2)
 points(z,K_trg[,2],xlab="z",ylab="Probability",pch=2,lwd=2, col="grey")
 lines(z,K_trg[,2],lty=2,lwd=2, col="grey")
 points(z,K_trg[,3],xlab="z",ylab="Probability",pch=3,lwd=2)
 lines(z,K_trg[,3],lty=3,lwd=2)
 points(z,K_epan[,1],xlab="z",ylab="Probability",pch=4,lwd=2, col="grey")
 lines(z,K_epan[,1],lty=4,lwd=2, col="grey")
 legend(0,1,c("Triang. h=0.2","Triang. h=0.7","Triang. h=0.95","Epan. h=1"),lty=c(1,2,3,4),pch=c(1,2,3,4),col=c("black","grey","black", "grey"),lwd=c(2,2,2,2),cex=1.2)

  
 # p=k=2
#opt
z=0:10
x=5
k=2
h=c(0.5, 0.7, 0.95)
K_opt=matrix(0,length(z),length(h))
for (i in 1:length(h))
{
 K_opt[,i]=DiscreteOptimal(x,z,h[i],k)
}
 plot(z,K_opt[,1],xlab="y",ylab="Probability",ylim=c(0,1),main ="Optimal (k=2, h) and Epanechnikov (h=2)", pch=1,lwd=2, cex=1.6,cex.axis=1.2,cex.lab=1.2)
 lines(z,K_opt[,1],lty=1,lwd=2)
 points(z,K_opt[,2],xlab="z",ylab="Probability",pch=2,lwd=2, col="grey")
 lines(z,K_opt[,2],lty=2,lwd=2, col="grey")
 points(z,K_opt[,3],xlab="z",ylab="Probability",pch=3,lwd=2)
 lines(z,K_opt[,3],lty=3,lwd=2)
points(z,K_epan[,2],xlab="z",ylab="Probability",pch=4,lwd=2, col="grey")
 lines(z,K_epan[,2],lty=4,lwd=2, col="grey")
 legend(0,1,c("Opt. h=0.5","Opt. h=0.7","Opt. h=0.95","Epan. h=2"),lty=c(1,2,3,4),pch=c(1,2,3,4),col=c("black","grey","black", "grey"),lwd=c(2,2,2,2),cex=1.2)


#triangular
z=0:10
x=5
a=2
h=c(0.5, 0.7,  0.95)
K_trg=matrix(0,length(z),length(h))
for (i in 1:length(h))
{
 K_trg[,i]=DiscreteTriang(x,z,h[i],a)
}
 plot(z,K_trg[,1],xlab="y",ylab=" ",main ="Triangular (a=2, h) and Epanechnikov (h=2)",ylim=c(0,1),pch=1,lwd=2, cex=1.6,cex.axis=1.2,cex.lab=1.2)
 lines(z,K_trg[,1],lty=1,lwd=2)
 points(z,K_trg[,2],xlab="z",ylab="Probability",pch=2,lwd=2, col="grey")
 lines(z,K_trg[,2],lty=2,lwd=2, col="grey")
 points(z,K_trg[,3],xlab="z",ylab="Probability",pch=3,lwd=2)
 lines(z,K_trg[,3],lty=3,lwd=2)
points(z,K_epan[,2],xlab="z",ylab="Probability",pch=4,lwd=2, col="grey")
 lines(z,K_epan[,2],lty=4,lwd=2, col="grey")
 legend(0,1,c("Triang. h=0.5","Triang. h=0.7","Triang. h=0.95","Epan. h=2"),lty=c(1,2,3,4),pch=c(1,2,3,4),col=c("black","grey","black", "grey"),lwd=c(2,2,2,2),cex=1.2)


 #############################################
 # I - Simulations de distributons : unimodal poisson, bimodal poisson, g?om?trique, n?gative binomiale 
#############################################

NN=100
nn=c(25,100,250)#,500)

# (A) - Poisson unimodal
########################

#Poisson unimodal
mu=2
x=0:10
f=dpois(x,mu)

# (1) Optimal kernel
######
Fn_opt_k1=matrix(0,NN,length(x))
hcv_opt_k1=matrix(0,NN,length(nn))
B_opt_k1=rep(0,length(nn))
V_opt_k1=rep(0,length(nn))
MISE_opt_k1=rep(0,length(nn))

Fn_opt_k2=matrix(0,NN,length(x))
hcv_opt_k2=matrix(0,NN,length(nn))
B_opt_k2=rep(0,length(nn))
V_opt_k2=rep(0,length(nn))
MISE_opt_k2=rep(0,length(nn))


Fn_opt_k3=matrix(0,NN,length(x))
hcv_opt_k3=matrix(0,NN,length(nn))
B_opt_k3=rep(0,length(nn))
V_opt_k3=rep(0,length(nn))
MISE_opt_k3=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # Poisson unimodal
 y=sort(rpois(n,mu))
  data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))


 
H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)

k=1
hcv_opt_k1[j,i]<-CV_optimal(y,H,k)
fn_opt_k1=Estim_Optim(x,hcv_opt_k1[j,i],y,k)
Fn_opt_k1[j,]=fn_opt_k1

k=2
hcv_opt_k2[j,i]<-CV_optimal(y,H,k)
fn_opt_k2=Estim_Optim(x,hcv_opt_k2[j,i],y,k)
Fn_opt_k2[j,]=fn_opt_k2


k=3
hcv_opt_k3[j,i]<-CV_optimal(y,H,k)
fn_opt_k3=Estim_Optim(x,hcv_opt_k3[j,i],y,k)
Fn_opt_k3[j,]=fn_opt_k3


 }  
B_opt_k1[i]=sum((apply(Fn_opt_k1,2,mean)-f)^(2))   
V_opt_k1[i]=sum(apply(Fn_opt_k1,2,var))
MISE_opt_k1[i]= B_opt_k1[i] + V_opt_k1[i]

B_opt_k2[i]=sum((apply(Fn_opt_k2,2,mean)-f)^(2))    
V_opt_k2[i]=sum(apply(Fn_opt_k2,2,var))
MISE_opt_k2[i]= B_opt_k2[i] + V_opt_k2[i]

B_opt_k3[i]=sum((apply(Fn_opt_k3,2,mean)-f)^(2))    
V_opt_k3[i]=sum(apply(Fn_opt_k3,2,var))
MISE_opt_k3[i]= B_opt_k3[i] + V_opt_k3[i]

}

#historgramme normalit? asymptotique pour k=1
u=sqrt(n)*(Fn_opt_k1[,1] - mean(Fn_opt_k1[,1]))
hist(u)

B_opt_k1
V_opt_k1
MISE_opt_k1

B_opt_k2
V_opt_k2
MISE_opt_k2

B_opt_k3
V_opt_k3
MISE_opt_k3


# (2) Triangulaire
######
Fn_triang_p1=matrix(0,NN,length(x))
hcv_trg_p1=matrix(0,NN,length(nn))
B_triang_p1=rep(0,length(nn))
V_triang_p1=rep(0,length(nn))
MISE_triang_p1=rep(0,length(nn))

Fn_triang_p2=matrix(0,NN,length(x))
hcv_trg_p2=matrix(0,NN,length(nn))
B_triang_p2=rep(0,length(nn))
V_triang_p2=rep(0,length(nn))
MISE_triang_p2=rep(0,length(nn))


Fn_triang_p3=matrix(0,NN,length(x))
hcv_trg_p3=matrix(0,NN,length(nn))
B_triang_p3=rep(0,length(nn))
V_triang_p3=rep(0,length(nn))
MISE_triang_p3=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # Poisson unimodal
  y=sort(rpois(n,mu))
  data=data.frame(table(y))
 names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 
 H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)

p=1
hcv_trg_p1[j,i]<-CV_triang(y,H,p)
Fn_triang_p1[j,]=Estim_Triang(x,hcv_trg_p1[j,i],y,p) 
 
p=2
hcv_trg_p2[j,i]<-CV_triang(y,H,p)
Fn_triang_p2[j,]=Estim_Triang(x,hcv_trg_p2[j,i],y,p) 
 
p=3
hcv_trg_p3[j,i]<-CV_triang(y,H,p)
Fn_triang_p3[j,]=Estim_Triang(x,hcv_trg_p3[j,i],y,p)

 }

B_triang_p1[i]=sum((apply(Fn_triang_p1,2,mean)-f)^(2))    # integrated squared bias
V_triang_p1[i]=sum(apply(Fn_triang_p1,2,var))
MISE_triang_p1[i]=B_triang_p1[i] +  V_triang_p1[i]

B_triang_p2[i]=sum((apply(Fn_triang_p2,2,mean)-f)^(2))    # integrated squared bias
V_triang_p2[i]=sum(apply(Fn_triang_p2,2,var))
MISE_triang_p2[i]=B_triang_p2[i] +  V_triang_p2[i]

B_triang_p3[i]=sum((apply(Fn_triang_p3,2,mean)-f)^(2))    # integrated squared bias
V_triang_p3[i]=sum(apply(Fn_triang_p3,2,var))
MISE_triang_p3[i]=B_triang_p3[i] +  V_triang_p3[i]
}
B_triang_p1
V_triang_p1
MISE_triang_p1

B_triang_p2
V_triang_p2
MISE_triang_p2

B_triang_p3
V_triang_p3
MISE_triang_p3


# (3) Binomial
######
Fn_bino=matrix(0,NN,length(x))
hcv_bin=matrix(0,NN,length(nn))
B_bino=rep(0,length(nn))
V_bino=rep(0,length(nn))
MISE_bino=rep(0,length(nn))
#ISE_bino=rep(0,length(nn))

for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # Poisson unimodal
  data=data.frame(table(rpois(n,mu)))
 y=sort(rpois(n,mu))
 names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))

 H=seq((max(y)-min(y))/500,1, length.out=50) 
hcv_bin[j,i]<-CV_binom(y,H)
    
 fn_bino=Estim_binom(x,hcv_bin[j,i],y)
 Fn_bino[j,]=fn_bino
 }   
B_bino[i]=sum((apply(Fn_bino,2,mean)-f)^(2))     # integrated squared bias
V_bino[i]=sum(apply(Fn_bino,2,var))
MISE_bino[i]= B_bino[i] + V_bino[i]

}
B_bino
V_bino
MISE_bino

# (4) Dirac
###########
MISE_dirac=rep(0,length(nn))
MISE_dirac=(1/nn)*(1-sum(f^2))
MISE_dirac

# (5) Discrete epanech kernel
######
H=seq(2,10,1)
Fn_epanech=matrix(0,NN,length(x))
hcv_epanech=matrix(0,NN,length(nn))
B_epanech=rep(0,length(nn))
V_epanech=rep(0,length(nn))
MISE_epanech=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # Poisson unimodal
  data=data.frame(table(rpois(n,mu)))
 y=sort(rpois(n,mu))
 names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 
hcv_epanech[j,i]<-CV_Epanech(y,H)

fn_epanech=Estim_Epanech(x,hcv_epanech[j,i],y)
Fn_epanech[j,]=fn_epanech
 }
B_epanech[i]=sum((apply(Fn_epanech,2,mean)-f)^(2))   # integrated squared bias 
V_epanech[i]=sum(apply(Fn_epanech,2,var))
MISE_epanech[i]= B_epanech[i] + V_epanech[i]
#ISE_epanech[i]=sum((Fn_epanech[j,]-f)^2)
}
B_epanech
V_epanech
MISE_epanech


# (B) - Geometric distribution
######################

NN=100
nn=c(25,100,250)

p1=0.1
x=0:50
f=dgeom(x,p1)

# (1) Optimal kernel
######
Fn_opt_k1=matrix(0,NN,length(x))
hcv_opt_k1=matrix(0,NN,length(nn))
B_opt_k1=rep(0,length(nn))
V_opt_k1=rep(0,length(nn))
MISE_opt_k1=rep(0,length(nn))

Fn_opt_k2=matrix(0,NN,length(x))
hcv_opt_k2=matrix(0,NN,length(nn))
B_opt_k2=rep(0,length(nn))
V_opt_k2=rep(0,length(nn))
MISE_opt_k2=rep(0,length(nn))


Fn_opt_k3=matrix(0,NN,length(x))
hcv_opt_k3=matrix(0,NN,length(nn))
B_opt_k3=rep(0,length(nn))
V_opt_k3=rep(0,length(nn))
MISE_opt_k3=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # geometric distribution
y=sort(rgeom(n,p1))
 data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N
 
H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)
k=1
hcv_opt_k1[j,i]<-CV_optimal(y,H,k)
fn_opt_k1=Estim_Optim(x,hcv_opt_k1[j,i],y,k)
Fn_opt_k1[j,]=fn_opt_k1

k=2
hcv_opt_k2[j,i]<-CV_optimal(y,H,k)
fn_opt_k2=Estim_Optim(x,hcv_opt_k2[j,i],y,k)
Fn_opt_k2[j,]=fn_opt_k2
#

k=3
hcv_opt_k3[j,i]<-CV_optimal(y,H,k)
fn_opt_k3=Estim_Optim(x,hcv_opt_k3[j,i],y,k)
Fn_opt_k3[j,]=fn_opt_k3


 }  
B_opt_k1[i]=sum((apply(Fn_opt_k1,2,mean)-f)^(2))   # integrated squared bias 
V_opt_k1[i]=sum(apply(Fn_opt_k1,2,var))
MISE_opt_k1[i]= B_opt_k1[i] + V_opt_k1[i]

B_opt_k2[i]=sum((apply(Fn_opt_k2,2,mean)-f)^(2))   # integrated squared bias 
V_opt_k2[i]=sum(apply(Fn_opt_k2,2,var))
MISE_opt_k2[i]= B_opt_k2[i] + V_opt_k2[i]

B_opt_k3[i]=sum((apply(Fn_opt_k3,2,mean)-f)^(2))   # integrated squared bias 
V_opt_k3[i]=sum(apply(Fn_opt_k3,2,var))
MISE_opt_k3[i]= B_opt_k3[i] + V_opt_k3[i]


}
B_opt_k1
V_opt_k1
MISE_opt_k1

B_opt_k2
V_opt_k2
MISE_opt_k2

B_opt_k3
V_opt_k3
MISE_opt_k3


# (2) Triangulaire
######
Fn_triang_p1=matrix(0,NN,length(x))
hcv_trg_p1=matrix(0,NN,length(nn))
B_triang_p1=rep(0,length(nn))
V_triang_p1=rep(0,length(nn))
MISE_triang_p1=rep(0,length(nn))

Fn_triang_p2=matrix(0,NN,length(x))
hcv_trg_p2=matrix(0,NN,length(nn))
B_triang_p2=rep(0,length(nn))
V_triang_p2=rep(0,length(nn))
MISE_triang_p2=rep(0,length(nn))


Fn_triang_p3=matrix(0,NN,length(x))
hcv_trg_p3=matrix(0,NN,length(nn))
B_triang_p3=rep(0,length(nn))
V_triang_p3=rep(0,length(nn))
MISE_triang_p3=rep(0,length(nn))

for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
  # geometric distribution
 y=sort(rgeom(n,p1))
 data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N
 
##
 H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)

p=1
hcv_trg_p1[j,i]<-CV_triang(y,H,p)
Fn_triang_p1[j,]=Estim_Triang(x,hcv_trg_p1[j,i],y,p) 
 
p=2
hcv_trg_p2[j,i]<-CV_triang(y,H,p)
Fn_triang_p2[j,]=Estim_Triang(x,hcv_trg_p2[j,i],y,p) 
 
p=3
hcv_trg_p3[j,i]<-CV_triang(y,H,p)
Fn_triang_p3[j,]=Estim_Triang(x,hcv_trg_p3[j,i],y,p)

 }

B_triang_p1[i]=sum((apply(Fn_triang_p1,2,mean)-f)^(2))    # integrated squared bias
V_triang_p1[i]=sum(apply(Fn_triang_p1,2,var))
MISE_triang_p1[i]=B_triang_p1[i] +  V_triang_p1[i]

B_triang_p2[i]=sum((apply(Fn_triang_p2,2,mean)-f)^(2))    # integrated squared bias
V_triang_p2[i]=sum(apply(Fn_triang_p2,2,var))
MISE_triang_p2[i]=B_triang_p2[i] +  V_triang_p2[i]

B_triang_p3[i]=sum((apply(Fn_triang_p3,2,mean)-f)^(2))    # integrated squared bias
V_triang_p3[i]=sum(apply(Fn_triang_p3,2,var))
MISE_triang_p3[i]=B_triang_p3[i] +  V_triang_p3[i]
}

B_triang_p1
V_triang_p1
MISE_triang_p1

B_triang_p2
V_triang_p2
MISE_triang_p2

B_triang_p3
V_triang_p3
MISE_triang_p3

mean(hcv_trg_p1)
mean(hcv_trg_p2)
mean(hcv_trg_p3)

# (3) Binomial
######
Fn_bino=matrix(0,NN,length(x))
hcv_bin=matrix(0,NN,length(nn))
B_bino=rep(0,length(nn))
V_bino=rep(0,length(nn))
MISE_bino=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # geometric distribution
y=sort(rgeom(n,p1))
 data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N
 
##
H=seq((max(y)-min(y))/500,1, length.out=50) 
hcv_bin[j,i]<-CV_binom(y,H)
 
 
 
 fn_bino=Estim_binom(x,hcv_bin[j,i],y)
 Fn_bino[j,]=fn_bino
 }
B_bino[i]=sum((apply(Fn_bino,2,mean)-f)^(2))     # integrated squared bias
V_bino[i]=sum(apply(Fn_bino,2,var))
MISE_bino[i]= B_bino[i] + V_bino[i]

}
B_bino
V_bino
MISE_bino

# (4) Dirac

MISE_dirac=rep(0,length(nn))
MISE_dirac=(1/nn)*(1-sum(f^2))
MISE_dirac

# (5) Discrete epanech kernel
######
H=seq(2,10,1)
Fn_epanech=matrix(0,NN,length(x))
hcv_epanech=matrix(0,NN,length(nn))
B_epanech=rep(0,length(nn))
V_epanech=rep(0,length(nn))
MISE_epanech=rep(0,length(nn))



for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
 # geometric distribution
 y=sort(rgeom(n,p1))
 data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N
 

hcv_epanech[j,i]<-CV_Epanech(y,H)


fn_epanech=Estim_Epanech(x,hcv_epanech[j,i],xx)
Fn_epanech[j,]=fn_epanech
 }
B_epanech[i]=sum((apply(Fn_epanech,2,mean)-f)^(2))   # integrated squared bias 
V_epanech[i]=sum(apply(Fn_epanech,2,var))
MISE_epanech[i]= B_epanech[i] + V_epanech[i]

}
B_epanech
V_epanech
MISE_epanech

 # (C) - Negative binomiale distribution
  ######################

NN=100
nn=c(25,100,250)#?,500)

p1=2/3
size=20
x=0:20
f=dnbinom(x,size,p1)

# (1) Optimal kernel
######
Fn_opt_k1=matrix(0,NN,length(x))
hcv_opt_k1=matrix(0,NN,length(nn))
B_opt_k1=rep(0,length(nn))
V_opt_k1=rep(0,length(nn))
MISE_opt_k1=rep(0,length(nn))

Fn_opt_k2=matrix(0,NN,length(x))
hcv_opt_k2=matrix(0,NN,length(nn))
B_opt_k2=rep(0,length(nn))
V_opt_k2=rep(0,length(nn))
MISE_opt_k2=rep(0,length(nn))


Fn_opt_k3=matrix(0,NN,length(x))
hcv_opt_k3=matrix(0,NN,length(nn))
B_opt_k3=rep(0,length(nn))
V_opt_k3=rep(0,length(nn))
MISE_opt_k3=rep(0,length(nn))

for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
# negative binomial distribution
y=sort(rnbinom(n, size, p1))
data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N
 
 H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)
 
k=1
hcv_opt_k1[j,i]<-CV_optimal(y,H,k)
fn_opt_k1=Estim_Optim(x,hcv_opt_k1[j,i],y,k)
Fn_opt_k1[j,]=fn_opt_k1

k=2
hcv_opt_k2[j,i]<-CV_optimal(y,H,k)
fn_opt_k2=Estim_Optim(x,hcv_opt_k2[j,i],y,k)
Fn_opt_k2[j,]=fn_opt_k2
#

k=3
hcv_opt_k3[j,i]<-CV_optimal(y,H,k)
fn_opt_k3=Estim_Optim(x,hcv_opt_k3[j,i],y,k)
Fn_opt_k3[j,]=fn_opt_k3


 }  
B_opt_k1[i]=sum((apply(Fn_opt_k1,2,mean)-f)^(2))   # integrated squared bias 
V_opt_k1[i]=sum(apply(Fn_opt_k1,2,var))
MISE_opt_k1[i]= B_opt_k1[i] + V_opt_k1[i]

B_opt_k2[i]=sum((apply(Fn_opt_k2,2,mean)-f)^(2))   # integrated squared bias 
V_opt_k2[i]=sum(apply(Fn_opt_k2,2,var))
MISE_opt_k2[i]= B_opt_k2[i] + V_opt_k2[i]

B_opt_k3[i]=sum((apply(Fn_opt_k3,2,mean)-f)^(2))   # integrated squared bias 
V_opt_k3[i]=sum(apply(Fn_opt_k3,2,var))
MISE_opt_k3[i]= B_opt_k3[i] + V_opt_k3[i]

#ISE_opt[i]=sum((Fn_opt[j,]-f)^2)
}
B_opt_k1
V_opt_k1
MISE_opt_k1

B_opt_k2
V_opt_k2
MISE_opt_k2

B_opt_k3
V_opt_k3
MISE_opt_k3


# (2) Triangulaire
######
Fn_triang_p1=matrix(0,NN,length(x))
hcv_trg_p1=matrix(0,NN,length(nn))
B_triang_p1=rep(0,length(nn))
V_triang_p1=rep(0,length(nn))
MISE_triang_p1=rep(0,length(nn))

Fn_triang_p2=matrix(0,NN,length(x))
hcv_trg_p2=matrix(0,NN,length(nn))
B_triang_p2=rep(0,length(nn))
V_triang_p2=rep(0,length(nn))
MISE_triang_p2=rep(0,length(nn))


Fn_triang_p3=matrix(0,NN,length(x))
hcv_trg_p3=matrix(0,NN,length(nn))
B_triang_p3=rep(0,length(nn))
V_triang_p3=rep(0,length(nn))
MISE_triang_p3=rep(0,length(nn))

for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
# negative binomial distribution
y=sort(rnbinom(n, size, p1))
data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N


 H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)

p=1
hcv_trg_p1[j,i]<-CV_triang(y,H,p)
Fn_triang_p1[j,]=Estim_Triang(x,hcv_trg_p1[j,i],y,p) 
 
p=2
hcv_trg_p2[j,i]<-CV_triang(y,H,p)
Fn_triang_p2[j,]=Estim_Triang(x,hcv_trg_p2[j,i],y,p) 
 
p=3
hcv_trg_p3[j,i]<-CV_triang(y,H,p)
Fn_triang_p3[j,]=Estim_Triang(x,hcv_trg_p3[j,i],y,p)

 }

B_triang_p1[i]=sum((apply(Fn_triang_p1,2,mean)-f)^(2))    # integrated squared bias
V_triang_p1[i]=sum(apply(Fn_triang_p1,2,var))
MISE_triang_p1[i]=B_triang_p1[i] +  V_triang_p1[i]

B_triang_p2[i]=sum((apply(Fn_triang_p2,2,mean)-f)^(2))    # integrated squared bias
V_triang_p2[i]=sum(apply(Fn_triang_p2,2,var))
MISE_triang_p2[i]=B_triang_p2[i] +  V_triang_p2[i]

B_triang_p3[i]=sum((apply(Fn_triang_p3,2,mean)-f)^(2))    # integrated squared bias
V_triang_p3[i]=sum(apply(Fn_triang_p3,2,var))
MISE_triang_p3[i]=B_triang_p3[i] +  V_triang_p3[i]
}

B_triang_p1
V_triang_p1
MISE_triang_p1

B_triang_p2
V_triang_p2
MISE_triang_p2

B_triang_p3
V_triang_p3
MISE_triang_p3

mean(hcv_trg_p1)
mean(hcv_trg_p2)
mean(hcv_trg_p3)

# (3) Binomial
######
Fn_bino=matrix(0,NN,length(x))
hcv_bin=matrix(0,NN,length(nn))
B_bino=rep(0,length(nn))
V_bino=rep(0,length(nn))
MISE_bino=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
# negative binomial distribution
y=sort(rnbinom(n, size, p1))
data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N
 
##
H=seq((max(y)-min(y))/500,1, length.out=50) 
hcv_bin[j,i]<-CV_binom(y,H)
 
 
 
 fn_bino=Estim_binom(x,hcv_bin[j,i],y)
 Fn_bino[j,]=fn_bino
 }
B_bino[i]=sum((apply(Fn_bino,2,mean)-f)^(2))     # integrated squared bias
V_bino[i]=sum(apply(Fn_bino,2,var))
MISE_bino[i]= B_bino[i] + V_bino[i]

}
B_bino
V_bino
MISE_bino

# (4) Dirac

MISE_dirac=rep(0,length(nn))
MISE_dirac=(1/nn)*(1-sum(f^2))
MISE_dirac

# (5) Discrete epanech kernel
######
H=seq(2,10,1)
Fn_epanech=matrix(0,NN,length(x))
hcv_epanech=matrix(0,NN,length(nn))
B_epanech=rep(0,length(nn))
V_epanech=rep(0,length(nn))
MISE_epanech=rep(0,length(nn))


for (i in 1:length(nn))
{
 n=nn[i]
 for (j in 1:NN)
 {
# negative binomial distribution
y=sort(rnbinom(n, size, p1))
data=data.frame(table(y))
   names(data)=c("xx","N")
 xx=data$xx
 xx=as.integer(as.character(xx))
 N=data$N


hcv_epanech[j,i]<-CV_Epanech(y,H)


fn_epanech=Estim_Epanech(x,hcv_epanech[j,i],xx)
Fn_epanech[j,]=fn_epanech
 }
B_epanech[i]=sum((apply(Fn_epanech,2,mean)-f)^(2))   # integrated squared bias 
V_epanech[i]=sum(apply(Fn_epanech,2,var))
MISE_epanech[i]= B_epanech[i] + V_epanech[i]

}
B_epanech
V_epanech
MISE_epanech




####################################
# II - Application donn?es r?elles : 
##################################
rm(list = ls(all=TRUE))

# 1 - fish weight
##############

data1_fish <- read.csv2(paste(path3,"data_fish_2019.csv",sep=""),header=T)

data_fish_peche <- read.csv2(paste(path3,"data_fish_2019_peche.csv",sep=""),header=T)


y=10*as.numeric(as.character((data1_fish$Poids)))
data1=as.data.frame(table(y))
x0=as.numeric(as.character(data1[,1]))
x=x0
freq_poids=as.numeric(as.character(data1[,2]))
f0=freq_poids/sum(freq_poids)

#bin
H=seq((max(y)-min(y))/500,1, length.out=50) 
hcv_bin<-CV_binom(y,H)
fn_bino<-Estim_binom(x,hcv_bin,y)
ISE_bino<-sum((fn_bino - f0)^2)

#triang p=1
H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)

p=1
hcv_trg_p1<-CV_triang(y,H,p=1)
fn_triang_p1<-Estim_Triang(x,hcv_trg_p1,y,p=1) 
ISE_triang_p1<-sum((fn_triang_p1 - f0)^2)

p=2
hcv_trg_p2<-CV_triang(y,H,p=2)
fn_triang_p2<-Estim_Triang(x,hcv_trg_p2,y,p=2) 
ISE_triang_p2<-sum((fn_triang_p2 - f0)^2)

p=3
hcv_trg_p3<-CV_triang(y,H,p=3)
fn_triang_p3<-Estim_Triang(x,hcv_trg_p3,y,p=3) 
ISE_triang_p3<-sum((fn_triang_p3 - f0)^2)

#discrete opt
H=seq((max(y)-min(y))/200,(max(y)-min(y))/2, length.out=50)
k=1
hcv_opt_k1<-CV_optimal(y,H,k=1)
fn_opt_k1<-Estim_Optim(x,hcv_opt_k1,y,k=1)
ISE_opt_k1<-sum((fn_opt_k1 - f0)^2)
 
k=2
hcv_opt_k2<-CV_optimal(y,H,k=2)
fn_opt_k2<-Estim_Optim(x,hcv_opt_k2,y,k=2)
ISE_opt_k2<-sum((fn_opt_k2 - f0)^2)

k=3
hcv_opt_k3<-CV_optimal(y,H,k=3)
fn_opt_k3<-Estim_Optim(x,hcv_opt_k3,y,k=3)
ISE_opt_k3<-sum((fn_opt_k3 - f0)^2)

# Epanech
H=seq(2,10,1)
hcv_epanech<-CV_Epanech(y,H)
fn_epanech<-Estim_Epanech(x,hcv_epanech,y)
ISE_epanech<-sum((fn_epanech - f0)^2)




#version 3
par(mfrow=c(3,2))
  plot(x0,f0,col="black",axes=F,lwd=3,ylab="Probability", xlab="",ylim=c(0,max(f0,fn_opt_k1,fn_triang_p1)),xlim=c(min(x),max(x)+1),type="h",main="(a) Optimal k=1 - ISE=0.0027 (hcv=0.94)",cex.axis=1.70,cex.lab=1.70)
axis(1, at=x,cex.axis=1.70,cex.lab=1.70)
axis(2)
box()
points(x+0.4,fn_opt_k1,lwd=3,col="grey", lty=1,type="h")

 plot(x0,f0,col="black",axes=F,lwd=3,ylab="", xlab="",ylim=c(0,max(f0,fn_opt_k1,fn_triang_p1)),xlim=c(min(x),max(x)+1),type="h",main="(b) Optimal k=2 - ISE=0.0032 (hcv=0.94)",cex.axis=1.70,cex.lab=1.70)
axis(1, at=x,cex.axis=1.70,cex.lab=1.70)
axis(2)
box()
points(x+0.4,fn_opt_k2,lwd=3,col="grey", lty=1,type="h")

plot(x0,f0,col="black",axes=F,lwd=3,ylab="Probability",xlab="",ylim=c(0,max(f0,fn_opt_k1,fn_triang_p1)),xlim=c(min(x),max(x)+1),type="h",main="(c) Triangular p=1 - ISE=0.0030 (hcv=42.30)",cex.axis=1.70,cex.lab=1.70)
axis(1, at=x,cex.axis=1.70,cex.lab=1.70)
axis(2)
box()
points(x+0.4,fn_triang_p1,lwd=3,col="grey",lty=1,type="h")

 plot(x0,f0,col="black",axes=F,lwd=3,ylab="",xlab="",ylim=c(0,max(f0,fn_opt_k1,fn_triang_p1)),xlim=c(min(x),max(x)+1),type="h",main="(d) Triangular p=2 - ISE=0.0034 (hcv=47.00)",cex.axis=1.70,cex.lab=1.70)
axis(1, at=x,cex.axis=1.70,cex.lab=1.70)
axis(2)
box()
points(x+0.4,fn_triang_p2,lwd=3,col="grey",lty=1,type="h")

plot(x0,f0,col="black",axes=F,lwd=3,ylab="Probability",xlab="Weight (dg)",ylim=c(0,max(f0,fn_opt_k1,fn_triang_p1)),xlim=c(min(x),max(x)+1),type="h",main="(e) Epanechnikov - ISE=0.0033 (hcv=9)",cex.axis=1.70,cex.lab=1.70)
axis(1, at=x,cex.axis=1.70,cex.lab=1.70)
axis(2)
box()
points(x+0.4,fn_epanech,lwd=3,col="grey",lty=1,type="h")

plot(x0,f0,col="black",axes=F,lwd=3,ylab="",xlab="Weight (dg)",ylim=c(0,max(f0,fn_opt_k1,fn_triang_p1)),xlim=c(min(x),max(x)+1),type="h",main="(f) Binomial - ISE=0.0028 (hcv=0.19) ",cex.axis=1.70,cex.lab=1.70)
axis(1, at=x,cex.axis=1.70,cex.lab=1.70)
axis(2)
box()
points(x+0.4,fn_bino,lwd=3,col="grey", lty=1,type="h")





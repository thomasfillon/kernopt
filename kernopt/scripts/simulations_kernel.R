devtools::load_all()
#############################################
# I - Simulations de distributons : unimodal poisson, bimodal poisson, géométrique, négative binomiale
#############################################
#
NN = 100
nn = c(25, 100, 250)#,500)

# (A) - Poisson unimodal
########################

# Poisson unimodal
mu = 2 # Mean
x = 0:10   # Quantile value
f = dpois(x, mu)  # Density values for quantile x=0-10

# (1) Optimal kernel
######

Fn_opt_k1 = matrix(0, NN, length(x))
hcv_opt_k1 = matrix(0, NN, length(nn))
B_opt_k1 = rep(0, length(nn))
V_opt_k1 = rep(0, length(nn))
MISE_opt_k1 = rep(0, length(nn))

Fn_opt_k2 = matrix(0, NN, length(x))
hcv_opt_k2 = matrix(0, NN, length(nn))
B_opt_k2 = rep(0, length(nn))
V_opt_k2 = rep(0, length(nn))
MISE_opt_k2 = rep(0, length(nn))


Fn_opt_k3 = matrix(0, NN, length(x))
hcv_opt_k3 = matrix(0, NN, length(nn))
B_opt_k3 = rep(0, length(nn))
V_opt_k3 = rep(0, length(nn))
MISE_opt_k3 = rep(0, length(nn))


for (i in 1:length(nn))
{
  n = nn[i] # Length of the sequence
  print(paste("Length of the sequence: ", n))

  for (j in 1:NN)
  {
    # Poisson unimodal
    y = sort(rpois(n, mu))
    #data=data.frame(table(y))
    #names(data)=c("xx","N")
    #xx=data$xx
    #xx=as.integer(as.character(xx))
    xx = unique(y)


    # H=seq(from = (max(y)-min(y))/200,
    #       to = 1,#(max(y)-min(y))/2,
    #       length.out=51)[1:50]

    k = 1
    #H = seq( from = (3/5)*(1-1/k) , to = 1, length.out = 52 )[2:51]
    H = seq((max(y) - min(y)) / 200, (max(y) - min(y)) / 2, length.out =
              50)


    hcv_opt_k1[j, i] <- cv_optimal(y, H, k)
    fn_opt_k1 = estim_optimal(x, hcv_opt_k1[j, i], y, k)
    Fn_opt_k1[j, ] = fn_opt_k1

    k = 2
    #H = seq(from = (3 / 5) * (1 - 1 / k) ,
    #        to = 1,
    #        length.out = 52)[2:51]

    hcv_opt_k2[j, i] <- cv_optimal(y, H, k)
    fn_opt_k2 = estim_optimal(x, hcv_opt_k2[j, i], y, k)
    Fn_opt_k2[j, ] = fn_opt_k2


    k = 3
    #H = seq(from = (3 / 5) * (1 - 1 / k) ,
    #        to = 1,
    #        length.out = 52)[2:51]

    hcv_opt_k3[j, i] <- cv_optimal(y, H, k)
    fn_opt_k3 = estim_optimal(x, hcv_opt_k3[j, i], y, k)
    Fn_opt_k3[j, ] = fn_opt_k3


  }
  B_opt_k1[i] = sum((apply(Fn_opt_k1, 2, mean) - f) ^ (2))
  V_opt_k1[i] = sum(apply(Fn_opt_k1, 2, var))
  MISE_opt_k1[i] = B_opt_k1[i] + V_opt_k1[i]

  B_opt_k2[i] = sum((apply(Fn_opt_k2, 2, mean) - f) ^ (2))
  V_opt_k2[i] = sum(apply(Fn_opt_k2, 2, var))
  MISE_opt_k2[i] = B_opt_k2[i] + V_opt_k2[i]

  B_opt_k3[i] = sum((apply(Fn_opt_k3, 2, mean) - f) ^ (2))
  V_opt_k3[i] = sum(apply(Fn_opt_k3, 2, var))
  MISE_opt_k3[i] = B_opt_k3[i] + V_opt_k3[i]

}

#histogramme normalité asymptotique pour k=1
u = sqrt(n) * (Fn_opt_k1[, 1] - mean(Fn_opt_k1[, 1]))
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

results_B_opt <- data.frame(nb_samples = nn, B_opt_k1, B_opt_k2, B_opt_k3)
results_V_opt <- data.frame(nb_samples = nn, V_opt_k1, V_opt_k2, V_opt_k3)
results_MISE_opt = rbind(data.frame(nb_samples = nn, k='1', MISE=MISE_opt_k1),
                         data.frame(nb_samples = nn, k='2', MISE=MISE_opt_k2),
                         data.frame(nb_samples = nn, k='3', MISE=MISE_opt_k3))

results_F <- rbind(
  data.frame(x = x, name='Fn_opt_k1', color_id='1', f=apply(Fn_opt_k1, 2, mean)),
  data.frame(x = x, name='Fn_opt_k2', color_id='2', f=apply(Fn_opt_k2, 2, mean)),
  data.frame(x = x, name='Fn_opt_k3', color_id='3', f=apply(Fn_opt_k3, 2, mean)),
  data.frame(x = x, name='f', f=f, color_id='4')
)


#####
# Display Results
#####
library(ggplot2)
library(patchwork)

l_plot <- ggplot(results_F, aes(x=x, y=f, color=color_id)) +
  geom_line() + geom_point(aes(shape=name))

r_plot <- ggplot(results_MISE_opt, aes(x=nb_samples, y=MISE, color=k)) +
  geom_line() + geom_point(aes(shape=k))

l_plot + r_plot


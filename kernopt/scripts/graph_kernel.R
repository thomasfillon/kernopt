load_all()

### COMPARISON GRAPH OF SYMMETRIC KERNELS

#epanech
z = 0:10  # Observations (?)
x = 5 # Target
h = c(1, 2, 3, 4)  # Set of Bandwidths

K_epan = matrix(data = 0,
                nrow = length(z),
                ncol = length(h))

for (i in 1:length(h))
{
  K_epan[, i] = discrete_epanech(x, z, h[i])
}



# p=k=1
#opt
z = 0:10
x = 5
k = 1
h = c(0.2, 0.7,  0.95)
K_opt = matrix(0, length(z), length(h))
for (i in 1:length(h))
{
  K_opt[, i] = discrete_optimal(x, z, h[i], k)
}

#-------------------------
# Graph
# ------------------------
#graphics.off()
par(mfrow = c(2, 2)) # 2 x 2 pictures on one plot

# 1,1 - Optimal (k=1, h) and Epanechnikov (h=1)
plot(
  x = z,
  y = K_opt[, 1],
  xlab = "z",
  ylab = "Probability",
  ylim = c(0, 1),
  main = "Optimal (k=1, h) and Epanechnikov (h=1)",
  type = "o",
  pch = 1,
  # Symbol
  lty = 1,
  # Line type
  lwd = 2,
  # Line width
  cex = 1.6,
  # Magnification factor
  cex.axis = 1.2,
  # Magnification factor for axis
  cex.lab = 1.2,
  # Magnification factor for label
)

lines(
  z,
  K_opt[, 2],
  type = "o",
  pch = 2,
  # Symbol
  lty = 2,
  # Line type
  lwd = 2,
  # Line width
  col = "grey",
)

lines(
  z,
  K_opt[, 3],
  type = "o",
  pch = 3,
  lty = 3,
  lwd = 2
)


lines(
  z,
  K_epan[, 1],
  type = "o",
  pch = 4,
  lty = 4,
  lwd = 2,
  col = "grey"
)

legend(
  0,
  1,
  c("Opt. h=0.2", "Opt. h=0.7", "Opt. h=0.95", "Epan. h=1"),
  lty = c(1, 2, 3, 4),
  pch = c(1, 2, 3, 4),
  col = c("black", "grey", "black", "grey"),
  lwd = c(2, 2, 2, 2),
  cex = 1.2
)


# Triangular (a=1, h) and Epanechnikov (h=1)
z = 0:10
x = 5
a = 1
h = c(0.2, 0.7, 0.95)
K_trg = matrix(0, length(z), length(h))
for (i in 1:length(h))
{
  K_trg[, i] = discrete_triang(x, z, h[i], a)
}

plot(
  z,
  K_trg[, 1],
  xlab = "z",
  ylab = "Probability",
  main = "Triangular (a=1, h) and Epanechnikov (h=1)",
  ylim = c(0, 1),
  type = "o",
  pch = 1,
  lty = 1,
  lwd = 2,
  cex = 1.6,
  cex.axis = 1.2,
  cex.lab = 1.2
)

lines(
  z,
  K_trg[, 2],
  type = "o",
  pch = 2,
  lty = 2,
  lwd = 2,
  col = "grey"
)

lines(
  z,
  K_trg[, 3],
  type = "o",
  pch = 3,
  lty = 3,
  lwd = 2
)

lines(
  z,
  K_epan[, 1],
  type = "o",
  pch = 4,
  lty = 4,
  lwd = 2,
  col = "grey"
)

legend(
  0,
  1,
  c("Triang. h=0.2", "Triang. h=0.7", "Triang. h=0.95", "Epan. h=1"),
  lty = c(1, 2, 3, 4),
  pch = c(1, 2, 3, 4),
  col = c("black", "grey", "black", "grey"),
  lwd = c(2, 2, 2, 2),
  cex = 1.2
)

# Optimal (k=2, h) and Epanechnikov (h=2)
# p=k=2
#opt
z = 0:10
x = 5
k = 2
h = c(0.5, 0.7, 0.95)
K_opt = matrix(0, length(z), length(h))
for (i in 1:length(h))
{
  K_opt[, i] = discrete_optimal(x, z, h[i], k)
}


plot(
  z,
  K_opt[, 1],
  xlab = "z",
  ylab = "Probability",
  ylim = c(0, 1),
  main = "Optimal (k=2, h) and Epanechnikov (h=2)",
  type = "o",
  pch = 1,
  lty = 1,
  lwd = 2,
  cex = 1.6,
  cex.axis = 1.2,
  cex.lab = 1.2
)

lines(
  z,
  K_opt[, 2],
  type = "o",
  pch = 2,
  lty = 2,
  lwd = 2,
  col = "grey"
)

lines(
  z,
  K_opt[, 3],
  type = "o",
  pch = 3,
  lty = 3,
  lwd = 2
)

lines(
  z,
  K_epan[, 2],
  type ="o",
  pch = 4,
  lty = 4,
  lwd = 2,
  col = "grey"
)

legend(
  0,
  1,
  c("Opt. h=0.5", "Opt. h=0.7", "Opt. h=0.95", "Epan. h=2"),
  lty = c(1, 2, 3, 4),
  pch = c(1, 2, 3, 4),
  col = c("black", "grey", "black", "grey"),
  lwd = c(2, 2, 2, 2),
  cex = 1.2
)

# Triangular (a=2, h) and Epanechnikov (h=2)
#triangular
z = 0:10
x = 5
a = 2
h = c(0.5, 0.7,  0.95)
K_trg = matrix(0, length(z), length(h))
for (i in 1:length(h))
{
  K_trg[, i] = discrete_triang(x, z, h[i], a)
}


plot(
  z,
  K_trg[, 1],
  xlab = "z",
  ylab = "Probability",
  main = "Triangular (a=2, h) and Epanechnikov (h=2)",
  ylim = c(0, 1),
  type = "o",
  pch = 1,
  lty = 1,
  lwd = 2,
  cex = 1.6,
  cex.axis = 1.2,
  cex.lab = 1.2
)

lines(
  z,
  K_trg[, 2],
  type = "o",
  pch = 2,
  lty = 2,
  lwd = 2,
  col = "grey"
)

lines(
  z,
  K_trg[, 3],
  type ="o",
  pch = 3,
  lty = 3,
  lwd = 2
)

lines(
  z,
  K_epan[, 2],
  type = "o",
  pch = 4,
  lty = 4,
  lwd = 2,
  col = "grey"
)

legend(
  0,
  1,
  c("Triang. h=0.5", "Triang. h=0.7", "Triang. h=0.95", "Epan. h=2"),
  lty = c(1, 2, 3, 4),
  pch = c(1, 2, 3, 4),
  col = c("black", "grey", "black", "grey"),
  lwd = c(2, 2, 2, 2),
  cex = 1.2
)



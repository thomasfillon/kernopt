# Test that return values from cv_bandwidth and estim_kernel functions match the
# results in the supplementary materials Table S1 p10 in Senga and Durrieu 2024.

# Target values
hcv_targets <- c(9, 42.30, 47.00, 47.00, 0.94, 0.94, 0.94, 0.19)
ISE_targets <- c(0.0033, 0.0030, 0.0034, 0.0034, 0.0027, 0.0032, 0.0034, 0.0028)
kernel_types <- c("epanech",
                  "triang",
                  "triang",
                  "triang",
                  "optimal",
                  "optimal",
                  "optimal",
                  "binomial")
kernel_k <- c(0, 1, 2, 3, 1, 2, 3, 0)

target_data <- data.frame(
  hcv = hcv_targets,
  ISE = ISE_targets,
  kernel = kernel_types,
  k = kernel_k
)

fish_weights <- fish_data$weight

weights_counts <- as.data.frame(table(fish_weights, dnn = "Weight"))


count_values <- as.numeric(as.character((weights_counts$Weight)))

# Empirical frequencies
count_f0 <- weights_counts$Freq / sum(weights_counts$Freq)


# #bin
# H=seq((max(fish_weights)-min(fish_weights))/500,1, length.out=50)
# hcv_bin<-CV_binom(fish_weights,H)
#
# fn_bino<-Estim_binom(weights,hcv_bin,fish_weights)
# ISE_bino<-sum((fn_bino - f0)^2)

# discrete opt
H <- seq((max(fish_weights) - min(fish_weights)) / 200, (max(fish_weights) - min(fish_weights)) / 2, length.out = 100)

for (i in 1:nrow(target_data)) {
  result <- target_data[i, ]
  kernel_val <- result$kernel
  k_val <- result$k

  hcv <- cv_bandwidth(kernel = kernel_val, fish_weights, H, k = k_val)

  fn_opt_k <- estim_kernel(
    kernel = kernel_val,
    x = count_values,
    h = hcv,
    v = fish_weights,
    k = k_val
  )
  ISE_opt_k <- sum((fn_opt_k - count_f0)^2)

  # Get target values for (kernel, k)
  hcv_target = result$hcv
  ISE_target = result$ISE
  # Test
  testthat::expect_equal(
    hcv,
    hcv_target,
    tolerance = 1e-1,
    info = sprintf("Mismatch for %s kernel", kernel_val)
  )
  testthat::expect_equal(
    ISE_opt_k,
    ISE_target,
    tolerance = 1e-2,
    info = sprintf("Mismatch for %s kernel", kernel_val)
  )
}

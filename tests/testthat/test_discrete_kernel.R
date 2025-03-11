# Check Results against original function

# Optimal Kernel
test_that("Kernel values match original function for optimal kernel", {
  expect_equal(
    discrete_kernel(
      kernel = "optimal",
      x = 25,
      z = 1:50,
      h = 0.9,
      k = 20
    ),
    discrete_optimal(
      x = 25,
      z = 1:50,
      h = 0.9,
      k = 20
    )
  )
})

# Triangular Kernel
test_that("Kernel values match original function for triangular kernel", {
  expect_equal(
    discrete_kernel(
      kernel = "triang",
      x = 25,
      z = 1:50,
      h = 0.9,
      k = 20
    )
    ,
    discrete_triang(
      x = 25,
      z = 1:50,
      h = 0.9,
      a = 20
    )
  )
})

# Epanechnikov Kernel
test_that("Kernel values match original function for epanech kernel", {
  expect_equal(
    discrete_kernel(
      kernel = "epanech",
      x = 25,
      z = 1:50,
      h = 20
    ),
    discrete_epanech(x = 25, z = 1:50, h = 20)
  )
})

# Binomial Kernel
test_that("Kernel values match original function for binomial kernel", {
  expect_equal(
    discrete_kernel(
      kernel = "binomial",
      x = 25,
      z = 1:50,
      h = 0.5
    ),
    discrete_binomial(x = 25, z = 1:50, h = 0.5)
  )
})

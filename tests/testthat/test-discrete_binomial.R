# Check Discrete kernel Property


test_that("Kernel is null outside support", {
  expect_equal(discrete_binomial(x = 25, z = 1:50, h = 0.1)[27:50], rep(0, 24))
})

test_that("Kernel sum to 1", {
  expect_equal(sum(discrete_binomial(
    x = 25, z = 1:50, h = 0.1
  )), 1)
})


# Check Kernel values
test_that("Kernel values are correct", {
  expect_equal(
    discrete_binomial(x = 5, z = 0:10, h = 0.1),
    c(
      1.139063e-05,
      3.872813e-04,
      5.486484e-03,
      4.145344e-02,
      1.761771e-01,
      3.993348e-01,
      3.771495e-01,
      0,
      0,
      0,
      0
    ),
    tolerance = 1e-6
  )
})

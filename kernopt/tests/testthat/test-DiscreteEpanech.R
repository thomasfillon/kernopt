


# Check Discrete kernel Property


test_that("Kernel is null outside support", {
  expect_equal(DiscreteEpanech(x = 50, z = 1:100, h = 10)[1:40], rep(0, 40))
  expect_equal(DiscreteEpanech(x = 50, z = 1:100, h = 10)[61:100], rep(0, 40))
})

test_that("Kernel sum to 1", {
  expect_equal(sum(DiscreteEpanech(
    x = 50, z = 1:100, h = 10
  )), 1)
})


# Check Kernel values
test_that("Kernel values are correct", {
  expect_equal(
    DiscreteEpanech(x = 5, z = 1:10, h = 3),
    c(
      0,
      0,
      0.1428571,
      0.2285714,
      0.2571429,
      0.2285714,
      0.1428571,
      0,
      0,
      0
    ),
    tolerance = 1e-6
  )
  expect_equal(
    DiscreteEpanech(x = 5, z = 1:10, h = 5),
    c(
      0.05454545,
      0.09696970,
      0.12727273,
      0.14545455,
      0.15151515,
      0.14545455,
      0.12727273,
      0.09696970,
      0.05454545,
      0.00000000
    ),
    tolerance = 1e-6
  )
  expect_equal(DiscreteEpanech(x = 5, z = 1:10, h = 1),
               c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0))
})

# Check Discrete kernel Property


test_that("Kernel is null outside support", {
  expect_equal(discrete_triang(
    x = 50,
    z = 1:100,
    h = 10,
    a = 5
  )[1:44], rep(0, 44))
  expect_equal(discrete_triang(
    x = 50,
    z = 1:100,
    h = 10,
    a = 5
  )[56:100], rep(0, 45))
})

test_that("Kernel sum to 1", {
  expect_equal(sum(discrete_triang(
    x = 50,
    z = 1:100,
    h = 10,
    a = 5
  )), 1)
})

# Check Kernel values
test_that("Kernel values are correct", {
  expect_equal(
    discrete_triang(5, 1:10, 3, 2),
    c(
      0,
      0,
      0.1623932,
      0.2222222,
      0.2307692,
      0.2222222,
      0.1623932,
      0,
      0,
      0
    ),
    tolerance = 1e-6
  )
  expect_equal(
    discrete_triang(5, 1:10, 3, 5),
    c(
      0.07892004,
      0.09813084,
      0.10799585,
      0.11163032,
      0.11214953,
      0.11163032,
      0.10799585,
      0.09813084,
      0.07892004,
      0.04724818
    ),
    tolerance = 1e-6
  )
  expect_equal(discrete_triang(5, 1:10, 3, 0), c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0))
})

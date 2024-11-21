# Check Discrete kernel Property

test_that("Function return error if h ", {
  expect_error(discrete_optimal(
    x = 50,
    z = 1:100,
    h = 0.1, # h < (3/5) * (1 - 1/k)) = 0.54
    k = 10
  ))
  expect_error(discrete_optimal(
    x = 50,
    z = 1:100,
    h = 2,
    k = 10
  ))
})


test_that("Kernel is null outside support", {
  expect_equal(
    discrete_optimal(
      x = 50,
      z = 1:100,
      h = 0.6,
      k = 10
    )[1:39],
    rep(0, 39)
  )
  expect_true(all(discrete_optimal(
    x = 50,
    z = 1:100,
    h = 0.6,
    k = 10
  )[40:60] > 0))
  expect_equal(
    discrete_optimal(
      x = 50,
      z = 1:100,
      h = 0.6,
      k = 10
    )[61:100],
    rep(0, 40)
  )
})

test_that("Kernel sum to 1", {
  expect_equal(sum(discrete_optimal(
    x = 50,
    z = 1:100,
    h = 0.8,
    k = 10
  )), 1)
})

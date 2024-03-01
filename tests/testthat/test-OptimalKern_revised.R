

# Check Discrete kernel Property


test_that("Kernel is null outside support", {
  expect_equal(OptimalKern_revised(
    x = 50,
    z = 1:100,
    h = 0.1,
    k = 10
  )[1:39], rep(0, 39))
  expect_equal(OptimalKern_revised(
    x = 50,
    z = 1:100,
    h = 0.1,
    k=10
  )[61:100], rep(0, 40))
})

test_that("Kernel sum to 1", {
  expect_equal(sum(OptimalKern_revised(
    x = 50,
    z = 1:100,
    h = 0.8,
    k=10
  )), 1)
})


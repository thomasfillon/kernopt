

# Check Discrete kernel Property


test_that("Kernel is null outside support", {
  expect_equal(DiscreteEpanech(x=50, z=1:100, h=10)[1:40], rep(0,40))
  expect_equal(DiscreteEpanech(x=50, z=1:100, h=10)[61:100], rep(0,40))
})

test_that("Kernel sum to 1", {
  expect_equal(sum(DiscreteEpanech(x=50, z=1:100, h=10)), 1)
})

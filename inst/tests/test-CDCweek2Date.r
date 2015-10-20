context('CDCweek2Date')

test_that('CDCweek2Date returns errors', {
  expect_error(CDCweek2Date())
  expect_error(CDCweek2Date(2015))
  expect_error(CDCweek2Date('a',1))
  expect_error(CDCweek2Date(2015,'a'))
  expect_error(CDCweek2Date(2015,0))
  expect_error(CDCweek2Date(2015,54))
})


test_that('CDCweek2Date matches CDCweek', {
  n = 20
  d = data.frame(
    CDCyear = sample(1900:2100, n, replace=TRUE),
    CDCweek = sample(1:52,      n, replace=TRUE),
    CDCday  = sample(1:7,       n, replace=TRUE)
  )
  date = with(d, CDCweek2Date(CDCyear,CDCweek,CDCday))
  expect_equal(d, CDCweek(date))
})
 

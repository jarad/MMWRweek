context('CDCweekday')

test_that('CDCweekday returns proper format', {
  expect_that(CDCweekday('1999-12-31'), is_a('factor'))
})

test_that('CDCweekday returns correct values', {
  chars = paste(1999:2011, "-12-31", sep="")
  dates = as.Date(chars)
  truth = factor(weekdays(dates), levels=c('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'))
  expect_that(CDCweekday(chars), equals(truth))
  expect_that(CDCweekday(dates), equals(truth))
})
 

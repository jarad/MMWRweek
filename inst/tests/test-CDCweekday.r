context('CDCweekday')

days = c('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')

test_that('CDCweekday returns a factor', {
  date = c('1999-12-31', '2005-06-15', '2014-01-01')
  wday = CDCweekday(date)
  expect_that(wday, is_a('factor'))
  expect_that(levels(wday), equals(days))
  expect_that(length(wday), equals(length(date)))
})

test_that('CDCweekday returns correct values', {
  chars = paste(1999:2011, "-12-31", sep="")
  dates = as.Date(chars)
  truth = factor(weekdays(dates), levels=days)
  expect_that(CDCweekday(chars), equals(truth))
  expect_that(CDCweekday(dates), equals(truth))
})
 

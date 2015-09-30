context('CDCweekday')

days = c('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')

dates = seq(as.Date('1900-01-01'), as.Date('2015-12-31'), by='day')
truth = factor(weekdays(dates), levels=days)

test_that('CDCweekday returns a factor vector', {
  wday = CDCweekday(dates)
  expect_that(wday, is_a('factor'))
  expect_that(levels(wday), equals(days))
  expect_that(length(wday), equals(length(dates)))
})

test_that('CDCweekday returns correct values', {
  dates_chr = as.Date(dates)
  expect_that(CDCweekday(dates    ), equals(truth))
  expect_that(CDCweekday(dates_chr), equals(truth))
})
 

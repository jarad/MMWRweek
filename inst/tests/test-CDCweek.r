context('CDCweek')

dates = seq(as.Date('1900-01-01'), as.Date('2015-12-31'), by='day')
truth = readRDS('CDCweek-truth.rds')

test_that('CDCweek returns a factor vector', {
  week = CDCweek(dates)
  expect_that(week, is_a('data.frame'))
  expect_that(names(week), equals(c('CDCyear', 'CDCweek', 'CDCday')))
})

test_that('CDCweek returns correct values', {
  dates_chr = as.Date(dates)
  expect_that(CDCweek(dates    ), equals(truth))
  expect_that(CDCweek(dates_chr), equals(truth))
})
 

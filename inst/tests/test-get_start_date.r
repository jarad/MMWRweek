context('start_date')

test_that('start_date returns a Date vector', {
  year = 1999:2015
  sd = start_date(year)
  expect_that(sd, is_a('Date'))
  expect_that(length(sd), equals(length(year)))
})


context('get_start_date')

test_that('get_start_date returns a Date vector', {
  year = paste(1999:2015, '-01-01', sep='')
  sd = get_start_date(year)
  expect_that(sd, is_a('Date'))
  expect_that(length(sd), equals(length(year)))
})

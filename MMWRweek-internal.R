#' Find the day of the week for January 1 of the year of date
#'
#' This internal function returns the weekday of January 1 of the year of the date.
#'
#' @param date Vector which can be coerced to class \code{Date}
#' @return An integer vector of weekdays (1-7, Sunday is 1)
#' @seealso \code{\link{ISOweekday}}
#' @keywords internal
jan1_weekday = function(date) {
  date = as.Date(date)
  year = format(date, '%Y')
  jan1 = as.Date(paste(year,'-01-01', sep=''))
  return(MMWRweekday(jan1))
}

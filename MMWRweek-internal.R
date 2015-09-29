#' Find the day of the week for January 1 of the year of date
#'
#' This internal function returns the January 1 for the year of the date
#'
#' @param date Vector which can be coerced to class \code{Date}
#' @return A date vector containing January for the year of the date
#' @seealso \code{\link{MMWRweek}}
#' @keywords internal
jan1 = function(date) {
  date = as.Date(date)
  year = format(date, '%Y')
  return(as.Date(paste(year,'-01-01', sep='')))
}


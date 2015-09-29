#' Day of week according to MMWR
#'
#' This function returns the weekday of a given date according to MMWR.
#' 
#' @param date Vector which can be coerced to class \code{Date}
#' @return An integer vector of weekdays (1-7, Sunday is 1)
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @seealso \code{\link{strptime}}
#' @export
#' @examples
#' y <- as.Date(paste(1999:2011, "-12-31", sep = ""))
#' data.frame(date = format(dates), weekday = weekdays(y), MMWRweekday = MMWRweekday(y))
MMWRweekday = function(date) {
  date = as.Date(date)
  date = factor(weekdays(date), levels=c('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'))
  return(as.integer(date))
}


#' Day of week according to CDC
#'
#' This function returns the weekday of a given date according to MMWR.
#' 
#' @param date vector which can be coerced to class \code{Date}
#' @return vector of weekdays as a factor
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @seealso \code{\link{CDCweek}}
#' @export
#' @examples
#' y <- as.Date(paste(1999:2011, "-12-31", sep = ""))
#' data.frame(date = format(y), CDCweekday = CDCweekday(y))
CDCweekday = function(date) {
  return(factor(weekdays(as.Date(date)), 
                levels=c('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')))
}

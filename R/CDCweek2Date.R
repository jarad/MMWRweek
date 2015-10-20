#' Convert CDCweek to Date
#' 
#' Computes the Date from the CDC year, week, and day.
#' 
#' @param CDCyear numeric vector of years
#' @param CDCweek numeric vector of weeks
#' @param CDCday numeric vector of days, defaults to a vector of 1s
#' @return Date vector of actual dates
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @seealso \code{\link{CDCweek}}
#' @export
#' @examples
#' CDCweek2Date(2015,36,3)
CDCweek2Date = function(CDCyear, CDCweek, CDCday=NULL) {
  stopifnot(all(is.numeric(CDCyear)))
  stopifnot(all(is.numeric(CDCweek)))
  stopifnot(all(0 < CDCweek & CDCweek < 54))

  stopifnot(length(CDCyear) == length(CDCweek))
  
  if (is.null(CDCday)) rep(1,length(CDCweek))
  stopifnot(all(0 < CDCday & CDCday < 8))
  
  jan1 = start_date(CDCyear)
  return(jan1 + (CDCweek-1)*7 + CDCday-1)
}

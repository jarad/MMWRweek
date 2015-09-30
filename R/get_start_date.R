#' Find start date for a calendar year
#' 
#' Finds the state date given a numeric calendar year
#' 
#' @param year integer vector of four digit years
#' @return Date vector for January 1st of the calendar year
#' @seealso \code{\link{get_start_date}}
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @export
#' @examples
#' start_date(2015)
start_date = function(year) {
  # Finds start state for this calendar year
  jan1 = as.Date(paste(year, '-01-01', sep=''))
  wday = as.numeric(CDCweekday(jan1))
  jan1 - (wday-1) + 7*(wday>4)
}

#' Finds the start date for the year associated with date.
#' 
#' Values for MMWR week range from 1 to 53, although most years consist of 
#' 52 weeks. The first day of any MMWR week is Sunday. MMWR week numbering 
#' is sequential beginning with 1 and incrementing with each week to a maximum 
#' of 52 or 53. MMWR week #1 of an MMWR year is the first week of the year 
#' that has at least four days in the calendar year. For example, if January 
#' 1 occurs on a Sunday, Monday, Tuesday or Wednesday, the calendar week that 
#' includes January 1 would be MMWR week #1. If January 1 occurs on a Thursday, 
#' Friday, or Saturday, the calendar week that includes January 1 would be the 
#' last MMWR week of the previous year (#52 or #53). This function returns the
#' start date for the year associated with this date.
#' 
#' @param date vector which can be coerced to class \code{Date}
#' @return Date vector for start date of CDC year associated with date
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @seealso \code{\link{start_date}}
#' @references \url{http://stackoverflow.com/questions/28238438/epidemiological-curve-using-r-and-epitools-gives-wrong-epiweeks}
#' @export
#' @examples
#' get_start_date(as.Date('2015-01-01')+ -10:10)
get_start_date <- function(date) {
  year = as.integer(format(as.Date(date),'%Y'))
  
  # Find start date for current and previous calendar years
  start_date_current = start_date(year  )
  start_date_prev    = start_date(year-1)
  
  # Return start_date for current year if date is after start date
  # otherwise return start_date for previous year
  out = start_date_current
  before = date < start_date_current
  out[before] = out[before]
  return(out)
}


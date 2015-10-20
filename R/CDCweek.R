#' CDC week and year 
#'
#' This function returns the CDC week and year for the date(s) provided.
#' 
#' @param date vector which can be coerced to class \code{Date}
#' @return data.frame with elements CDCday (of the week), CDCweek, and CDCyear
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @seealso \code{\link{get_start_date}}, \code{\link{CDCweekday}}
#' @references \url{http://stackoverflow.com/questions/28238438/epidemiological-curve-using-r-and-epitools-gives-wrong-epiweeks}
#' @export 
#' @examples
#' y = as.Date(paste(1999:2011, "-12-31", sep = ""))
#' cbind(y, CDCweek(y))
CDCweek = function(date) {
  date = as.Date(date)
  #year = as.numeric(format(date, '%Y'))
  start_date      = get_start_date(date)

  return(data.frame(CDCyear = as.numeric(format(start_date+7, '%Y')),
                    CDCweek = round(as.numeric(date - start_date - 3) / 7)+1, # why 3? 
                    CDCday  = as.numeric(CDCweekday(date)))
  )
} 

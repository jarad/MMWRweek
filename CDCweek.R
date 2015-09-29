#' CDC week and year 
#'
#' This function returns the MMWR week and year for the date(s) provided.
#' 
#' @param date Vector which can be coerced to class \code{Date}
#' @return data.frame with elements week and year
#' @author Jarad Niemi \email{niemi@@iastate.edu}
#' @seealso \code{\link{MMWRweekday}}
#' @export 
#' @examples
#' y = as.Date(paste(1999:2011, "-12-31", sep = ""))
#' cbind(y, MMWR(y))
CDCweek = function(date) {
  #requires date in format YYYY-MM-DD
  #date in POSIXlt
  date = as.Date(date)
  #year = as.numeric(format(date, '%Y'))
  start_date      = get_start_date(date)

  return(data.frame(day  = as.numeric(MMWRweekday(date)), 
                    week = round(as.numeric(date - start_date - 3) / 7)+1, 
                    year = as.numeric(format(start_date+7, '%Y'))))
} 




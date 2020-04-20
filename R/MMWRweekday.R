#' Day of week according to MMWR
#'
#' This function returns the weekday of a given date according to MMWR.
#' 
#' @param date vector which can be coerced to class \code{Date}
#' @return vector of weekdays as a factor (first level is Sunday)
#' @author Sebastian Meyer \email{seb.meyer@@fau.de}
#' @seealso \code{\link{MMWRweek}}
#' @export
#' @examples
#' y <- as.Date(paste(1999:2011, "-12-31", sep = ""))
#' data.frame(date = format(y), MMWRweekday = MMWRweekday(y))
MMWRweekday = function(date) {
    factor(strftime(as.Date(date), "%w"), # Sunday is 0
           levels = 0:6,
           labels = c('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'))
}

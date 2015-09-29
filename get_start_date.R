get_start_date <- function(date) {
  # From http://stackoverflow.com/questions/28238438/epidemiological-curve-using-r-and-epitools-gives-wrong-epiweeks
  # Values for MMWR week range from 1 to 53, although most years consist of 
  # 52 weeks. The first day of any MMWR week is Sunday. MMWR week numbering 
  # is sequential beginning with 1 and incrementing with each week to a maximum 
  # of 52 or 53. MMWR week #1 of an MMWR year is the first week of the year 
  # that has at least four days in the calendar year. For example, if January 
  # 1 occurs on a Sunday, Monday, Tuesday or Wednesday, the calendar week that 
  # includes January 1 would be MMWR week #1. If January 1 occurs on a Thursday, 
  # Friday, or Saturday, the calendar week that includes January 1 would be the 
  # last MMWR week of the previous year (#52 or #53). Because of this rule, 
  # December 29, 30, and 31 could potentially fall into MMWR week #1 of the 
  # following MMWR year.
  year = as.numeric(format(as.Date(date),'%Y'))
  
  # Find start date for current calendar year
  jan1c = as.Date(paste(year, '-01-01', sep=''))
  wdayc = as.numeric(MMWRweekday(jan1c))
  out_c = jan1c - (wdayc-1) + 7*(wdayc>4)
  
  # Find start date for previous calendar year
  jan1p = as.Date(paste(year-1, '-01-01', sep=''))
  wdayp = as.numeric(MMWRweekday(jan1p))
  out_p = jan1p - (wdayp-1) + 7*(wdayp>4)
  
  # Return start_date for current year if date is after start date
  # otherwise return start_date for previous year
  out = out_c
  out[date<out_c] = out_p[date<out_c]
  return(out)
}


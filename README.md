---
output:
  md_document:
    variant: markdown_github
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# MMWRweek

This package provides functionality to convert between
Dates and Morbidity and Mortality Weekly Report (MMWR)
weeks (day, week, and year). 

The first day of any MMWR week is Sunday. 
MMWR week numbering is sequential beginning with 1 
and incrementing with each week to a maximum of 52 
or 53. MMWR week #1 of an MMWR year is the first week 
of the year that has at least four days in the calendar 
year. This package provides functionality to convert 
Dates to MMWR day, week, and year and the reverse.


```r
MMWRweek('2015-11-24')
#> Error in eval(expr, envir, enclos): could not find function "MMWRweek"
```

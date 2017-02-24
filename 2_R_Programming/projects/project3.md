## R Programming Project 3

The zip file containing the data can be downloaded here:
[Assignment 3 Data](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip)

###  Part 1 Plot the 30-day mortality rates for heart attack ([outcome.R](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/outcome.R))

```R
# install.packages("data.table")
library("data.table")

# Reading in data
outcome <- data.table::fread('outcome-of-care-measures.csv')
outcome[, (11) := lapply(.SD, as.numeric), .SDcols = (11)]
outcome[, lapply(.SD
                 , hist
                 , xlab= "Deaths"
                 , main = "Hospital 30-Day Death (Mortality) Rates from Heart Attack"
                 , col="lightblue")
        , .SDcols = (11)]
```

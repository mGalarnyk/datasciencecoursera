# Exploratory Data Analysis Quiz 1 (JHU) Coursera

Question 1
----------
Which of the following is a principle of analytic graphics?

_Make judicious use of color in your scatterplots

_Don't plot more than two variables at at time

_Show box plots (univariate summaries)

_Only do what your tools allow you to do

_Show comparisons

Question 2
----------
Using the jpeg package read in the following picture of your instructor into R

https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data?

```R
# install.packages('jpeg')
library(jpeg)

# Download the file
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
              , 'jeff.jpg'
              , mode='wb' )

# Read the image
picture <- jpeg::readJPEG('jeff.jpg'
                          , native=TRUE)

# Get Sample Quantiles corressponding to given prob
quantile(picture, probs = c(0.3, 0.8) )

# Answer: 
#       30%       80% 
# -15259150 -10575416 
```

Question 3
----------
Load the Gross Domestic Product data for the 190 ranked countries in this data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

Load the educational data from this data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank. What is the 13th country in the resulting data frame?

Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table http://data.worldbank.org/data-catalog/ed-stats


```R
# install.packages("data.table)
library("data.table")


# Download data and read FGDP data into data.table
FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
                          )

# Download data and read FGDP data into data.table
FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
                                      )
                                      
mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')

# How many of the IDs match?
nrow(mergedDT)

# Answer: 
# 189

# Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?
mergedDT[order(-Rank)][13,.(Economy)]

# Answer: 

#                Economy
# 1: St. Kitts and Nevis
```


Question 4
----------
What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

```R
# "High income: OECD" 
mergedDT[`Income Group` == "High income: OECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]

# Answer:
#
#         Income Group     Rank
# 1: High income: OECD 32.96667

# "High income: nonOECD"
mergedDT[`Income Group` == "High income: nonOECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]

# Answer
#            Income Group     Rank
# 1: High income: nonOECD 91.91304
```

Question 5
----------
Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?

```R
# install.packages('dplyr')
library('dplyr')

breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)
mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]

# Answer 
#           Income Group quantileGDP  N
# 1: Lower middle income (38.6,76.2] 13
# 2: Lower middle income   (114,152]  9
# 3: Lower middle income   (152,190] 16
# 4: Lower middle income  (76.2,114] 11
# 5: Lower middle income    (1,38.6]  5
```
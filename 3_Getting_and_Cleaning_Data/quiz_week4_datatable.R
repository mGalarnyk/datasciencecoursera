# Getting and Cleaning Data, JHU Coursera

#1. 
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

# and load the data into R. The code book, describing the variable names is here:
  
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

# Apply strsplit() to split all the names of the data frame on the characters "wgtp". What is the value of the 123 element of the resulting list?

communities <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
varNames <- names(communities)
varNamesSplit <- strsplit(varNames, "wgtp")
varNamesSplit[[123]]

#2. 
#Load the Gross Domestic Product data for the 190 ranked countries in this data set:
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average?

#Original data sources:
  
#  http://data.worldbank.org/data-catalog/GDP-ranking-table

dtGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                    , skip=5
                    , nrows=190)
# , select = c(1, 2, 4, 5)
# , col.names=c("CountryCode", "Rank", "Economy", "Total")


# 3. Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?

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

#data.table::merge(FGDP, FEDSTATS_Country, by = 'CountryCode')
mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')

# How many of the IDs match?
nrow(mergedDT)

# Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?
mergedDT[order(-Rank)][13,.(Economy)]

# 4. What is the average GDP ranking for the 
# "High income: OECD" and "High income: nonOECD" group?

# "High income: OECD" 
mergedDT[`Income Group` == "High income: OECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]

# "High income: nonOECD"
mergedDT[`Income Group` == "High income: nonOECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]

# 5. Cut the GDP ranking into 5 separate quantile groups.
# Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?

install.packages('dplyr')
library('dplyr')


breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)
mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)
mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]

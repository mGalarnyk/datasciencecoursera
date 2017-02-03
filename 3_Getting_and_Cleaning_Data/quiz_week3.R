# Getting and Cleaning Data, JHU Coursera

# 1. Register an application with the Github API here https://github.com/settings/applications. 
#The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

#and load the data into R. The code book, describing the variable names is here:
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

#Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE.

#which(agricultureLogical)

#What are the first 3 values that result?

# Download the file
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
              , 'ACS.csv'
              , method='curl' )

# Read data into data.frame
ACS <- read.csv('ACS.csv')

agricultureLogical <- ACS$ACR == 3 & ACS$AGS == 6
head(which(agricultureLogical), 3)

# 2. Using the jpeg package read in the following picture of your instructor into R
# https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

# Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? (some Linux systems may produce an answer 638 different for the 30th quantile)
# write the file url and file destination to an object

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

# 3. Load the Gross Domestic Product data for the 190 ranked countries in this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# Load the educational data from this data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame?

library("data.table")
# Download the File
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
              , 'FGDP.csv' )


# download from the URL
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
              , 'FEDSTATS_Country.csv' )

# Read data into data.frame
FEDSTATS_Country <- read.csv('FEDSTATS_Country.csv')



# 4. What is the average GDP ranking for the 
# "High income: OECD" and "High income: nonOECD" group?

# "High income: OECD" 


# "High income: nonOECD"


# 5. Cut the GDP ranking into 5 separate quantile groups.
# Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?



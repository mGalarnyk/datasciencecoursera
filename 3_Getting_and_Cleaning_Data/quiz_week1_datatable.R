# Quiz data.table code Week 1 

# 1.
# fread url requires curl package on mac 
# install.packages("curl")
# Reading in data
housing <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

# VAL attribute says how much property is worth, .N is the number of rows
housing[VAL == 24, .N]

# 3. Download the Excel spreadsheet on Natural Gas Aquisition Program here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx

# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:dat
# install.packages("xlsx")
# setwd("~/Desktop/datasciencecoursera/3_Getting_and_Cleaning_Data")
# housing <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = paste0(getwd(), '/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'), method = "curl")

dat <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

# 4. 
#Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
#How many restaurants have zipcode 21231?

# install.packages("XML")
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- XML::xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
rootNode <- XML::xmlRoot(doc)

zipcodes <- XML::xpathSApply(rootNode, "//zipcode", XML::xmlValue)
xmlZipcodeDT <- data.table::data.table(zipcode = zipcodes)
xmlZipcodeDT[zipcode == "21231", .N]

# 5
# The American Community Survey distributes downloadable 
# data about United States communities. Download the 2006 microdata survey about 
# housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
 
#Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
#How many restaurants have zipcode 21231?

DT <- data.table::fread("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

# fastest
system.time(DT[,mean(pwgtp15),by=SEX])


# Extracting the last 2 rows of the data.table (either expression would work) 
tail(quiz_data,2)
quiz_data[c(.N-1,.N)]

# Removing Missing Values 
quiz_data[complete.cases(quiz_data),]

# Ozone values are above 31 and Temp values are above 90. etc
quiz_data[Ozone > 31 & Temp > 90]
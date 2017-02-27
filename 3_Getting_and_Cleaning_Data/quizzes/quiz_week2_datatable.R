# 1. Register an application with the Github API here https://github.com/settings/applications. 
# Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos").
# Use this data to find the time that the datasharing repo was created. What time was it created?
# see https://medium.com/@GalarnykMichael/accessing-data-from-github-api-using-r-3633fb62cb08#.z0z07ph5h for more details.

#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on your appname, key, and secret 
myapp <- oauth_app(appname = "Youtube_Michael_Galarnyk",
                   key = "8758a6bf9a146e1da0c1",
                   secret = "b9504edde46b794414495bd9c33ea28cbfd87824")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 

# 2. The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.

# Download the American Community Survey data and load it into an R object called acs
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?

# install.packages("sqldf")
library("sqldf")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)
acs <- data.table::data.table(read.csv(f))
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")

# 3. Using the same data frame you created in the previous problem, 
# what is the equivalent function to unique(acs$AGEP)

sqldf("select distinct AGEP from acs")

# 4. How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:

#http://biostat.jhsph.edu/~jleek/contact.html

# (Hint: the nchar() function in R may be helpful)

# connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
# htmlCode <- readLines(connection)
# close(connection)
# c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))


# 5. Read this data set into R and report the sum of the numbers in the fourth of the nine columns.

# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for

# Original source of the data: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for

# (Hint this is a fixed width file format)

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
# lines <- readLines(url, n = 10)
# w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
# colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
#              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", 
#              "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
#d <- read.fwf(url, w, header = FALSE, skip = 4, col.names = colNames)
#d <- d[, grep("^[^filler]", names(d))]
# sum(d[, 4])
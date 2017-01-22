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



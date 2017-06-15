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
![](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/Hospital_30_day_death.png)
###  Part 2 Finding the best hospital in a state ([best.R](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/best.R))
```R
best <- function(state, outcome) {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 

  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  return(out_dt[, "hospital name"][1])

}
```
###  Alternate Part 2 Finding the best hospital in a state
```R
## Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
## outcome name. 
## The function reads the outcome-of-care-measures.csv file and returns a character vector
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
## in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
## be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular
## outcome should be excluded from the set of hospitals when deciding the rankings.
## Handling ties. If there is a tie for the best hospital for a given outcome, then the hospital names should
## be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals “b”, “c”,
## and “f” are tied for best, then hospital “b” should be returned).
## The function should use the following template.


best <- function(state, outcome) {
	
	## All of the possible outcome strings
	outcomes = c("heart attack", "heart failure", "pneumonia")

    ## Check if outcome is one of the strings in outcomes
	## %in% is a more intuitive interface as a binary operator, which returns a logical vector indicating if there is a match or not
    if( outcome %in% outcomes == FALSE ) {
    	stop("invalid outcome")
    }

	## Read outcome data
	data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

	## Get the columns below from 'data' and place it in 'data' with new names ("name", "state", "heart attack", etc)
	#"Hospital.Name"                                              
	#"State"                                                     
    #"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
    #"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    #"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"    

	data <- data[c(2, 7, 11, 17, 23)]
	names(data)[1] <- "name"
	names(data)[2] <- "state"
	names(data)[3] <- "heart attack"
	names(data)[4] <- "heart failure"
	names(data)[5] <- "pneumonia"

    ## Get a vector of all of the states in 'data' now at column 2, NOTE: could've also used data["state"]
    states <- data[, 2]
    states <- unique(states)
    if( state %in% states == FALSE ) {
    	stop("invalid state")
    }

    ## Get only the rows with our state value	
    data <- data[data$state==state & data[outcome] != 'Not Available', ]
    vals <- data[, outcome]

    ## RowNum = the index of the minimum value 
    rowNum <- which.min(vals)
	
	## Return hospital name in that state with lowest 30-day death rate
    data[rowNum, ]$name
}
```
###  Part 3 Ranking hospitals by outcome in a state ([rankhospital.R](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/rankhospital.R))
```R
rankhospital <- function(state, outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  # Column name is same as variable so changing it 
  chosen_state <- state 
  
  # Check that state and outcome are valid
  if (!chosen_state %in% unique(out_dt[["State"]])) {
    stop('invalid state')
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  #Filter by state
  out_dt <- out_dt[state == chosen_state]
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  
  # Removing Missing Values for numerical datatype (outcome column)
  out_dt <- out_dt[complete.cases(out_dt),]
  
  # Order Column to Top 
  out_dt <- out_dt[order(get(outcome), `hospital name`)]
  
  out_dt <- out_dt[,  .(`hospital name` = `hospital name`, state = state, rate = get(outcome), Rank = .I)]
  
  if (num == "best"){
    return(out_dt[1,`hospital name`])
  }
  
  if (num == "worst"){
    return(out_dt[.N,`hospital name`])
  }
  
  return(out_dt[num,`hospital name`])

}
```
###  Alternate Solution Part 3 Ranking hospitals by outcome in a state
```R
rankhospital <- function(state, outcome, num) {
    
    
    ## Read outcome data .csv file
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data <- data[c(2, 7, 11, 17, 23)]
    names(data)[1] <- "name"
    names(data)[2] <- "state"
    names(data)[3] <- "heart attack"
    names(data)[4] <- "heart failure"
    names(data)[5] <- "pneumonia"

    ## All of the possible outcome strings
    outcomes = c("heart attack", "heart failure", "pneumonia")
    ## Check if outcome is one of the strings in outcomes
    if( outcome %in% outcomes == FALSE ) {
    	stop("invalid outcome")
    }

    ## Validate the state string
    ## All of the possible states from the data
    states <- data[, 2]
    states <- unique(states)
    ## Check if state is one of the states in the data
    if( state %in% states == FALSE ) {
    	stop("invalid state")
    }
    
    ## Validate the num value by checking if it is "best","worst", or a number.
    ## NOTE: If num was Boolean then num%%1 = 0
    if( num != "best" && num != "worst" && num%%1 != 0 ) {
    	stop("invalid num")
    }

    ## Get only the rows with our state value    
    data <- data[data$state==state & data[outcome] != 'Not Available', ]

    ## Order the data by name and then outcome
    data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
    data <- data[order(data$name, decreasing = FALSE), ]
    data <- data[order(data[outcome], decreasing = FALSE), ]

    ## Process the num argument to get the row index
    vals <- data[, outcome]
    if( num == "best" ) {
        rowNum <- which.min(vals)
    } else if( num == "worst" ) {
        rowNum <- which.max(vals)
    } else {
        rowNum <- num
    }

    ## Return hospital name in that state with lowest 30-day death rate
    data[rowNum, ]$name
}
```
###  Part 4 Ranking hospitals in all states ([rankall.R](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/rankall.R))
```R
rankall <- function(outcome, num = "best") {
  
  # Read outcome data
  out_dt <- data.table::fread('outcome-of-care-measures.csv')
  
  outcome <- tolower(outcome)
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop('invalid outcome')
  }
  
  # Renaming Columns to be less verbose and lowercase
  setnames(out_dt
           , tolower(sapply(colnames(out_dt), gsub, pattern = "^Hospital 30-Day Death \\(Mortality\\) Rates from ", replacement = "" ))
  )
  
  # Columns indices to keep
  col_indices <- grep(paste0("hospital name|state|^",outcome), colnames(out_dt))
  
  # Filtering out unnessecary data 
  out_dt <- out_dt[, .SD ,.SDcols = col_indices]
  
  # Find out what class each column is 
  # sapply(out_dt,class)
  
  # Change outcome column class
  out_dt[, outcome] <- out_dt[,  as.numeric(get(outcome))]
  
  if (num == "best"){
    return(out_dt[order(state, get(outcome), `hospital name`)
    , .(hospital = head(`hospital name`, 1))
    , by = state])
  }
  
  if (num == "worst"){
    return(out_dt[order(get(outcome), `hospital name`)
    , .(hospital = tail(`hospital name`, 1))
    , by = state])
  }
  
  return(out_dt[order(state, get(outcome), `hospital name`)
                , head(.SD,num)
                , by = state, .SDcols = c("hospital name") ])
  
}
```
###  Alternate Solution Part 4 Ranking hospitals in all states 
```R
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    data <- data[c(2, 7, 11, 17, 23)]
    names(data)[1] <- "name"
    names(data)[2] <- "state"
    names(data)[3] <- "heart attack"
    names(data)[4] <- "heart failure"
    names(data)[5] <- "pneumonia"

    ## Validate the outcome string
    outcomes = c("heart attack", "heart failure", "pneumonia")
    if( outcome %in% outcomes == FALSE ) stop("invalid outcome")

    ## Validate the num value
    if( num != "best" && num != "worst" && num%%1 != 0 ) stop("invalid num")

    ## Grab only rows with data in our outcome
    data <- data[data[outcome] != 'Not Available', ]
    
    ## Order the data
    data[outcome] <- as.data.frame(sapply(data[outcome], as.numeric))
    data <- data[order(data$name, decreasing = FALSE), ]
    data <- data[order(data[outcome], decreasing = FALSE), ]

    ## Helper functiont to process the num argument
    getHospByRank <- function(df, s, n) {
        df <- df[df$state==s, ]
        vals <- df[, outcome]
        if( n == "best" ) {
            rowNum <- which.min(vals)
        } else if( n == "worst" ) {
            rowNum <- which.max(vals)
        } else {
            rowNum <- n
        }
        df[rowNum, ]$name
    }
    
    ## For each state, find the hospital of the given rank
    states <- data[, 2]
    states <- unique(states)
    newdata <- data.frame("hospital"=character(), "state"=character())
    for(st in states) {
        hosp <- getHospByRank(data, st, num)
        newdata <- rbind(newdata, data.frame(hospital=hosp, state=st))
    }

    ## Return a data frame with the hospital names and the (abbreviated) state name
    newdata <- newdata[order(newdata['state'], decreasing = FALSE), ]
    newdata
}
```

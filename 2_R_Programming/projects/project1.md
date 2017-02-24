## R Programming Project 1

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file specdata.zip that you can download from the Coursera web site.

Although this is a programming assignment, you will be assessed using a separate quiz.



The zip file containing the data can be downloaded here:
[specdata.zip](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip) [2.4MB]
</br>Description: The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data. 

### Part 1 (pollutantmean.R)

```R
# install.packages("data.table")
library("data.table")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  if (c(pollutant) %in% names(dt)){
    return(dt[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  } 
}

# Example usage
pollutantmean(directory = '~/Desktop/specdata', pollutant = 'sulfate', id = 20)
```

### Part 2 (complete.R)
```R
complete <- function(directory,  id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  return(dt[complete.cases(dt), .(nobs = .N), by = ID])
  
}

#Example usage
complete(directory = '~/Desktop/specdata', id = 20:30)
```

### Part 3 (corr.R)
```R
corr <- function(directory, threshold = 0) {
  
  # Reading in all files and making a large data.table
  lst <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  dt <- rbindlist(lst)
  
  # Only keep completely observed cases
  dt <- dt[complete.cases(dt),]
  
  # Apply threshold
  dt <- dt[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(dt[, corr])
}

# Example Usage
corr(directory = '~/Desktop/specdata', threshold = 150)
```
